using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace RealStateProject.Controllers
{
    public partial class LanguageController : Controller
    {
        // GET: Language
        public virtual ActionResult Index()
        {
            return View();
        }

        public virtual ActionResult ChangeLanguage(string Language)
        {
            if (Language != null)
            {
                Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(Language);
                Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Language);
            }
            HttpCookie _cookie = new HttpCookie("language");
            _cookie.Value = Language;
            Response.Cookies.Add(_cookie);

            return RedirectToAction("Index","Home");
        }
    }
}