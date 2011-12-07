using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_LoginDialog : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e) {
        ErrorLogger log = new ErrorLogger();
        log.ErrorLog(HttpContext.Current.Server.MapPath("Logs/Login"), "User is logging in.");
    }
    protected void Login1_LoggedIn(object sender, EventArgs e) {
        ErrorLogger log = new ErrorLogger();
        log.ErrorLog(HttpContext.Current.Server.MapPath("Logs/Login"), "User is logged in.");
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e) {
        ErrorLogger log = new ErrorLogger();
        log.ErrorLog(HttpContext.Current.Server.MapPath("Logs/Login"), "User is authenticating.");
    }
    protected void Login1_LoginError(object sender, EventArgs e) {
        ErrorLogger log = new ErrorLogger();
        log.ErrorLog(HttpContext.Current.Server.MapPath("Logs/Login"), "User login failed.");
    }
}