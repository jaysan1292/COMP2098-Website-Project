using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// simple struct that represents a (page number, url) association
public struct PageUrl {
    private string page;
    private string url;

    // Page and Url property definitions
    public string Page {
        get {
            return page;
        }
    }
    public string Url {
        get {
            return url;
        }
    }

    // constructor
    public PageUrl(string page, string url) {
        this.page = page;
        this.url = url;
    }
}

public partial class UserControls_Pager : System.Web.UI.UserControl {
    public void Show(int currentPage, int totalPages, string firstPageUrl, string pageUrlFormat, bool showPages) {
        // display paging controls
        if (totalPages > 1) {
            // make the pager visible
            this.Visible = true;

            // display the current page
            lblCurrentPage.Text = currentPage.ToString();
            lblTotalPages.Text = totalPages.ToString();

            // create the Previous link
            if (currentPage == 1) {
                lnkPrevious.Enabled = false;
            } else {
                NameValueCollection query = Request.QueryString;
                string paramName, newQueryString = "?";
                for (int i = 0; i < query.Count; i++)
                    if (query.AllKeys[i] != null)
                        if ((paramName = query.AllKeys[i].ToString()).ToUpper() != "PAGE")
                            newQueryString += paramName + "=" + query[i] + "&";
                lnkPrevious.NavigateUrl = Request.Url.AbsolutePath + newQueryString + "Page=" + (currentPage - 1).ToString();
            }

            // create the Next link
            if (currentPage == totalPages) {
                lnkNext.Enabled = false;
            } else {
                NameValueCollection query = Request.QueryString;
                string paramName, newQueryString = "?";
                for (int i = 0; i < query.Count; i++)
                    if (query.AllKeys[i] != null)
                        if ((paramName = query.AllKeys[i].ToString()).ToUpper() != "PAGE")
                            newQueryString += paramName + "=" + query[i] + "&";
                lnkNext.NavigateUrl = Request.Url.AbsolutePath + newQueryString + "Page=" + (currentPage + 1).ToString();

            }

            // create the page links
            if (showPages) {
                // the list of pages and their URLs as an array
                PageUrl[] pages = new PageUrl[totalPages];

                // generate (page, url) elements
                pages[0] = new PageUrl("1", firstPageUrl);
                for (int i = 2; i <= totalPages; i++) {
                    pages[i - 1] = new PageUrl(i.ToString(), String.Format(pageUrlFormat, i));
                }
                // do not generate a link for the currentpage
                pages[currentPage - 1] = new PageUrl((currentPage).ToString(), "");

                // feed the pages to the repeater
                repPages.DataSource = pages;
                repPages.DataBind();
            }
        }
    }
}