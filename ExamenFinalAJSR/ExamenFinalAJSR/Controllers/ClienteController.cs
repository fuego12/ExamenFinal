using ExamenFinalAJSR.Models.ConectDBEntity;
using ExamenFinalAJSR.Models.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenFinalAJSR.Controllers
{
    public class ClienteController : Controller
    {
        // GET: Cliente
        public ActionResult Index()
        {
            List<tbCliente> listClientes;
            using (var db = new ConectDB())
            {
                listClientes = db.tbCliente.ToList();
                return View(listClientes);
            }

        }

        [HttpGet]
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(tbCliente cliente)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            try
            {
                cliente.Estado = "A";
                using (var db = new ConectDB())
                {
                    db.tbCliente.Add(cliente);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {
                return View();
            }

        }
    }
}