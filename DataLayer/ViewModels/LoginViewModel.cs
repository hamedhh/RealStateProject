using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.ViewModels
{
    public class LoginViewModel
    {
        [Display(Name = "UserName", ResourceType = typeof(Resources.Resource_User))]
        [Required(ErrorMessageResourceType = typeof(Resources.Resource_User), ErrorMessageResourceName = "RequiredUserName")]
        public string UserName { get; set; }

        //[EmailAddress(ErrorMessageResourceType = typeof(Resources.Resource_Main), ErrorMessageResourceName = "EmailFormat")]
        //[Display(Name = "Email", ResourceType = typeof(Resources.Resource_User))]
        //[Required(ErrorMessageResourceType = typeof(Resources.Resource_User), ErrorMessageResourceName = "RequiredUserEmail")]
        //public string Email { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Password", ResourceType = typeof(Resources.Resource_User))]
        [Required(ErrorMessageResourceType = typeof(Resources.Resource_User), ErrorMessageResourceName = "RequiredUserPassword")]
        public string Password { get; set; }


        [Display(Name = "RemmberMe",ResourceType =typeof(Resources.Resource_Main))]
        public bool RememberMe { get; set; }
    }
}
