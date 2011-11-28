using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;

/// <summary>
/// Summary description for ShoppingCartAccess
/// </summary>
public class ShoppingCartAccess {
    public ShoppingCartAccess() {
    }

    // returns the shopping cart ID for the current user
    private static string shoppingCartId {
        get {
            // get the current HttpContext
            HttpContext context = HttpContext.Current;
            string cartId;
            // if the cart ID isn't in the cookie...
            {
                // check if the cart ID exists as a cookie
                if (context.Request.Cookies["JDwebstore_CartID"] != null) {
                    // try to retrieve the cart ID from the user cookie
                    cartId = context.Request.Cookies["JDwebstore_CartID"].Value;
                    // return the id
                    return cartId;
                } else
                // if the cart ID doesn't exist in the cookie as well, generate
                // a new ID
                {
                    // generate a new GUID
                    cartId = Guid.NewGuid().ToString();
                    // create the cookie object and set its value
                    HttpCookie cookie = new HttpCookie("JDwebstore_CartID", cartId);
                    // set the cookie's expiration date
                    int howManyDays = JDwebstoreConfig.CartPersistDays;
                    DateTime currentDate = DateTime.Now;
                    TimeSpan timeSpan = new TimeSpan(howManyDays, 0, 0, 0);
                    DateTime expirationDate = currentDate.Add(timeSpan);
                    cookie.Expires = expirationDate;
                    // set the cookie on the client's browser
                    context.Response.Cookies.Add(cookie);
                    // return the CartID
                    return cartId.ToString();
                }
            }
        }
    }

    // Add a new shopping cart item
    public static bool AddItem(string itemId, string attributes) {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "JDwebstore-ShoppingCartAddItem";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@ItemID";
        param.Value = itemId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Attributes";
        param.Value = attributes;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        // returns true in case of success and false in case of an error
        try {
            // execute the stored procedure and return true if it executes
            // successfully, and false otherwise
            return (GenericDataAccess.ExecuteNonQuery(comm) != -1);
        } catch {
            // prevent the exception from propagating, but return false to
            // signal the error
            return false;
        }
    }

    // Update the quantity of a shopping cart item
    public static bool UpdateItem(string itemId, int quantity) {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "JDwebstore-ShoppingCartUpdateItem";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@ItemID";
        param.Value = itemId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Quantity";
        param.Value = quantity;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // returns true in case of success and false in case of an error
        try {
            // execute the stored procedure and return true if it executes
            // successfully, and false otherwise
            return (GenericDataAccess.ExecuteNonQuery(comm) != -1);
        } catch {
            // prevent the exception from propagating, but return false to
            // signal the error
            return false;
        }
    }

    // Remove a shopping cart item
    public static bool RemoveItem(string itemId) {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "JDwebstore-ShoppingCartRemoveItem";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@ItemID";
        param.Value = itemId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // returns true in case of success and false in case of an error
        try {
            // execute the stored procedure and return true if it executes
            // successfully, and false otherwise
            return (GenericDataAccess.ExecuteNonQuery(comm) != -1);
        } catch {
            // prevent the exception from propagating, but return false to
            // signal the error
            return false;
        }
    }

    // Retrieve shopping cart items
    public static DataTable GetItems() {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "JDwebstore-ShoppingCartGetItems";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        comm.Parameters.Add(param);
        // return the result table
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);
        return table;
    }


    // Retrieve shopping cart items
    public static decimal GetTotalAmount() {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "JDwebstore-ShoppingCartGetTotalAmount";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        comm.Parameters.Add(param);
        // return the result table
        return Decimal.Parse(GenericDataAccess.ExecuteScalar(comm));
    }

}
