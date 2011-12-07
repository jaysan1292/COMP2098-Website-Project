using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Cart : System.Web.UI.Page {
    protected void Page_Init(object sender, EventArgs e) {
        //Main Master = (Main)Page.Master;
        //Master.SetCurrentPage("Account");
    }
    protected void Page_Load(object sender, EventArgs e) {
        // Populate the control only on the initial page load
        if (!IsPostBack) {
            PopulateControls();
        }
    }

    // fill shopping cart controls with data
    private void PopulateControls() {
        // get the items in the shopping cart
        DataTable dt = ShoppingCartAccess.GetItems();

        // if the shopping cart is empy
        if (dt.Rows.Count == 0) {
            lblMessage.Text = "You have no items in your shopping cart.";
            grid.Visible = false;
            btnUpdate.Enabled = false;
            lblTotalAmount.Text = String.Format("{0:c}", 0);
        } else {
            // if the shopping cart is not empty
            // populate the list with the shopping cart contents
            grid.DataSource = dt;
            grid.DataBind();


            // set up controls
            lblMessage.Text = "Items in your cart:";
            grid.Visible = true;
            btnUpdate.Enabled = true;

            // display the total amount
            decimal amount = ShoppingCartAccess.GetTotalAmount();
            lblTotalAmount.Text = String.Format("{0:c}", amount);
        }
    }

    // remove an item from the cart
    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e) {
        // Index of the row being deleted
        int rowIndex = e.RowIndex;

        // The ID of the product being deleted
        string itemId = grid.DataKeys[rowIndex].Value.ToString();

        // Remove the product from the shopping cart
        bool success = ShoppingCartAccess.RemoveItem(itemId);

        // display status
        lblStatus.Text = success ? "Item removed successfully!" : "There was an error removing the item from your cart.";

        // Repopulate the control
        PopulateControls();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowDialog", "showMessage()", true);
    }

    // update shopping cart item quantities
    protected void btnUpdate_Click(object sender, EventArgs e) {
        // Number of rows in the GridView
        int rowsCount = grid.Rows.Count;

        // Will store a row of the GridView
        GridViewRow gridRow;

        // Will reference a quantity TextBox in the GridView
        TextBox quantityTextBox;

        // Variables to store item ID and quantity
        string itemId;
        int quantity;

        // Was the update successful?
        bool success = true;

        // Go through the rows of the GridView
        for (int i = 0; i < rowsCount; i++) {
            // Get a row
            gridRow = grid.Rows[i];

            // The ID of the item being deleted
            itemId = grid.DataKeys[i].Value.ToString();

            // Get the quantity TextBox in the Row
            quantityTextBox = (TextBox)gridRow.FindControl("txtQuantity");
            // TODO: Figure out why THIS DOESN'T WORK

            // Get the quantity, guarding against bogus values
            if (Int32.TryParse(quantityTextBox.Text, out quantity)) {
                // Update product quantity
                success = success && ShoppingCartAccess.UpdateItem(itemId, quantity);
            } else {
                // if TryParse didn't succeed
                success = false;
            }

            // Display status message
            lblStatus.Text = success ? "Shopping cart successfully updated." : "Some quantity updates failed. Please make sure you have entered correct values.";
        }
        // Repopulate the control
        PopulateControls();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowDialog", "showMessage()", true);
    }
}