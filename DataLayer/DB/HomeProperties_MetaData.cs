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
    
    [MetadataType(typeof(HomeProperties_MetaDataMetaData))]
    public partial class HomeProperties_MetaData
    {
        public int MetaID { get; set; }
        public int HomePropertyID { get; set; }
        public Nullable<int> FacilityID { get; set; }
        public Nullable<int> ConditionID { get; set; }
    
        public virtual Condition Condition { get; set; }
        public virtual Facility Facility { get; set; }
        public virtual HomeProperty HomeProperty { get; set; }
    }
}
