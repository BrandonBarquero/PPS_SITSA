using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
   public class ContratoDAO
    {

        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public ContratoDAO()
        {
            this.conexion = Conexion.getConexion();
        }

        public List<Contrato> listaContratos()
        {
            List<Contrato> listaContratos = new List<Contrato>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CTRL_LISTAR_MAN_CONTRATO";


            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Contrato cont = new Contrato();
                cont.ID_CONTRATO = list.GetInt32(0);
                cont.NOMBRE_CONTRATO = list.GetString(1);
                listaContratos.Add(cont);
            }
            list.Dispose();
            comando.Dispose();
            return listaContratos;

        }

    }
}
