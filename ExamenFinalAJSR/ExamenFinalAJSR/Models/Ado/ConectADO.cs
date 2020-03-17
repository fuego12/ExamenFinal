using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ExamenFinalAJSR.Models.Ado
{
    public class ConectADO
    {

        public static SqlConnection getConnection()
        {
            //string CNX = @"Data Source=DESKTOP-Q10U8GE\SQL2017; DATABASE=BD_Prueba1; Trusted_Connection=true; INTEGRATED SECURITY=true;";
            string CNX = ConfigurationManager.ConnectionStrings["connBD"].ConnectionString;

            SqlConnection cn = new SqlConnection(CNX);

            if (cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
            else
            {
                cn.Open();
            }

            return cn;
        }
    }
}