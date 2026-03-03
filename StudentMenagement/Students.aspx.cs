using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using StudentMenagement.Models;

namespace StudentMenagement
{
    public partial class Students : System.Web.UI.Page
    {
        string userFilePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string currentUser = Session["User"].ToString();
                lblUser.Text = currentUser;
                userFilePath = Server.MapPath($"~/App_Data/students_{currentUser}.json");

                if (!File.Exists(userFilePath))
                {
                    File.WriteAllText(userFilePath, "[]");
                }
            }

            if (!IsPostBack) BindGrid();
        }

        void BindGrid()
        {
            var data = File.ReadAllText(userFilePath);
            gvStudents.DataSource = JsonConvert.DeserializeObject<List<Student>>(data) ?? new List<Student>();
            gvStudents.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var list = GetList();
            if (list.Any(s => s.StudentNumber == sNo.Text))
            {
                Response.Write("<script>alert('Bu nömrəli tələbə artıq siyahınızda var!');</script>");
                return;
            }

            list.Add(new Student { StudentNumber = sNo.Text, Name = sName.Text, Surname = sSurname.Text });
            SaveList(list);
            sNo.Text = ""; sName.Text = ""; sSurname.Text = "";
            BindGrid();
        }

        protected void gvStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvStudents.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvStudents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvStudents.EditIndex = -1;
            BindGrid();
        }

        protected void gvStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string no = gvStudents.DataKeys[e.RowIndex].Value.ToString();
            string newName = ((TextBox)gvStudents.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string newSurname = ((TextBox)gvStudents.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            var list = GetList();
            var student = list.FirstOrDefault(s => s.StudentNumber == no);
            if (student != null)
            {
                student.Name = newName;
                student.Surname = newSurname;
                SaveList(list);
            }
            gvStudents.EditIndex = -1;
            BindGrid();
        }

        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var list = GetList();
            list.RemoveAt(e.RowIndex);
            SaveList(list);
            BindGrid();
        }

        private List<Student> GetList()
        {
            return JsonConvert.DeserializeObject<List<Student>>(File.ReadAllText(userFilePath)) ?? new List<Student>();
        }

        private void SaveList(List<Student> list)
        {
            File.WriteAllText(userFilePath, JsonConvert.SerializeObject(list, Formatting.Indented));
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}