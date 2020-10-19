using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca_Clases.Models
{
   public class Proyectos
    {

        public string DESCRIPCION { set; get; }
        public string NOMBRE { set; get; }
        public Double PRECIO { set; get; }
        public int FK_ID_CLIENTE { set; get; }

        public Proyectos(string nOMBRE, string dESCRIPCION, double pRECIO, int fK_ID_CLIENTE)
        {
            NOMBRE = nOMBRE;
            DESCRIPCION = dESCRIPCION;
            PRECIO = pRECIO;
            FK_ID_CLIENTE = fK_ID_CLIENTE;
        }
    }
}
