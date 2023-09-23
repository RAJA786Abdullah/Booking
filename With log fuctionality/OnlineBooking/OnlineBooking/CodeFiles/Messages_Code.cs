using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CMRS.CodeFiles
{
    public static class Messages_Code
    {
        public static void Info_msg(string Head, string message, HtmlGenericControl Control_ID)
        {
            string str = @"""";
            Control_ID.Attributes.Add("class", "alert alert-info alert-dismissible");
            Control_ID.InnerHtml = "<h4><i class=" + str + "icon fa fa-info" + str + "></i>"+ Head + "</h4>" +
                            "<span>" + message +
                            "</span>";
        }
        public static void Success_msg(string Head, string message, HtmlGenericControl Control_ID)
        {
            string str = @"""";
            Control_ID.Attributes.Add("class", "alert alert-success alert-dismissible");
            Control_ID.InnerHtml = "<h4><i class=" + str + "icon fa fa-check" + str + "></i>" + Head + "</h4>" +
                            "<span>" + message +
                            "</span>";
        }
        public static void Warning_msg(string Head, string message, HtmlGenericControl Control_ID)
        {
            string str = @"""";
            Control_ID.Attributes.Add("class", "alert alert-warning alert-dismissible");
            Control_ID.InnerHtml = "<h4><i class=" + str + "icon fa fa-warning" + str + "></i>" + Head + "</h4>" +
                            "<span>" + message +
                            "</span>";
        }
        public static void Error_msg(string Head, string message, HtmlGenericControl Control_ID)
        {
            string str = @"""";
            Control_ID.Attributes.Add("class", "alert alert-danger alert-dismissible");
            Control_ID.InnerHtml = "<h4><i class=" + str + "icon fa fa-ban" + str + "></i>" + Head + "</h4>" +
                            "<span>" + message +
                            "</span>";
        }
    }
    public static class ApplicationProcesses
    {
        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}