<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentMenagement.Login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Giriş</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(120deg, #2980b9, #8e44ad); height: 100vh; display: flex; align-items: center; justify-content: center; }
        .login-card { background: white; padding: 30px; border-radius: 20px; width: 350px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card shadow text-center">
            <h2 class="mb-4 text-dark">Giriş</h2>
            <div class="mb-3 text-start">
                <asp:TextBox ID="txtLoginUser" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
            </div>
            <div class="mb-3 text-start">
                <asp:TextBox ID="txtLoginPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Şifrə"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Daxil Ol" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
            <asp:Label ID="lblLoginMsg" runat="server" CssClass="text-danger mt-2 d-block small"></asp:Label>
            <hr />
            <a href="Register.aspx" class="btn btn-outline-secondary btn-sm w-100">Yeni Hesab</a>
        </div>
    </form>
</body>
</html>