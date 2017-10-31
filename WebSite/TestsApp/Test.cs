using NUnit.Framework;
using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Edge;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using LoginModelApp;
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

        //UC-003:
        //        TC-009
        //[UnidadDeTrabajo][Contexto][Resultado]
        [TestCase("josecarlos@gmail.com", "1234")]
        public void SalesInfo_AvialableSalesInformation_ShowSalesInformation(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(3, state);

        }

        //UC-004: Acceder a listado de contactos registrados.
        //      TC-012: Acceder a la lista de contactos.
        //[UnidadDeTrabajo][Contexto][Resultado]

        [TestCase("josecarlos@gmail.com", "1234")]
        public void ContactInfo_AvialableContactInformation_ShowContactInformation(String userName, String password)
        {
            int state;
            //enviar usuario y contraseña.
            //Login.verificarInicioSesion("","");
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(3, state);

        }



    }
}


