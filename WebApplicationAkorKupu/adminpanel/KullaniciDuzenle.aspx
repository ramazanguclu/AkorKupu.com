<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="KullaniciDuzenle.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.KullaniciDuzenle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td width="30%">
                <asp:ScriptManager ID="ScriptManager1" runat="server"
                    EnableScriptGlobalization="True">
                </asp:ScriptManager>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Kullanıcı Adı:</td>
            <td>
                <asp:TextBox ID="txtKullaniciAdi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Şifre:</td>
            <td>
                <asp:TextBox ID="txtSifre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Şifre2:</td>
            <td>
                <asp:TextBox ID="txtSifre2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Ad Soyad:</td>
            <td>
                <asp:TextBox ID="txtAdSoyad" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Görevi:</td>
            <td>
                <asp:DropDownList ID="DdlGörevi" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>eMail:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>Cinsiyet:</td>
            <td>
                <asp:RadioButton ID="rdBay" runat="server" Text="Bay" GroupName="Cinsiyet" Checked="True" />
                <asp:RadioButton ID="rdBayan" runat="server" Text="Bayan" GroupName="Cinsiyet" />

            </td>
        </tr>
        <tr>
            <td>Doğum Tarihi:</td>
            <td>
                <asp:TextBox ID="txtDogum" runat="server"></asp:TextBox>
                <asp:CalendarExtender DefaultView="Years" runat="server" TargetControlID="txtDogum"
                    ID="CalendarExtender1"></asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>Engelle:</td>
            <td>
                <asp:RadioButton ID="rdEvet" runat="server" GroupName="Engel" Text="Evet" />
                <asp:RadioButton ID="rdHayır" runat="server" GroupName="Engel" Text="Hayır" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnGüncelle" runat="server" Text="GÜNCELLE"
                    OnClick="btnGüncelle_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblBilgi" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
