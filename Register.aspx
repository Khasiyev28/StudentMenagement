<%@ Page Title="Qeydiyyat" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StudentManagement.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .auth-wrapper { min-height: 80vh; display: flex; align-items: center; justify-content: center; background: #f4f7fe; padding: 20px; }
        .auth-card { background: white; padding: 40px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); width: 100%; max-width: 400px; text-align: center; }
        .form-group { position: relative; margin-bottom: 15px; text-align: left; }
        .form-group i { position: absolute; left: 15px; top: 50%; transform: translateY(-50%); color: #adb5bd; z-index: 10; }
        .form-control { width: 100%; padding: 12px 15px 12px 45px !important; border: 1.5px solid #e0e0e0; border-radius: 12px; box-sizing: border-box; }
        .btn-reg { background: #2ecc71; color: white; border: none; padding: 14px; border-radius: 12px; width: 100%; font-weight: 700; cursor: pointer; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2 style="margin-bottom:25px;">Yeni Hesab</h2>
            <div id="lblMsg" runat="server" style="color:red; display:none; margin-bottom:15px;"></div>
            
            <div class="form-group">
                <i class="fa-solid fa-user"></i>
                <input type="text" id="txt_username" runat="server" class="form-control" placeholder="İstifadəçi adı" />
            </div>

            <div class="form-group">
                <i class="fa-solid fa-envelope"></i>
                <input type="email" id="txt_email" runat="server" class="form-control" placeholder="E-poçt ünvanı" />
            </div>

            <div class="form-group">
                <i class="fa-solid fa-lock"></i>
                <input type="password" id="txt_password" runat="server" class="form-control" placeholder="Şifrə" />
            </div>

            <button id="btn_reg" runat="server" onserverclick="btn_reg_ServerClick" class="btn-reg">Qeydiyyatı Tamamla</button>
            <p style="margin-top:20px;"><a href="Login.aspx" style="text-decoration:none; color:#2ecc71; font-weight:bold;">Geri qayıt</a></p>
        </div>
    </div>
</asp:Content>