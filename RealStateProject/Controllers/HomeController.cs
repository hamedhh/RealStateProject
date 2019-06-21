using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;

namespace RealStateProject.Controllers
{ 
    public partial class HomeController : Controller
    {
        RealState_DBEntities _db = new RealState_DBEntities();

        public virtual ActionResult Index()
        {
            var homeproperty = _db.HomeProperties.ToList();
            return View(homeproperty);
          
        }

        public virtual ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public virtual ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}