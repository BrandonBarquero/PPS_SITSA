using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Biblioteca_Clases.DAO;
using Biblioteca_Clases.Models;

namespace WebApplication2.Controllers
{
    public class ProyectoController : Controller
    {
        // GET: Proyecto

        ProyectoDAO dao_proyecto = new ProyectoDAO();
        Fase_TiempoDAO dao_fase = new Fase_TiempoDAO();

        int id_proyecto_result = 0;


        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult agregar_proyecto( Proyecto pro/*, List<Fases> fases*/)
        {
           
            string validacion = "fail";
            Fecha fecha = new Fecha();
           //List<Fases> fases2 = fases; 

            Proyecto proyect = new Proyecto();
            proyect.NOMBRE = pro.NOMBRE;
            proyect.DESCRIPCION = pro.DESCRIPCION;
            proyect.PRECIO = pro.PRECIO;
            proyect.FECHA_CREACION = fecha.fecha();
            proyect.USUARIO_CREACION = (string)(Session["User"]);
            proyect.FK_ID_CLIENTE = pro.FK_ID_CLIENTE;

             id_proyecto_result = dao_proyecto.AgregarProyecto(proyect);



            if (id_proyecto_result != 0)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult agregar_fases(int id_proyecto/*List<Fase_Tiempo> fases*/)
        {

            string validacion = "fail";

            //int result = 0; 
        
            //foreach (Fase_Tiempo dato in fases)
            //{
            //     result = dao_fase.AgregarFase_Tiempo(dato, id_proyecto_result, (string)(Session["User"]));
            //}
           
            //if (result == 1)
            //{
            //    validacion = "sucess";
            //}
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult actualizar_proyecto(Proyecto cont)
        {
            var t = cont;
            string validacion = "fail";
            Fecha fecha = new Fecha();

            Proyecto proyect = new Proyecto();
            proyect.ID_PROYECTO = t.ID_PROYECTO;
            proyect.NOMBRE = t.NOMBRE;
            proyect.DESCRIPCION = t.DESCRIPCION;
            proyect.PRECIO = t.PRECIO;
            proyect.FECHA_CREACION = fecha.fecha();
            proyect.USUARIO_CREACION = (string)(Session["User"]);
            proyect.FK_ID_CLIENTE = t.FK_ID_CLIENTE;

            int result = dao_proyecto.ActualizarProyecto(proyect);

            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        public JsonResult actualizar_estado_deshabilitar_proyecto(int id_proyecto)
        {
            string validacion = "fail";

            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();

            Proyecto proy = new Proyecto(id_proyecto, dato, Usuario_Edita);


            int result = dao_proyecto.ActualizarEstadoDeshabilitarProyecto(proy);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        public JsonResult actualizar_estado_habilitar_proyecto(int id_proyecto)
        {
            string validacion = "fail";

            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();

            Proyecto proy = new Proyecto(id_proyecto, dato, Usuario_Edita);


            int result = dao_proyecto.ActualizarEstadoHabilitarProyecto(proy);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

    }
}