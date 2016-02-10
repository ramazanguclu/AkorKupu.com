<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="ProfilDuzenle.aspx.cs" Inherits="WebApplicationAkorKupu.ProfilDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div id="Kul_bilgi">
        <div id="profil_resim">
            <asp:Image Height="150" ID="imgResim" runat="server" />
        </div>

        <div class="profil_satir">
            <div class="profil_satir1">Resim:</div>
            <div class="profil_satir2">

                <asp:FileUpload ID="fuResim" runat="server" />

            </div>
        </div>
        <div class="temizle"></div>

        <div class="profil_satir">
            <div class="profil_satir1">AdSoyad:</div>
            <div class="profil_satir2">
                <asp:TextBox ID="txtAdSoyad" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="temizle"></div>

        <div class="profil_satir">
            <div class="profil_satir1">Şifre:</div>
            <div class="profil_satir2">
                <asp:TextBox ID="txtsifre" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Text="*"></asp:Label>
            </div>
        </div>
        <div class="temizle"></div>

        <div class="profil_satir">
            <div class="profil_satir1">Yeni Şifre:</div>
            <div class="profil_satir2">
                <asp:TextBox ID="txtyenisifre" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="temizle"></div>

        <div class="profil_satir">
            <div class="profil_satir1">Yeni Şifre(Tekrar):</div>
            <div class="profil_satir2">
                <asp:TextBox ID="txtsiftetekrar" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:CompareValidator ID="CompareValidator1" runat="server"
        ControlToCompare="txtyenisifre" ControlToValidate="txtsiftetekrar"
        CssClass="hata">Şifreler Uyuşmamaktadır.</asp:CompareValidator>
            </div>
        </div>
        <div class="temizle"></div>


        <div class="profil_satir">
            <div class="profil_satir1">Meslek:</div>
            <div class="profil_satir2">
                <asp:DropDownList ID="ddlMeslek" runat="server">
                </asp:DropDownList>
            </div>
        </div>

        <div class="temizle"></div>


        <div class="profil_satir">
            <asp:Button ID="btnguncelle" runat="server" Text="Güncelle"
                OnClick="btnguncelle_Click" />
        </div>
    </div>



</asp:Content>
