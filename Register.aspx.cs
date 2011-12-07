using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = JDwebstoreConfig.SiteName + " - Register";
    }
    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e) {
        Response.Redirect("~/Default.aspx");
    }
}