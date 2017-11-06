using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using toConnect;

using System.Web.UI.WebControls;

namespace toEmpresaModel
{

    /// <summary>
    /// Acciones relacionadas con la conexión a la base de datos.
    /// </summary>
    public class EmpresaModel
    {

        public static ArrayList cargaDataCorp(String nombreCorp)
        {

            ArrayList corporacionesinfo = new ArrayList();
            String nombrecorporation = "";



            SqlConnection con = null;
            Connection conexion = new Connection();
            con = conexion.getConnection();

            try
            {

                con.Open();
                System.Data.SqlTypes.SqlNullValueException exp;
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "dbo.getCorporationData";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@name", nombreCorp);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    try
                    {
                        nombrecorporation = reader.GetValue(1).ToString();
                        corporacionesinfo.Add(reader.GetValue(2).ToString());

                    }
                    catch (System.Data.SqlTypes.SqlNullValueException ex)
                    {
                        exp = ex;
                    }

                }
                con.Close();

            }
            catch (Exception)
            {

            }



            corporacionesinfo.Add(nombrecorporation);

            return corporacionesinfo;
        }



        public static String getContactPhoneNumbers(int contactID)
        {
            String numbers = "";
            SqlConnection con = null;
            Connection conexion = new Connection();
            con = conexion.getConnection();


            try
            {

                con.Open();
                System.Data.SqlTypes.SqlNullValueException exp;
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "dbo.getContactPhoneNumbers";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@contactID", contactID);
                reader = cmd.ExecuteReader();
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

            }
            catch (Exception)
            {

                


            }

            

            return numbers;
        }



        public static ArrayList getCorpContacts(String nameCorporation)
        {
            ArrayList filasCorp = new ArrayList();

            string numeroTelefono = "";


            SqlConnection con = null;
            
            Connection conexion = new Connection();
            con = conexion.getConnection();


            try
            {

                con.Open();
                System.Data.SqlTypes.SqlNullValueException exp;
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "dbo.getCorporationContactsData";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@name", nameCorporation);
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    try
                    {
                        filasCorp.Add(reader.GetValue(1).ToString());
                        filasCorp.Add(reader.GetValue(2).ToString());
                        numeroTelefono = getContactPhoneNumbers(reader.GetInt32(0));
                        filasCorp.Add(numeroTelefono);
                        filasCorp.Add(reader.GetValue(3).ToString());
                        filasCorp.Add(reader.GetValue(4).ToString());
                    }
                    catch (System.Data.SqlTypes.SqlNullValueException ex)
                    {
                        exp = ex;
                    }
                }

                con.Close();

            }
            catch (Exception)
            {

            }

            

            return filasCorp;
        }



        public static ArrayList getSalesCorp(String nameCorporation)
        {
            ArrayList filasVentas = new ArrayList();

            SqlConnection con = null;

            Connection conexion = new Connection();
            con = conexion.getConnection();


            


            



            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "dbo.getSalesGeneralData";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@corp", nameCorporation);
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    try
                    {
                        filasVentas.Add(reader.GetValue(0).ToString());
                        filasVentas.Add(reader.GetValue(1).ToString());
                        filasVentas.Add(reader.GetValue(2).ToString());
                        filasVentas.Add(reader.GetValue(3).ToString());
                    }
                    catch (Exception)
                    {

                    }
                }

                con.Close();
            }
            catch (Exception)
            {

            }













            con.Close();



            try
            {

            }
            catch (Exception)
            {

            }



            return filasVentas;
        }


        public static ArrayList getPropCorp(String nameCorporation)
        {
            ArrayList filasprop = new ArrayList();

            


            SqlConnection con = null;

            Connection conexion = new Connection();
            con = conexion.getConnection();

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "dbo.getSalesPetitionsGeneralData";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@corp", nameCorporation);
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    try
                    {
                        filasprop.Add(reader.GetValue(0).ToString());
                        filasprop.Add(reader.GetValue(1).ToString());
                        filasprop.Add(reader.GetValue(2).ToString());
                        filasprop.Add(reader.GetValue(3).ToString());
                    }
                    catch (Exception)
                    {

                    }
                }

                con.Close();

            }
            catch (Exception)
            {

            }

            

            return filasprop;
        }



        public static ArrayList getSeguimientoVentas()
        {

            ArrayList ventasSeguidas = new ArrayList();

            SqlConnection con = null;

            Connection conexion = new Connection();
            con = conexion.getConnection();

            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "dbo.getSalesInfo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    try
                    {
                        ventasSeguidas.Add(reader.GetValue(0).ToString());
                        ventasSeguidas.Add(reader.GetValue(1).ToString());
                        ventasSeguidas.Add(reader.GetValue(2).ToString());
                        ventasSeguidas.Add(reader.GetValue(3).ToString());
                        ventasSeguidas.Add(reader.GetValue(4).ToString());
                        ventasSeguidas.Add(reader.GetValue(5).ToString());
                        ventasSeguidas.Add(reader.GetValue(6).ToString());
                    }
                    catch (Exception)
                    {

                    }
                }

                con.Close();

            }
            catch (Exception)
            {

            }

           



            return ventasSeguidas;
        }


        public static ArrayList getPropuestasInfo()
        {
            ArrayList propuestasInfo = new ArrayList();

            SqlConnection con = null;

            Connection conexion = new Connection();
            con = conexion.getConnection();


            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;
                cmd.CommandText = "dbo.getReviewsInfo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    try
                    {
                        propuestasInfo.Add(reader.GetValue(0).ToString());
                        propuestasInfo.Add(reader.GetValue(1).ToString());
                        propuestasInfo.Add(reader.GetValue(2).ToString());
                        propuestasInfo.Add(reader.GetValue(3).ToString());
                        propuestasInfo.Add(reader.GetValue(4).ToString());

                    }
                    catch (Exception)
                    {

                    }
                }

                con.Close();

            }
            catch (Exception)
            {

            }


            
            return propuestasInfo;
        }



















    }

}
