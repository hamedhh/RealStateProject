using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealStateProject.Controllers
{
    public partial class PropertyController : Controller
    {
        // GET: Property

        public virtual ActionResult ShowAllProperty()
        {
            return View();
        }

        public virtual ActionResult ShowDetailProperty()
        {
            return View();
        }

        public virtual ActionResult PapulerProperty()
        {
            return PartialView();
        }

        public virtual ActionResult NearbyProperty()
        {
            return PartialView();
        }
    }
}