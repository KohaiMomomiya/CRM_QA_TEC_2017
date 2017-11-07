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
using System.Reflection;
using toConnect;
using toEmpresaModel;

public partial class Empresas : System.Web.UI.Page
{

    private String corpName;

   
    protected void Page_Load(object sender, EventArgs e)
    {
        

        
        loadDataCorp();
        loadContactsCorp();
        loadSalesandPropCorp();
        loadSeguimientoVentas();
        loadPropuestasInfo();

            // code to only run at first page load here 


    }



    private void loadDataCorp() {
        if (Session["Corp"] != null)
        {
            corpName = Session["Corp"].ToString();
            Label12.Text = corpName;
            Session.Abandon();
        }
        else {
            Label12.Text = "Sin nombre";
        }
        String corporationName = Label12.Text;

        ArrayList info = new ArrayList();

        info = EmpresaModel.cargaDataCorp(corporationName);

        for(int i = 0; i < info.Count - 1; i++)
        {
            DropDownList1.Items.Add( info[i].ToString() );
        }

        if(info.Count>0)
            Label20.Text = info[info.Count-1].ToString();

    }

    

    private void loadContactsCorp() {

        string nombreCorp = Label12.Text;

        ArrayList infoContactos = new ArrayList();
        infoContactos = EmpresaModel.getCorpContacts(nombreCorp);
             

        DataTable dt = new DataTable();
        DataRow dr = null;


        dt.Columns.Add(new DataColumn("Nombre", typeof(string)));
        dt.Columns.Add(new DataColumn("Correo", typeof(string)));
        dt.Columns.Add(new DataColumn("Número de Teléfono", typeof(string)));
        dt.Columns.Add(new DataColumn("Dirección", typeof(string)));
        dt.Columns.Add(new DataColumn("Rol", typeof(string)));
        dr = dt.NewRow();


        for (int i = 0; i < infoContactos.Count; i++)
        {
            try
            {
                
                
                dr["Nombre"] = infoContactos[i].ToString();
                dr["Correo"] = infoContactos[i+1].ToString();
                dr["Número de Teléfono"] = infoContactos[i+2].ToString();
                dr["Dirección"] = infoContactos[i+3].ToString();
                dr["Rol"] = infoContactos[i+4].ToString();
                dt.Rows.Add(dr);
                dr = dt.NewRow();
                i = i + 4;
            }
            catch ( Exception )
            {
                
            }
        }

        tblContacts.DataSource = dt;
        tblContacts.DataBind();

    }



    private void loadSalesandPropCorp()
    {
        //Carga los datos de las ventas.
        string nombreCorp = Label12.Text;

        ArrayList infoVentas = new ArrayList();
        infoVentas = EmpresaModel.getSalesCorp(nombreCorp);
        DataTable dt = new DataTable();
        DataRow dr = null;

        

        dt.Columns.Add(new DataColumn("ID", typeof(string)));
        dt.Columns.Add(new DataColumn("Tipo", typeof(string)));
        dt.Columns.Add(new DataColumn("Nombre Persona", typeof(string)));
        dt.Columns.Add(new DataColumn("Correo", typeof(string)));
        dr = dt.NewRow();


        for (int i = 0; i < infoVentas.Count; i++)
        {

            try
            {
                //Guardar elementos en la tabla de ventas.

                dr["ID"] = infoVentas[i].ToString();
                dr["Tipo"] = infoVentas[i + 1].ToString();
                dr["Nombre Persona"] = infoVentas[i + 2].ToString();
                dr["Correo"] = infoVentas[i + 3].ToString();
                i = i + 3;

                dt.Rows.Add(dr);
                dr = dt.NewRow();
            }
            catch (Exception )
            {

            }
        }


        //Carga los datos de las propuestas.

        ArrayList infoPropuestas = new ArrayList();
        infoPropuestas = EmpresaModel.getPropCorp(nombreCorp);
        dr = dt.NewRow();

        for (int i = 0; i < infoPropuestas.Count; i++)
        {

            try
            {
                //Guardar elementos en la tabla de ventas.

                dr["ID"] = infoPropuestas[i].ToString();
                dr["Tipo"] = infoPropuestas[i + 1].ToString();
                dr["Nombre Persona"] = infoPropuestas[i + 2].ToString();
                dr["Correo"] = infoPropuestas[i + 3].ToString();
                i = i + 3;

                dt.Rows.Add(dr);
                dr = dt.NewRow();
            }
            catch (Exception )
            {

            }
        }


        GridView1.DataSource = dt;
        GridView1.DataBind();





    }


