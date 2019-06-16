using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataLayer.DB;

namespace RealStateProject.Controllers
{
    public partial class UsersController : Controller
    {
        private RealState_DBEntities db = new RealState_DBEntities();

        // GET: Users
        public virtual ActionResult Index()
        {
            var users = db.Users.Include(u => u.Culture).Include(u => u.Role);
            return View(users.ToList());
        }

        // GET: Users/Details/5
        public virtual ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Users/Create
        public virtual ActionResult Create()
        {
            ViewBag.CultureID = new SelectList(db.Cultures, "CultureD", "CultureTitle");
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleTitle");
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public virtual ActionResult Create([Bind(Include = "UserID,RoleID,CultureID,UserName,Email,Password,ActiveCode,IsActive,RegisterDate")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CultureID = new SelectList(db.Cultures, "CultureD", "CultureTitle", user.CultureID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleTitle", user.RoleID);
            return View(user);
        }

        // GET: Users/Edit/5
        public virtual ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.CultureID = new SelectList(db.Cultures, "CultureD", "CultureTitle", user.CultureID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleTitle", user.RoleID);
            return View(user);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public virtual ActionResult Edit([Bind(Include = "UserID,RoleID,CultureID,UserName,Email,Password,ActiveCode,IsActive,RegisterDate")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CultureID = new SelectList(db.Cultures, "CultureD", "CultureTitle", user.CultureID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleTitle", user.RoleID);
            return View(user);
        }

        // GET: Users/Delete/5
        public virtual ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public virtual ActionResult DeleteConfirmed(int id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
