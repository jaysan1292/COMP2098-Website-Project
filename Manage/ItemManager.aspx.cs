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
}