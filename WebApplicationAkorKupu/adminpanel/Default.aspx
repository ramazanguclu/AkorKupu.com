<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center; color: #000080;">Admin Paneline Giriş Yaptınız.<br />
                Siteyi Soldaki Menülerden Yönetebilirsiniz.</td>
        </tr>
    </table>
</asp:Content>
