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
                fillAlarmDetailsGrid("AlarmType", "ASC", "%", "%");
            }
            else
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "renderSettingsGrid", "renderSettingsGrid(\"gridUserSettings\", settings); ", true);
                //ScriptManager.RegisterStartupScript(this, GetType(), "renderDataGrid", "renderDataGrid(\"gridAlarmDetails\", results, settings); ", true);
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

        protected void btnOrderResults_Click(object sender, EventArgs e) {

            fillAlarmDetailsGrid(hfSortColumnChosen.Value, getSortDirection(hfSortColumnChosen.Value), "%", "%");
            ScriptManager.RegisterStartupScript(this, GetType(), "renderDataGrid", "results = JSON.parse('"+hfAlarmDetailsJSON.Value+"');renderDataGrid(\"gridAlarmDetails\", results, settings); ", true);

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