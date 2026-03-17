using System;
using System.IO;
using System.Web.UI;

namespace StudentManagement
{
    public partial class WebForm1 : Page
    {
        protected void btn_reg_ServerClick(object sender, EventArgs e)
        {
            string user = txt_username.Value.Trim();
            string email = txt_email.Value.Trim();
            string pass = txt_password.Value.Trim();

            if (user == "" || email == "" || pass == "")
            {
                lblMsg.InnerText = "Xanaları boş buraxmayın!";
                lblMsg.Style["display"] = "block";
                return;
            }

            string dir = Server.MapPath("~/Data/");
            if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);

            string path = dir + "Users.txt";
            File.AppendAllText(path, $"{user}|{pass}|{email}{Environment.NewLine}");

            Response.Redirect("Login.aspx");
        }
    }
}