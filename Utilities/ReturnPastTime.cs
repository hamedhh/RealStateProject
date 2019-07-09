using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace Utilities
{
    public static class ReturnPastTime
    {
        public static string calculatDate(DateTime value)
        {
            CultureInfo.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
            var d = CultureInfo.CurrentCulture;
            var dv = value.ToString();
            DateTime dtNow = DateTime.Parse(dv, CultureInfo.CurrentCulture);

            TimeSpan dt = (dtNow - value);


            string Text = "در ";

            if (dt.Days > 0)
            {
                Text += dt.Days + "روز ، ";
            }
            if (dt.Hours > 0)
            {
                Text += dt.Hours + "ساعت ، ";
            }

            if (dt.Minutes > 0)
            {
                Text += dt.Minutes + "دقیقه  ";
            }
            Text += " قبل";
            return Text;
        }

        public static string TimeAgo(this DateTime? date)
        {

            var culture = CultureInfo.CurrentCulture;

            switch (culture.Name)
            {
                case "fa-IR":

                    PersianCalendar pc = new PersianCalendar();
                    int year = Convert.ToInt32(date.ToString().Split('/')[2].Substring(0,4));
                    int month = Convert.ToInt32(date.ToString().Split('/')[1]);
                    int day = Convert.ToInt32(date.ToString().Split('/')[0]);
                    var hour = Convert.ToInt32(date.ToString().Split('/')[2].Substring(4, 3).Trim());
                    var min = Convert.ToInt32(date.ToString().Split('/')[2].Substring(8, 2).Trim());
                    var second = Convert.ToInt32(date.ToString().Split('/')[2].Substring(11, 3).Trim());
                    DateTime dateIni = pc.ToDateTime(year,month,day, hour, min, second, 0); //new DateTime(year, month, day, new System.Globalization.PersianCalendar());
                    TimeSpan timeSince = DateTime.Now.Subtract(dateIni);
                    if (timeSince.TotalMilliseconds < 1) return "در لحظه";
                    if (timeSince.TotalMinutes < 1) return "چند لحظه پیش";
                    if (timeSince.TotalMinutes < 2) return "1 دقیقه پیش";
                    if (timeSince.TotalMinutes < 60) return string.Format("{0} دقیقه پیش", timeSince.Minutes);
                    if (timeSince.TotalMinutes < 120) return "1 ساعت پیش";
                    if (timeSince.TotalHours < 24) return string.Format("{0} ساعت پیش", timeSince.Hours);
                    if (timeSince.TotalDays < 2) return "دیروز";
                    if (timeSince.TotalDays < 7) return string.Format("{0} روز پیش", timeSince.Days);
                    if (timeSince.TotalDays < 14) return "هفته پیش";
                    if (timeSince.TotalDays < 21) return "2 هفته پیش";
                    if (timeSince.TotalDays < 28) return "3 هفته پیش";
                    if (timeSince.TotalDays < 60) return "ماه پیش";
                    if (timeSince.TotalDays < 365) return string.Format("{0} ماه پیش", Math.Round(timeSince.TotalDays / 30));
                    if (timeSince.TotalDays < 730) return "سال پیش"; //last but not least...
                    return string.Format("{0} سال پیش", Math.Round(timeSince.TotalDays / 365));

                case "en-US":
                    var dateEn = date ?? DateTime.Now;
                    TimeSpan timeSinceEN = DateTime.Now.Subtract(dateEn);
                    if (timeSinceEN.TotalMilliseconds < 1) return "not yet";
                    if (timeSinceEN.TotalMinutes < 1) return "just now";
                    if (timeSinceEN.TotalMinutes < 2) return "1 minute ago";
                    if (timeSinceEN.TotalMinutes < 60) return string.Format("{0} minutes ago", timeSinceEN.Minutes);
                    if (timeSinceEN.TotalMinutes < 120) return "1 hour ago";
                    if (timeSinceEN.TotalHours < 24) return string.Format("{0} hours ago", timeSinceEN.Hours);
                    if (timeSinceEN.TotalDays < 2) return "yesterday";
                    if (timeSinceEN.TotalDays < 7) return string.Format("{0} days ago", timeSinceEN.Days);
                    if (timeSinceEN.TotalDays < 14) return "last week";
                    if (timeSinceEN.TotalDays < 21) return "2 weeks ago";
                    if (timeSinceEN.TotalDays < 28) return "3 weeks ago";
                    if (timeSinceEN.TotalDays < 60) return "last month";
                    if (timeSinceEN.TotalDays < 365) return string.Format("{0} months ago", Math.Round(timeSinceEN.TotalDays / 30));
                    if (timeSinceEN.TotalDays < 730) return "last year"; //last but not least...
                    return string.Format("{0} years ago", Math.Round(timeSinceEN.TotalDays / 365));

                default:
                    var datedef = date ?? DateTime.Now;
                    TimeSpan timeSinceDef = DateTime.Now.Subtract(datedef);
                    if (timeSinceDef.TotalMilliseconds < 1) return "not yet";
                    if (timeSinceDef.TotalMinutes < 1) return "just now";
                    if (timeSinceDef.TotalMinutes < 2) return "1 minute ago";
                    if (timeSinceDef.TotalMinutes < 60) return string.Format("{0} minutes ago", timeSinceDef.Minutes);
                    if (timeSinceDef.TotalMinutes < 120) return "1 hour ago";
                    if (timeSinceDef.TotalHours < 24) return string.Format("{0} hours ago", timeSinceDef.Hours);
                    if (timeSinceDef.TotalDays < 2) return "yesterday";
                    if (timeSinceDef.TotalDays < 7) return string.Format("{0} days ago", timeSinceDef.Days);
                    if (timeSinceDef.TotalDays < 14) return "last week";
                    if (timeSinceDef.TotalDays < 21) return "2 weeks ago";
                    if (timeSinceDef.TotalDays < 28) return "3 weeks ago";
                    if (timeSinceDef.TotalDays < 60) return "last month";
                    if (timeSinceDef.TotalDays < 365) return string.Format("{0} months ago", Math.Round(timeSinceDef.TotalDays / 30));
                    if (timeSinceDef.TotalDays < 730) return "last year"; //last but not least...
                    return string.Format("{0} years ago", Math.Round(timeSinceDef.TotalDays / 365));

            }


        }


        public static DateTime SetTime(DateTime date)
        {

            var culture = CultureInfo.CurrentCulture;
            DateTime dateEn;
            DateTime dateIni;
            switch (culture.Name)
            {
                case "fa-IR":

                    PersianCalendar pc = new PersianCalendar();
                    int year = Convert.ToInt32(date.ToString().Split('/')[2].Substring(0,4));
                    int month = Convert.ToInt32(date.ToString().Split('/')[1]);
                    int day = Convert.ToInt32(date.ToString().Split('/')[0]);
                    return dateIni = pc.ToDateTime(year,month,day, 0, 0, 0, 0);


                case "en-US":
                    return dateEn = DateTime.Now;
                   
                    


                default:
                    return dateEn = DateTime.Now;


            }


        }


        public static DateTime SetTime(string date)
        {

            var culture = CultureInfo.CurrentCulture;
            DateTime dateEn;
            DateTime dateIni;
            switch (culture.Name)
            {
                case "fa-IR":

                    PersianCalendar pc = new PersianCalendar();
                    int year = Convert.ToInt32(date.ToString().Split('/')[2].Substring(0, 4));
                    int month = Convert.ToInt32(date.ToString().Split('/')[1]);
                    int day = Convert.ToInt32(date.ToString().Split('/')[0]);
                    return dateIni = pc.ToDateTime(year, month, day, 0, 0, 0, 0);


                case "en-US":
                    return dateEn = DateTime.Now;




                default:
                    return dateEn = DateTime.Now;


            }


        }



    }



}
