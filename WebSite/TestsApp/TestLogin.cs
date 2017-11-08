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
using LoginModelApp;
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


        //UC-001: Acceder al sistema.
        //      TC-01: Acceder al sistema como administrador.
        [TestCase ("admin@gmail.com","1234")]
       
        public void LoginUser_ValidData_StartUserSession(String userName, String password)
        {

            int state;
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(1,state);
            
        }


        //UC-001: Acceder al sistema.
        //      TC-01: Acceder al sistema como inválido.
        
        [TestCase("adminzzz@gmail.com", "1234")]
        public void LoginUser_InvalidDataUserName_StartUserSession(String userName, String password)
        {
            int state;
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(-1, state);

        }

        //UC-001: Acceder al sistema.
        //      TC-03: Acceder al sistema con contraseña inválida.
        [TestCase("admin@gmail.com", "12434")]
        public void LoginUser_InvalidDataPassword_StartUserSession(String userName, String password)
        {
            int state;
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(-1, state);

        }

        //UC-001: Acceder al sistema.
        //      TC-04: Acceder al sistema No se ingresa la contaseña.
        [TestCase("admin@gmail.com", "")]
        public void LoginUser_InvalidDataNoPassword_StartUserSession(String userName, String password)
        {
            int state;
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(-1, state);

        }

        //UC-001: Acceder al sistema.
        //      TC-05: Acceder al sistema sin usuario.
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

        //UC-001: Acceder a listado de Empresas.
        //      TC-076: Acceder al sistema como usuario.

        [TestCase("bernan0795@gmail.com", "1234")]
        public void SalesInfo_AvialableCorporationInformation_ShowCorporationInformation(String userName, String password)
        {
            int state;
            
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(0, state);

        }

        //UC-004: Acceder a listado de Empresas.
        //      TC-012: Acceder a la lista de contactos como usuario.
        

        [TestCase("josecarlos@gmail.com", "1234")]
        public void ContactInfo_AvialableCorporationInformation_ShowCoporationInformation(String userName, String password)
        {
            int state;
            
            LoginModel vlogin = new LoginModel(userName, password);
            state = vlogin.verificarInicioSesion();
            Assert.AreEqual(3, state);

        }

        //UC-004: Acceder a listado de Empresas.
        //      TC-015: Lista de contactos está vacía
        

        [TestCase]
        public void CorpInfo_AccessCorpInformatin_DontExistsCorporations()
        {

            
            ArrayList corporaciones = AdminModel.corporations();
            int canditad = corporaciones.Count;
            Assert.Equals(canditad, 0);
        
           

        }

        //UC-004: Acceder a listado de contactos registrados.
        //      TC-014: Lista de contactos no está vacía
        

        [TestCase]
        public void CorptInfo_AccessCorpInformatin_ExistsCorp()
        {

            ArrayList corporaciones = AdminModel.corporations();
            int canditad = corporaciones.Count;
            Assert.Greater(canditad, 0);

        }


    }
}


