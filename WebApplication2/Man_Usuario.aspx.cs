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
    }
}