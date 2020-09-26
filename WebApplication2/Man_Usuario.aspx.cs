using Biblioteca_Clases.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Biblioteca_Clases.DAO;
using Control_Visitas.Controllers;

namespace WebApplication2
{
    public partial class Man_Usuario : System.Web.UI.Page
    {
        DefaultController controller = new DefaultController();
        public Permiso_e Permisos;
        ServicioDAO dao_servicio = new ServicioDAO();
        PerfilDAO dao_perfil = new PerfilDAO();

        List<Usuario> list = new List<Usuario>();


        protected void Page_Load(object sender, EventArgs e)
        {



            int perfil = (int)(Session["perfil"]);
            Permisos = dao_servicio.ControlPaginas("Usuarios", perfil.ToString());

            if (Permisos.VER == false)
            {
                Response.Write("<script language='javascript'>alert('hello');window.location.href = 'Home.aspx';</ script > ");
                Response.Redirect("Home.aspx", false);
            }

         
        }
        public List<Usuario> lista1()
        {

            UsuarioDAO dao = new UsuarioDAO();

            List<Usuario> list = dao.listausuarios();
            return list;
        }

        public List<Perfil> lista_perfiles()
        {

            PerfilDAO dao = new PerfilDAO();

            List<Perfil> list = dao.consultaPerfiles();
            return list;
        }

        public List<Usuario> ListaUsuarios(string valor)
        {

            UsuarioDAO dao = new UsuarioDAO();


            if (valor == null || valor == "Todos_Usuario")
            {
                list = dao.ListaUsuariosGeneral();
            }
            if (valor == "Activo_Usuario")
            {
                list = dao.ListaUsuariosActivos();
            }
            if (valor == "Inactivo_Usuario")
            {
                list = dao.ListaUsuariosInactivos();
            }

            return list;
        }


    }
}