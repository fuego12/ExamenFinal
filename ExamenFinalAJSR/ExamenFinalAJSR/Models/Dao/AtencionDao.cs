using ExamenFinalAJSR.Models.Ado;
using ExamenFinalAJSR.Models.Beans;
using ExamenFinalAJSR.Models.ConectDBEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ExamenFinalAJSR.Models.Dao
{
    public class AtencionDao
    {
        public Boolean create(tbAtencionCliente atencion)
        {
            Boolean result = false;
            SqlCommand cmd = new SqlCommand();

            try
            {
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_create_atencion";
                cmd.Parameters.AddWithValue("@idCliente", atencion.IdCliente);
                cmd.Parameters.AddWithValue("@idTipoAtencion", atencion.IdTipoAtencion);

                cmd.Connection = ConectADO.getConnection();
                cmd.ExecuteNonQuery();
                result = true;
            }
            catch (Exception)
            {

                throw;
            }
            return result;
        }

        public List<AtencionClienteBean> list()
        {
            List<AtencionClienteBean> list = new List<AtencionClienteBean>();
            SqlCommand cmd = new SqlCommand();
            AtencionClienteBean atencion;
            SqlDataReader readSQL;

            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_atencion_list";
                cmd.Connection = ConectADO.getConnection();
                readSQL = cmd.ExecuteReader();

                while (readSQL.Read())
                {
                    atencion = new AtencionClienteBean();
                    atencion.Nombres = readSQL.GetString(0);
                    atencion.Apellidos = readSQL.GetString(1);
                    atencion.NombreCompleto = readSQL.GetString(0) + " " + readSQL.GetString(1);
                    atencion.Detalle = readSQL.GetString(2);
                    atencion.FechaRegistro = readSQL.GetDateTime(3);

                    list.Add(atencion);
                }
            }
            catch (Exception e)
            {

                throw;
            }

            return list;
        }
    }
}