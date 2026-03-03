using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using StudentMenagement.Models;

namespace StudentMenagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/App_Data/users.json");
            var users = JsonConvert.DeserializeObject<List<User>>(File.ReadAllText(path)) ?? new List<User>();
            var user = users.FirstOrDefault(u => u.Username == txtLoginUser.Text && u.Password == txtLoginPass.Text);

            if (user != null)
            {
                Session["User"] = user.Username;
                HttpCookie cookie = new HttpCookie("UserLogin", user.Username);
                cookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(cookie);
                Response.Redirect("Students.aspx");
            }
            else
            {
                lblLoginMsg.Text = "Username və ya şifrə səhvdir!";
            }
        }
    }
}