using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca_Clases.Models
{
  public class Contrato
    {

        public int ID_CONTRATO { set; get; }
        public string NOMBRE_CONTRATO { set; get; }
        public string DESCRIPCION { set; get; }
        public string FECHA_INICIO { set; get; }
        public string FECHA_VENCE { set; get; }
        public float PRECIO { set; get; }
        public int ESTADO { set; get; }
        public int HORAS { set; get; }
        public int RANGO { set; get; }
        public float HORAS_POR_CONSUMIR { set; get; }
        public string FECHA_CREACION { set; get; }
        public string USUARIO_CREACION { set; get; }
        public string FECHA_MODIFICACION { set; get; }
        public string USUARIO_MODIFICACION { set; get; }

        public Contrato()
        {


        }

    }
}
