﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RealStateProject.Controllers
{
    public class PropertyController : Controller
    {
        // GET: Property
        public ActionResult ShowPropertyDetail()
        {
            return View();
        }
    }
}