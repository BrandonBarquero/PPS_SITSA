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
        public string ESTADO { set; get; }

        public Usuario(string cEDULA, string cONTRASENNA)
        {
            CEDULA = cEDULA;
            CONTRASENNA = cONTRASENNA;
        }

}
}
