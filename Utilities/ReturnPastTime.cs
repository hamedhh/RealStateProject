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

        public static string TimeAgo(this DateTime date)
        {
            TimeSpan timeSince = DateTime.Now.Subtract(date);
            if (timeSince.TotalMilliseconds < 1) return "not yet";
            if (timeSince.TotalMinutes < 1) return "just now";
            if (timeSince.TotalMinutes < 2) return "1 minute ago";
            if (timeSince.TotalMinutes < 60) return string.Format("{0} minutes ago", timeSince.Minutes);
            if (timeSince.TotalMinutes < 120) return "1 hour ago";
            if (timeSince.TotalHours < 24) return string.Format("{0} hours ago", timeSince.Hours);
            if (timeSince.TotalDays < 2) return "yesterday";
            if (timeSince.TotalDays < 7) return string.Format("{0} days ago", timeSince.Days);
            if (timeSince.TotalDays < 14) return "last week";
            if (timeSince.TotalDays < 21) return "2 weeks ago";
            if (timeSince.TotalDays < 28) return "3 weeks ago";
            if (timeSince.TotalDays < 60) return "last month";
            if (timeSince.TotalDays < 365) return string.Format("{0} months ago", Math.Round(timeSince.TotalDays / 30));
            if (timeSince.TotalDays < 730) return "last year"; //last but not least...
            return string.Format("{0} years ago", Math.Round(timeSince.TotalDays / 365));
        }
    }
}
