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
    
    public partial class Muscle
    {
        public Muscle()
        {
            this.Excercises = new HashSet<Excercise>();
        }
    
        public System.Guid MuscleId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
    
        public virtual ICollection<Excercise> Excercises { get; set; }
    }
}
