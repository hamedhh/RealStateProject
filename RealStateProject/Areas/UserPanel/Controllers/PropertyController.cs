using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;
using DataLayer.ViewModels;
using InsertShowImage;
using KooyWebApp_MVC.Classes;

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
            ViewBag.Facilities = _db.Facilities.ToList();
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

            ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            ViewBag.Facilities = _db.Facilities.ToList();
            ViewBag.Conditions = _db.Conditions.ToList();
            return View();
        }

        [HttpPost]
        public virtual ActionResult testCreate3(CreatePropertyViewModel _createPropertyViewModel, List<int> checkFacility, List<int> checkCondition, List<HttpPostedFileBase> fileUpload, List<string> DeletedPhotp)
        {

            _createPropertyViewModel.ImageName = "home-defualt.png";
            int _cultureID = 1;
            int UserID = 1;
            if (User.Identity.IsAuthenticated)
            {
                var res = _db.Users.SingleOrDefault(a => a.UserName == User.Identity.Name);
                if (res != null)
                    UserID = res.UserID;
            }
            switch (System.Globalization.CultureInfo.CurrentCulture.Name)
            {
                case "fa-IR":
                    {
                        _cultureID = 1;
                        break;
                    }

                case "en-US":
                    {
                        _cultureID = 2;
                        break;
                    }

            }
            HomeProperty _homeProperty = new HomeProperty() {
                CreateDate = DateTime.Now,
                Title = _createPropertyViewModel.Title,  
                CreateUserID = UserID,
                SubUsageID = _createPropertyViewModel.SubUsageID,
                StatusID = 1,
                RegionID = _createPropertyViewModel.rigionID,
                CultureID = _cultureID,
                PropertyTypeID = _createPropertyViewModel.PropertyTypeID

                //Description =_createPropertyViewModel.Description,
                //HomePrice=_createPropertyViewModel.HomePrice,
                //LocAge=_createPropertyViewModel.LocAge,
                //LocArea=_createPropertyViewModel.LocArea,
                //MortgagePrice=_createPropertyViewModel.MortgagePrice,
            };
            if (ModelState.IsValid)
            {
                _db.HomeProperties.Add(_homeProperty);

            }
            //_db.Roles.Add(new Role()
            //{
            //    RoleName = "testi",
            //    RoleTitle = "test"
            //});
            _db.SaveChanges();

            foreach (var item in fileUpload)
            {
                if (item != null && item.IsImage())
                {
                    if (DeletedPhotp != null)
                    {
                        if (DeletedPhotp.Contains(item.FileName))
                        {
                            continue;
                        }

                    }
                    _createPropertyViewModel.ImageName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(item.FileName);
                    item.SaveAs(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName);
                    ImageResizer img = new ImageResizer();
                    img.Resize(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName,
                    Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/Thumb/") + _createPropertyViewModel.ImageName);

                }

            }

            ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            ViewBag.Facilities = _db.Facilities.ToList();
            ViewBag.Conditions = _db.Conditions.ToList();
            return View();


        }

        public virtual ActionResult UploadAction()
        {
            return View();
        }



        [HttpPost]
        public virtual ActionResult UploadAction(CreatePropertyViewModel _createPropertyViewModel, List<HttpPostedFileBase> fileUpload, List<string> my)
        {
            // Your Code - / Save Model Details to DB

            // Handling Attachments -
            //foreach (HttpPostedFileBase item in fileUpload)
            //{
            //    if (Array.Exists(model.FilesToBeUploaded.Split(','), s => s.Equals(item.FileName)))
            //    {
            //        //Save or do your action -  Each Attachment ( HttpPostedFileBase item )
            //    }
            //}
            return View("Index");
        }


        public virtual JsonResult FindCity(int id)
        {
            var res = _db.Cities.Where(a => a.CountryID == id).Select(c => new { c.CityID, c.CityTitle });
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public virtual JsonResult FindRigion(int id)
        {
            var res = _db.Rigions.Where(a => a.CityID == id).Select(c => new { c.RigionID, c.RegionTitle });
            return Json(res, JsonRequestBehavior.AllowGet);
        }

        public virtual JsonResult FindSubUsage(int id)
        {
            var res = _db.SubUsages.Where(a => a.UsageID == id).Select(c => new { c.SubUsageID, c.SubUsageTitle });
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        //
    }
}