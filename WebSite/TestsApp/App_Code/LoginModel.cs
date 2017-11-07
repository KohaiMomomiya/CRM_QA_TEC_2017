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
using toConnect;




/// <summary>
/// Summary description for LoginModel
/// </summary>
/// 

namespace LoginModelApp
{
    public class LoginModel
    {
        //String lblBase;
        String userName;
        String password;

        public LoginModel(String pUserName, String pPassword)
        {
            userName = pUserName;
            password = pPassword;
        }

        public int verificarInicioSesion()
        {
            int returnValue = 0;
            SqlConnection con = null;
            int isUser = 0;

            Connection conexion = new Connection();
            con = conexion.getConnection();

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT dbo.validarLogin(@userName,@password)", con);
            cmd.Parameters.AddWithValue("@userName", userName);
            cmd.Parameters.AddWithValue("@password", password);
            isUser = (Int32)cmd.ExecuteScalar();
            con.Close();

            //devuelve el salt desde sql con el cual sabemos si el usuario es administrador o no.
            if (isUser == -1)
            {
                //no hay usuario

                //-1 = "Contraseña o Usuario incorrecto.";
                returnValue = -1;
            }
            else
            {
                //El tipo de salt representa si el usuario es administrador o no.
                if (isUser == 1)
                {
                    returnValue = 1;
                }
                else if (isUser == 3)
                {
                    //consultar empresa del usuario, y redirigir el usuario a dicha empresa.
                    returnValue = 3;
                }
                else
                {
                    returnValue = 0;
                }
            }

            return returnValue;
        }
    }
}

