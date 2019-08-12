using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using DataLayer.DB;

namespace DataLayer.ViewModels
{
    public class CreatePropertyViewModel
    {

        [Display(Name = "نوع آگهی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int PropertyTypeID { get; set; }

        [Display(Name = "کشور")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int CountryID { get; set; }


        [Display(Name = "شهر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int CityID { get; set; }


  //[Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int rigionID { get; set; }


        [Display(Name = "محله")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string rigionTitle { get; set; }

        [Display(Name = "نوع کاربری")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int usageID { get; set; }

        [Display(Name = "زیر گروه کاربری")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int SubUsageID { get; set; }


        [Display(Name = "قیمت")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        //[DisplayFormat(DataFormatString = "{0:c}", ApplyFormatInEditMode = true)]
        public string HomePrice { get; set; }

        [Display(Name = "قیمت رهن")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DisplayFormat(DataFormatString = "{0:n0}")]
        public string MortgagePrice { get; set; }


        [Display(Name = "قیمت اجاره")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        //[RegularExpression(@"^[0-9]+(\.[0-9]{1,2})$", ErrorMessage = "Valid Decimal number with maximum 2 decimal places.")]
        public string RentPrice { get; set; }


        [Display(Name = "متراژ")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string LocArea { get; set; }

        [Display(Name = "سن بنا")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string LocAge { get; set; }

        [Display(Name = "عنوان آگهی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string Title { get; set; }

        [Display(Name = "توضیحات")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [Display(Name ="شماره تماس")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string PhoneNum { get; set; }

        public string latlongMap { get; set; }

        public string FilesToBeUploaded { get; set; }
        public string ImageName { get; set; }

        public string LocLatitude { get; set; }
        public string LocLongitude { get; set; }

        public int homePropertyId { get; set; }

    }
}
