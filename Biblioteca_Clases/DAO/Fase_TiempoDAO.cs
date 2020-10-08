using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
   public class Fase_TiempoDAO
    {

        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public Fase_TiempoDAO()
        {
            this.conexion = Conexion.getConexion();
        }

        public int AgregarFase_Tiempo(Fase_Tiempo fase)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "execute PA_MAN_AGREGAR_FASE_TIEMPO @DESCRIPCION, @TIEMPO,@USUARIO, @FECHA, @FK_ID_PROYECTO, @ESTADO";

            comando.Parameters.AddWithValue("@DESCRIPCION", fase.DESCRIPCION);
            comando.Parameters.AddWithValue("@TIEMPO", fase.TIEMPO);
            comando.Parameters.AddWithValue("@USUARIO", fase.USUARIO_CREACION);
            comando.Parameters.AddWithValue("@FECHA", fase.FECHA_CREACION);
            comando.Parameters.AddWithValue("@FK_ID_PROYECTO", fase.FK_ID_PROYECTO);
            comando.Parameters.AddWithValue("@ESTADO", 1);


            result = comando.ExecuteNonQuery();

            return result;

        }

        public List<Fase_Tiempo> Listar_Fase_Tiempo(int id)
        {
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;

            List<Fase_Tiempo> fases = new List<Fase_Tiempo>();

            comando.CommandText = "exec PA_CON_LISTAR_MAN_FASE_TIEMPO_ACTIVO @FK_ID_PROYECTO";
            comando.Parameters.AddWithValue("@FK_ID_PROYECTO", id);

            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Fase_Tiempo fase = new Fase_Tiempo();
                fase.DESCRIPCION = list.GetString(0);
                fase.TIEMPO = list.GetDouble(1);
                fase.ID_FASE = list.GetInt32(2);
                fases.Add(fase);
            }
            list.Dispose();
            comando.Dispose();

            return fases;
        }

        public int ActualizarEstadoDeshabilitarFase(Fase_Tiempo fase)
        {
            int result = 0;
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "execute PA_MAN_DESHABILITAR_FASE_TIEMPO @PK_ID_FASE,@USUARIO, @FECHA";
            comando.Parameters.AddWithValue("@PK_ID_FASE", fase.ID_FASE);
            comando.Parameters.AddWithValue("@USUARIO", fase.USUARIO_MODIFICACION);
            comando.Parameters.AddWithValue("@FECHA", fase.FECHA_MODIFICACION);


            result = comando.ExecuteNonQuery();

            return result;

        }


    }
}
