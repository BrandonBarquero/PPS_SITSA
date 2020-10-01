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
    public partial class Man_Contacto : System.Web.UI.Page
    {

        List<Contacto> list = new List<Contacto>();

        public Permiso_e Permisos;
        ContactoDAO dao_contacto = new ContactoDAO();


        protected void Page_Load(object sender, EventArgs e)
        {

            int perfil = (int)(Session["perfil"]);
            Permisos = dao_contacto.ControlPaginas("Contacto", perfil.ToString());

            if (Permisos.VER == false)
            {
                Response.Write("<script language='javascript'>alert('hello');window.location.href = 'Home.aspx';</ script > ");
                Response.Redirect("Home.aspx", false);

            }

        }

        public List<Contacto> ListaContacto()
        {

            ContactoDAO dao = new ContactoDAO();

                list = dao.listaContactos();
        

            return list;
        }
    }
}