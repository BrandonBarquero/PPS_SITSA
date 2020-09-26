using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Biblioteca_Clases.DAO;
using Biblioteca_Clases.Models;

namespace WebApplication2.Controllers
{
    public class ClienteController : Controller
    {
        // GET: Cliente

        ClienteDAO dao_cliente = new ClienteDAO();
        public ActionResult Index()
        {
            return View();
        }


    }
}