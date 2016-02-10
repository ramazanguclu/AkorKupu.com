<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="SifremiUnuttum.aspx.cs" Inherits="WebApplicationAkorKupu.SifremiUnuttum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="sifremi_unuttum" style="padding-right: 200px">
        <asp:Label ID="lblEmail" runat="server"
            Text="Kullanıcı Bilgilerini Almak İstediğiniz Mail Adresini Giriniz."></asp:Label>
    </div>
    <div style="text-align: center;">
        <asp:TextBox ID="txtEmail" runat="server" Width="170px"></asp:TextBox>
    </div>
    <div style="text-align: center;">
        <asp:Button ID="txtGonder" runat="server" Text="Gönder"
            OnClick="txtGonder_Click" />
    </div>
</asp:Content>
