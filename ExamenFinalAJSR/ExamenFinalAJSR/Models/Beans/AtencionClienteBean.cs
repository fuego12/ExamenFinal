using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenFinalAJSR.Models.Beans
{
    public class AtencionClienteBean
    {
        public int IdCliente { get; set; }
        public int IdTipoAtencion { get; set; }
        public System.DateTime FechaRegistro { get; set; }
        public string Estado { get; set; }
        public string Nombres { get; set; }

        public string Apellidos { get; set; }
        public string Detalle { get; set; }
        public string TipoAtencion { get; set; }

        public string NombreCompleto { get; set; }
    }
}