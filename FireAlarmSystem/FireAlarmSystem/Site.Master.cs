using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace FireAlarmSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Logged"].Equals("True"))
            {
                panelNotLogged.Visible = false;
                if(Session["role"].Equals("Operator"))
                {
                    panelOperator.Visible = true;
                    panelSupervisor.Visible = false;
                }
                else
                {
                    panelSupervisor.Visible = true;
                    panelOperator.Visible = false;
                }
            }
            else
            {
                panelNotLogged.Visible = true;
                panelOperator.Visible = false;
                panelSupervisor.Visible = false;
            }

            String page = Path.GetFileName(Request.Url.AbsolutePath);
            if (Session["Logged"].Equals("False") && !page.Equals("Login"))
            {
                Response.Redirect("Login.aspx");
            } 
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);
        }
    }
}