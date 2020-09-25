using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
   public class ContactoDAO
    {
        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public ContactoDAO()
        {
            this.conexion = Conexion.getConexion();
        }

        public List<Contacto> listaContactos()
        {
            List<Contacto> listaContactos = new List<Contacto>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CON_LISTAR_MAN_SERVICIO_ACTIVO";


            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Contacto cont = new Contacto();
                cont.ID_CONTACTO = list.GetInt32(0);
                cont.ENCARGADO = list.GetString(1);
                cont.TELEFONO = list.GetInt32(2);
                cont.CORREO = list.GetString(3);
                cont.TIPO_ENCARGADO = list.GetString(4);
                listaContactos.Add(cont);
            }
            list.Dispose();
            comando.Dispose();
            return listaContactos;

        }

        public int AgregarContacto(Contacto cont)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "execute PA_MAN_AGREGAR_SERVICIO @ENCARGADO, @TELEFONO,@CORREO, @TIPO_ENCARGADO, @USUARIO, @FECHA";
            comando.Parameters.AddWithValue("@ENCARGADO", cont.ENCARGADO);
            comando.Parameters.AddWithValue("@TELEFONO", cont.TELEFONO);
            comando.Parameters.AddWithValue("@CORREO", cont.CORREO);
            comando.Parameters.AddWithValue("@TIPO_ENCARGADO", cont.TIPO_ENCARGADO);
            comando.Parameters.AddWithValue("@USUARIO", cont.USUARIO_CREACION);
            comando.Parameters.AddWithValue("@FECHA", cont.FECHA_CREACION);


            result = comando.ExecuteNonQuery();

            return result;

        }
    }
}
