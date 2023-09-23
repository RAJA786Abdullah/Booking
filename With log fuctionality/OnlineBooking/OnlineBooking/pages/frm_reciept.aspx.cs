using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.Reporting
{
    public partial class frm_reciept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            int id = Convert.ToInt32(Session["PASSID"]);
            if (id!=0)
            {
                this.rpt_reciept.LocalReport.Refresh();

                var db = new OB_entities(); // Create an instance of your Entity Framework context
                var query = from cb in db.customer_booking
                            join c in db.customers on cb.customer_id equals c.customer_id
                            join ts in db.booking_schedule on cb.schedule_id equals ts.schedule_id
                            join tc in db.team_category on ts.team_category_id equals tc.team_category_id
                            join s in db.shifts on ts.shift_id equals s.shift_id
                            join bt in db.booking_type on ts.booking_type_id equals bt.booking_type_id
                            join v in db.vanues on bt.vanue_id equals v.vanue_id
                            join wd in db.week_days on ts.day_id equals wd.day_id
                            join usr in db.users on cb.update_by_id equals usr.user_id
                            where cb.customer_booking_id == id
                            select new
                            {
                                cb.Booking_no,
                                c.cnic,
                                c.name,
                                wd.day,
                                bt.booking_type1,
                                v.vanue_title,
                                s.shift_title,
                                time_slot = s.time_from + " - " + s.time_to,
                                cb.customer_booking_id,
                                cb.total_amount,
                                c.mobile_no,
                                tc.team_title,
                                cb.booking_date,
                                cb.update_date,
                                usr.Emp_Name
                            };

                // Execute the query
                var result = query.ToList();
                rpt_reciept.LocalReport.DataSources.Clear();
                rpt_reciept.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", result));
                byte[] pdfBytes = rpt_reciept.LocalReport.Render("PDF");

                // Send the PDF to the client (for example, as a download)
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=Booking Reciept.pdf");
                Response.BinaryWrite(pdfBytes);
                Response.End();
            }     
 
        }
    }
}