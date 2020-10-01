using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Biblioteca_Clases.DAO;
using Biblioteca_Clases.Models;

namespace WebApplication2
{
    public partial class Man_Proyecto : System.Web.UI.Page
    {

        List<Proyecto> list = new List<Proyecto>();

        public Permiso_e Permisos;
        ProyectoDAO dao_proyecto = new ProyectoDAO();


        protected void Page_Load(object sender, EventArgs e)
        {

            int perfil = (int)(Session["perfil"]);
            Permisos = dao_proyecto.ControlPaginas("Proyectos", perfil.ToString());

            if (Permisos.VER == false)
            {
                Response.Write("<script language='javascript'>alert('hello');window.location.href = 'Home.aspx';</ script > ");
                Response.Redirect("Home.aspx", false);

            }

        }

    

            public List<Proyecto> ListaProyectos(string valor)
            {

                ProyectoDAO dao = new ProyectoDAO();


                if (valor == null || valor == "Todos_Servicio")
                {
                    list = dao.listaProyectos_General();
                }
                if (valor == "Activo_Servicio")
                {
                    list = dao.listaProyectos();
                }
                if (valor == "Inactivo_Servicio")
                {
                    list = dao.listaProyectos_INACTIVOS();
                }

                return list;
            }


    }
}