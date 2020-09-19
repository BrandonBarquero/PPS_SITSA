using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;

namespace Biblioteca_Clases.DAO
{
    public class Fecha
    {
        private const string URL = "http://api.timezonedb.com/v2.1/get-time-zone?key=IY6HULRCQDBR&format=json&by=zone&zone=America/Costa_Rica";
        private const string DATA = @"{""object"":{""formatted"":""Formatted""}}";

  
        public string fecha()
        {
            string dato = CreateObject();
            return dato.Substring(0, 10);
        }

        public string hora()
        {
            string dato = CreateObject();
            return dato.Substring(11, dato.Length - 11);
        }

        private static string CreateObject()
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.ContentLength = DATA.Length;

            string data = "";

            using (Stream webStream = request.GetRequestStream())
            using (StreamWriter requestWriter = new StreamWriter(webStream, System.Text.Encoding.ASCII))
            {
                requestWriter.Write(DATA);
            }

            try
            {
                WebResponse webResponse = request.GetResponse();
                using (Stream webStream = webResponse.GetResponseStream())
                {
                    if (webStream != null)
                    {
                        using (StreamReader responseReader = new StreamReader(webStream))
                        {
                            string response = responseReader.ReadToEnd();
                            JObject jObject = JObject.Parse(response);
                            //Console.Out.WriteLine(jObject["formatted"]);
                            data = jObject["formatted"].ToString();
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Console.Out.WriteLine("-----------------");
                Console.Out.WriteLine(e.Message);
            }
            return data;
        }
    }
}

