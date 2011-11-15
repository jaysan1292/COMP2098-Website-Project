using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ItemList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }

    private void PopulateControls()
    {
        // Retrieve CategoryID from the query string
        string categoryId = Request.QueryString["CategoryID"];

        // Retrieve Page from the query string
        string page = Request.QueryString["Page"];

        if (page == null) page = "1";
        // How many pages of products?
        int totalPages = 1;

        // pager links format
        string firstPageUrl = "";
        string pagerFormat = "";

        //if browsing a category..
        if (categoryId != null)
        {
            // Retrieve list of products in a category
            lstItems.DataSource = CatalogAccess.GetItemsInCategory(categoryId, page, out totalPages);
            lstItems.DataBind();

            // get first page url and pager format
            firstPageUrl = Link.ToCategory(categoryId, "1");
            pagerFormat = Link.ToCategory(categoryId, "{0}");
        }
        else if (categoryId != null)
        {
            // Retrieve list of products 
            lstItems.DataSource = CatalogAccess.GetItemsInCategory(categoryId, page, out totalPages);
            lstItems.DataBind();
            // get first page url and pager format
            firstPageUrl = Link.ToCategory(categoryId, "1");
            pagerFormat = Link.ToCategory(categoryId, "{0}");
        }
        else
        {
            // Retrieve list of products on catalog promotion
            lstItems.DataSource = CatalogAccess.GetItemsOnFront(page, out totalPages);
            lstItems.DataBind();

            // have the current page as integer
            int currentPage = Int32.Parse(page);
        }

        // Display pager controls
        PagerTop.Show(int.Parse(page), totalPages, firstPageUrl, pagerFormat, false);
        PagerBottom.Show(int.Parse(page), totalPages, firstPageUrl, pagerFormat, true);
    }
}