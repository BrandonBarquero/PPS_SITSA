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
    public partial class Man_Contrato : System.Web.UI.Page
    {

        List<Contrato> list = new List<Contrato>();

        public Permiso_e Permisos;
        ContratoDAO dao_contrato = new ContratoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            int perfil = (int)(Session["perfil"]);
            Permisos = dao_contrato.ControlPaginas("Contrato", perfil.ToString());

            if (Permisos.VER == false)
            {
                Response.Write("<script language='javascript'>alert('hello');window.location.href = 'Home.aspx';</ script > ");
                Response.Redirect("Home.aspx", false);

            }
        }

        public List<Contrato> Lista_Contrato(string valor)
        {

            ContratoDAO dao = new ContratoDAO();
            list = dao.listaContratos(valor);

            return list;

        }

    }
}