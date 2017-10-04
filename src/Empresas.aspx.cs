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

public partial class Empresas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadDataCorp();

    }

    private void loadDataCorp() {
        if (Session["Corp"] != null)
        {
            Label12.Text = Session["Corp"].ToString();
            Session.Abandon();
        }
        else {
            Label12.Text = "Sin nombre";
        }

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
        cmd.CommandText = "dbo.getCorporationData";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@name", Label12.Text);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            try
            {
                Label20.Text = reader.GetValue(1).ToString();
                string phoneNumber = reader.GetValue(2).ToString();
                DropDownList1.Items.Add(phoneNumber);
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

    }
}