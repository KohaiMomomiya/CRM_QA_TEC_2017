using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using toConnect;
using System.Collections;

namespace toAdminModel
{

    /// <summary>
    /// Descripción breve de AdminModel
    /// </summary>
    public class AdminModel
    {

        
       


        public static ArrayList corporations()
        {
            ArrayList corporaciones = new ArrayList();

            SqlConnection con = null;

            Connection conexion = new Connection();
            con = conexion.getConnection();

            con.Open();
            System.Data.SqlTypes.SqlNullValueException exp;
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "dbo.getCorporationsName";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                try
                {
                    string corpName = reader.GetValue(0).ToString();
                    corporaciones.Add(corpName);
                }
                catch (System.Data.SqlTypes.SqlNullValueException ex)
                {
                    exp = ex;
                }

            }
            con.Close();

            return corporaciones;

        }
    }



}
