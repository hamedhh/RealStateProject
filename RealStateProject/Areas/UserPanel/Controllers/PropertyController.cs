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
            ViewBag.CountryID = new SelectList(_db.Countries, "CountryID", "CountryTitle");
            ViewBag.PropertyTypeID = new SelectList(_db.HomeProperty_Type, "PropertyTypeID", "Title");
            ViewBag.usageID = new SelectList(_db.Usages, "UsageID", "UsageTitle");
            ViewBag.Facilities = _db.Facilities.ToList();
            ViewBag.Conditions = _db.Conditions.ToList();
            return View();
        }

        [HttpPost]
        public virtual ActionResult Create(CreatePropertyViewModel _createPropertyViewModel, List<int> checkFacility, List<int> checkCondition, List<HttpPostedFileBase> fileUpload, List<string> DeletedPhotp)
        {
            decimal homeprice = 0;
            decimal rentPrice = 0;
            decimal mortgagePrice = 0;
            int locArea = 0;

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
                StatusID = 1,
                RegionID = _createPropertyViewModel.rigionID,
                CultureID = _cultureID,
                PropertyTypeID = _createPropertyViewModel.PropertyTypeID,
                LocAge = _createPropertyViewModel.LocAge,
                LocArea = locArea,
                Description = _createPropertyViewModel.Description,
                HomePrice = homeprice,
                MortgagePrice = mortgagePrice,
                RentPrice = rentPrice,
                ImageName = _createPropertyViewModel.ImageName
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

        
        public JsonResult searchRigion(string Areas, string sreachText = "")
        {
            var _rigion = _db.Rigions.Where(a => a.RegionTitle.ToLower().Contains(sreachText.ToLower())).Select(c => new { ID = c.RigionID, Name = c.RegionCode }).Distinct().ToList();
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
    }
}