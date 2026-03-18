using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace StudentManagement
{
    public partial class WebForm3 : Page
    {
        private string FilePath => Server.MapPath("~/Data/Students.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null) Response.Redirect("Login.aspx");
            litUser.Text = Session["username"].ToString();

            string action = Request.QueryString["action"];
            string id = Request.QueryString["id"];

            if (!IsPostBack)
            {
                if (action == "delete" && !string.IsNullOrEmpty(id)) DeleteStudent(id);
                if (action == "edit" && !string.IsNullOrEmpty(id)) PrepareEdit(id);
                LoadData();
            }
        }

        private void LoadData()
        {
            if (!File.Exists(FilePath)) return;
            var lines = File.ReadAllLines(FilePath).Where(l => !string.IsNullOrWhiteSpace(l)).ToList();
            studentsTable.InnerHtml = "";

            foreach (var line in lines)
            {
                var p = line.Split('|');
                if (p.Length < 3) continue;

                studentsTable.InnerHtml += $@"
                <tr>
                    <td><span class='badge-no'>{p[0]}</span></td>
                    <td>{p[1]}</td>
                    <td>{p[2]}</td>
                    <td style='text-align:center;'>
                        <a href='Students.aspx?action=edit&id={p[0]}' class='btn-icon btn-edit' title='Redaktə et'><i class='fa-solid fa-pen-to-square'></i></a>
                        <a href='Students.aspx?action=delete&id={p[0]}' class='btn-icon btn-delete' title='Sil' onclick='return confirm(""{p[0]} nömrəli tələbə silinsin?"")'><i class='fa-solid fa-trash'></i></a>
                    </td>
                </tr>";
            }
        }

        protected void btn_save_ServerClick(object sender, EventArgs e)
        {
            string no = txtNo.Value.Trim();
            string ad = txtAd.Value.Trim();
            string soyad = txtSoyad.Value.Trim();

            if (string.IsNullOrEmpty(no) || string.IsNullOrEmpty(ad) || string.IsNullOrEmpty(soyad)) return;

            var lines = File.Exists(FilePath) ? File.ReadAllLines(FilePath).ToList() : new List<string>();

            bool found = false;
            for (int i = 0; i < lines.Count; i++)
            {
                if (lines[i].Split('|')[0] == no)
                {
                    lines[i] = $"{no}|{ad}|{soyad}";
                    found = true;
                    break;
                }
            }

            if (!found) lines.Add($"{no}|{ad}|{soyad}");

            File.WriteAllLines(FilePath, lines);
            Response.Redirect("Students.aspx");
        }

        private void DeleteStudent(string id)
        {
            if (!File.Exists(FilePath)) return;
            var lines = File.ReadAllLines(FilePath).Where(l => l.Split('|')[0] != id).ToList();
            File.WriteAllLines(FilePath, lines);
            Response.Redirect("Students.aspx");
        }

        private void PrepareEdit(string id)
        {
            var line = File.ReadAllLines(FilePath).FirstOrDefault(l => l.Split('|')[0] == id);
            if (line != null)
            {
                var p = line.Split('|');
                txtNo.Value = p[0];
                txtAd.Value = p[1];
                txtSoyad.Value = p[2];
                txtNo.Attributes.Add("readonly", "readonly"); // Redaktə zamanı ID dəyişilməsin
                txtNo.Style["background-color"] = "#f8f9fa";
            }
        }

        protected void btn_logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}