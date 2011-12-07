using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;

/// <summary>
/// Item catalog business tier component
/// </summary>
public class CatalogAccess {
    public CatalogAccess() { }

    // Retrieve the list of categories
    public static DataTable GetCategories() {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "JDwebstore-GetCategories";

        // execute the stored procedure and return the results
        return GenericDataAccess.ExecuteSelectCommand(comm);
    }

    // Get category details
    public static CategoryDetails GetCategoryDetails(string categoryId) {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "JDwebstore-CatalogGetCategoryDetails";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CategoryID";
        param.Value = categoryId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // execute the stored procedure
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);

        // wrap retrieved data into a CategoryDetails object
        CategoryDetails details = new CategoryDetails();

        if (table.Rows.Count > 0) {
            details.Name = table.Rows[0]["Name"].ToString();
            details.Description = table.Rows[0]["Description"].ToString();
        }

        // return department details
        return details;
    }

    // Get item details
    public static ItemDetails GetItemDetails(string itemId) {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "JDwebstore-CatalogGetItemDetails";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@ItemID";
        param.Value = itemId;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        // execute the stored procedure
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);

        // wrap retrieved data into an ItemDetails object
        ItemDetails details = new ItemDetails();

        if (table.Rows.Count > 0) {
            DataRow dr = table.Rows[0];

            // get item details
            details.ItemID = itemId;
            details.Name = dr["Name"].ToString();
            details.Description = dr["Description"].ToString();
            details.Price = Decimal.Parse(dr["Price"].ToString());
            details.Thumbnail = dr["Thumbnail"].ToString();
            details.Image = dr["Image"].ToString();
            details.OnFront = bool.Parse(dr["OnFront"].ToString());
        }

        // return item details
        return details;
    }

    // retrieve the list of items in a category
    public static DataTable GetItemsInCategory(string categoryId, string pageNumber, out int totalPages) {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "JDwebstore-CatalogGetItemsInCategory";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CategoryID";
        param.Value = categoryId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@DescriptionLength";
        param.Value = JDwebstoreConfig.ItemDescriptionLength;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@PageNumber";
        param.Value = pageNumber;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@ItemsPerPage";
        param.Value = JDwebstoreConfig.ItemsPerPage;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@HowManyItems";
        param.Direction = ParameterDirection.Output;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // execute the stored procedure and save the results in a DataTable
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);

        // calculate how many pages of items and set the out parameter
        int howManyItems = Int32.Parse
        (comm.Parameters["@HowManyItems"].Value.ToString());
        totalPages = (int)Math.Ceiling((double)howManyItems /
        (double)JDwebstoreConfig.ItemsPerPage);

        // return the page of items
        return table;
    }

    // Retrieve the list of products on catalog promotion
    public static DataTable GetItemsOnFront(string pageNumber, out int totalPages) {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "JDwebstore-CatalogGetItemsOnFrontpage";

        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@DescriptionLength";
        param.Value = JDwebstoreConfig.ItemDescriptionLength;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@PageNumber";
        param.Value = pageNumber;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@ItemsPerPage";
        param.Value = JDwebstoreConfig.ItemsPerPage;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@HowManyItems";
        param.Direction = ParameterDirection.Output;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // execute the stored procedure and save the results in a DataTable
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);

        // calculate how many pages of products and set the out parameter
        int totalItems = Int32.Parse(comm.Parameters["@HowManyItems"].Value.ToString());
        totalPages = (int)Math.Ceiling((double)totalItems / (double)JDwebstoreConfig.ItemsPerPage);

        // return the page of items
        return table;
    }

    // Searches the catalog
    public static DataTable SearchCatalog(string query, string pageNumber, out int totalPages) {
        DbCommand comm = GenericDataAccess.CreateCommand();

        comm.CommandText = "JDwebstore-SearchItems";

        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@uQuery";
        param.Value = query;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@DescriptionLength";
        param.Value = JDwebstoreConfig.ItemDescriptionLength;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@PageNumber";
        param.Value = pageNumber;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@ItemsPerPage";
        param.Value = JDwebstoreConfig.ItemsPerPage;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@HowManyItems";
        param.Direction = ParameterDirection.Output;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);

        int howManyItems = Int32.Parse(comm.Parameters["@HowManyItems"].Value.ToString());
        totalPages = (int)Math.Ceiling((double)howManyItems / (double)JDwebstoreConfig.ItemsPerPage);

        return table;
    }

    // Create a new item
    public static bool AddItem(string name, string price, string description, string keywords, string image, string thumbnail, string categoryId, string onFront, string onSlides) {
        DbCommand comm = GenericDataAccess.CreateCommand();

        comm.CommandText = "JDwebstore-CatalogAddItem";

        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@Name";
        param.Value = name;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Description";
        param.Value = description;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Price";
        param.Value = price;
        param.DbType = DbType.Decimal;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Keywords";
        param.Value = keywords;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Image";
        param.Value = image;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Thumbnail";
        param.Value = thumbnail;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@CategoryID";
        param.Value = categoryId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@OnFront";
        param.Value = onFront;
        param.DbType = DbType.Boolean;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@OnSlides";
        param.Value = onSlides;
        param.DbType = DbType.Boolean;
        comm.Parameters.Add(param);

        int result = -1;

        try {
            result = GenericDataAccess.ExecuteNonQuery(comm);
        } catch {

        }
        return (result >= 1);
    }

    // Updates the specified item
    public static bool UpdateItem(string itemId, string name, string price, string description, string keywords, string categoryId, string onFront, string onSlides) {
        DbCommand comm = GenericDataAccess.CreateCommand();

        comm.CommandText = "JDwebstore-CatalogUpdateItem";

        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@ItemID";
        param.Value = itemId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Name";
        param.Value = name;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Price";
        param.Value = price;
        param.DbType = DbType.Decimal;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Description";
        param.Value = description;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@OnFront";
        param.Value = onFront;
        param.DbType = DbType.Boolean;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@OnSlides";
        param.Value = onSlides;
        param.DbType = DbType.Boolean;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@Keywords";
        param.Value = keywords;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);

        param = comm.CreateParameter();
        param.ParameterName = "@CategoryID";
        param.Value = categoryId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        int result = -1;

        try {
            result = GenericDataAccess.ExecuteNonQuery(comm);
        } catch { }
        return (result >= 1);

    }
    // Delete an item
    public static bool DeleteItem(string itemId) {
        DbCommand comm = GenericDataAccess.CreateCommand();

        comm.CommandText = "JDwebstore-CatalogDeleteItem";

        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@ItemID";
        param.Value = itemId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        int result = -1;

        try {
            result = GenericDataAccess.ExecuteNonQuery(comm);
        } catch { }

        return (result != -1);
    }
}

public struct CategoryDetails {
    public string Name;
    public string Description;
}

public struct ItemDetails {
    public string ItemID;
    public string Name;
    public string Description;
    public decimal Price;
    public string Thumbnail;
    public string Image;
    public bool OnFront;
}