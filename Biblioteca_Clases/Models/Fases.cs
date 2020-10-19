using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca_Clases.Models
{
  public class Fases
    {

        public string DESCRIPCION { set; get; }
        public Double TIEMPO { set; get; }

        public Fases()
        {
        }

        public Fases(string dESCRIPCION, double tIEMPO)
        {
            DESCRIPCION = dESCRIPCION;
            TIEMPO = tIEMPO;
        }
    }
}
