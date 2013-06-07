//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Training
    {
        public Training()
        {
            this.Statistics = new HashSet<Statistic>();
        }
    
        public System.Guid TrainingId { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<int> Shift { get; set; }
        public bool IsActive { get; set; }
    
        public virtual Program Program { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Statistic> Statistics { get; set; }
    }
}
