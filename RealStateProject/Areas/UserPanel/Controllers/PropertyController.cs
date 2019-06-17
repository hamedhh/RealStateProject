using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;
using DataLayer.ViewModels;

namespace RealStateProject.Areas.UserPanel.Controllers
{
    public partial class PropertyController : Controller
    {
        private RealState_DBEntities _db = new RealState_DBEntities();

        public virtual ActionResult Create()
        {
            ViewBag.Country = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.City = new SelectList(_db.Cities, "CityID", "CityTitle");
            ViewBag.Rigion = new SelectList(_db.Rigions, "RigionID", "RegionTitle");
            return View();
        }

        [HttpPost]
        public virtual ActionResult Create(HomeProperty _homeProperty)
        {
            return View();
        }

        public virtual ActionResult testCreate()
        {
            ViewBag.Country = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.City = new SelectList(_db.Cities, "CityID", "CityTitle");
            ViewBag.Rigion = new SelectList(_db.Rigions, "RigionID", "RegionTitle");
            return View();
        }

        [HttpPost]
        public virtual ActionResult testCreate(CreatePropertyViewModel _createPropertyViewModel, int City)
        {
            
            return View();
        }

        public virtual ActionResult testCreate2()
        {

            ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            return View();
        }

        [HttpPost]
        public virtual ActionResult testCreate2(CreatePropertyViewModel _createPropertyViewModel)
        {

            ViewBag.City = new SelectList(_db.Cities, "CityID", "CityTitle");
            return View();
        }

        public virtual ActionResult testCreate3()
        {

            ViewBag.CityID = new SelectList(_db.Cities, "CityID", "CityTitle");
            return View();
        }

        [HttpPost]
        public virtual ActionResult testCreate3(CreatePropertyViewModel _createPropertyViewModel)
        {

            ViewBag.City = new SelectList(_db.Cities, "CityID", "CityTitle");
            return View();
        }

        public JsonResult FindCity(int id)
        {
           var res= _db.Cities.Where(a => a.CountryID == id).Select(c => new { c.CityID, c.CityTitle });
            return Json(res, JsonRequestBehavior.AllowGet);
        }
    }
}