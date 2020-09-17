using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Biblioteca_Clases.Models
{
   public class Conexion
    {
        private static SqlConnection objConexion;
        private static string error;

        public Conexion() { }
        public static SqlConnection getConexion()
        {
            if (objConexion != null)
            {
                return objConexion;
            }
            objConexion = new SqlConnection();
            objConexion.ConnectionString = "Data Source=DESKTOP-4GT4NSO\\SQLEXPRESS;Initial Catalog=SITSA ;User ID=test;Password=root;";
            try
            {
                objConexion.Open();
                return objConexion;
            }
            catch (Exception e)
            {
                error = e.Message;
                return null;
            }
        }
        public static void cerrarConexion()
        {
            if (objConexion != null)
            {
                objConexion.Close();
            }
        }
    }
}
