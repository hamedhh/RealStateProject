﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer.DB
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RealState_DBEntities : DbContext
    {
        public RealState_DBEntities()
            : base("name=RealState_DBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Condition> Conditions { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Culture> Cultures { get; set; }
        public virtual DbSet<Facility> Facilities { get; set; }
        public virtual DbSet<HomeProperty> HomeProperties { get; set; }
        public virtual DbSet<HomeProperties_MetaData> HomeProperties_MetaData { get; set; }
        public virtual DbSet<HomeProperty_Galleries> HomeProperty_Galleries { get; set; }
        public virtual DbSet<HomeProperty_Status> HomeProperty_Status { get; set; }
        public virtual DbSet<HomeProperty_Type> HomeProperty_Type { get; set; }
        public virtual DbSet<Rigion> Rigions { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<SubUsage> SubUsages { get; set; }
        public virtual DbSet<Usage> Usages { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}
