<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StudentMenagement.Register" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Qeydiyyat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; height: 100vh; display: flex; align-items: center; justify-content: center; }
        .card { border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 400px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card p-4">
            <h3 class="text-center mb-4">Yeni Hesab</h3>
            <div class="mb-3">
                <label>İstifadəçi adı</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>Şifrə</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Qeydiyyatı Tamamla" CssClass="btn btn-primary w-100" OnClick="btnRegister_Click" />
            <div class="mt-3 text-center">
                <asp:Label ID="lblMsg" runat="server" CssClass="text-danger small"></asp:Label><br />
                <a href="Login.aspx" class="small">Girişə qayıt</a>
            </div>
        </div>
    </form>
</body>
</html>