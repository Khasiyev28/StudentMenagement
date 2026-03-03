<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="StudentMenagement.Students" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Tələbə Paneli</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .sidebar { background: #2c3e50; color: white; min-height: 100vh; padding: 20px; position: fixed; width: 220px; }
        .content { margin-left: 240px; padding: 30px; background: #f4f7f6; min-height: 100vh; }
        .card { border: none; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .error-text { font-size: 11px; color: red; display: block; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar text-center">
            <h4>Admin Panel</h4>
            <hr />
            <p>İstifadəçi:<br /><strong><asp:Label ID="lblUser" runat="server"></asp:Label></strong></p>
            <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn btn-danger btn-sm w-100 mt-5" OnClick="btnLogout_Click" CausesValidation="false">Çıxış</asp:LinkButton>
        </div>

        <div class="content">
            <h2 class="mb-4 text-dark">Tələbə İdarəetmə Sistemi</h2>
            
            <div class="card p-4 mb-4 text-center">
                <h5 class="text-primary mb-3 text-start">Tələbə Siyahısı</h5>
                <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-hover bg-white" GridLines="None" 
                    OnRowDeleting="gvStudents_RowDeleting" 
                    OnRowEditing="gvStudents_RowEditing" 
                    OnRowUpdating="gvStudents_RowUpdating" 
                    OnRowCancelingEdit="gvStudents_RowCancelingEdit" DataKeyNames="StudentNumber">
                    <Columns>
                        <asp:BoundField DataField="StudentNumber" HeaderText="No" ReadOnly="true" />
                        <asp:BoundField DataField="Name" HeaderText="Ad" />
                        <asp:BoundField DataField="Surname" HeaderText="Soyad" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" 
                            EditText="Düzəliş" DeleteText="Sil" UpdateText="Yadda saxla" CancelText="İmtina"
                            ControlStyle-CssClass="btn btn-sm btn-link text-decoration-none" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card p-4">
                <h5 class="text-success mb-3">Yeni Tələbə Əlavə Et</h5>
                <div class="row g-3">
                    <div class="col-md-3 text-start">
                        <asp:TextBox ID="sNo" runat="server" CssClass="form-control" placeholder="No"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="sNo" ErrorMessage="Nömrə mütləqdir!" CssClass="error-text" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4 text-start">
                        <asp:TextBox ID="sName" runat="server" CssClass="form-control" placeholder="Ad"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="sName" ErrorMessage="Ad mütləqdir!" CssClass="error-text" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4 text-start">
                        <asp:TextBox ID="sSurname" runat="server" CssClass="form-control" placeholder="Soyad"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="sSurname" ErrorMessage="Soyad mütləqdir!" CssClass="error-text" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-1">
                        <asp:Button ID="btnAdd" runat="server" Text="Əlavə et" CssClass="btn btn-success w-100" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>