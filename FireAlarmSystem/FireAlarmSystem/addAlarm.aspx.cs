using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

namespace FireAlarmSystem {
    public partial class addAlarm : System.Web.UI.Page {
        private string cs = ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e) {
            if(!IsPostBack) {
                fillLocationDDL();
                fillAlarmTypeDDL();
            }
                
        }

        private void fillAlarmTypeDDL() {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Select_AlarmType";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        ddlAlarmType.DataSource = dt;
                        ddlAlarmType.DataTextField = "alarmType";
                        ddlAlarmType.DataValueField = "alarmTypeID";
                        ddlAlarmType.DataBind();
                        ddlAlarmType.SelectedIndex = 0;
                    }
                }
            } catch (MySqlException ex) {
                lblError.Text = "Could not retrieve alarm type: " + ex.ToString();
                lblError.Visible = true;
            }
        }

        protected void ddlAlarmLocation_SelectedIndexChanged(object sender, EventArgs e) {
            
        }

        private void fillLocationDDL() {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Select_Locations";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        ddlLocation.DataSource = dt;
                        ddlLocation.DataTextField = "locationDescription";
                        ddlLocation.DataValueField = "locationID";
                        ddlLocation.DataBind();
                        ddlLocation.SelectedIndex = 0;
                    }
                }
            } catch (MySqlException ex) {
                lblError.Text = "Could not retrieve available locations: " + ex.ToString();
                lblError.Visible = true;
            }
        }

        

       

        protected void ddlAlarmType_SelectedIndexChanged(object sender, EventArgs e) {

        }

        protected void insertBtn_Click(object sender, EventArgs e) {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    

                    var procedure = "USP_Insert_New_Alarm";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("alarmTypeID", ddlAlarmType.SelectedValue);
                    cmd.Parameters.AddWithValue("description", alarmDescription.Text);
                    cmd.Parameters.AddWithValue("locationID", ddlLocation.SelectedValue);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    lblMsg.Text = "Alarm Succesfully Added";
                    lblMsg.Visible = true;
                }
            } catch(MySqlException ex) {
                lblError.Text = "Unable to add new alarm to DB: " + ex.ToString();
                lblError.Visible = true;
            }
        }

       
    }
}