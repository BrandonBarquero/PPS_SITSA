using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca_Clases.Models
{
   public class Usuario
    {
        public string CEDULA { set; get; }
        public string NOMBRE { set; get; }
        public string CORREO { set; get; }
        public string CONTRASENNA { set; get; }
        public bool ESTADO { set; get; }
        public string FECHA_CREACION { set; get; }
        public string USUARIO_CREACON { set; get; }
        public string FECHA_MODIFICACION { set; get; }
        public string USUARIO_MODIFICACION { set; get; }
        public int FK_PERFIL { set; get; }
        public Usuario(string cEDULA, string cONTRASENNA)
        {
            CEDULA = cEDULA;
            CONTRASENNA = cONTRASENNA;
        }
        public Usuario()
        {
         
        }

        public Usuario(string cEDULA, string nOMBRE, string cORREO, int fK_PERFIL, string fECHA_MODIFICACION, string uSUARIO_MODIFICACION) 
        {
            CEDULA = cEDULA;
            NOMBRE = nOMBRE;
            CORREO = cORREO;
            FK_PERFIL = fK_PERFIL;
            FECHA_MODIFICACION = fECHA_MODIFICACION;
            USUARIO_MODIFICACION = uSUARIO_MODIFICACION;
        }
    }
}