    private void loadSeguimientoVentas()
    {
        string nombreCorp = Label12.Text;

        ArrayList infoVentasSeguimiento = new ArrayList();
        infoVentasSeguimiento = EmpresaModel.getSeguimientoVentas(nombreCorp);




        DataTable dt = new DataTable();
        DataRow dr = null;


        dt.Columns.Add(new DataColumn("ID Venta", typeof(string)));
        dt.Columns.Add(new DataColumn("Qué fue Vendido", typeof(string)));
        dt.Columns.Add(new DataColumn("Cuándo se vendió", typeof(string)));
        dt.Columns.Add(new DataColumn("Precio", typeof(string)));
        dt.Columns.Add(new DataColumn("Descuento", typeof(string)));
        dt.Columns.Add(new DataColumn("Comisión", typeof(string)));
        dt.Columns.Add(new DataColumn("Quién hizo la venta", typeof(string)));

        dr = dt.NewRow();
        for (int i = 0; i < infoVentasSeguimiento.Count; i++)
        {
            try
            {
                dr["ID Venta"] = infoVentasSeguimiento[i].ToString();
                dr["Qué fue Vendido"] = infoVentasSeguimiento[i + 1].ToString();
                dr["Cuándo se vendió"] = infoVentasSeguimiento[i + 2].ToString();
                dr["Precio"] = infoVentasSeguimiento[i + 3].ToString();
                dr["Descuento"] = infoVentasSeguimiento[i + 4].ToString();
                dr["Comisión"] = infoVentasSeguimiento[i + 5].ToString();
                dr["Quién hizo la venta"] = infoVentasSeguimiento[i + 6].ToString();

                i = i + 6;

                dt.Rows.Add(dr);
                dr = dt.NewRow();

            }
            catch (Exception )
            {

            }

        }

        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    private void loadPropuestasInfo()
    {
        string nombreCorp = Label12.Text;

        ArrayList infoPropuestasSeguimiento = new ArrayList();
        infoPropuestasSeguimiento = EmpresaModel.getPropuestasInfo(nombreCorp);


        DataTable dt = new DataTable();
        DataRow dr = null;


        dt.Columns.Add(new DataColumn("ID Propuesta", typeof(string)));
        dt.Columns.Add(new DataColumn("Fecha", typeof(string)));
        dt.Columns.Add(new DataColumn("Quién lo revisó", typeof(string)));
        dt.Columns.Add(new DataColumn("Estado", typeof(string)));
        dt.Columns.Add(new DataColumn("Observaciones", typeof(string)));



        dr = dt.NewRow();
        for (int i = 0; i < infoPropuestasSeguimiento.Count; i++)
        {

            try
            {
                dr["ID Propuesta"] = infoPropuestasSeguimiento[i].ToString();
                dr["Fecha"] = infoPropuestasSeguimiento[i+1].ToString();
                dr["Quién lo revisó"] = infoPropuestasSeguimiento[i+2].ToString();
                if (infoPropuestasSeguimiento[i+3].ToString().Equals("1"))
                    dr["Estado"] = "Aprobado";
                else
                    dr["Estado"] = "Denegado";
                dr["Observaciones"] = infoPropuestasSeguimiento[i+4].ToString();

                i = i + 4;

                dt.Rows.Add(dr);
                dr = dt.NewRow();

            }
            catch (Exception )
            {
                
            }
        }
        


        GridView3.DataSource = dt;
        GridView3.DataBind();


    }
       

        protected void bttnCerrarSesion(object sender, EventArgs e)
    {
        Server.Transfer("Login.aspx", true);
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int indice = Convert.ToInt32( GridView1.SelectedIndex.ToString());
        Label23.Text = indice.ToString();


        
        
    }
}