<%@ Page Title="Giriş" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentManagement.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .auth-wrapper { min-height: 80vh; display: flex; align-items: center; justify-content: center; background: #f4f7fe; padding: 20px; }
        .auth-card { background: white; padding: 40px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); width: 100%; max-width: 400px; text-align: center; }
        .form-group { position: relative; margin-bottom: 20px; text-align: left; }
        
        /* İkonun yerləşməsi */
        .form-group i { 
            position: absolute; left: 15px; top: 50%; transform: translateY(-50%); 
            color: #adb5bd; z-index: 10; font-size: 18px;
        }

        /* Mətnin ikona dəyməməsi üçün sol boşluq */
        .form-control { 
            width: 100%; padding: 12px 15px 12px 45px !important; 
            border: 1.5px solid #e0e0e0; border-radius: 12px; box-sizing: border-box;
            font-size: 15px; transition: 0.3s;
        }
        .form-control:focus { border-color: #4361ee; outline: none; box-shadow: 0 0 0 4px rgba(67, 97, 238, 0.1); }
        
        .btn-auth { background: #4361ee; color: white; border: none; padding: 14px; border-radius: 12px; width: 100%; font-weight: 700; cursor: pointer; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auth-wrapper">
        <div class="auth-card">
            <h2 style="margin-bottom:25px;">Sistemə Giriş</h2>
            <div id="lblMsg" runat="server" style="color:red; margin-bottom:15px; display:none; font-size:13px;"></div>
            
            <div class="form-group">
                <i class="fa-solid fa-user"></i>
                <input type="text" id="txt_username" runat="server" class="form-control" placeholder="İstifadəçi adı" />
            </div>

            <div class="form-group">
                <i class="fa-solid fa-lock"></i>
                <input type="password" id="txt_password" runat="server" class="form-control" placeholder="Şifrə" />
            </div>

            <button id="btn_login" runat="server" onserverclick="btn_login_ServerClick" class="btn-auth">Daxil Ol</button>
            <p style="margin-top:20px;">Hesabınız yoxdur? <a href="Register.aspx" style="text-decoration:none; color:#4361ee; font-weight:bold;">Qeydiyyatdan keçin</a></p>
        </div>
    </div>
</asp:Content>