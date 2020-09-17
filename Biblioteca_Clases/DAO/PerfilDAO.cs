using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
    public class PerfilDAO
    {

        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public PerfilDAO()
        {
            this.conexion = Conexion.getConexion();
        }
        public List<Perfil> consultaPerfiles()
        {
            List<Perfil> listperfil = new List<Perfil>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "EXEC [PA_CON_TBL_CRM_SEG_PERFIL]";


            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Perfil men = new Perfil();
                men.Pk_ID_PERFIL = list.GetInt32(0).ToString();
                men.ESTADO = list.GetString(1);
                men.DESCRIPCION = list.GetString(2);
                listperfil.Add(men);
            }
            list.Dispose();
            comando.Dispose();
            return listperfil;

        }

      
    }
}
