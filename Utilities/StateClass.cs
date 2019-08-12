using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using DataLayer.DB;
using DataLayer.ViewModels;

namespace Utilities
{
    public class StateClass
    {
        static void CountUpState()
        {
            try
            {
                using (RealState_DBEntities db = new RealState_DBEntities())
                {
                    DateTime dt = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                    var state = db.StateSites.FirstOrDefault(f => f.StateSiteDate == dt);
                    if (state != null)
                    {
                        state.StateSiteCount += 1;
                    }
                    else
                    {
                        db.StateSites.Add(new StateSite()
                        {
                            StateSiteDate = dt,
                            StateSiteCount = 1
                        });
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception)
            {

                
            }

        }

        public static void CounterState()
        {
            try
            {
                DateTime dt = ReturnPastTime.SetTime(DateTime.Now);
                if (HttpContext.Current.Request.Cookies["StateSite"] != null)
                {
                    if (ReturnPastTime.SetTime(HttpContext.Current.Request.Cookies["StateSite"].Value.ToString()) != dt)
                    {
                        HttpCookie cookieCode = new HttpCookie("StateSite", dt.ToString());
                        HttpContext.Current.Response.Cookies.Add(cookieCode);
                        CountUpState();
                    }
                }
                else
                {
                    CountUpState();
                    HttpCookie cookie = new HttpCookie("StateSite");
                    cookie.Value = dt.ToString();
                    HttpContext.Current.Response.Cookies.Add(cookie);
                }
            }
            catch (Exception)
            {

               
            }

        }


        public static ShowStateViewModel ShowState()
        {
            try
            {
                using (RealState_DBEntities db = new RealState_DBEntities())
                {
                    DateTime dt = ReturnPastTime.SetTime(DateTime.Now);
                    DateTime dt2 = dt.AddDays(-1);
                    return new ShowStateViewModel()
                    {
                        OnlineUser = (int)HttpContext.Current.Application["OnlineUser"],
                        SeeSum = db.StateSites.Sum(s => s.StateSiteCount) ,
                        SeeToday = db.StateSites.First(s => s.StateSiteDate == dt).StateSiteCount ,
                        SeeYesterday = db.StateSites.Where(s => s.StateSiteDate == dt2).Select(s => s.StateSiteCount).FirstOrDefault()
                    };
                }
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}
