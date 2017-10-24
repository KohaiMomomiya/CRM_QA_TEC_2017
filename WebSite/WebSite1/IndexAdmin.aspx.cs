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
        DropDownList1.Items.Clear();
        SqlConnection con = null;
        int isUser = 0;

        try
        {
            con = new SqlConnection("Data Source=MPC\\SQLEXPRESS;Initial Catalog=TEC_QA_CRM;Integrated Security=True");

        }
        catch (Exception ex)
        {
            Response.Write("<script language=javascript>alert('No hay conexión con la BD.')</script>");
        }

        con.Open();
        System.Data.SqlTypes.SqlNullValueException exp;
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader;
        cmd.CommandText = "dbo.getCorporationsName";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            try
            {
                string corpName = reader.GetValue(0).ToString();
                DropDownList1.Items.Add(corpName);
            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }

        }
        con.Close();
    }

    protected void bttnCerrarSesion(object sender, EventArgs e)
    {
        Server.Transfer("Login.aspx", true);
    }

    protected void bttnBuscar(object sender, EventArgs e)
    {
        /*HttpCookie cName = new HttpCookie("Corp");
        cName.Value = DropDownList1.SelectedItem.Value;
        Response.Cookies.Add(cName);*/
        Session["Corp"] = DropDownList1.SelectedItem.Value;
        Response.Redirect("Empresas.aspx");
        Server.Transfer("Empresas.aspx", true);
    }
}