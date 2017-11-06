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
using LoginModelApp;

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
        int stateLogin;
        LoginModel vlogin = new LoginModel(userName, password);
        stateLogin = vlogin.verificarInicioSesion();
        switch (stateLogin) {
            case -2:
                Response.Write("<script language=javascript>alert('No hay conexión con la BD.')</script>");
                break;
            case -1:
                Session["VerifyUser"] = 1 + "";
                lblBase.Text = "Contraseña o Usuario incorrecto.";
                break;
            case 0:
                Server.Transfer("PortalClientes.aspx", true);
                break;
            case 1:
                Server.Transfer("IndexAdmin.aspx", true);
                break;
            case 3:
                //consultar empresa del usuario, y redirigir el usuario a dicha empresa.
                break;

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