using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using toConnect;
using toAdminModel;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                loadCorps();
            }
            catch (Exception exp)
            {
                Response.Write("<script>window.alert('No hay datos catálogo' " + " + " + exp + ");</script>");

            }

        }
        
    }

    private void loadCorps()
    {

        //Voy a cargar las corporaciones, son string entonces voy a usar un array de strings
        ArrayList corporations = new ArrayList();
        int isUser = 0;
        corporations = AdminModel.corporations();

        DropDownList1.Items.Clear();

        for(int i = 0; i < corporations.Count; i++)
        {
            DropDownList1.Items.Add(corporations[i].ToString());
        }

        
    }

    protected void bttnCerrarSesion(object sender, EventArgs e)
    {
        Server.Transfer("Login.aspx", true);
    }

    protected void bttnBuscar(object sender, EventArgs e)
    {
        
        Session["Corp"] = DropDownList1.SelectedItem.Value;
        Response.Redirect("Empresas.aspx");
        Server.Transfer("Empresas.aspx", true);
    }
}