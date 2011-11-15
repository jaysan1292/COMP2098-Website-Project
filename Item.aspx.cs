using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Retrieve ItemID from the query string
        string itemId = Request.QueryString["ItemID"];

        // Retrieves item details
        ItemDetails det = CatalogAccess.GetItemDetails(itemId);

        // Does the item exist?
        if (det.Name != null)
        {
            PopulateControls(det);
        }
    }
    
    // Fill the control with data
    private void PopulateControls(ItemDetails det)
    {
        // Display item details
        lblTitle.Text = det.Name;
        lblDescription.Text = det.Description;
        lblPrice.Text = String.Format("{0:c}", det.Price);
        imgItem.ImageUrl = "~/Images/ItemImages/" + det.Image;

        // Set the title of the page
        this.Title = JDwebstoreConfig.SiteName + " - " + det.Name;
    }
}