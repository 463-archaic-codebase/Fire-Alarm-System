using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace FireAlarmSystem
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_start(object sender, EventArgs e)
        {
            Session["Logged"] = "False";
            Session["userID"] = "";
            Session["userName"] = "";
            Session["role"] = "";
            Session["URL"] = "Default.aspx";
        }
    }
}