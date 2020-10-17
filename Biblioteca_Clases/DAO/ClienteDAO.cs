using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
   public class ClienteDAO
    {

        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public ClienteDAO()
        {
            this.conexion = Conexion.getConexion();
        }

        public List<Cliente> listaClientes()
        {
            List<Cliente> listaServicios = new List<Cliente>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CTRL_REG_LISTAR_REG_CLIENTE_ACTIVO";


            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Cliente client = new Cliente();
                client.ID_CLIENTE = list.GetInt32(0);
                client.NOMBRE = list.GetString(1);
                listaServicios.Add(client);
            }
            list.Dispose();
            comando.Dispose();
            return listaServicios;

        }

        public Cliente filtrar_cliente(int id)
        {
            Cliente cliente = new Cliente();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CTRL_REG_LISTAR_REG_CLIENTE_FILTRADO @ID";
            comando.Parameters.AddWithValue("@ID", id);

            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                cliente = new Cliente();
                cliente.ID_CLIENTE = list.GetInt32(0);
                cliente.NOMBRE = list.GetString(1);
            }
            list.Dispose();
            comando.Dispose();

            return cliente;
        }
    }
}
