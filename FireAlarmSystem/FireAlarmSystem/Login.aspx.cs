using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using MySql;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace FireAlarmSystem
{
    public partial class Login : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["CString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            DateTime date = DateTime.Now;
            System.Diagnostics.Debug.WriteLine(date);
            String username = txtUName.Text;
            String pword = txtPword.Text;

            try
            {
                using(MySqlConnection conn = new MySqlConnection(cs))
                {
                    var procedure = "USP_Get_Select_User_Login";
                    MySqlCommand cmd = new MySqlCommand(procedure, conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("userName", username);
                    cmd.Parameters.AddWithValue("userPassword", pword);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if(dt.Rows.Count == 1)
                        {
                            foreach(DataRow row in dt.Rows)
                            {
                                Session["Logged"] = "True";
                                Session["userID"] = row["userID"];
                                Session["userName"] = row["userName"];
                                Session["role"] = row["roleName"];
                            }
                            Response.Redirect(Session["URL"].ToString());
                        }
                        else
                        {
                            msgLbl.Text = "Invalid username/password";
                        }
                    }
                }
            }
            catch(MySqlException ex)
            {
                msgLbl.Text = "Error connecting to database: " + ex.ToString();
            }
            
        }
    }
}