using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Item : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        // Retrieve ItemID from the query string
        string itemId = Request.QueryString["ItemID"];

        // redirect to homepage if ItemID is null
        if (itemId == null) {
            Response.Redirect("Default.aspx");
        }

        // Retrieves item details
        ItemDetails det = CatalogAccess.GetItemDetails(itemId);

        // Does the item exist?
        if (det.Name != null) {
            PopulateControls(det);
        }
    }

    // Fill the control with data
    private void PopulateControls(ItemDetails det) {
        // Display item details
        lblTitle.Text = det.Name;
        lblDescription.Text = det.Description;
        lblPrice.Text = String.Format("{0:c}", det.Price);
        imgItem.ImageUrl = "~/Images/ItemImages/" + det.Image;

        // Set the title of the page
        this.Title = JDwebstoreConfig.SiteName + " - " + det.Name;
    }
    protected void btnAddToCart_Click(object sender, EventArgs e) {
        // Retrieve ItemID from the query string
        string itemId = Request.QueryString["ItemID"];

        string options = "";
        // Retrive the selected product options
        // TODO: Determine if this block of code is necessary;
        // PDF pg399; Textbook pg384

        // Add the product to the shopping cart
        ShoppingCartAccess.AddItem(itemId, options);
        Response.Redirect(Request.Url.ToString());
    }
}