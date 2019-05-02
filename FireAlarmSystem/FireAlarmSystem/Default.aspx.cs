using System;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace FireAlarmSystem
{
    public partial class _Default : Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e) {
            
            if (!IsPostBack) {
                //leave this hardcoded to UserID = 1. This is the No Fluff version (no fancy settings saved for users, etc.)
                Session["TotalTimeUp"] = 0;
                getSettingsForUser(1);
                fillAlarmStatusIndicators();
                fillMessagesGrid("Time", "DESC");
                fillAlarmDetailsGrid(hfSortColumnChosen.Value, "ASC", hfFilterAlarmTypeChosen.Value, hfFilterAlarmStatusChosen.Value);
                updateTriggeredAlarmCountdowns();
            }
            else
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "renderSettingsGrid", "renderSettingsGrid(\"gridUserSettings\", settings); ", true);
                //ScriptManager.RegisterStartupScript(this, GetType(), "renderDataGrid", "renderDataGrid(\"gridAlarmDetails\", results, settings); ", true);
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e) {
            if (!IsPostBack) {
                fillAlarmStatusIndicators();
            } else {
            }
        }

        protected void getSettingsForUser(int userID) {
            String userSettingsJSON = "{";
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Get_Select_UserSettings";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("UserID", userID);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        userSettingsJSON += "\"gridConfiguration\":{";
                        foreach (DataRow row in dt.Rows) {
                            foreach (DataColumn column in dt.Columns) {
                                String columnName = column.ColumnName;
                                if ("columnName".Equals(columnName)) {
                                    userSettingsJSON += "\"" + row[columnName] + "\":{";
                                } else if ("visible".Equals(columnName) || "sortable".Equals(columnName)) {
                                    userSettingsJSON += "\"" + columnName + "\":" + row[columnName] + ",";
                                } else {
                                    userSettingsJSON += "\"" + columnName + "\":\"" + row[columnName] + "\",";
                                }
                            }
                            userSettingsJSON = userSettingsJSON.Remove(userSettingsJSON.Length - 1);
                            userSettingsJSON += "},";
                        }
                        userSettingsJSON = userSettingsJSON.Remove(userSettingsJSON.Length - 1);
                        userSettingsJSON += "},";
                        userSettingsJSON += "\"columnSettings\":{";

                        foreach (DataColumn column in dt.Columns) {
                            String columnName = column.ColumnName;
                            if ("columnName".Equals(columnName)) {
                                userSettingsJSON += "\"" + columnName + "\":{";
                                userSettingsJSON += "\"headerText\":\"Column Name\",\"alignment\":\"center\",\"width\":\"3\"},";
                            } else if ("visible".Equals(columnName)) {
                                userSettingsJSON += "\"" + columnName + "\":{";
                                userSettingsJSON += "\"headerText\":\"Visible\",\"alignment\":\"center\",\"width\":\"2\"},";
                            } else if ("alignment".Equals(columnName)) {
                                userSettingsJSON += "\"" + columnName + "\":{";
                                userSettingsJSON += "\"headerText\":\"Alignment\",\"alignment\":\"center\",\"width\":\"3\"},";
                            } else if ("width".Equals(columnName)) {
                                userSettingsJSON += "\"" + columnName + "\":{";
                                userSettingsJSON += "\"headerText\":\"Width\",\"alignment\":\"center\",\"width\":\"4\"},";
                            }
                        }
                        userSettingsJSON = userSettingsJSON.Remove(userSettingsJSON.Length - 1);
                        userSettingsJSON += "}}";
                    }
                }
                hfUserSettingsJSON.Value = userSettingsJSON;
            } catch (MySqlException ex) {

            }
        }


        protected void fillAlarmDetailsGrid(String sortExpression, String sortDirection, String alarmType, String alarmStatus )
        {
            lblResultsMessage.Text = "";
            
            String resultsJSON = "{";
            try
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    var procedure = "USP_Get_Select_Alarms";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("SortExpression", sortExpression);
                    cmd.Parameters.AddWithValue("SortDirection", sortDirection);
                    cmd.Parameters.AddWithValue("AlarmType", alarmType);
                    cmd.Parameters.AddWithValue("AlarmStatus", alarmStatus);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                         resultsJSON += "\"recordSet\": {";

                        int rowCount = 0;
                        foreach (DataRow row in dt.Rows) {
                            String alarmID = row["alarmID"].ToString();
                            String alarmTypeText = row["alarmType"].ToString();
                            resultsJSON += "\""+rowCount + "\":{";
                            foreach (DataColumn column in dt.Columns) {
                                String currentCellValue = row[column.ColumnName].ToString();
                                if (currentCellValue.Contains("'")) {
                                    currentCellValue = currentCellValue.Replace("'", "\\'");
                                }
                                if (currentCellValue.Contains("\"")) {
                                    currentCellValue = currentCellValue.Replace("\"", "\'\'");
                                }
                                if (column.ColumnName.Equals("lastService")) {
                                    if (currentCellValue.Contains(" 12:00:00 AM")) {
                                        currentCellValue = currentCellValue.Replace(" 12:00:00 AM", "");
                                    }
                                }
                                resultsJSON += "\"" + column.ColumnName + "\":\""+ currentCellValue + "\",";
                                //if (column.ColumnName.Equals("LastService")) {
                                //    String serviceDateString = row[column.ColumnName].ToString();
                                //    DateTime serviceDate = DateTime.ParseExact(serviceDateString, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                                //    resultsJSON += "\"" + column.ColumnName + "\":\"" + serviceDate.ToString() + "\",";
                                //}
                            }
                            resultsJSON = resultsJSON.Remove(resultsJSON.Length - 1);
                            resultsJSON += "},";
                            rowCount++;
                        }
                        resultsJSON = resultsJSON.Remove(resultsJSON.Length - 1);
                        resultsJSON += "}}";
                    }
                }
                hfAlarmDetailsJSON.Value = resultsJSON;
                if ("{\"recordSet\": }}".Equals(resultsJSON)) {
                    hfAlarmDetailsJSON.Value = "{}";
                    lblResultsMessage.Text = "No results. Select a different filter.";
                } else {
                    String alarmTypeText = alarmType;
                    String alarmStatusText = alarmStatus;
                    if ("%".Equals(alarmTypeText)) {
                        alarmTypeText = "All Types";
                    }
                    if ("%".Equals(alarmStatusText)) {
                        alarmStatusText = "All Statuses";
                    }
                    lblResultsMessage.Text = alarmTypeText + " - " + alarmStatusText;
                }

                
            }
            catch (MySqlException ex)
            {

            }
        }

        protected void updateTriggeredAlarmCountdowns() {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Select_TriggerdAlarms";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow row in dt.Rows) {
                            String alarmID = row["alarmID"].ToString();
                            foreach (DataColumn column in dt.Columns) {
                                String currentCellValue = row[column.ColumnName].ToString();
                                if (currentCellValue.Equals("Triggered")) {
                                    if (Session[alarmID] == null) {
                                        Session[alarmID] = Session["TotalTimeUp"];
                                    } else {
                                        int alarmTriggeredTime = ((int)Session[alarmID]);
                                        if (alarmTriggeredTime + 30 <= ((int)Session["TotalTimeUp"])) {
                                            Session[alarmID] = null;
                                            Session["autoConfirmScript"] = Session["autoConfirmScript"] + "$('#confirm" + alarmID + "').click();";
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } catch (MySqlException ex) {

            }
        }

        protected void fillAlarmStatusIndicators() {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Select_AlarmStatusCounts";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        
                        foreach (DataRow row in dt.Rows) {
                            foreach (DataColumn column in dt.Columns) {
                                if (column.ColumnName.Equals("summaryOK")) {
                                    summaryOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("summaryService")) {
                                    summaryService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("summaryTriggered")) {
                                    summaryTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("summaryAlert")) {
                                    summaryAlarm.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityAlarmOK")) {
                                    securityAlarmOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityAlarmService")) {
                                    securityAlarmService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityAlarmTriggered")) {
                                    securityAlarmTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityAlarmAlert")) {
                                    securityAlarmAlert.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("carbonMonoxideOK")) {
                                    carbonMonoxideOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("carbonMonoxideService")) {
                                    carbonMonoxideService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("carbonMonoxideTriggered")) {
                                    carbonMonoxideTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("carbonMonoxideAlert")) {
                                    carbonMonoxideAlert.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("fireOK")) {
                                    fireOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("fireService")) {
                                    fireService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("fireTriggered")) {
                                    fireTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("fireAlert")) {
                                    fireAlert.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("lightedPathwayOK")) {
                                    lightedPathwayOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("lightedPathwayService")) {
                                    lightedPathwayService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("lightedPathwayTriggered")) {
                                    lightedPathwayTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("lightedPathwayAlert")) {
                                    lightedPathwayAlert.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityDoorOK")) {
                                    securityDoorOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityDoorService")) {
                                    securityDoorService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityDoorTriggered")) {
                                    securityDoorTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("securityDoorAlert")) {
                                    securityDoorAlert.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("sprinklerOK")) {
                                    sprinklerOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("sprinklerService")) {
                                    sprinklerService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("sprinklerTriggered")) {
                                    sprinklerTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("sprinklerAlert")) {
                                    sprinklerAlert.Text = row[column.ColumnName].ToString();
                                }
                            }
                        }
                    }
                }
            } catch (MySqlException ex) {

            }
        }


        protected void fillMessagesGrid(String sortExpression, String sortDirection) {
            String messagesJSON = "{";
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Get_Select_Messages";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("SortExpression", sortExpression);
                    cmd.Parameters.AddWithValue("SortDirection", sortDirection);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        messagesJSON += "\"recordSet\": {";

                        int rowCount = 0;
                        foreach (DataRow row in dt.Rows) {
                            messagesJSON += "\"" + rowCount + "\":{";
                            foreach (DataColumn column in dt.Columns) {
                                String currentCellValue = row[column.ColumnName].ToString();
                                if (currentCellValue.Contains("'")) {
                                    currentCellValue = currentCellValue.Replace("'", "\\'");
                                }
                                if (currentCellValue.Contains("\"")) {
                                    currentCellValue = currentCellValue.Replace("\"", "\'\'");
                                }
                                messagesJSON += "\"" + column.ColumnName + "\":\"" + currentCellValue + "\",";
                            }
                            messagesJSON = messagesJSON.Remove(messagesJSON.Length - 1);
                            messagesJSON += "},";
                            rowCount++;
                        }
                        messagesJSON = messagesJSON.Remove(messagesJSON.Length - 1);
                        messagesJSON += "}}";
                    }
                }
                hfMessageCenterJSON.Value = messagesJSON;
            } catch (MySqlException ex) {

            }
        }

        protected void confirmAlarms(String alarmID, String alarmType, String alarmStatus) {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Confirm_Alarms";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    cmd.Parameters.AddWithValue("AlarmID", alarmID);
                    cmd.Parameters.AddWithValue("AlarmType", alarmType);
                    cmd.Parameters.AddWithValue("AlarmStatus", alarmStatus);
                    
                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }
            } catch (MySqlException ex) {
                string test = ex.Message;
            }
        }
        protected void resolveAlarm(String alarmID) {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Resolve_Alarm";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    cmd.Parameters.AddWithValue("AlarmID", alarmID);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }
            } catch (MySqlException ex) {
                string test = ex.Message;
            }
        }
        protected void serviceAlarm(String alarmID) {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Service_Alarm";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    cmd.Parameters.AddWithValue("AlarmID", alarmID);
                    String userName = Session["userName"].ToString();
                    cmd.Parameters.AddWithValue("UserName", userName);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }
            } catch (MySqlException ex) {
                string test = ex.Message;
            }
        }

        protected void btnOrderResults_Click(object sender, EventArgs e) {
            fillAlarmStatusIndicators();
            fillMessagesGrid("Time", hfMessagesSortMessageTime.Value);
            fillAlarmDetailsGrid(hfSortColumnChosen.Value, getSortDirection(hfSortColumnChosen.Value), hfFilterAlarmTypeChosen.Value, hfFilterAlarmStatusChosen.Value);
            updateTriggeredAlarmCountdowns();
            ScriptManager.RegisterStartupScript(this, GetType(), "renderGrids", "messages = JSON.parse('" + hfMessageCenterJSON.Value + "');results = JSON.parse('" + hfAlarmDetailsJSON.Value + "');renderDataGrid(\"gridAlarmDetails\", results, settings);$('#gridAlarmDetails').scrollTop($('#hfAlarmDetailsScrollPosition').val());renderMessageGrid(\"gridMessageCenter\", messages, settings);$('#gridMessageCenter').scrollTop($('#hfMessageCenterScrollPosition').val());"+ Session["autoConfirmScript"], true);
        }

        private string getSortDirection(String sortColumnChosen) {
            if ("AlarmType".Equals(sortColumnChosen)) {
                return hfAlarmsSortAlarmType.Value;
            } else if ("AlarmStatus".Equals(sortColumnChosen)) {
                return hfAlarmsSortAlarmStatus.Value;
            } else if ("Zone".Equals(sortColumnChosen)) {
                return hfAlarmsSortZone.Value;
            } else if ("Floor".Equals(sortColumnChosen)) {
                return hfAlarmsSortFloor.Value;
            } else if ("Room".Equals(sortColumnChosen)) {
                return hfAlarmsSortRoom.Value;
            } else if ("LastService".Equals(sortColumnChosen)) {
                return hfAlarmsSortLastService.Value;
            } else {
                return hfAlarmsSortAlarmType.Value;
            }
        }

        protected void btnResolveAlarm_Click(object sender, EventArgs e) {
            resolveAlarm(hfResolvedAlarmID.Value);
            fillAlarmStatusIndicators();
            fillAlarmDetailsGrid(hfSortColumnChosen.Value, getSortDirection(hfSortColumnChosen.Value), hfFilterAlarmTypeChosen.Value, hfFilterAlarmStatusChosen.Value);
            updateTriggeredAlarmCountdowns();
            ScriptManager.RegisterStartupScript(this, GetType(), "renderGrids", "messages = JSON.parse('" + hfMessageCenterJSON.Value + "');results = JSON.parse('" + hfAlarmDetailsJSON.Value + "');renderDataGrid(\"gridAlarmDetails\", results, settings);$('#gridAlarmDetails').scrollTop($('#hfAlarmDetailsScrollPosition').val());renderMessageGrid(\"gridMessageCenter\", messages, settings);$('#gridMessageCenter').scrollTop($('#hfMessageCenterScrollPosition').val());" + Session["autoConfirmScript"], true);
        }

        protected void btnConfirmAlarm_Click(object sender, EventArgs e) {
            confirmAlarms(hfConfirmedAlarmID.Value, hfConfirmedAlarmType.Value, "Alert");
            fillAlarmStatusIndicators();
            fillAlarmDetailsGrid(hfSortColumnChosen.Value, getSortDirection(hfSortColumnChosen.Value), hfFilterAlarmTypeChosen.Value, hfFilterAlarmStatusChosen.Value);
            updateTriggeredAlarmCountdowns();
            ScriptManager.RegisterStartupScript(this, GetType(), "renderGrids", "messages = JSON.parse('" + hfMessageCenterJSON.Value + "');results = JSON.parse('" + hfAlarmDetailsJSON.Value + "');renderDataGrid(\"gridAlarmDetails\", results, settings);$('#gridAlarmDetails').scrollTop($('#hfAlarmDetailsScrollPosition').val());renderMessageGrid(\"gridMessageCenter\", messages, settings);$('#gridMessageCenter').scrollTop($('#hfMessageCenterScrollPosition').val());" + Session["autoConfirmScript"], true);
            Session["autoConfirmScript"] = "";
        }

        protected void btnServiceAlarm_Click(object sender, EventArgs e) {
            serviceAlarm(hfServicedAlarmID.Value);
            fillAlarmStatusIndicators();
            fillAlarmDetailsGrid(hfSortColumnChosen.Value, getSortDirection(hfSortColumnChosen.Value), hfFilterAlarmTypeChosen.Value, hfFilterAlarmStatusChosen.Value);
            updateTriggeredAlarmCountdowns();
            ScriptManager.RegisterStartupScript(this, GetType(), "renderGrids", "messages = JSON.parse('" + hfMessageCenterJSON.Value + "');results = JSON.parse('" + hfAlarmDetailsJSON.Value + "');renderDataGrid(\"gridAlarmDetails\", results, settings);$('#gridAlarmDetails').scrollTop($('#hfAlarmDetailsScrollPosition').val());renderMessageGrid(\"gridMessageCenter\", messages, settings);$('#gridMessageCenter').scrollTop($('#hfMessageCenterScrollPosition').val());" + Session["autoConfirmScript"], true);
        }

        protected void tAutoPostBack_Tick(object sender, EventArgs e) {
            
            int totalTimeUp = ((int)Session["TotalTimeUp"]);
            Session["TotalTimeUp"] = totalTimeUp + 5;

            btnOrderResults_Click(sender, e);
        }
    }
}