using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.IO;

namespace OnlineBooking.pages
{
    public partial class frm_voucher : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            int id = Convert.ToInt32(Session["CBID"]);
            this.rpt_voucher.LocalReport.Refresh();
            var db = new OB_entities(); // Create an instance of your Entity Framework context
            var query = from booking in db.customer_booking
                        join customer in db.customers
                        on booking.customer_id equals customer.customer_id
                        where booking.customer_booking_id == id
                        select new
                        {
                            booking.Booking_no,
                            booking.total_amount,
                            customer.mobile_no,
                            customer.cnic,
                            customer.name,
                            booking.created_date,
                            booking.customer_booking_id
                        };

            var result = query.ToList();
            rpt_voucher.LocalReport.DataSources.Clear();
            rpt_voucher.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", result));
            byte[] pdfBytes = rpt_voucher.LocalReport.Render("PDF");

            // Send the PDF to the client (for example, as a download)
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename=Booking Voucher.pdf");
            Response.BinaryWrite(pdfBytes);
            Response.End(); 
        }
    }
}