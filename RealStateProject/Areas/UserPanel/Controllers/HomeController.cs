using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealStateProject.Areas.UserPanel.Controllers
{
    public partial class HomeController : Controller
    {
        // GET: UserPanel/Home

        public virtual ActionResult Index()
        {
            return View();
        }
    }
}