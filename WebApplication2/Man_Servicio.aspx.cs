using Biblioteca_Clases.DAO;
using Biblioteca_Clases.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Man_Servicio : System.Web.UI.Page
    {
        List<Servicio> list = new List<Servicio>();

        public Permiso_e Permisos;
        ServicioDAO dao_servicio = new ServicioDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            int perfil = (int)(Session["perfil"]);
            Permisos = dao_servicio.ControlPaginas("Servicios", perfil.ToString());

            if (Permisos.VER == false)
            {
                Response.Write("<script language='javascript'>alert('hello');window.location.href = 'Home.aspx';</ script > ");
                Response.Redirect("Home.aspx", false);

            }
        }


        public List<Servicio> ListaServicios(string valor)
        {

            ServicioDAO dao = new ServicioDAO();


            if (valor == null || valor == "Todos_Servicio")
            {
                list = dao.listaServicios_General();
            }
            if (valor == "Activo_Servicio")
            {
                list = dao.listaServicios();
            }
            if (valor == "Inactivo_Servicio")
            {
                list = dao.listaServicios_INACTIVOS();
            }

            return list;
        }
    }
}