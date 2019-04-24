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
using System.Diagnostics;

namespace FireAlarmSystem {
    public partial class deleteAlarm : System.Web.UI.Page {

        private string cs = ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                ddlAlarmFill();
                populateAlarmDescriptionTextBox();
                populateAlarmLocationTextBox();
            }

        }

        private void ddlAlarmFill() {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Select_Alarm";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        ddlAlarm.DataSource = dt;
                        ddlAlarm.DataTextField = "alarmID";
                        ddlAlarm.DataValueField = "alarmID";
                        ddlAlarm.DataBind();
                       
                        ddlAlarm.SelectedIndex = 0;

                    }
                }
            } catch (MySqlException ex) {
                lblError.Text = "unable to fetch data: " + ex.ToString();
                lblError.Visible = true;
            }
        }
        protected void deleteBtn_Click(object sender, EventArgs e) {
            try {
                using(MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Delete_Alarm";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("id", ddlAlarm.SelectedValue);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Clone();
                    lblMsg.Text = "Alarm Successfully Deleted.";
                    lblMsg.Visible = true;
                }
            } catch(MySqlException ex) {
                lblError.Text = "Error: " + ex.ToString();
                lblError.Visible = true;
            }
        }
        protected void ddlAlarm_SelectedIndexChanged(object sender, EventArgs e) {
            populateAlarmLocationTextBox();
            populateAlarmDescriptionTextBox();
        }

        private void populateAlarmLocationTextBox() {
            try {
                using (MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Get_Alarm_Location_Description";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("id", ddlAlarm.SelectedValue);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        alarmLocation.Text = dt.Rows[0]["locationDescription"].ToString();
                    }
                }
            } catch (MySqlException ex) {
                lblError.Text = "Error: " + ex.ToString();
                lblError.Visible = true;
            }
        }

        protected void populateAlarmDescriptionTextBox() {
            try {
                using(MySqlConnection conn = new MySqlConnection(cs)) {
                    var procedure = "USP_Get_Alarm_Description";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("id", ddlAlarm.SelectedValue);
                    
                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd)) {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        


                        alarmDescription.Text = dt.Rows[0]["alarmDescription"].ToString();
                    }
                }
            } catch(MySqlException ex) {
                lblError.Text = "Error: " + ex.ToString();
                lblError.Visible = true;
            }
           

        }
    }
}