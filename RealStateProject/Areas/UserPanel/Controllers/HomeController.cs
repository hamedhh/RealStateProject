using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Utilities;

namespace RealStateProject.Areas.UserPanel.Controllers
{
    public partial class HomeController : Controller
    {
        // GET: UserPanel/Home

        public virtual ActionResult Index()
        {
            return View();
        }


        public ActionResult ShowState()
        {
            Session["IsCreate"] = false;
            Session["IsList"] = false;
            return View(StateClass.ShowState());
        }

    }
}