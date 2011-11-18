using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.MasterPage
{
    public string CurrentPage
    {
        get
        {
            return MainMenu.CurrentPage;
        }
        set
        {
            MainMenu.CurrentPage = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        MainMenu.CurrentPage = CurrentPage;
    }

    public void SetCurrentPage(string page)
    {
        CurrentPage = page;
    }
}
