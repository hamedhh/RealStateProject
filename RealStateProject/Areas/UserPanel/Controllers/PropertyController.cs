using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;
using DataLayer.ViewModels;
using InsertShowImage;
using KooyWebApp_MVC.Classes;
using Utilities;
using PagedList;
using System.Net;
using System.Web.Helpers;

namespace RealStateProject.Areas.UserPanel.Controllers
{
    public partial class PropertyController : Controller
    {
        private RealState_DBEntities _db = new RealState_DBEntities();

        public virtual ActionResult Create()
        {
            ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            ViewBag.Facilities = _db.Facilities.ToList();
            ViewBag.Conditions = _db.Conditions.ToList();
            Session["IsCreate"] = true;
            Session["IsList"] = false;

            return View();
        }

        [HttpPost]
        public virtual ActionResult Create(CreatePropertyViewModel _createPropertyViewModel, List<int> checkFacility, List<int> checkCondition, List<HttpPostedFileBase> fileUpload, List<string> DeletedPhotp)
        {
            decimal homeprice = 0;
            decimal rentPrice = 0;
            decimal mortgagePrice = 0;
            int locArea = 0;
            int locAge = 0;
            string _lat = "";
            string _long = "";

            if (!string.IsNullOrEmpty(_createPropertyViewModel.HomePrice))
            {
                if (_createPropertyViewModel.HomePrice.Contains(','))
                    homeprice = decimal.Parse(_createPropertyViewModel.HomePrice.Replace(",", ""));
                else
                    homeprice = decimal.Parse(_createPropertyViewModel.HomePrice);
            }
            if (!string.IsNullOrEmpty(_createPropertyViewModel.RentPrice))
            {
                if (_createPropertyViewModel.RentPrice.Contains(','))
                    rentPrice = decimal.Parse(_createPropertyViewModel.RentPrice.Replace(",", ""));
                else
                    rentPrice = decimal.Parse(_createPropertyViewModel.RentPrice);
            }
            if (!string.IsNullOrEmpty(_createPropertyViewModel.MortgagePrice))
            {
                if (_createPropertyViewModel.MortgagePrice.Contains(','))
                    mortgagePrice = decimal.Parse(_createPropertyViewModel.MortgagePrice.Replace(",", ""));
                else
                    mortgagePrice = decimal.Parse(_createPropertyViewModel.MortgagePrice);
            }
            if (!string.IsNullOrEmpty(_createPropertyViewModel.LocArea))
            {
                if (_createPropertyViewModel.LocArea.Contains(','))
                    locArea = int.Parse(_createPropertyViewModel.LocArea.Replace(",", ""));
                else
                    locArea = int.Parse(_createPropertyViewModel.LocArea);
            }
            if (!string.IsNullOrEmpty(_createPropertyViewModel.LocAge))
            {
                if (_createPropertyViewModel.LocAge.Contains(','))
                    locAge = int.Parse(_createPropertyViewModel.LocAge.Replace(",", ""));
                else
                    locAge = int.Parse(_createPropertyViewModel.LocAge);
            }
            if (!string.IsNullOrEmpty(_createPropertyViewModel.latlongMap))
            {
                _lat = _createPropertyViewModel.latlongMap.Split(',')[0];
                _long = _createPropertyViewModel.latlongMap.Split(',')[1];
            }
            int _cultureID = 1;
            int UserID = 1;
            List<string> ImageNames = new List<string>();
            if (User.Identity.IsAuthenticated)
            {
                var res = _db.Users.SingleOrDefault(a => a.UserName == User.Identity.Name);
                if (res != null)
                    UserID = res.UserID;
            }
            if (fileUpload[0] == null)
            {
                _createPropertyViewModel.ImageName = "home-defualt.png";
                ImageNames.Add(_createPropertyViewModel.ImageName);
            }
            else
            {
                _createPropertyViewModel.ImageName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fileUpload[0].FileName);
                fileUpload[0].SaveAs(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName);
                ImageResizer img = new ImageResizer();
                img.Resize(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName,
                Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/Thumb/") + _createPropertyViewModel.ImageName);
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
            if (_createPropertyViewModel.PropertyTypeID == 1)
            {
                rentPrice = 0;
                mortgagePrice = 0;
            }
            else
            {
                homeprice = 0;
            }
            HomeProperty _homeProperty = new HomeProperty()
            {
                CreateDate = DateTime.Now,
                Title = _createPropertyViewModel.Title,
                CreateUserID = UserID,
                SubUsageID = _createPropertyViewModel.SubUsageID,
                StatusID = (_createPropertyViewModel.PropertyTypeID == 1 ? 1 : 2),
                RegionID = _createPropertyViewModel.rigionID,
                CultureID = _cultureID,
                PropertyTypeID = _createPropertyViewModel.PropertyTypeID,
                LocAge = locAge,
                LocArea = locArea,
                Description = _createPropertyViewModel.Description,
                HomePrice = homeprice,
                MortgagePrice = mortgagePrice,
                RentPrice = rentPrice,
                ImageName = _createPropertyViewModel.ImageName,
                LocLatitude = _lat,
                LocLongitude = _long

            };
            if (ModelState.IsValid)
            {
                _db.HomeProperties.Add(_homeProperty);
                _db.SaveChanges();

                if (fileUpload != null)
                {
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
                            ImageNames.Add(_createPropertyViewModel.ImageName);
                            item.SaveAs(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName);
                            ImageResizer img = new ImageResizer();
                            img.Resize(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName,
                            Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/Thumb/") + _createPropertyViewModel.ImageName);

                        }

                    }
                }

                #region facility
                if (checkFacility != null)
                {
                    foreach (var item in checkFacility)
                    {
                        _db.HomeProperties_MetaData.Add(new HomeProperties_MetaData()
                        {
                            HomePropertyID = _homeProperty.HomePropertyID,
                            FacilityID = item
                        });
                    }
                }
                #endregion

                #region condition
                if (checkCondition != null)
                {
                    foreach (var item in checkCondition)
                    {
                        _db.HomeProperties_MetaData.Add(new HomeProperties_MetaData()
                        {
                            HomePropertyID = _homeProperty.HomePropertyID,
                            ConditionID = item
                        });
                    }
                }
                #endregion

                #region ImageGallry
                if (ImageNames != null)
                {
                    foreach (var item in ImageNames)
                    {
                        _db.HomeProperty_Galleries.Add(new HomeProperty_Galleries()
                        {
                            HomePropertyID = _homeProperty.HomePropertyID,
                            ImageName = item
                        });
                    }
                }
                #endregion
                _db.SaveChanges();
                Session["InsertProperty"] = true;
                ModelState.Clear();
            }
            ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            ViewBag.Facilities = _db.Facilities.ToList();
            ViewBag.Conditions = _db.Conditions.ToList();

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


            //int _cultureID = 1;
            //int UserID = 1;
            //List<string> ImageNames = new List<string>();
            //if (User.Identity.IsAuthenticated)
            //{
            //    var res = _db.Users.SingleOrDefault(a => a.UserName == User.Identity.Name);
            //    if (res != null)
            //        UserID = res.UserID;
            //}
            //if (fileUpload[0] == null)
            //{
            //    _createPropertyViewModel.ImageName = "home-defualt.png";
            //    ImageNames.Add(_createPropertyViewModel.ImageName);
            //}
            //else
            //{
            //    _createPropertyViewModel.ImageName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fileUpload[0].FileName);
            //    fileUpload[0].SaveAs(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName);
            //    ImageResizer img = new ImageResizer();
            //    img.Resize(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName,
            //    Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/Thumb/") + _createPropertyViewModel.ImageName);
            //}
            //switch (System.Globalization.CultureInfo.CurrentCulture.Name)
            //{
            //    case "fa-IR":
            //        {
            //            _cultureID = 1;
            //            break;
            //        }

            //    case "en-US":
            //        {
            //            _cultureID = 2;
            //            break;
            //        }

            //}
            //if (_createPropertyViewModel.PropertyTypeID == 1)
            //{
            //    _createPropertyViewModel.RentPrice = 0;
            //    _createPropertyViewModel.MortgagePrice = 0;
            //}
            //else
            //{
            //    _createPropertyViewModel.HomePrice = 0;
            //}
            //HomeProperty _homeProperty = new HomeProperty()
            //{
            //    CreateDate = DateTime.Now,
            //    Title = _createPropertyViewModel.Title,
            //    CreateUserID = UserID,
            //    SubUsageID = _createPropertyViewModel.SubUsageID,
            //    StatusID = 1,
            //    RegionID = _createPropertyViewModel.rigionID,
            //    CultureID = _cultureID,
            //    PropertyTypeID = _createPropertyViewModel.PropertyTypeID,
            //    LocAge = _createPropertyViewModel.LocAge,
            //    LocArea = _createPropertyViewModel.LocArea,
            //    Description = _createPropertyViewModel.Description,
            //    HomePrice = _createPropertyViewModel.HomePrice,
            //    MortgagePrice = _createPropertyViewModel.MortgagePrice,
            //    RentPrice = _createPropertyViewModel.RentPrice,
            //    ImageName = _createPropertyViewModel.ImageName
            //};
            //if (ModelState.IsValid)
            //{
            //    _db.HomeProperties.Add(_homeProperty);
            //    _db.SaveChanges();

            //    if (fileUpload != null)
            //    {
            //        foreach (var item in fileUpload)
            //        {
            //            if (item != null && item.IsImage())
            //            {
            //                if (DeletedPhotp != null)
            //                {
            //                    if (DeletedPhotp.Contains(item.FileName))
            //                    {
            //                        continue;
            //                    }

            //                }
            //                _createPropertyViewModel.ImageName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(item.FileName);
            //                ImageNames.Add(_createPropertyViewModel.ImageName);
            //                item.SaveAs(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName);
            //                ImageResizer img = new ImageResizer();
            //                img.Resize(Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/") + _createPropertyViewModel.ImageName,
            //                Server.MapPath("/Areas/UserPanel/HomePropertyUploadImages/Thumb/") + _createPropertyViewModel.ImageName);

            //            }

            //        }
            //    }

            //    #region facility
            //    if (checkFacility!= null)
            //    {
            //        foreach (var item in checkFacility)
            //        {
            //            _db.HomeProperties_MetaData.Add(new HomeProperties_MetaData()
            //            {
            //                HomePropertyID = _homeProperty.HomePropertyID,
            //                FacilityID = item
            //            });
            //        }
            //    }
            //    #endregion

            //    #region condition
            //    if (checkCondition != null)
            //    {
            //        foreach (var item in checkCondition)
            //        {
            //            _db.HomeProperties_MetaData.Add(new HomeProperties_MetaData()
            //            {
            //                HomePropertyID = _homeProperty.HomePropertyID,
            //                ConditionID = item
            //            });
            //        }
            //    }
            //    #endregion

            //    #region ImageGallry
            //    if (ImageNames != null)
            //    {
            //        foreach (var item in ImageNames)
            //        {
            //            _db.HomeProperty_Galleries.Add(new HomeProperty_Galleries()
            //            {
            //                HomePropertyID = _homeProperty.HomePropertyID,
            //                ImageName = item
            //            });
            //        }
            //    }
            //    #endregion
            //    _db.SaveChanges();
            //    Session["InsertProperty"] = true;
            //    ModelState.Clear();
            //}
            //ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            //ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            //ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            //ViewBag.Facilities = _db.Facilities.ToList();
            //ViewBag.Conditions = _db.Conditions.ToList();

            return View();


        }

