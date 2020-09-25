using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Biblioteca_Clases.DAO;
using Biblioteca_Clases.Models;

namespace WebApplication2.Controllers
{
    public class TipoContratoController : Controller
    {
        Tipo_ContratoDAO dao_tipo_contrato = new Tipo_ContratoDAO();

        // GET: TipoContrato
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult actualizar_estado_Habilitar_Tipo_Contrato(int id_tipo_contrato)
        {
            string validacion = "fail";

            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();

            Tipo_Contrato tipo_Contrato = new Tipo_Contrato(id_tipo_contrato, dato, Usuario_Edita);


            int result = dao_tipo_contrato.ActualizarEstadoHabilitarTipoContrato(tipo_Contrato);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }
                
        public ActionResult actualizar_estado_deshabilitar_Tipo_Contrato(int id_tipo_contrato)
        {
            string validacion = "fail";

            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();

            Tipo_Contrato tipo_Contrato = new Tipo_Contrato(id_tipo_contrato, dato, Usuario_Edita);


            int result = dao_tipo_contrato.ActualizarEstadoDeshabilitarTipoContrato(tipo_Contrato);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult agregar_tipo_contrato(Tipo_Contrato tipo)
        {
            var t = tipo;
            string validacion = "fail";
            Fecha fecha = new Fecha();

            Tipo_Contrato tipo_Contrato = new Tipo_Contrato();
            tipo_Contrato.NOMBRE = t.NOMBRE;
            tipo_Contrato.HORAS = t.HORAS;
            tipo_Contrato.RANGO_DOCUMENTOS = t.RANGO_DOCUMENTOS;
            tipo_Contrato.MONTO = t.MONTO;
            tipo_Contrato.ACEPTACION = t.ACEPTACION;
            tipo_Contrato.FECHA_CREACION = fecha.fecha();
            tipo_Contrato.USUARIO_CREACION = (string)(Session["User"]);

            int result = dao_tipo_contrato.AgregarTipoContrato(tipo_Contrato);

            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult modificar_tipo_contrato(Tipo_Contrato tipo)
        {
            var t = tipo;
            string validacion = "fail";
            Fecha fecha = new Fecha();

            Tipo_Contrato tipo_Contrato = new Tipo_Contrato();
            tipo_Contrato.NOMBRE = t.NOMBRE;
            tipo_Contrato.HORAS = t.HORAS;
            tipo_Contrato.RANGO_DOCUMENTOS = t.RANGO_DOCUMENTOS;
            tipo_Contrato.MONTO = t.MONTO;
            tipo_Contrato.ACEPTACION = t.ACEPTACION;
            tipo_Contrato.FECHA_CREACION = fecha.fecha();
            tipo_Contrato.USUARIO_CREACION = (string)(Session["User"]);

            int result = dao_tipo_contrato.ModificarTipoContrato(tipo_Contrato);

            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        public JsonResult listar_activos()
        {
            List<Tipo_Contrato> lista = new List<Tipo_Contrato>();
            lista = dao_tipo_contrato.listaTipoContratos();

            return Json(lista, JsonRequestBehavior.AllowGet);
        }

        public JsonResult listar_inactivos()
        {
            List<Tipo_Contrato> lista = new List<Tipo_Contrato>();
            lista = dao_tipo_contrato.listaTipoContratosInactivos();

            return Json(lista, JsonRequestBehavior.AllowGet);
        }
    }

   
}