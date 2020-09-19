using Biblioteca_Clases.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Biblioteca_Clases.DAO;
namespace WebApplication2
{
    public partial class Man_Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<Usuario> lista1() {

            UsuarioDAO dao = new UsuarioDAO();

            List<Usuario> list = dao.listausuarios();
            return list;
        }
    }
}