using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages
{
    public partial class frm_week_day : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            BindDayData();
        }

        //Day of week databind method start here 
        private void BindDayData()
        {

            try
            {

                //tbldays.Rows.Clear();
                for (int i = tbldays.Rows.Count - 1; i > 0; i--)
                {
                    tbldays.Rows.RemoveAt(i);
                }
                using (var db = new OB_entities())
                {

                    var week = db.week_days.ToList();


                    var uniqueTitles = new HashSet<string>();


                    foreach (var days in week)
                    {

                        string normalizedTitle = days.day.Trim().ToLower();


                        if (!uniqueTitles.Contains(normalizedTitle))
                        {
                            uniqueTitles.Add(normalizedTitle);
                            TableRow row = new TableRow();
                            TableCell cellTitle = new TableCell();
                            TableCell cellStatus = new TableCell();
                           
                            cellTitle.Text = days.day.ToString();
                            cellStatus.Text = days.day_status.ToString();
                          
                            
                            row.Cells.Add(cellTitle);
                            row.Cells.Add(cellStatus);
                          
                            tbldays.Rows.Add(row);

                        }

                    }

                }
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
        //Day of week databind method end here
    }
}