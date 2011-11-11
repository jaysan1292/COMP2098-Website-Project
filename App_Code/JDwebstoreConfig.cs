using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Repo for JDwebstore configuration settings
/// </summary>
public class JDwebstoreConfig
{
	// Caches the connection string
    private static string dbConnectionString;

    // Caches the data provider name
    private static string dbProviderName;

    static JDwebstoreConfig()
    {
        dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        dbProviderName = ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName;
    }

    // Returns the connection string for the database
    public static string DbConnectionString
    {
        get
        {
            return dbConnectionString;
        }
    }

    // Returns the data provider name
    public static string DbProviderName
    {
        get
        {
            return dbProviderName;
        }
    }
}