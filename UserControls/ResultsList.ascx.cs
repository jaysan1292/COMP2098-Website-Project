using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ResultsList : System.Web.UI.UserControl {
    protected void Page_Load(object sender, EventArgs e) {
        PopulateControls();
    }

    private void PopulateControls() {
        // Retrieve Page from the query string
        string page = Request.QueryString["Page"];

        // Retrieve search string from query string
        string query = Request.QueryString["q"];

        if (page == null) page = "1";
        // How many pages of products?
        int totalPages = 1;

        // pager links format
        string firstPageUrl = "";
        string pagerFormat = "";

        // Perform search
        lstResults.DataSource = CatalogAccess.SearchCatalog(query, page, out totalPages);
        lstResults.DataBind();

        // Display pager
        firstPageUrl = Link.ToSearch(query, "1");
        pagerFormat = Link.ToSearch(query, "{0}");

        // have the current page as integer
        int currentPage = Int32.Parse(page);

        // Display pager controls
        PagerTop.Show(int.Parse(page), totalPages, firstPageUrl, pagerFormat, false);
        PagerBottom.Show(int.Parse(page), totalPages, firstPageUrl, pagerFormat, true);
    }
}