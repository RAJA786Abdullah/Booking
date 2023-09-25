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
    
    public partial class booking_schedule
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public booking_schedule()
        {
            this.customer_booking = new HashSet<customer_booking>();
        }
    
        public int schedule_id { get; set; }
        public Nullable<int> policy_id { get; set; }
        public Nullable<int> booking_type_id { get; set; }
        public Nullable<int> shift_id { get; set; }
        public Nullable<int> day_id { get; set; }
        public Nullable<decimal> charges_amount { get; set; }
        public Nullable<bool> schedule_status { get; set; }
        public Nullable<System.DateTime> created_date { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<int> team_category_id { get; set; }
    
        public virtual booking_type booking_type { get; set; }
        public virtual policy policy { get; set; }
        public virtual shift shift { get; set; }
        public virtual team_category team_category { get; set; }
        public virtual week_days week_days { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<customer_booking> customer_booking { get; set; }
    }
}