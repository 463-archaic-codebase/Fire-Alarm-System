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

namespace FireAlarmSystem
{
    public partial class AddUser : System.Web.UI.Page
    {

        private string cs = ConfigurationManager.ConnectionStrings["CString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["role"].Equals("Operator"))
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void insertBtn_Click(object sender, EventArgs e)
        {
            try
            {
                using(MySqlConnection conn = new MySqlConnection(cs))
                {
                    var proc = "USP_Insert_User";
                    using(MySqlCommand cmd = new MySqlCommand(proc, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("fName", firstName.Text);
                        cmd.Parameters.AddWithValue("mName", middleInitial.Text);
                        cmd.Parameters.AddWithValue("lName", lastName.Text);
                        cmd.Parameters.AddWithValue("uPW", password.Text);
                        cmd.Parameters.AddWithValue("rID", ddlRole.SelectedValue);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Dispose();
                        conn.Close();

                        lblMsg.Text = "User successfully added";
                        firstName.Text = "";
                        middleInitial.Text = "";
                        lastName.Text = "";
                        password.Text = "";
                    }
                }
            }
            catch (MySqlException ex)
            {
                lblError.Text = "MySQL Error: " + ex;
            }
        }
    }
}