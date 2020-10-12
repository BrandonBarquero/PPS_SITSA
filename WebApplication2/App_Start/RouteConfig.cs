using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebApplication2
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Contacto",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Contacto", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Tipo_Contrato",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "TipoContrato", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Cliente",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Cliente", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Servicio",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Servicio", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Usuario",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Usuario", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Proyecto",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Proyecto", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Contrato",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Contrato", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
              name: "Fase_Tiempo",
              url: "{controller}/{action}/{id}",
              defaults: new { controller = "Fase_Tiempo", action = "Index", id = UrlParameter.Optional }
          );  
        }
    }
}
