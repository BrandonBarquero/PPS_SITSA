using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Biblioteca_Clases.DAO;
using Biblioteca_Clases.Models;
using Newtonsoft.Json;
namespace WebApplication2.Controllers
{
    public class ClienteController : Controller
    {
        // GET: Cliente
        ContratoDAO dao = new ContratoDAO();
        Cliente_ServicioDAO dao_cliente = new Cliente_ServicioDAO();
        Cliente_ContactoDAO dao_contrato = new Cliente_ContactoDAO();
        ServicioDAO daoservicio = new ServicioDAO();
        ContactoDAO dao1 = new ContactoDAO();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult agrega(Cliente_Servicio cont)
        {
            var t = cont;
            string validacion = "fail";
            Fecha fecha = new Fecha();

            Cliente_Servicio cliente_Servicio = new Cliente_Servicio();
            cliente_Servicio.TARIFA_HORA = t.TARIFA_HORA;
            cliente_Servicio.ESTADO = 1;
            cliente_Servicio.USUARIO_CREACION = (string)(Session["User"]);
            cliente_Servicio.FECHA_CREACION = fecha.fecha();
            cliente_Servicio.FK_ID_CLIENTE = t.FK_ID_CLIENTE;
            cliente_Servicio.FK_ID_SERVICIO = t.FK_ID_SERVICIO;


            int result = dao_cliente.AgregarCliente_Servicio(cliente_Servicio);

            if (result == 1)
            {

                string sJSONResponse = JsonConvert.SerializeObject(cliente_Servicio, Formatting.Indented);
                return Json(sJSONResponse, JsonRequestBehavior.AllowGet);
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult agrega_contactos(Contacto cont, Cliente client)
        {

            var t = cont;
            var y = client;


            string validacion = "fail";
            Fecha fecha = new Fecha();
            Cliente_Contacto entidad = new Cliente_Contacto();
            entidad.ESTADO = 1;
            entidad.FECHA_CREACION = fecha.fecha();
            entidad.USUARIO_CREACION = (string)(Session["User"]);
            entidad.FK_ID_CLIENTE = 2;
            entidad.FK_ID_CONTACTO = t.ID_CONTACTO;


            int result = dao_contrato.AgregarCliente_Contacto(entidad);

            if (result == 1)
            {

                List<Contacto> list = dao1.listaContactoscliente(2);

                string sJSONResponse = JsonConvert.SerializeObject(list, Formatting.Indented);
                return Json(sJSONResponse, JsonRequestBehavior.AllowGet);
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SesionCLeinte(string dato1)
        {
            List<Contrato> list = dao.listaContratosCliente(dato1);


            string sJSONResponse = JsonConvert.SerializeObject(list, Formatting.Indented);
            return Json(sJSONResponse, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult ServiciosCliente(string dato1)
        {
            List<Cliente_Servicio> list = dao_cliente.Listar_servicio_cliente_filtrado(dato1);


            string sJSONResponse = JsonConvert.SerializeObject(list, Formatting.Indented);
            return Json(sJSONResponse, JsonRequestBehavior.AllowGet);
        }






        [HttpPost]
        public JsonResult ProyectosCliente(string dato1)
        {
            List<Proyecto> list = dao_cliente.Listar_servicio_cliente_filtrado_contrato(dato1);


            string sJSONResponse = JsonConvert.SerializeObject(list, Formatting.Indented);
            return Json(sJSONResponse, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult ContactodCliente(string dato1)
        {
            List<Proyecto> list = dao_cliente.Listar_servicio_cliente_filtrado_contrato(dato1);


            string sJSONResponse = JsonConvert.SerializeObject(list, Formatting.Indented);
            return Json(sJSONResponse, JsonRequestBehavior.AllowGet);
        }
    }
}