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
   

    //SqlConnection con = new SqlConnection("Data Source=DESKTOP-7UGVRJF;Initial Catalog=controlVacaciones;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void bttnRegistreseAqui(object sender, EventArgs e)
    {
        Server.Transfer("Register.aspx", true);
    }


    public void verificarInicioSesion(String userName, String password) {
        SqlConnection con = null;
        int isUser = 0;

        try
        {
            con = new SqlConnection("Data Source=MPC\\SQLEXPRESS;Initial Catalog=TEC_QA_CRM;Integrated Security=True");
            lblBase.Text = "Conexión con TEC_QA_CRM";
        }
        catch (Exception ex)
        {
            Response.Write("<script language=javascript>alert('No hay conexión con la BD.')</script>");
        }

        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT dbo.validarLogin(@userName,@password)", con);
        cmd.Parameters.AddWithValue("@userName", userName);
        cmd.Parameters.AddWithValue("@password", password);
        isUser = (Int32)cmd.ExecuteScalar();
        con.Close();

        //devuelve el salt desde sql con el cual sabemos si el usuario es administrador o no.
        if (isUser == -1)
        {
            //no hay usuario
            Session["VerifyUser"] = 1 + "";
            lblBase.Text = "Contraseña o Usuario incorrecto.";
        }
        else
        {
            Session["VerifyUser"] = 0 + "";
            //El tipo de salt representa si el usuario es administrador o no.
            if (isUser == 1)
            {
                Server.Transfer("IndexAdmin.aspx", true);
            }
            else
            {
                Server.Transfer("PortalClientes.aspx", true);
            }

        }

    }
    protected void bttnIniciarSesion(object sender, EventArgs e)
    {
        //Verifica si el usuario y contraseña coinciden.
        String userName = TextBox1.Text;
        String password = TextBox2.Text;

        verificarInicioSesion(userName, password);


    }
}