using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Repo for JDwebstore configuration settings
/// </summary>
public class JDwebstoreConfig {
    // Caches the connection string
    private static string dbConnectionString;

    // Caches the data provider name
    private static string dbProviderName;

    // Store the number of items per page
    private readonly static int itemsPerPage;

    // Store the product description length for product lists
    private readonly static int itemDescriptionLength;

    // Store the name of your shop
    private readonly static string siteName;

    static JDwebstoreConfig() {
        dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        dbProviderName = ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName;
        itemsPerPage = System.Int32.Parse(ConfigurationManager.AppSettings["ItemsPerPage"]);
        itemDescriptionLength = System.Int32.Parse(ConfigurationManager.AppSettings["ItemDescriptionLength"]);
        siteName = ConfigurationManager.AppSettings["SiteName"];
    }

    // Returns the maximum number of products to be displated on a page
    public static int ItemsPerPage {
        get {
            return itemsPerPage;
        }
    }

    // Returns the legnth of product descriptions in items list
    public static int ItemDescriptionLength {
        get {
            return itemDescriptionLength;
        }
    }

    // Returns the shop name
    public static string SiteName {
        get {
            return siteName;
        }
    }

    // Returns the connection string for the database
    public static string DbConnectionString {
        get {
            return dbConnectionString;
        }
    }

    // Returns the data provider name
    public static string DbProviderName {
        get {
            return dbProviderName;
        }
    }
}