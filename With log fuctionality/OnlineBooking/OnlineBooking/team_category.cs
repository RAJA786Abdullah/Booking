//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineBooking
{
    using System;
    using System.Collections.Generic;
    
    public partial class team_category
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public team_category()
        {
            this.booking_schedule = new HashSet<booking_schedule>();
        }
    
        public int team_category_id { get; set; }
        public string team_title { get; set; }
        public Nullable<bool> team_status { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<booking_schedule> booking_schedule { get; set; }
    }
}
