using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealStateProject.Areas.UserPanel.Controllers
{
    public class UserHomeController : Controller
    {
        // GET: UserPanel/UserHome
        public ActionResult IndexUser()
        {
            return View();
        }
    }
}