using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_WebUserControl : System.Web.UI.UserControl {
    public string CurrentPage { get; set; }

    protected void Page_Load(object sender, EventArgs e) {
        if (CurrentPage == "Home")
            lnkHome.CssClass = "on";
        else if (CurrentPage == "Category")
            lnkCategory.CssClass = "on";
        else if (CurrentPage == "Account")
            lnkAccount.CssClass = "on";
        else {
            lnkAccount.CssClass = "";
            lnkCategory.CssClass = "";
            lnkHome.CssClass = "";
        }

        this.txtSearch.Attributes.Add("onClick", "searchFocus(this)");
        this.txtSearch.Attributes.Add("onBlur", "searchBlur(this)");

        if (!IsPostBack) {
            if (Request.QueryString["q"] != null) txtSearch.Text = Request.QueryString["q"].ToString();
        }
    }
}