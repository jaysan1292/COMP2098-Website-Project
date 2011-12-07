using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        string query = Request.QueryString["q"].ToString();
        this.Title = JDwebstoreConfig.SiteName + " - Product search for: " + query;
        lblTitle.Text = "Search for \"" + query + "\"";
    }
}