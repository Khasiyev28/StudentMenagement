<%@ Page Title="Students" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="StudentManagement.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --primary: #4361ee; --danger: #ef233c; --success: #2ecc71; --warning: #f39c12; }
        body { background-color: #f4f7fe; font-family: 'Inter', sans-serif; }
        .container { padding: 40px; max-width: 1100px; margin: 0 auto; }
        
        .header-card { 
            background: white; padding: 20px 30px; border-radius: 15px; 
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05); margin-bottom: 30px;
        }

        .action-card { 
            background: white; padding: 30px; border-radius: 15px; 
            box-shadow: 0 4px 20px rgba(0,0,0,0.05); margin-bottom: 30px;
        }

        .form-grid { display: grid; grid-template-columns: 1fr 2fr 2fr; gap: 15px; margin-bottom: 20px; }
        .form-control { 
            width: 100%; padding: 12px 15px; border: 1.5px solid #e0e0e0; 
            border-radius: 10px; font-size: 14px; transition: 0.3s;
        }
        .form-control:focus { border-color: var(--primary); outline: none; box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1); }

        .btn-save { 
            background: var(--primary); color: white; border: none; 
            padding: 12px 30px; border-radius: 10px; font-weight: 600; 
            cursor: pointer; width: 100%; transition: 0.3s;
        }
        .btn-save:hover { background: #3751d1; transform: translateY(-2px); }

        .table-card { background: white; border-radius: 15px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.05); }
        .table { width: 100%; border-collapse: collapse; }
        .table thead th { background: #f8f9fa; color: #8898aa; padding: 15px; text-align: left; font-size: 12px; text-transform: uppercase; letter-spacing: 1px; }
        .table tbody td { padding: 15px; border-top: 1px solid #f1f3f5; color: #32325d; font-size: 14px; }
        
        .btn-icon { 
            width: 35px; height: 35px; display: inline-flex; align-items: center; 
            justify-content: center; border-radius: 8px; color: white; 
            text-decoration: none; margin-right: 5px; transition: 0.2s;
        }
        .btn-edit { background: var(--warning); }
        .btn-delete { background: var(--danger); }
        .btn-icon:hover { opacity: 0.8; transform: scale(1.1); }
        
        .badge-no { background: #eef2ff; color: var(--primary); padding: 4px 8px; border-radius: 6px; font-weight: 700; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="header-card">
            <h3 style="margin:0; color:#2b2d42;"><i class="fa-solid fa-users-viewfinder me-2" style="color:var(--primary)"></i> Tələbə İdarəetmə Paneli</h3>
            <div style="display:flex; align-items:center; gap:15px;">
                <span>Xoş gəldiniz, <b style="color:var(--primary)"><asp:Literal ID="litUser" runat="server"></asp:Literal></b></span>
                <button runat="server" onserverclick="btn_logout_ServerClick" style="background:rgba(239, 35, 60, 0.1); color:var(--danger); border:none; padding:8px 15px; border-radius:8px; cursor:pointer; font-weight:600;">
                    <i class="fa-solid fa-right-from-bracket"></i> Çıxış
                </button>
            </div>
        </div>

        <div class="action-card">
            <h5 style="margin-top:0; margin-bottom:20px; color:#525f7f;">Yeni Məlumat / Redaktə</h5>
            <div class="form-grid">
                <div>
                    <label style="font-size:12px; font-weight:700; color:#8898aa; display:block; margin-bottom:5px;">Tələbə No</label>
                    <input type="number" id="txtNo" runat="server" class="form-control" placeholder="101" />
                </div>
                <div>
                    <label style="font-size:12px; font-weight:700; color:#8898aa; display:block; margin-bottom:5px;">Ad</label>
                    <input type="text" id="txtAd" runat="server" class="form-control" placeholder="Ad daxil edin" />
                </div>
                <div>
                    <label style="font-size:12px; font-weight:700; color:#8898aa; display:block; margin-bottom:5px;">Soyad</label>
                    <input type="text" id="txtSoyad" runat="server" class="form-control" placeholder="Soyad daxil edin" />
                </div>
            </div>
            <button runat="server" onserverclick="btn_save_ServerClick" class="btn-save">
                <i class="fa-solid fa-check-circle me-2"></i> Məlumatları Yadda Saxla
            </button>
        </div>

        <div class="table-card">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width:15%">Tələbə No</th>
                        <th style="width:30%">Ad</th>
                        <th style="width:30%">Soyad</th>
                        <th style="text-align:center;">Əməliyyatlar</th>
                    </tr>
                </thead>
                <tbody id="studentsTable" runat="server"></tbody>
            </table>
        </div>
    </div>
</asp:Content>