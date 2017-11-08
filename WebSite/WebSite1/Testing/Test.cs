using NUnit.Framework;
using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Edge;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using toAdminModel;


/// <summary>
/// Summary description for Test
/// </summary>


namespace LoginModelApp
{

    [TestFixture]
    public class Test
    {
        public Test() {
        }

        [TestCase ("admin@gmail.com","1234")]
        //[UnidadDeTrabajo][Contexto][Resultado]
        public void LoginUser_ValidData_StartUserSession(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(1,state);
            
        }

        //Usuario inválida
        [TestCase("adminzzz@gmail.com", "1234")]
        public void LoginUser_InvalidDataUserName_StartUserSession(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(-1, state);

        }

        //Contraseña inválida
        [TestCase("admin@gmail.com", "12434")]
        public void LoginUser_InvalidDataPassword_StartUserSession(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(-1, state);

        }

        //No ingresa contraseña
        [TestCase("admin@gmail.com", "")]
        public void LoginUser_InvalidDataNoPassword_StartUserSession(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(-1, state);

        }

        //No ingresa usuario
        [TestCase("", "1234")]
        public void LoginUser_InvalidDataNoUserName_StartUserSession(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(-1, state);

        }

        /*
        //Ingresa a sección de ventas
        [TestCase]
        public void AdminSelection_AccessSalesInfo_SalesDataEmpty(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            AdminModel admin = new AdminModel();
            ArrayList corporaciones = new ArrayList();
               //corporaciones = admin.corporations();
            
            Assert.AreEqual(0, corporaciones.Count);
            

        }*/

    }
}


