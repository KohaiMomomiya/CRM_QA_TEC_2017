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

       // [TestCase("Herramientas Friend")]
        //[UnidadDeTrabajo][Contexto][Resultado]
        public void CorpInfo_AccessCorpInformatin_DontExistsContacts(String corpName)
        {
            
            ArrayList contactos = EmpresaModel.cargaDataCorp(corpName);
            int canditad = contactos.Count;
            Assert.AreEqual(canditad, 0);

        }


        [TestCase("Herramientas Friend")]
        //[UnidadDeTrabajo][Contexto][Resultado]
        public void ContactInfo_AccessCorpInformatin_ExistsContact(String corpName)
        {

            ArrayList contactos = EmpresaModel.cargaDataCorp(corpName);
            int canditad = contactos.Count;
            Assert.Greater(canditad, 0);

        }




    }
}
