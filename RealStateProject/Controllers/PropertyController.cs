using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealStateProject.Controllers
{
    public class PropertyController : Controller
    {
        // GET: Property

        public ActionResult ShowAllProperty()
        {
            return View();
        }

        public ActionResult ShowDetailProperty()
        {
            return View();
        }

        public ActionResult PapulerProperty()
        {
            return PartialView();
        }
    }
}