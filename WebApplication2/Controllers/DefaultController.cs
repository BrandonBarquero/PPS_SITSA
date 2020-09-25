using Biblioteca_Clases.DAO;
using Biblioteca_Clases.Models;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Control_Visitas.Controllers
{
    public class DefaultController : Controller
    {
        LoginDAO dao = new LoginDAO();
        UsuarioDAO dao_usuario = new UsuarioDAO();
        ServicioDAO dao_servicio = new ServicioDAO();
        Mail mail = new Mail();
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }

        // GET: Default/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Default/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Default/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Default/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Default/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Default/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Default/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        public JsonResult login(FormCollection formCollection)
        {

            // Mail prueba = new Mail();
            // prueba.mail();
          
            string validacion = "fail";
            string username = formCollection["logEmail"];
            string pass = formCollection["logPssword"];

            Usuario user = new Usuario(username, pass);

           
            int result = dao.consultamenu(user);

            if (result == 1)
            {
                Session["User"] = username;
                validacion = "sucess";

                int user_perfil = dao.consultausuarioperfil(username);
                Session["perfil"] = user_perfil;

            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }
        public ActionResult AfterLogin()
        {
            if (Session["UserID"] != null)
            {
                return View();
            }
            else
            {
                return Redirect("~/Home.aspx");
            }
        }

        public JsonResult olvidocontrasenna(FormCollection formCollection) {

            string correo = formCollection["Mail"];
            string validacion = "fail";
            ArrayList listcorreos= dao.consultacorreos();

            if (listcorreos.Contains(correo))
            {
               
                string contra = mail.Contrasenna();
                Usuario user = new Usuario(correo, contra);
                dao.cambiarcontrasenna(user);
                mail.mail(correo,contra);
                validacion = "sucess";
            }
            
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }
        public JsonResult CerrarSesion()
        {
            string validacion = "fail";

            Session.RemoveAll();
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.AppendHeader("Cache-Control", "no-store");
            if (Session["User"]==null) {
            
                Response.Redirect("~/Login.aspx");
                validacion = "sucess";
            }

            return Json(validacion, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ValidarContrasenna(string Contrasenna) {
            string validacion = "fail";

            string cedula = (string)(Session["User"]);
            Usuario user = new Usuario(cedula, Contrasenna);


            int result = dao.consultamenu(user);

            if (result == 1)
            {
              
                validacion = "sucess";

            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }
        public JsonResult cambiocontraseena(string contrasenna_1) {
            string validacion = "fail";
            string cedula = (string)(Session["User"]);
            Usuario user = new Usuario(cedula, contrasenna_1);

           int result= dao.cambiocontrasenna(user);
            if (result == 1) {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }
        public JsonResult verificacedula(string cedula)
        {
            string validacion = "fail";

            int result = dao_usuario.verificacedula(cedula);

            
            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        public JsonResult verificaemail(string email)
        {
            string validacion = "fail";

            int result = dao_usuario.verificaemail(email);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        public JsonResult actualiza_usuario(FormCollection formCollection)
        {
            string validacion = "fail";

            string cedula = formCollection["cedula"];
            string nombre = formCollection["nombre"];
            string email = formCollection["email"];
            string perfil = formCollection["perfil"];
            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();
            int PK_PERFIL= Int32.Parse(perfil);
            Usuario user = new Usuario(cedula,nombre,email, PK_PERFIL, dato, Usuario_Edita);


          int result=  dao_usuario.ActualizarUsuario(user);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }





        public JsonResult agregar_servicio(FormCollection formCollection)
        {
            string validacion = "fail";

            string descripcion = formCollection["descripcion"];
            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();
          
            Servicio serv = new Servicio(descripcion, dato, Usuario_Edita);


            int result = dao_servicio.AgregarServicio(serv);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        public JsonResult actualizar_servicio(int id_servicio, string descripcion)
        {
            string validacion = "fail";

            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();

            Servicio serv = new Servicio(id_servicio, descripcion, dato, Usuario_Edita);


            int result = dao_servicio.ActualizarServicio(serv);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }


        public JsonResult actualizar_estado_deshabilitar_servicio(int id_servicio)
        {
            string validacion = "fail";

            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();

            Servicio serv = new Servicio(id_servicio, dato, Usuario_Edita);


            int result = dao_servicio.ActualizarEstadoDeshabilitarServicio(serv);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }

        public JsonResult actualizar_estado_Habilitar_servicio(int id_servicio)
        {
            string validacion = "fail";

            string Usuario_Edita = (string)(Session["User"]);
            Fecha fecha = new Fecha();
            string dato = fecha.fecha();

            Servicio serv = new Servicio(id_servicio, dato, Usuario_Edita);


            int result = dao_servicio.ActualizarEstadoHabilitarServicio(serv);


            if (result == 1)
            {
                validacion = "sucess";
            }
            return Json(validacion, JsonRequestBehavior.AllowGet);
        }


         public JsonResult lista1(string val_select)
          {

              ServicioDAO dao = new ServicioDAO();

              List<Servicio> list;

              list = dao.listaServicios();

              Servicio Servicio_Select = new Servicio();

            var collection = list;

            var collectionWrapper = new
            {

                Servicio = collection

            };

            string sJSONResponse = JsonConvert.SerializeObject(list, Formatting.Indented);
            



              if (val_select == "Activo_Servicio")
              {


              }
              else
              {


              }


            return Json(sJSONResponse, JsonRequestBehavior.AllowGet);
        }
    }

}
