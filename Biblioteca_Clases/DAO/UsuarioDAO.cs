using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
    public class UsuarioDAO
    {

        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public UsuarioDAO()
        {
            this.conexion = Conexion.getConexion();
        }

        public List<Usuario> listausuarios() {
            List<Usuario> listusuarios = new List<Usuario>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CON_LISTAR_MAN_USUARIO";


            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Usuario user = new Usuario();
                user.CEDULA = list.GetString(1);
                user.NOMBRE = list.GetString(2);
                user.CORREO = list.GetString(3);
                user.ESTADO = list.GetBoolean(4);
                user.FK_PERFIL = list.GetInt32(10);
                listusuarios.Add(user);
            }
            list.Dispose();
            comando.Dispose();
            return listusuarios;

        }

        public Usuario listausuarios(string cedula )
        {
            Usuario user = new Usuario();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CON_LISTAR_MAN_USUARIO @cedula";
            comando.Parameters.AddWithValue("@cedula", cedula);

            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                
                user.CEDULA = list.GetString(1);
                user.NOMBRE = list.GetString(2);
                user.CORREO = list.GetString(3);
                user.ESTADO = list.GetBoolean(4);
                user.FK_PERFIL = list.GetInt32(10);
              
            }
            list.Dispose();
            comando.Dispose();
            return user;

        }


        public int verificacedula(string dato)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CTRL_CON_VERFICA_CEDULA @Cedula";
            comando.Parameters.AddWithValue("@Cedula", dato);

            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {

                result = list.GetInt32(0);
            }
            list.Dispose();
            comando.Dispose();
            return result;

        }
        public int verificaemail(string dato)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CTRL_CON_VERFICA_CORREO  @Correo";
            comando.Parameters.AddWithValue("@Correo", dato);

            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {

                result = list.GetInt32(0);
            }
            list.Dispose();
            comando.Dispose();
            return result;

        }
        public int ActualizarUsuario(Usuario user)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "execute PA_MAN_ACTUALIZAR_MAN_USUARIO @CEDULA, @NOMBRE,@CORREO,@FK_PERFIL,@FECHA,@USUARIO";
            comando.Parameters.AddWithValue("@CEDULA", user.CEDULA);
            comando.Parameters.AddWithValue("@NOMBRE", user.NOMBRE);
            comando.Parameters.AddWithValue("@CORREO", user.CORREO);
            comando.Parameters.AddWithValue("@FK_PERFIL", user.FK_PERFIL);
            comando.Parameters.AddWithValue("@FECHA", user.FECHA_MODIFICACION);
            comando.Parameters.AddWithValue("@USUARIO", user.USUARIO_MODIFICACION);
      
            result = comando.ExecuteNonQuery();

            return result;

        }

    }
}
