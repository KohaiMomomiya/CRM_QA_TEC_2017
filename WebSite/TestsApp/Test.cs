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

/// <summary>
/// Summary description for Test
/// </summary>


namespace TestsApp
{

    [TestFixture]
    public class Test
    {
        public Test()
        {
        }
        IWebDriver driver;

        [SetUp]
        public void setup() {
            driver = new EdgeDriver();

            driver.Manage().Window.Maximize();
        }

        [Test]
        public void verifyValidLogin()
        {
            
            driver.Url =  "http://localhost:60144/Login.aspx";
            driver.FindElement(By.Id("TextBox1")).SendKeys("admin@gmail.com");
            driver.FindElement(By.Id("TextBox2")).SendKeys("1234");

            //hacer click en el botón
            driver.FindElement(By.Id("Button1")).Click();

            //obtener valor del cookie.
            String loginState = HttpContext.Current.Session["VerifyUser"].ToString();
            Assert.AreEqual(loginState, "0");
            Console.WriteLine("*********Login correcto********");
        }

        [Test]
        public void verifyInvalidLogin()
        {
            //codigo para probar.

            //obtener valor del cookie.
            String loginState = HttpContext.Current.Session["VerifyUser"].ToString();
            Assert.That(loginState, Does.Match("1"));
        }
    }
}


