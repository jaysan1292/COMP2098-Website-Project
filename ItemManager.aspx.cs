using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_ItemManager : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        this.Title = JDwebstoreConfig.SiteName + " - Item Management";

        // Add item dialog stuff
        btnCancel.Attributes.Add("onclick", "hideLightbox();");
        initDialog(txtName, "name");
        initDialog(txtDescription, "description");
        initDialog(txtPrice, "price");
        initDialog(txtKeywords, "keywords");
        initDialog(txtImage, "image");
        initDialog(lstCategories, "category");
        initDialog(chkOnFront, "frontpage");
        initDialog(chkOnSlides, "slideshow");
    }

    private void initDialog(WebControl control, string id) {
        control.Attributes.Add("onfocus", "document.getElementById('" + id + "').style.display='block'");
        control.Attributes.Add("onblur", "document.getElementById('" + id + "').style.display='none'");
        control.Attributes.Add("onmouseover", "document.getElementById('" + id + "').style.display='block'");
        control.Attributes.Add("onmouseout", "document.getElementById('" + id + "').style.display='none'");
    }
    protected void lstItems_ItemCreated(object sender, DataListItemEventArgs e) {
        //string command = "resetItemValues('" + lstItems.index + "');
        //btnCancel.Attributes.Add("onclick",command);
    }
    protected void btnSubmit_Click(object sender, EventArgs e) {

    }
    protected void btnCancel_Click(object sender, EventArgs e) {
        Response.Redirect("~/CANCEL" + txtName.Text + ".aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e) {
        Response.Redirect("~/DELETE" + txtName.Text + ".aspx");
    }
    protected void btnSubmit_Click1(object sender, EventArgs e) {
        string name = txtName.Text;
        string description = txtDescription.Text;
        string price = txtPrice.Text;
        string keywords = txtKeywords.Text;
        string image = txtImage.Text;
        int categoryId = lstCategories.SelectedIndex;
        bool onFront = chkOnFront.Checked;
        bool onSlides = chkOnSlides.Checked;

    }

    [System.Web.Services.WebMethod]
    public static string createItem(string[] item) {
        /*
         *item[0] = name
         *item[1] = description
         *item[2] = price
         *item[3] = keywords
         *item[4] = image
         *item[5] = thumbnail
         *item[6] = categoryId
         *item[7] = onFront
         *item[8] = onSlides
         */
        bool success = CatalogAccess.AddItem(item[0], item[2], item[1], item[3], item[4], item[5], item[6], item[7], item[8]);
        return success ? "Item added successfully!" : "There was an error processing your request.";
    }

    [System.Web.Services.WebMethod]
    public static string deleteItem(string itemId) {
        ErrorLogger log = new ErrorLogger();
        log.ErrorLog(HttpContext.Current.Server.MapPath("Logs/Delete"), "Item with ID " + itemId + " deleted from database.");
        bool success = CatalogAccess.DeleteItem(itemId);
        return success ? "Item deleted successfully." : "There was an error processing your request.";
    }

    [System.Web.Services.WebMethod]
    public static string updateItem(string[] item) {
        /*
         *item[0] = name
         *item[1] = description
         *item[2] = price
         *item[3] = keywords
         *item[4] = image
         *item[5] = thumbnail
         *item[6] = categoryId
         *item[7] = onFront
         *item[8] = onSlides
         *item[9] = itemId
         */
        bool success = CatalogAccess.UpdateItem(item[9], item[0], item[2], item[1], item[3], item[6], item[7], item[8]);
        return success ? "Item updated successfully." : "There was an error processing your request.";
    }
}