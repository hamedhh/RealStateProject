using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DataLayer.DB;
using DataLayer;

namespace RealStateProject.Controllers
{
    public partial class AccountController : Controller
    {
        RealState_DBEntities db = new RealState_DBEntities();
        // GET: Account
        public virtual ActionResult Register()
        {
            return PartialView();
        }
        [HttpPost]
        public virtual ActionResult Register(User _user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var findUser = db.Users.Where(a => a.UserName == _user.UserName.ToLower()).ToList();
                    if (findUser.Count>0)
                    {
                        ModelState.AddModelError("UserName", DataLayer.Resources.Resource_Main.RegisterError);
                        return View(_user);
                    }

                    if (!db.Users.Any(a => a.UserName == _user.UserName.ToLower()))
                    {

                        _user.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(_user.Password, "MD5");
                        _user.IsActive = true;
                        _user.RegisterDate = DateTime.Now;
                        _user.ActiveCode = Guid.NewGuid().ToString();
                        _user.UserName = _user.UserName.ToLower();
                        //var _cookieCulture = HttpContext.Request.Cookies["language"].Value;
                        switch (System.Globalization.CultureInfo.CurrentCulture.Name)
                        {
                            case "fa-IR":
                                {
                                    _user.CultureID = 1;
                                    break;
                                }

                            case "en-US":
                                {
                                    _user.CultureID = 2;
                                    break;
                                }

                        }
                        _user.RoleID = 1;

                        db.Users.Add(_user);
                        db.SaveChanges();
                        FormsAuthentication.SetAuthCookie(_user.UserName, true);
                    }
                    else
                    {
                        ModelState.AddModelError("UserName", DataLayer.Resources.Resource_Main.RegisterError);
                        return View(_user);
                    }
                }
                else
                    return View(_user);

                return Redirect("/");
                //return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {

                return new HttpStatusCodeResult(HttpStatusCode.NotFound);
            }

        }

        public virtual ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            return Redirect("/");
        }

        public virtual ActionResult Login()
        {
            return PartialView();
        }
        //RemmeberMe

        [HttpPost]
        public virtual ActionResult Login(DataLayer.ViewModels.LoginViewModel user, string ReturnUrl = "/")
        {
            bool remmeberMe = false;
            if (ModelState.IsValid)
            {
                //if (string.IsNullOrEmpty(RemmeberMe))
                //{
                //    if (RemmeberMe.Equals("on"))
                //        remmeberMe = true;
                //}
                var hashPass = FormsAuthentication.HashPasswordForStoringInConfigFile(user.Password, "MD5");
                var _user = db.Users.SingleOrDefault(a => a.UserName == user.UserName.ToLower() && a.Password == hashPass);
                if (_user == null)
                {
                    ModelState.AddModelError("UserName", DataLayer.Resources.Resource_Main.LoginUserError);
                    return View(user);
                }
                else
                {
                    FormsAuthentication.SetAuthCookie(_user.UserName, user.RememberMe);
                    return Redirect(ReturnUrl);
                }

            }
            return Redirect(ReturnUrl);
        }

    }
}