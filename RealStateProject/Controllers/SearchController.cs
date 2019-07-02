using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;
using DataLayer.ViewModels;

namespace RealStateProject.Controllers
{
    public class SearchController : Controller
    {
        RealState_DBEntities _db = new RealState_DBEntities();
        // GET: Search
        public ActionResult Defualt()
       {
            ViewBag.CountryID = new SelectList(_db.Countries.ToList(), "CountryID", "CountryTitle");
            ViewBag.usageID = new SelectList(_db.Usages.ToList(), "UsageID", "UsageTitle");
            ViewBag.propertyTypeID = new SelectList(_db.HomeProperty_Type.Where(a=>a.PropertyTypeID==3 || a.PropertyTypeID==2).OrderByDescending(a=>a.PropertyTypeID), "PropertyTypeID", "Title");
            //Session["Buy"] = true;
            return PartialView();
        }

        public JsonResult findCity(int id)
        {
            var cities =_db.Cities.Where(a => a.CountryID == id).Select(c=>new {ID=c.CityID,Name=c.CityTitle}).ToList();
            return Json(cities, JsonRequestBehavior.AllowGet);

        }
    }
}