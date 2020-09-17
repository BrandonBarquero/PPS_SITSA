using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;


namespace Biblioteca_Clases.DAO
{
    public class Mail
    {

        public string Contrasenna()
        {

            Random rdn = new Random();
            // string caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890%$#@";
            string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            int longitud = caracteres.Length;
            char letra;
            int longitudContrasenia = 10;
            string contraseniaAleatoria = string.Empty;
            for (int i = 0; i < longitudContrasenia; i++)
            {
                letra = caracteres[rdn.Next(longitud)];
                contraseniaAleatoria += letra.ToString();
            }
            return contraseniaAleatoria;
        }

        public void mail(string correo, string contrasenna)
        {




            try
            {
                MailMessage msg = new MailMessage("allan6kzx1@gmail.com",
                   "bbarqueroberrocal@gmail.com",
                   "Nueva Contrasenna",
                   "<html><body><h1>Su nueva contrasenna es </h1><br>" + contrasenna + "</body></html>"
                 );


                msg.IsBodyHtml = true;
                // MailAddress ms = new MailAddress("barquerobrandon@gmail.com");
                // MailAddress ms1 = new MailAddress("eduardarauz2799@gmail.com");


                //msg.Bcc.Add(ms);

                //msg.Bcc.Add(ms1);
                SmtpClient sc = new SmtpClient("smtp.gmail.com");
                sc.Port = 25;
                sc.Credentials = new NetworkCredential("allan6kzx@gmail.com", "camilalinda1");
                sc.EnableSsl = true;
                sc.Send(msg);


            }
            catch (Exception e)
            {
                string hola = e.Message;

            }


        }

}
}
