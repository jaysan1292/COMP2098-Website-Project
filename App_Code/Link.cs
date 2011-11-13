using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Link factory class
/// </summary>
public class Link
{
	// Builds an absolute URL
    private static string BuildAbsolute(string relativeUri)
    {
        // get current url
        Uri uri = HttpContext.Current.Request.Url;

        // build absolute path
        string app = HttpContext.Current.Request.ApplicationPath;

        if (!app.EndsWith("/")) app += "/";

        relativeUri = relativeUri.TrimStart('/');

        //return the absolute path
        return HttpUtility.UrlPathEncode(String.Format("http://{0}:{1}{2}{3}", uri.Host, uri.Port, app, relativeUri));
    }

    // Generate a category URL
    public static string ToCategory(string categoryId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("Category.aspx?CategoryID={0}", categoryId));
        else
            return BuildAbsolute(String.Format("Category.aspx?CategoryID={0}&Page={1}", categoryId, page));
    }

    // Generate a category URL for the first page
    public static string ToCategory(string categoryId)
    {
        return ToCategory(categoryId, "1");
    }

    public static string ToProductImage(string fileName)
    {
        // build item URL
        return BuildAbsolute("/Images/ItemImages/" + fileName);
    }

    public static string ToSearchResult(string query)
    {
        return BuildAbsolute(String.Format("Search.aspx?q={0}", query));
    }
}