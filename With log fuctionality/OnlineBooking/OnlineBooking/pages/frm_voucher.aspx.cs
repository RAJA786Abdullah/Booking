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
            try
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


                var query2 = from cus_additional in db.customer_booking_addl_ch
                             join additional in db.Additional_ch_config on cus_additional.additional_ch_id equals additional.additional_ch_id
                             where cus_additional.customer_booking_id == id
                             select new
                             {
                                 additional.charges_title,
                                 additional.amount,
                             };

                var result2 = query2.ToList();

                var query3 = from bank in db.banks
                             where bank.status == true
                             select new
                             {
                                 bank.Account_title,
                                 bank.bank_name,
                                 bank.Account_no,

                             };

                var result3 = query3.ToList();


                rpt_voucher.LocalReport.DataSources.Clear();
                rpt_voucher.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", result));
                rpt_voucher.LocalReport.DataSources.Add(new ReportDataSource("DataSet2", result2));
                rpt_voucher.LocalReport.DataSources.Add(new ReportDataSource("DataSet3", result3));


                byte[] pdfBytes = rpt_voucher.LocalReport.Render("PDF");

                // Send the PDF to the client (for example, as a download)
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=Booking Voucher.pdf");
                Response.BinaryWrite(pdfBytes);
                Response.End();
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    // Show the modal with the error message
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{ex.InnerException.InnerException.Message}')", true);
                }
                catch (Exception)
                {
                    try
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{ex.InnerException.Message}')", true);
                    }
                    catch (Exception)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{ex.Message}')", true);
                    }
                }
            }

        }
    }
}