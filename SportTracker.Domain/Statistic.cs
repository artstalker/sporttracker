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
    
    public partial class Statistic
    {
        public System.Guid StatisticId { get; set; }
        public short SetNumber { get; set; }
        public short RepsCount { get; set; }
        public double Weight { get; set; }
        public string Note { get; set; }
        public System.DateTime DateTime { get; set; }
    
        public virtual Excercise Excercise { get; set; }
        public virtual Training Training { get; set; }
    }
}
