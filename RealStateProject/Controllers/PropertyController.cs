using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;


namespace RealStateProject.Controllers
{
    public partial class PropertyController : Controller
    {
        RealState_DBEntities _db = new RealState_DBEntities();
        // GET: Property

        public virtual ActionResult ShowAllProperty()
        {
            return View();
        }

        
        public virtual ActionResult ShowDetailProperty(int id)
        {

            var homeProperty = _db.HomeProperties.SingleOrDefault(a=>a.HomePropertyID==id);
            if (homeProperty != null)
            {
                if (homeProperty.HomeProperties_MetaData.Any(a =>a.FacilityID != null))
                    ViewBag.facility = homeProperty.HomeProperties_MetaData.Where(a => a.FacilityID != null).ToList();
                if (homeProperty.HomeProperties_MetaData.Any(a => a.ConditionID != null))
                    ViewBag.condition = homeProperty.HomeProperties_MetaData.Where(a => a.ConditionID != null).ToList();
                return View(homeProperty);

            }
            else
                return RedirectToAction("Index", "Home");
        }

        public virtual ActionResult PapulerProperty()
        {
            return PartialView();
        }

        public virtual ActionResult NearbyProperty()
        {
            var res = _db.HomeProperties.ToList();
            return PartialView(res);
        }

        
    }
}