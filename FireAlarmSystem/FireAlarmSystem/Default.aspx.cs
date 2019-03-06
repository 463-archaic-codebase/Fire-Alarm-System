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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //fillAlarmDetailsGrid("alarmType", "ASC");
            }
        }
        protected void fillAlarmDetailsGrid(String sortExpression, String sortDirection )
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    var procedure = "USP_Select_Alarms";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("SortExpression", sortExpression);
                    cmd.Parameters.AddWithValue("SortDirection", sortDirection);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        String resultsJSON = "{\"ColumnHeaderNames\": {";

                        foreach (DataColumn column in dt.Columns)
                        {
                            resultsJSON += "\"" + column.ColumnName + "\":\"";
                        }

                        foreach (DataRow row in dt.Rows)
                        {

                        }

                    }
                }
            }
            catch (MySqlException ex)
            {

            }
        }
    }
}