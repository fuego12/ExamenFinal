using ExamenFinalAJSR.Models.Ado;
using ExamenFinalAJSR.Models.Beans;
using ExamenFinalAJSR.Models.ConectDBEntity;
using ExamenFinalAJSR.Models.Dao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

            AtencionDao atencionDao = new AtencionDao();
            List<AtencionClienteBean> list = new List<AtencionClienteBean>();
            list = atencionDao.list();
            return View(list);
            //List<tbAtencionCliente> listAtencion;
            //using (var db = new ConectDB())
            //{
            //    listAtencion = db.tbAtencionCliente.ToList();
            //    return View(listAtencion);
            //}
        }
        public ActionResult Add()
        {
            List<tbCliente> listCliente;
            List<tbTipoAtencion> listTipoAtencion;
            using (var db = new ConectDB())
            {
                listCliente = db.tbCliente.ToList();
                listTipoAtencion = db.tbTipoAtencion.ToList();

                ViewBag.ListCliente = listCliente;
                ViewBag.ListTipoAtencion = listTipoAtencion;
            }
            return View();
        }

        [HttpPost]
        public ActionResult Add(tbAtencionCliente atencion)
        {
            Boolean result = false;
            AtencionDao atencionDao = new AtencionDao();
            result = atencionDao.create(atencion);

            if (result)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Add");
            }
        }
    }
}