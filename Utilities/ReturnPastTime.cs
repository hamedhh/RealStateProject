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
    }
}
