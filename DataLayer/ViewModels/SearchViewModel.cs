using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer.DB;
using System.ComponentModel.DataAnnotations;

namespace DataLayer.ViewModels
{
    public class DefualtSearchViewModel
    {
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [Display(Name = "مورد معامله")]
        public int propertyTypeID { get; set; }

        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [Display(Name = "کشور")]
        public int CountryID { get; set; }

        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [Display(Name = "نوع ملک")]
        public int usageID { get; set; }

        public int CityID { get; set; }

  


        public int RegionID { get; set; }
        [Required(ErrorMessage = "لطفا شهر را وارد کنید")]
        [Display(Name = "شهر")]
        public string regionTitle { get; set; }

        [Display(Name = "حداقل قیمت")]
        public string minPrice { get; set; }

        [Display(Name = "حداکتر قیمت")]
        public string maxPrice { get; set; }

        [Display(Name = "حداقل متراژ")]
        public string minArea { get; set; }

        [Display(Name = "حداکثر متراژ")]
        public string MaxArea { get; set; }

        [Display(Name = "حداقل کرایه")]
        public string minRent { get; set; }

        [Display(Name = "حداکثر کرایه")]
        public string maxRent { get; set; }




    }
}
