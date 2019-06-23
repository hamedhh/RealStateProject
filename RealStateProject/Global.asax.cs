using GSD.Globalization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Utilities;

namespace RealStateProject
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            ModelBinders.Binders.Add(typeof(decimal), new DecimalModelBinder());
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Application_BeginRequest()
        {
            HttpCookie _cookire = HttpContext.Current.Request.Cookies["language"];
            if (_cookire != null && _cookire.Value != null)
            {
                if (_cookire.Value == "fa")
                {
                    var persianCulture = new PersianCulture();
                    Thread.CurrentThread.CurrentCulture = persianCulture;
                    Thread.CurrentThread.CurrentUICulture = persianCulture;
                }
                else
                {
                Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(_cookire.Value);
                Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(_cookire.Value);
                }
                
            }
            else {
                var persianCulture = new PersianCulture();
                //Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("fa");
                //Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("fa");
                
                Thread.CurrentThread.CurrentCulture = persianCulture;
                Thread.CurrentThread.CurrentUICulture = persianCulture;
            }


        }
    }
}
