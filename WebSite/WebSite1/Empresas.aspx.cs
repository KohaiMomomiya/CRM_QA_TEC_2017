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
        cmd.Parameters.AddWithValue("@name", corpName);
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
        cmd.CommandText = "dbo.getCorporationContactsData";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@name", Label12.Text);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            try
            {
                
            }
            catch (System.Data.SqlTypes.SqlNullValueException ex)
            {
                exp = ex;
            }

        }
        con.Close();

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

    }
}