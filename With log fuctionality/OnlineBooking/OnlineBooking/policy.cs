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
    
    public partial class policy
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public policy()
        {
            this.Additional_ch_config = new HashSet<Additional_ch_config>();
            this.booking_schedule = new HashSet<booking_schedule>();
        }
    
        public int policy_id { get; set; }
        public string policy_title { get; set; }
        public string policy_year { get; set; }
        public Nullable<bool> policy_status { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Additional_ch_config> Additional_ch_config { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<booking_schedule> booking_schedule { get; set; }
    }
}
