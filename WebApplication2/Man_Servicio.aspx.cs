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
    public partial class Man_Servicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Servicio> lista1()
        {

            ServicioDAO dao = new ServicioDAO();

            List<Servicio> list = dao.listaServicios();
            return list;
        }
    }
}