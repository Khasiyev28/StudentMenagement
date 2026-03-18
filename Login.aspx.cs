using System;
using System.IO;
using System.Web.UI;

namespace StudentManagement
{
    public partial class WebForm2 : Page
    {
        protected void btn_login_ServerClick(object sender, EventArgs e)
        {
            string user = txt_username.Value.Trim().ToLower();
            string pass = txt_password.Value.Trim();

            string path = Server.MapPath("~/Data/Users.txt");
            if (File.Exists(path))
            {
                var lines = File.ReadAllLines(path);
                foreach (var line in lines)
                {
                    var p = line.Split('|');
                    if (p.Length >= 2 && p[0].ToLower() == user && p[1] == pass)
                    {
                        Session["username"] = user;
                        Response.Redirect("Students.aspx");
                        return;
                    }
                }
            }
            lblMsg.InnerText = "İstifadəçi adı və ya şifrə yanlışdır!";
            lblMsg.Style["display"] = "block";
        }
    }
}