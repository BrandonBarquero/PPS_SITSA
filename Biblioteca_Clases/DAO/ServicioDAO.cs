using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
    public class ServicioDAO
    {

        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public ServicioDAO()
        {
            this.conexion = Conexion.getConexion();
        }


        public List<Servicio> listaServicios()
        {
            List<Servicio> listaServicios = new List<Servicio>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CON_LISTAR_MAN_SERVICIO_ACTIVO";


            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Servicio serv = new Servicio();
                serv.ID_SERVICIO = list.GetInt32(0);
                serv.DESCRIPCION = list.GetString(1);
                serv.ESTADO = list.GetInt32(2);
                listaServicios.Add(serv);
            }
            list.Dispose();
            comando.Dispose();
            return listaServicios;

        }

        public int AgregarServicio(Servicio serv)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "execute PA_MAN_AGREGAR_SERVICIO @DESCRIPCION, @ESTADO,@USUARIO, @FECHA";
            comando.Parameters.AddWithValue("@DESCRIPCION", serv.DESCRIPCION);
            comando.Parameters.AddWithValue("@ESTADO", 1);
            comando.Parameters.AddWithValue("@USUARIO", serv.USUARIO_CREACION);
            comando.Parameters.AddWithValue("@FECHA", serv.FECHA_CREACION);
           

            result = comando.ExecuteNonQuery();

            return result;

        }


        public int ActualizarServicio(Servicio serv)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "execute PA_MAN_ACTUALIZAR_SERVICIO @PK_ID_SERVICIO, @DESCRIPCION,@USUARIO, @FECHA";
            comando.Parameters.AddWithValue("@PK_ID_SERVICIO", serv.ID_SERVICIO);
            comando.Parameters.AddWithValue("@DESCRIPCION", serv.DESCRIPCION);
            comando.Parameters.AddWithValue("@USUARIO", serv.USUARIO_MODIFICACION);
            comando.Parameters.AddWithValue("@FECHA", serv.FECHA_MODIFICACION);


            result = comando.ExecuteNonQuery();

            return result;

        }


    }
}
