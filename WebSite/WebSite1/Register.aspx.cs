using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnClickInicieSesionLabel(object sender, EventArgs e)
    {
        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
    }


    protected void bttnInicieSesion(object sender, EventArgs e)
    {
        //ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
        Server.Transfer("Login.aspx", true);
    }
}