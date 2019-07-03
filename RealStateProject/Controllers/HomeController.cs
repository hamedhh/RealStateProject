using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;
using DataLayer.ViewModels;
using PagedList;

namespace RealStateProject.Controllers
{
    public partial class HomeController : Controller
    {
        RealState_DBEntities _db = new RealState_DBEntities();

        public virtual ActionResult Index(int? page)
        {
            int pageSize = 6;
            int pageIndex = 1;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var homeproperty = _db.HomeProperties.ToList();
            return View(homeproperty.ToPagedList(pageIndex, pageSize));
        }

        [HttpPost]
        public virtual ActionResult Index(int? page, DefualtSearchViewModel _defualtSearchViewModel)
        {
            int pageIndex = 1;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            int pageSize = 6;
            int maxLocArea = 0;
            int minLocArea = 0;
            decimal minPrice = 0;
            decimal maxPrice = 0;
            decimal maxRent = 0;
            decimal minRent = 0;

            List<HomeProperty> homeProperty = new List<HomeProperty>();
            if (ModelState.IsValid)
            {
                //if (_defualtSearchViewModel.CityID > 0 && !string.IsNullOrEmpty(_defualtSearchViewModel.regionTitle))
                //    homeProperty.AddRange(_db.HomeProperties.Where(a => a.Rigion.CityID == _defualtSearchViewModel.CityID));
                //if (!string.IsNullOrEmpty(_defualtSearchViewModel.regionTitle) && _defualtSearchViewModel.RegionID > 0)
                //    homeProperty.AddRange(_db.HomeProperties.Where(a => a.RegionID == _defualtSearchViewModel.RegionID));
                //if (_defualtSearchViewModel.usageID > 0)
                //    homeProperty.AddRange(_db.HomeProperties.Where(a => a.SubUsage.UsageID == _defualtSearchViewModel.usageID));

                if (_defualtSearchViewModel.CityID > 0 && !string.IsNullOrEmpty(_defualtSearchViewModel.regionTitle)&&
                    !string.IsNullOrEmpty(_defualtSearchViewModel.regionTitle) && _defualtSearchViewModel.RegionID > 0 &&
                    _defualtSearchViewModel.usageID > 0 && _defualtSearchViewModel.propertyTypeID>0)
                {
                    homeProperty = _db.HomeProperties.Where(a => a.SubUsage.UsageID == _defualtSearchViewModel.usageID
                                              && a.RegionID == _defualtSearchViewModel.RegionID &&
                                               a.Rigion.CityID == _defualtSearchViewModel.CityID && a.PropertyTypeID==_defualtSearchViewModel.propertyTypeID).ToList();
                                            
                }



                homeProperty=homeProperty.Distinct().ToList();
                if (_defualtSearchViewModel.propertyTypeID == 3)
                {
                    //------------------------------------------------HomePrice--------------------------------------

                    if (!string.IsNullOrEmpty(_defualtSearchViewModel.minPrice))
                    {
                        if (_defualtSearchViewModel.minPrice.Contains(','))
                            minPrice = decimal.Parse(_defualtSearchViewModel.minPrice.Replace(",", ""));
                        else
                            minPrice = decimal.Parse(_defualtSearchViewModel.minPrice);
                        homeProperty=homeProperty.Where(a => a.HomePrice >= minPrice).ToList();
                    }
                    if (!string.IsNullOrEmpty(_defualtSearchViewModel.maxPrice))
                    {
                        if (_defualtSearchViewModel.maxPrice.Contains(','))
                            maxPrice = decimal.Parse(_defualtSearchViewModel.maxPrice.Replace(",", ""));
                        else
                            maxPrice = decimal.Parse(_defualtSearchViewModel.maxPrice);
                        homeProperty=homeProperty.Where(a => a.HomePrice <= maxPrice).ToList();
                    }

                }
                if (_defualtSearchViewModel.propertyTypeID == 2)
                {
                    //---------------------------------------Rent-----------------------------------------------

                    if (!string.IsNullOrEmpty(_defualtSearchViewModel.minPrice))
                    {
                        if (_defualtSearchViewModel.minPrice.Contains(','))
                            minPrice = decimal.Parse(_defualtSearchViewModel.minPrice.Replace(",", ""));
                        else
                            minPrice = decimal.Parse(_defualtSearchViewModel.minPrice);
                        homeProperty= homeProperty.Where(a => a.RentPrice >= minPrice).ToList();
                    }
                    if (!string.IsNullOrEmpty(_defualtSearchViewModel.maxPrice))
                    {
                        if (_defualtSearchViewModel.maxPrice.Contains(','))
                            maxPrice = decimal.Parse(_defualtSearchViewModel.maxPrice.Replace(",", ""));
                        else
                            maxPrice = decimal.Parse(_defualtSearchViewModel.maxPrice);
                        homeProperty=homeProperty.Where(a => a.RentPrice <= maxPrice).ToList();
                    }

                    //---------------------------------------Mortgage-----------------------------------------------

                    if (!string.IsNullOrEmpty(_defualtSearchViewModel.minRent))
                    {
                        if (_defualtSearchViewModel.minRent.Contains(','))
                            minRent = decimal.Parse(_defualtSearchViewModel.minRent.Replace(",", ""));
                        else
                            minRent = decimal.Parse(_defualtSearchViewModel.minRent);
                        homeProperty=homeProperty.Where(a => a.MortgagePrice >= minRent).ToList();
                    }
                    if (!string.IsNullOrEmpty(_defualtSearchViewModel.maxRent))
                    {
                        if (_defualtSearchViewModel.maxRent.Contains(','))
                            maxRent = decimal.Parse(_defualtSearchViewModel.maxRent.Replace(",", ""));
                        else
                            maxRent = decimal.Parse(_defualtSearchViewModel.maxRent);
                        homeProperty=homeProperty.Where(a => a.MortgagePrice <= maxPrice).ToList();
                    }

                }
            }
            else
            {
                homeProperty=homeProperty = _db.HomeProperties.ToList();
            }
            //------------------------------------------------Area--------------------------------------
            if (!string.IsNullOrEmpty(_defualtSearchViewModel.MaxArea))
            {
                if (_defualtSearchViewModel.MaxArea.Contains(','))
                    maxLocArea = int.Parse(_defualtSearchViewModel.MaxArea.Replace(",", ""));
                else
                    maxLocArea = int.Parse(_defualtSearchViewModel.MaxArea);
                homeProperty.Where(a => a.LocArea <= maxLocArea).ToList();
            }
            if (!string.IsNullOrEmpty(_defualtSearchViewModel.minArea))
            {
                if (_defualtSearchViewModel.minArea.Contains(','))
                    minLocArea = int.Parse(_defualtSearchViewModel.minArea.Replace(",", ""));
                else
                    minLocArea = int.Parse(_defualtSearchViewModel.minArea);
                homeProperty.Where(a => a.LocArea <= minLocArea).ToList();
            }

            return View(homeProperty.ToPagedList(pageIndex, pageSize));
        }


        public virtual ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public virtual ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}