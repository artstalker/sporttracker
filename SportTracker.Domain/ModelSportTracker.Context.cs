﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SportTracker.Domain
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ModelSportTrackerContainer : DbContext
    {
        public ModelSportTrackerContainer()
            : base("name=ModelSportTrackerContainer")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Muscle> Muscles { get; set; }
        public DbSet<Excercise> Excercises { get; set; }
        public DbSet<ProgramExcercise> ProgramExcercises { get; set; }
        public DbSet<Statistic> Statistics { get; set; }
        public DbSet<Training> Trainings { get; set; }
        public DbSet<BodyStamp> BodyStamps { get; set; }
        public DbSet<Tweet> Tweets { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Program> Programs { get; set; }
        public DbSet<Membership> Memberships { get; set; }
        public DbSet<OAuthMembership> OAuthMemberships { get; set; }
        public DbSet<Config> Configs { get; set; }
        public DbSet<Role> Roles { get; set; }
    }
}
