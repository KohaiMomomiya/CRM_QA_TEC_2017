using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace toConnect
{
    public class Connection
    {

        SqlConnection con = null;
        

          public  Connection()
        {
            try
            {
                con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=TEC_QA_CRM;Integrated Security=True");
               
            }
            catch (Exception )
            {

            }

        }

        public SqlConnection getConnection()
        {


            return this.con;
        }


        
       









    }
}
