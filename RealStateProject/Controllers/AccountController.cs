using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;

namespace RealStateProject.Controllers
{
    public class AccountController : Controller
    {
        RealState_DBEntities db = new RealState_DBEntities();
        // GET: Account
        public ActionResult Register()
        {
            return PartialView();
        }

        [HttpPost]
        public ActionResult Register(User _user)
        {
            if (ModelState.IsValid)
                return PartialView();
            else
                return View();
        }
    }
}