﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        Main master = (Main)Page.Master;
        master.SetCurrentPage("Account");
    }
    protected void Page_Load(object sender, EventArgs e) { }
}