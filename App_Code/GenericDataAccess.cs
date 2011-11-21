using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;

/// <summary>
/// Class contains generic data access functionality to be accessed from
/// the business tier
/// </summary>
public class GenericDataAccess {
    // static constructor
    static GenericDataAccess() { }

    // executes a command and returns the results as a DataTable object
    public static DataTable ExecuteSelectCommand(DbCommand command) {
        // The DataTable to be returned
        DataTable table;

        // Execute the command making sure the connection gets closed in the end
        // Open the data connection
        command.Connection.Open();

        // Execute the command and save the results in a DataTable
        DbDataReader reader = command.ExecuteReader();
        table = new DataTable();
        table.Load(reader);

        // Close the reader
        reader.Close();

        // Close the connection
        command.Connection.Close();

        return table;
    }

    // Creates and prepares a new DbCommand object on a new connection
    public static DbCommand CreateCommand() {
        // Obtain the database provider name
        string dataProviderName = JDwebstoreConfig.DbProviderName;

        // Obtain the database connection string
        string connectionString = JDwebstoreConfig.DbConnectionString;

        // Create a new data provider factory
        DbProviderFactory factory = DbProviderFactories.GetFactory(dataProviderName);

        // Obtain a database specific connection object
        DbConnection conn = factory.CreateConnection();

        // Set the connection string
        conn.ConnectionString = connectionString;

        // Create a database specific command object
        DbCommand comm = conn.CreateCommand();

        // Set the command type to stored procedure
        comm.CommandType = CommandType.StoredProcedure;

        // Return the initialized command object
        return comm;
    }
}