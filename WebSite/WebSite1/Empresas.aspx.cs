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

    private String corpName;

   
    protected void Page_Load(object sender, EventArgs e)
    {
        

        
            loadDataCorp();
            loadContactsCorp();
            loadSalesCorp();
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

    private String getContactPhoneNumbers(int contactID) {
        String numbers = "";
        SqlConnection con = null;
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
        cmd.CommandText = "dbo.getContactPhoneNumbers";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@contactID", contactID);
        reader = cmd.ExecuteReader();
        TableRow row = new TableRow();
        while (reader.Read())
        {
            try
            {
                numbers += reader.GetValue(0).ToString() + " ";

            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }

        }
        con.Close();

        return numbers;
    }

    private void loadContactsCorp() {
        //Carga los datos de los contactos de la empresa.
        //TableRow row = new TableRow();
        //for (int i = 0; i < 5; i++) {
            //TableCell col = new TableCell();
            //col.Controls.Add(new TextBox());
            //col.Text = "Khé";
            //row.Cells.Add(col);
            //tblContacts.Rows.Add(row);
        //}
        SqlConnection con = null;
        int contactID = -1;
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
        cmd.CommandText = "dbo.getCorporationContactsData";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@name", Label12.Text);
        reader = cmd.ExecuteReader();
        
        while (reader.Read())
        {
            TableRow row = new TableRow();
            try
            {
                //Guardar elementos en la tabla.
                for (int i = 0; i < 5; i++)
                {
                    TableCell col = new TableCell();
                    if (i == 0)
                    {
                        contactID = int.Parse(reader.GetValue(i).ToString());
                    }
                    else {
                        if (i == 3)
                        {
                            TableCell colPhoneNumbers = new TableCell();
                            colPhoneNumbers.Text = getContactPhoneNumbers(contactID);
                            row.Cells.Add(colPhoneNumbers);
                        }
                        col.Text = reader.GetValue(i).ToString();
                        row.Cells.Add(col);
                        tblContacts.Rows.Add(row);

                    }
                    
                }

            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }

        }
        con.Close();
    }

    private void loadSalesCorp() {
        //Carga los datos de las ventas.
        SqlConnection con = null;
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
        cmd.CommandText = "dbo.getSalesGeneralData";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@corp", Label12.Text);
        reader = cmd.ExecuteReader();

        DataTable dt = new DataTable();
        DataRow dr = null;

        

        dt.Columns.Add(new DataColumn("ID", typeof(string)));
        dt.Columns.Add(new DataColumn("Tipo", typeof(string)));
        dt.Columns.Add(new DataColumn("Nombre Persona", typeof(string)));
        dt.Columns.Add(new DataColumn("Correo", typeof(string)));
        dr = dt.NewRow();


        while (reader.Read())
        {
            
            try
            {
                //Guardar elementos en la tabla de ventas.
                //ids.Add("333");
                dr["ID"] = reader.GetValue(0).ToString();
                
                dr["Tipo"] = reader.GetValue(1).ToString();
                
                dr["Nombre Persona"] = reader.GetValue(2).ToString();
                dr["Correo"] = reader.GetValue(3).ToString();
                

                dt.Rows.Add(dr);
                dr = dt.NewRow();
            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }
        }

       
        



        con.Close();
        
        //Agregar propuestas a la tabla.
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "dbo.getSalesPetitionsGeneralData";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@corp", Label12.Text);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
           
            try
            {
                dr["ID"] = reader.GetValue(0).ToString();
                
                dr["Tipo"] = reader.GetValue(1).ToString();
               
                dr["Nombre Persona"] = reader.GetValue(2).ToString();
                dr["Correo"] = reader.GetValue(3).ToString();
                

                dt.Rows.Add(dr);
                dr = dt.NewRow();

            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }
        }
        con.Close();


        GridView1.DataSource = dt;
        GridView1.DataBind();


        //Agregar propuestas a la tabla.
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "dbo.getSalesPetitionsGeneralData";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@corp", Label12.Text);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {

            try
            {
                dr["ID"] = reader.GetValue(0).ToString();
                dr["Tipo"] = reader.GetValue(1).ToString();
                dr["Nombre Persona"] = reader.GetValue(2).ToString();
                dr["Correo"] = reader.GetValue(3).ToString();
       
                dt.Rows.Add(dr);
                dr = dt.NewRow();

            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }
        }
        con.Close();


        GridView1.DataSource = dt;
        GridView1.DataBind();

        /// ESTO VA A LLENAR LA TABLA DE CADA INFO DE VENTAS PARA CUMPLIR LOS REQUERIMIENTOS DE LA PARTE 2
        //Agregar propuestas a la tabla.
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "dbo.getSalesInfo";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        
        reader = cmd.ExecuteReader();
        DataTable dt2 = new DataTable();
        DataRow dr2 = null;


        dt2.Columns.Add(new DataColumn("ID Venta", typeof(string)));
        dt2.Columns.Add(new DataColumn("Qué fue Vendido", typeof(string)));
        dt2.Columns.Add(new DataColumn("Cuándo se vendió", typeof(string)));
        dt2.Columns.Add(new DataColumn("Precio", typeof(string)));
        dt2.Columns.Add(new DataColumn("Descuento", typeof(string)));
        dt2.Columns.Add(new DataColumn("Comisión", typeof(string)));
        dt2.Columns.Add(new DataColumn("Quién hizo la venta", typeof(string)));
        
        
        dr2 = dt2.NewRow();
        while (reader.Read())
        {

            try
            {
                dr2["ID Venta"] = reader.GetValue(0).ToString();
                dr2["Qué fue Vendido"] = reader.GetValue(1).ToString();
                dr2["Cuándo se vendió"] = reader.GetValue(2).ToString();
                dr2["Precio"] = reader.GetValue(3).ToString();
                dr2["Descuento"] = reader.GetValue(4).ToString();
                dr2["Comisión"] = reader.GetValue(5).ToString();
                dr2["Quién hizo la venta"] = reader.GetValue(6).ToString();

                dt2.Rows.Add(dr2);
                dr2 = dt2.NewRow();

            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }
        }
        con.Close();


        GridView2.DataSource = dt2;
        GridView2.DataBind();


        /// ESTO VA A LLENAR LA TABLA DE RESPUESTAS DE LAS VENTAS
        //Agregar propuestas a la tabla.
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "dbo.getReviewsInfo";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        reader = cmd.ExecuteReader();
        DataTable dt3 = new DataTable();
        DataRow dr3 = null;


        dt3.Columns.Add(new DataColumn("ID Propuesta", typeof(string)));
        dt3.Columns.Add(new DataColumn("Fecha", typeof(string)));
        dt3.Columns.Add(new DataColumn("Quién lo revisó", typeof(string)));
        dt3.Columns.Add(new DataColumn("Estado", typeof(string)));
        dt3.Columns.Add(new DataColumn("Observaciones", typeof(string)));
        


        dr3 = dt3.NewRow();
        while (reader.Read())
        {

            try
            {
                dr3["ID Propuesta"] = reader.GetValue(0).ToString();
                dr3["Fecha"] = reader.GetValue(1).ToString();
                dr3["Quién lo revisó"] = reader.GetValue(2).ToString();
                if (reader.GetValue(3).ToString().Equals("1"))
                    dr3["Estado"] = "Aprobado";
                else
                    dr3["Estado"] = "Denegado";
                dr3["Observaciones"] = reader.GetValue(4).ToString();
                

                dt3.Rows.Add(dr3);
                dr3 = dt3.NewRow();

            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }
        }
        con.Close();


        GridView3.DataSource = dt3;
        GridView3.DataBind();



    }

    /*
     select u.Email
from 
users u 
	inner join
SalesPetitions s
	on s.PetitionID = u.UserID
	inner join
reviewpetitions r
	on s.PetitionID = r.PetitionID
	inner join
sales l
	on r.SaleID = l.SaleID
     */

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