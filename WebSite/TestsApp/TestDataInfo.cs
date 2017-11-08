using NUnit.Framework;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using LoginModelApp;
using toAdminModel;
using toEmpresaModel;

namespace TestsApp
{

    [TestFixture]
    class TestDataInfo
    {

        //UC-004: Acceder a listado de Empresas.
        //      TC-015: Lista de empress está vacía
        
        [TestCase("Herramientas Friend")]
        public void CorpInfo_AccessCorpInformatin_DontExistsContacts(String corpName)
        {
            
            ArrayList contactos = EmpresaModel.cargaDataCorp(corpName);
            int cantidad = contactos.Count;
            Assert.AreEqual(cantidad, 0);

        }

        //UC-004: Acceder a listado de Empresas.
        //      TC-012: Lista de empress tiene elementos como administrador
        [TestCase("Herramientas Friend")]
        
        public void ContactInfo_AccessCorpInformatin_ExistsContact(String corpName)
        {

            ArrayList contactos = EmpresaModel.cargaDataCorp(corpName);
            int cantidad = contactos.Count;
            Assert.Greater(cantidad, 0);

        }



        //UC-004: Acceder a info de contacto específico.
        //      TC-016: Acceso a información de un usuario específico
        [TestCase("José Carlos Mora", "Herramientas Friend")]
        
        public void SalesInformation_AccessingInfoContactSpecific_ContactExists(String contactName, string corpName)
        {

            ArrayList contactos = EmpresaModel.getCorpContacts(corpName);
            if (contactos.Contains(contactName))
            {
                int posicion = contactos.IndexOf(contactName);
                string correoDir = contactos[posicion + 1].ToString() + contactos[posicion + 3].ToString();
                Assert.AreEqual(correoDir, "josecarlos@gmail.comBarrio Escalante de San José");
            }
            

        }

        //UC-013: Acceder a info de ventas.
        //      TC-027: Acceso a información de ventas
        [TestCase("Herramientas Friend")]
        
        public void SalesInformation_AccessingSales_ShowSales(String corpName)
        {

            ArrayList ventas = EmpresaModel.getSalesCorp(corpName);
            int cantidad = ventas.Count;
            Assert.Greater(cantidad, 0);

        }

        //UC-013: Acceder a info de ventas de contacto.
        //      TC-028: Acceder a información de Empresa que no tiene ventas
        [TestCase("P&G")]
        
        public void SalesInformation_AccessingSales_ShowSalesSpecific(String corpName)
        {

            ArrayList ventas = EmpresaModel.getSalesCorp(corpName);
            int canditad = ventas.Count;
            Assert.AreEqual(canditad, 0);

        }

        //UC-014: Verificar Relación contacto Venta.
        //      TC-029: Verificar que la venta se relaciona con un contacto
        [TestCase("Alberto Plaza Muhr", "Herramientas Friend")]
        
        public void SalesInformation_RelationContactSale_ExistsSaleRelatedContact(String contactName, string corpName)
        {

            ArrayList contactos = EmpresaModel.getCorpContacts(contactName);
            ArrayList ventas = EmpresaModel.getSalesCorp(corpName);
            if (contactos.Contains(contactName))
                Assert.IsTrue(ventas.Contains(contactName));

        }

        //UC-034: Acceder a info de contacto específico.
        //      TC-059: Acceso a información de un usuario específico
        [TestCase("Herramientas Friend")]
        
        public void SalesInformation_AccessingInfoCorptSpecific_CorpExists(String corpName)
        {

            ArrayList contactos = EmpresaModel.cargaDataCorp(corpName);
            int posicion = contactos.IndexOf(corpName);
            string numTelAdress = contactos[posicion + 1].ToString() + contactos[posicion + 2].ToString();
            Assert.AreEqual(numTelAdress, "87849009Carmelita de Alajuela");

        }

        //UC-042: Acceder info de pruepuestas de empresa.
        //      TC-071: Existen propuestas de propuestas para empresas
        [TestCase("Herramientas Friend")]
        
        public void PropInformation_AccessingInfoProp_ExistsProp(String corpName)
        {

            ArrayList propuestas = EmpresaModel.getPropCorp(corpName);
            int cantidad = propuestas.Count;
            Assert.Greater(cantidad, 0);

        }

        //UC-042: Acceder info de pruepuestas de empresa.
        //      TC-072: No hay información de propuestas
        [TestCase("Herramientas Friend")]
        
        public void PropInformation_AccessingInfoProp_DontExistsProp(String corpName)
        {

            ArrayList propuestas = EmpresaModel.getPropuestasInfo(corpName);
            int cantidad = propuestas.Count;
            Assert.AreEqual(cantidad, 0);

        }

        //UC-043: Acceder info de pruepuestas de empresa.
        //      TC-073: No hay información de propuestas
        [TestCase("Herramientas Friend", "Luis Montoya Pérez")]

        public void PropInformation_AccessingInfoProp_SpecificInfoProp(String corpName,string reviewer)
        {

            ArrayList propuestas = EmpresaModel.getPropuestasInfo(corpName);
            if (propuestas.Contains(reviewer))
            {
                int posicion = propuestas.IndexOf(reviewer);
                string dataProp = propuestas[posicion - 1].ToString() + propuestas[+1].ToString();
                Assert.AreEqual(dataProp, "23/10/2017Denegado");
            }
            
            

        }







    }
}
