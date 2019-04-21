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
                getSettingsForUser(1);
                fillAlarmStatusIndicators();
                fillAlarmDetailsGrid(hfSortColumnChosen.Value, hfSortColumnChosen.Value, hfFilterAlarmTypeChosen.Value, hfFilterAlarmStatusChosen.Value);
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
                                } else if ("visible".Equals(columnName)) {
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
                            resultsJSON += "\""+rowCount + "\":{";
                            foreach (DataColumn column in dt.Columns) {
                                if (!column.ColumnName.Equals("alarmID")) {
                                    resultsJSON += "\"" + column.ColumnName + "\":\""+row[column.ColumnName]+"\",";
                                }
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
            }
            catch (MySqlException ex)
            {

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
                                } else if (column.ColumnName.Equals("cameraOK")) {
                                    cameraOK.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("cameraService")) {
                                    cameraService.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("cameraTriggered")) {
                                    cameraTriggered.Text = row[column.ColumnName].ToString();
                                } else if (column.ColumnName.Equals("cameraAlert")) {
                                    cameraAlert.Text = row[column.ColumnName].ToString();
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

        protected void btnOrderResults_Click(object sender, EventArgs e) {
            fillAlarmStatusIndicators();
            fillAlarmDetailsGrid(hfSortColumnChosen.Value, getSortDirection(hfSortColumnChosen.Value), hfFilterAlarmTypeChosen.Value, hfFilterAlarmStatusChosen.Value);
            ScriptManager.RegisterStartupScript(this, GetType(), "renderDataGrid", "results = JSON.parse('" + hfAlarmDetailsJSON.Value + "');renderDataGrid(\"gridAlarmDetails\", results, settings); ", true);
        }

        private string getSortDirection(String sortColumnChosen) {
            if ("AlarmType".Equals(sortColumnChosen)) {
                return hfSortAlarmType.Value;
            } else if ("AlarmStatus".Equals(sortColumnChosen)) {
                return hfSortAlarmStatus.Value;
            } else if ("Zone".Equals(sortColumnChosen)) {
                return hfSortZone.Value;
            } else if ("Floor".Equals(sortColumnChosen)) {
                return hfSortFloor.Value;
            } else if ("Room".Equals(sortColumnChosen)) {
                return hfSortRoom.Value;
            } else if ("LastService".Equals(sortColumnChosen)) {
                return hfSortLastService.Value;
            } else {
                return hfSortAlarmType.Value;
            }
        }
    }
}