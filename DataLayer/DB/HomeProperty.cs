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
    
    [MetadataType(typeof(HomePropertyMetaData))]
    public partial class HomeProperty
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HomeProperty()
        {
            this.HomeProperties_MetaData = new HashSet<HomeProperties_MetaData>();
            this.HomeProperty_Galleries = new HashSet<HomeProperty_Galleries>();
        }
    
        public int HomePropertyID { get; set; }
        public int PropertyTypeID { get; set; }
        public int CultureID { get; set; }
        public int RegionID { get; set; }
        public int StatusID { get; set; }
        public int SubUsageID { get; set; }
        public int CreateUserID { get; set; }
        public Nullable<decimal> HomePrice { get; set; }
        public Nullable<decimal> MortgagePrice { get; set; }
        public Nullable<decimal> RentPrice { get; set; }
        public string LocLatitude { get; set; }
        public string LocLongitude { get; set; }
        public Nullable<int> LocArea { get; set; }
        public Nullable<int> LocAge { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageName { get; set; }
        public System.DateTime CreateDate { get; set; }
        public System.Data.Entity.Spatial.DbGeography GeoLocation { get; set; }
    
        public virtual Culture Culture { get; set; }
        public virtual User User { get; set; }
        public virtual HomeProperty_Status HomeProperty_Status { get; set; }
        public virtual HomeProperty_Type HomeProperty_Type { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HomeProperties_MetaData> HomeProperties_MetaData { get; set; }
        public virtual Rigion Rigion { get; set; }
        public virtual SubUsage SubUsage { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HomeProperty_Galleries> HomeProperty_Galleries { get; set; }
    }
}
