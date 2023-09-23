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
    
    public partial class customer_booking
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public customer_booking()
        {
            this.customer_booking_addl_ch = new HashSet<customer_booking_addl_ch>();
        }
    
        public int customer_booking_id { get; set; }
        public int Booking_no { get; set; }
        public int schedule_id { get; set; }
        public int customer_id { get; set; }
        public bool is_paid { get; set; }
        public bool is_reservation { get; set; }
        public bool is_confirmed { get; set; }
        public decimal total_amount { get; set; }
        public System.DateTime booking_date { get; set; }
        public System.DateTime created_date { get; set; }
        public int user_id { get; set; }
        public Nullable<int> update_by_id { get; set; }
        public Nullable<System.DateTime> update_date { get; set; }
        public Nullable<System.DateTime> transaction_date { get; set; }
    
        public virtual booking_schedule booking_schedule { get; set; }
        public virtual customer customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<customer_booking_addl_ch> customer_booking_addl_ch { get; set; }
        public virtual user user { get; set; }
    }
}
