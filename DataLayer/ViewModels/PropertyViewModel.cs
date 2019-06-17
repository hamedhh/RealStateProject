﻿using System;
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
        public List<HomeProperty_Type>  PropertyTypeID { get; set; }

        [Display(Name = "کشور")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public List<Country> Country { get; set; }

        [Display(Name = "شهر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public List<City> city { get; set; }

        [Display(Name = "محله")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public List<Rigion> rigion { get; set; }


        [Display(Name = "نوع کاربری")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public List<Usage> usage { get; set; }

        [Display(Name = "زیر گروه کاربری")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public List<SubUsage> SubUsage { get; set; }

      
        [Display(Name = "قیمت")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public Nullable<decimal> HomePrice { get; set; }

        [Display(Name = "قیمت رهن")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public Nullable<decimal> MortgagePrice { get; set; }
        

        [Display(Name = "قیمت اجاره")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public Nullable<decimal> RentPrice { get; set; }


        [Display(Name = "متراژ")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public Nullable<int> LocArea { get; set; }

        [Display(Name = "سن بنا")]
        public Nullable<int> LocAge { get; set; }

        [Display(Name = "عنوان آگهی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string Title { get; set; }

        [Display(Name = "توضیحات")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

    }
}
