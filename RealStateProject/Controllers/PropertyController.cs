using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            var datetime = DateTime.Now;
            if (_db.PropertyViews.Any(a => a.HomePropertyID == id))
            {
                var propertyView = _db.PropertyViews.Where(a => a.HomePropertyID == id).OrderByDescending(a => a.PropertyViewID).FirstOrDefault();
                if (propertyView != null)
                {
                    _db.Entry(propertyView).State = EntityState.Modified;
                    var date = propertyView.PropertyViewDate.Date;
                    var now = datetime.Date;
                    if (date == now)
                    {
                        propertyView.PropertyViewCount = propertyView.PropertyViewCount + 1;
                        _db.SaveChanges();
                    }
                    else
                    {
                        var viewProperty = new PropertyView()
                        {
                            HomePropertyID = id,
                            PropertyViewDate = datetime,
                            PropertyViewCount = 1,
                            StringDate = datetime.Year + "/" + datetime.Month + "/" + datetime.Day
                        };
                        _db.PropertyViews.Add(viewProperty);
                        _db.SaveChanges();
                    }
                }
            }
            else
            {
                var viewProperty = new PropertyView()
                {
                    HomePropertyID = id,
                    PropertyViewDate = datetime,
                    PropertyViewCount = 1,
                    StringDate = datetime.Year + "/" + datetime.Month + "/" + datetime.Day

                };
                _db.PropertyViews.Add(viewProperty);
                _db.SaveChanges();
            }



            var homeProperty = _db.HomeProperties.SingleOrDefault(a => a.HomePropertyID == id);
            if (homeProperty != null)
            {
                if (homeProperty.HomeProperties_MetaData.Any(a => a.FacilityID != null))
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