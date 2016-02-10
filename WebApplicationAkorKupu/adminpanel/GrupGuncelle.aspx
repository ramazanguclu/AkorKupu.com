<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="GrupGuncelle.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.GrupGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="style1">
        <tr>
            <td width="30%">Grup Adı:</td>
            <td>
                <asp:TextBox ID="txtGrupAdi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnGuncelle" runat="server" OnClick="btnGuncelle_Click"
                    Text="Güncelle" />
            </td>
        </tr>
    </table>
</asp:Content>
