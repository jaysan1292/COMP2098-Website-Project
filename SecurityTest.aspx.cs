using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Security;

public partial class SecurityTest : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void btnProcess_Click(object sender, EventArgs e) {
        string hash1 = PasswordHasher.Hash(txtPwd1.Text);
        string hash2 = PasswordHasher.Hash(txtPwd2.Text);
        StringBuilder sb = new StringBuilder();
        sb.Append("The hash of the first password is: ");
        sb.Append(hash1);
        sb.Append("<br />The hash of the second password is: ");
        sb.Append(hash2);

        if (hash1 == hash2) {
            sb.Append("<br/>The passwords match!");
        } else {
            sb.Append("<br/>Password invalid.");
        }
        lblResult.Text = sb.ToString();
    }
}