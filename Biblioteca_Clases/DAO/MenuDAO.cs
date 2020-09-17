﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Biblioteca_Clases.Models;

namespace Biblioteca_Clases.DAO
{
    public class MenuDAO
    {

        public SqlConnection conexion;
        public SqlTransaction transaction;
        public string error;

        public MenuDAO()
        {
            this.conexion = Conexion.getConexion();
        }

        public List<Menu> consultamenu(int dato, int dato2)
        {
            List<Menu> listmenu = new List<Menu>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "execute PA_CON_CRM_SEG_MENU @dato,@dato2";
            comando.Parameters.AddWithValue("@dato", dato);
            comando.Parameters.AddWithValue("@dato2", dato);
            SqlDataReader list = comando.ExecuteReader();
            while (list.Read())
            {
                Menu men = new Menu();
                men.PK_ID_MENU = list.GetInt32(0);
                men.CODIGO_PADRE = list.GetString(1);
                men.DESCRIPCION = list.GetString(2);
                men.ICONO = list.GetString(3);
                men.URL = list.GetString(4);
                men.ESTADO_MENU = list.GetBoolean(5);
                men.CREAR_MENU = list.GetBoolean(6);
                men.EDITAR_MENU = list.GetBoolean(7);
                men.VER_MENU = list.GetBoolean(8);
                men.ESTADO_PERMISO = list.GetBoolean(9);
                men.CREAR_PERMISO = list.GetBoolean(10);
                men.EDITAR_PERMISO = list.GetBoolean(11);
                men.VER_PERMISO = list.GetBoolean(12);
                listmenu.Add(men);
            }
            list.Dispose();
            comando.Dispose();
            return listmenu;

        }
        public List<Menu> consultamenuperfil(int dato,string dato2)
        {
            List<Menu> listmenu = new List<Menu>();
            SqlCommand comando = new SqlCommand();

            comando.Connection = conexion;
            comando.CommandText = "exec PA_CON_CRM_SEG_MENU12 @dato,@dato2";
            comando.Parameters.AddWithValue("@dato", dato);
            comando.Parameters.AddWithValue("@dato2", dato2);
            SqlDataReader list2 = comando.ExecuteReader();
            while (list2.Read())
            {
                Menu men = new Menu();
                men.PK_ID_MENU = list2.GetInt32(0);
                men.CODIGO_PADRE = list2.GetString(1);
                men.DESCRIPCION = list2.GetString(2);
                men.ICONO = list2.GetString(3);
                men.URL = list2.GetString(4);
                men.ESTADO_MENU = list2.GetBoolean(5);
                men.CREAR_MENU = list2.GetBoolean(6);
                men.EDITAR_MENU = list2.GetBoolean(7);
                men.VER_MENU = list2.GetBoolean(8);
                men.ESTADO_PERMISO = list2.GetBoolean(9);
                men.CREAR_PERMISO = list2.GetBoolean(10);
                men.EDITAR_PERMISO = list2.GetBoolean(11);
                men.VER_PERMISO = list2.GetBoolean(12);
                listmenu.Add(men);
            }
            list2.Dispose();
            comando.Dispose();
            return listmenu;

        }
    }
}