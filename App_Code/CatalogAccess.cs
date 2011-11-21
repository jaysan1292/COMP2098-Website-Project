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