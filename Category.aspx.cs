using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Category : System.Web.UI.Page {
    protected void Page_Init(object sender, EventArgs e) {
        Main Master = (Main)Page.Master;
        Master.SetCurrentPage("Category");
    }
    protected void Page_Load(object sender, EventArgs e) {
        // Retrieve ItemID from the query string
        string categoryId = Request.QueryString["CategoryID"];

        // redirect to homepage if ItemID is null
        if (categoryId == null) {
            Response.Redirect("Default.aspx");
        }
    }
}