using ExamenFinalAJSR.Models.ConectDBEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenFinalAJSR.Controllers
{
    public class AtencionController : Controller
    {
        // GET: Atencion
        public ActionResult Index()
        {
            List<tbCliente> listCliente;
            List<tbAtencionCliente> listAtencion;
            using (var db = new ConectDB())
            {
                listCliente = db.tbCliente.ToList();
                listAtencion = db.tbAtencionCliente.ToList();

                ViewBag.ListCliente = listCliente;
                ViewBag.ListAtencion = listAtencion;
            }
            return View();
        }
    }
}