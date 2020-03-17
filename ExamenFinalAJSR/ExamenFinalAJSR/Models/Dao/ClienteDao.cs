using ExamenFinalAJSR.Models.ConectDBEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenFinalAJSR.Models.Dao
{
    public class ClienteDao
    {
        public List<tbCliente> list()
        {
            List<tbCliente> listClientes;
            using (var db = new ConectDB())
            {
                listClientes = db.tbCliente.ToList();
                return listClientes;
            }
        }
    }
}