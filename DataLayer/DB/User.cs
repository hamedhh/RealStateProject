//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer.DB
{
    using System.ComponentModel.DataAnnotations;
    using System;
    using System.Collections.Generic;
    
    [MetadataType(typeof(UserMetaData))]
    public partial class User
    {
        public int UserID { get; set; }
        public int RoleID { get; set; }
        public int CultureID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ActiveCode { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> RegisterDate { get; set; }
    
        public virtual Culture Culture { get; set; }
        public virtual Role Role { get; set; }
    }
}
