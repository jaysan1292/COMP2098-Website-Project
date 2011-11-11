using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;

/// <summary>
/// Product catalog business tier component
/// </summary>
public class CatalogAccess
{
    public CatalogAccess() { }

    // Retrieve the list of categories
    public static DataTable GetCategories()
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "JDwebstore-GetCategories";

        // execute the stored procedure and return the results
        return GenericDataAccess.ExecuteSelectCommand(comm);
    }
}