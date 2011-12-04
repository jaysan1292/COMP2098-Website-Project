using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class UserControls_AccountSidebar : System.Web.UI.UserControl {
    protected void Page_Load(object sender, EventArgs e) {
        PopulateControls();
    }
    private void PopulateControls() {
        decimal total = ShoppingCartAccess.GetTotalAmount();
        if (total == 0) {
            lnkCart.Visible = false;
            lblCartTotal.Text = "<span style=\"font-size: 1.15em; font-weight: bold;\">No items in your cart.</span>";
        } else {
            lnkCart.Visible = true;
            lblCartTotal.Text = "<span style=\"font-weight: bold;\">Total</span><br /><span style=\"font-size: 1.15em; font-weight: bold;\">" + String.Format("{0:c}", total) + "</span>";
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e) {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Default.aspx");
    }
}