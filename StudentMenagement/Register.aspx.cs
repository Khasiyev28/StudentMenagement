using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Newtonsoft.Json;
using StudentMenagement.Models;

namespace StudentMenagement
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/App_Data/users.json");
            var users = JsonConvert.DeserializeObject<List<User>>(File.ReadAllText(path)) ?? new List<User>();

            if (users.Any(u => u.Username == txtUsername.Text))
            {
                lblMsg.Text = "Bu username artıq mövcuddur!";
                return;
            }

            users.Add(new User { Username = txtUsername.Text, Password = txtPassword.Text, Email = txtEmail.Text });
            File.WriteAllText(path, JsonConvert.SerializeObject(users, Formatting.Indented));
            Response.Redirect("Login.aspx");
        }
    }
}