        public virtual ActionResult UploadAction()
        {
            return View();
        }

        [HttpPost]
        public JsonResult searchRigion(string searchText = "", int idCity = 0)
        {
            var _rigion = _db.Rigions.Where(a => a.CityID == idCity && a.RegionTitle.ToLower().Contains(searchText.ToLower())).Select(c => new { Name = c.RegionTitle, ID = c.RigionID }).Distinct().ToList();
            //if (_rigion != null)
            //{
            //    foreach (var item in _rigion)
            //    {
            //        ViewBag.valRegion = item.ID;

            //    }
            //}

            return Json(_rigion, JsonRequestBehavior.AllowGet);
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

        public ActionResult PropertyList(int? page)
        {
            Session["IsCreate"] = false;
            Session["IsList"] = true;
            int pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            int pageSiza = 6;
            if (User.Identity.IsAuthenticated)
            {
                var properties = _db.HomeProperties.Where(a => a.User.UserName == User.Identity.Name).ToList();

                return View(properties.ToPagedList(pageIndex, pageSiza));

            }
            else
                return RedirectToAction("Index", "Home", new { area = "" });
        }

        public JsonResult getTime(string dateTime)
        {
            var datetime = ReturnPastTime.calculatDate(Convert.ToDateTime(dateTime));
            return Json(datetime, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Edit(int? id)
        {
            Session["InsertProperty"] = false;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var homeProperty = _db.HomeProperties.Find(id);
            if (homeProperty == null)
            {
                return HttpNotFound();
            }
            CreatePropertyViewModel _createPropertyViewModel = new CreatePropertyViewModel()
            {
                CityID = homeProperty.Rigion.CityID,
                CountryID = homeProperty.Rigion.City.CountryID,
                Description = homeProperty.Description,
                HomePrice = homeProperty.HomePrice.ToString(),
                MortgagePrice = homeProperty.MortgagePrice.ToString(),
                PropertyTypeID = homeProperty.PropertyTypeID ?? 0,
                RentPrice = homeProperty.RentPrice.ToString(),
                ImageName = homeProperty.ImageName,
                rigionID = homeProperty.RegionID ?? 0,
                rigionTitle = homeProperty.Rigion.RegionTitle,
                LocAge = homeProperty.LocAge.ToString(),
                LocArea = homeProperty.LocArea.ToString(),
                SubUsageID = homeProperty.SubUsageID ?? 0,
                usageID = homeProperty.SubUsage.UsageID,
                Title = homeProperty.Title

            };

            ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            ViewBag.Facilities = _db.Facilities.ToList();
            ViewBag.Conditions = _db.Conditions.ToList();
            return View(_createPropertyViewModel);
        }

        [HttpPost]
        public ActionResult Edit(CreatePropertyViewModel _createPropertyViewModel, List<int> checkFacility, List<int> checkCondition, List<HttpPostedFileBase> fileUpload, List<string> DeletedPhotp)
        {
            return View(_createPropertyViewModel);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var homeProperty = _db.HomeProperties.Find(id);
            if (homeProperty == null)
            {
                return HttpNotFound();
            }
            return View(homeProperty);
        }

        [ActionName("Delete"), HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            List<HomeProperties_MetaData> homeProperties_MetaData = _db.HomeProperties_MetaData.Where(a => a.HomePropertyID == id).ToList();
            if (homeProperties_MetaData != null)
            {
                foreach (var item in homeProperties_MetaData)
                {
                    _db.HomeProperties_MetaData.Remove(item);
                }
            }

            List<HomeProperty_Galleries> homeProperty_Galleries = _db.HomeProperty_Galleries.Where(a => a.HomePropertyID == id).ToList();
            if (homeProperty_Galleries != null)
            {
                foreach (var item in homeProperty_Galleries)
                {
                    _db.HomeProperty_Galleries.Remove(item);
                }
            }

            HomeProperty homeProperty = _db.HomeProperties.Find(id);
            _db.HomeProperties.Remove(homeProperty);
            _db.SaveChanges();
            return RedirectToAction("PropertyList");

        }

        public ActionResult ShowChart(int id=20)
       {
            ViewBag.homePropertyID = id;
            return PartialView();
           
        }

        [HttpPost]
        public JsonResult getPropertyView(int id)
        {
            if (_db.PropertyViews.Any(a => a.HomePropertyID == id))
            {
                return Json(_db.PropertyViews.Where(a => a.HomePropertyID == id).OrderBy(a=>a.PropertyViewDate).Select(c=>new {c.StringDate, c.PropertyViewCount }).Take(5),JsonRequestBehavior.AllowGet);
            }
            else
             return Json(null);

        } 
        


    }
}