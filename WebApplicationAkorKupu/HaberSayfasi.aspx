<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="HaberSayfasi.aspx.cs" Inherits="WebApplicationAkorKupu.HaberSayfasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="temizle"></div>
    <asp:Repeater ID="rpHaber" runat="server">
        <ItemTemplate>
            <div class="haber_alani">
                <div class="haber_baslik">
                    <asp:Label ID="lblbaslik" runat="server" Font-Bold="True"
                        Font-Size="25pt" ForeColor="Red"><%#Eval("Baslik") %></asp:Label>
                </div>
                <div class="temizle"></div>
                <div class="haber_aciklama">
                    <asp:Label ID="lblaciklama" runat="server"
                        Font-Size="15pt" ForeColor="Black" Font-Bold="True" Font-Italic="True"><%#Eval("Aciklama") %></asp:Label>
                </div>
                <div class="temizle"></div>
                <div class="haber_resim">
                    <img alt="" src="Haber/buyuk/<%#Eval("Haber") %>" /></div>
                <div class="temizle"></div>
                <div class="haber_metin"><%#Eval("Icerik") %></div>
                <div class="temizle"></div>
                <div class="haber_tarih">
                    <div class="haber_tarih_bir">
                        <asp:Label ID="lbltarih" runat="server" Font-Size="10pt"><%#Eval("Tarih") %></asp:Label>
                    </div>
                    <div class="haber_tarih_iki">
                        <asp:Label ID="lblHit" runat="server" Font-Size="10pt"><%#Eval("AdSoyad") %></asp:Label>
                    </div>
                    <div class="haber_tarih_bir">&nbsp;</div>

                    <div class="haber_tarih_iki">
                        <asp:Label ID="Label1" runat="server" Font-Size="10pt">Okunma:<%#Eval("Hit") %></asp:Label>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="habersayfasi_alt">
        <div style="width: 654px; height: auto; margin: 7px; background-color: #339966; text-align: center; float: left">
            <asp:LinkButton ID="lnkbtndigerhaberler" runat="server" Text="Diğer Haberler"
                BorderColor="#000099" BorderStyle="Solid" BorderWidth="2px"
                Font-Overline="False" ForeColor="#CC0000" OnClick="lnkbtndigerhaberler_Click"></asp:LinkButton>
        </div>
    </div>
    <div class="temizle"></div>
</asp:Content>
