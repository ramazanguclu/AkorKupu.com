<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="HaberListe.aspx.cs" Inherits="WebApplicationAkorKupu.HaberListe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <asp:Repeater ID="rphaber" runat="server">
        <ItemTemplate>
            <div class="haberliste">
                <a href="HaberSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                    <div class="haberliste_resim">
                        <img alt="" src="Haber/kucuk/<%#Eval("Haber") %>" /></div>
                </a>
                <div class="haberliste_yazi">
                    <a href="HaberSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                        <div class="haberliste_baslik">
                            <asp:Label ID="baslik" runat="server"><%#Eval("Baslik") %></asp:Label>
                        </div>
                    </a>
                    <div class="haberliste_satir">
                        <div class="haberlistesutun">
                            <asp:Label ID="lbltarih" runat="server"><%#Eval("Tarih") %></asp:Label>
                        </div>
                        <div class="haberlistesutun">
                            <asp:Label ID="lbladsoyad" runat="server" Text="Ekleyen: "><%#Eval("AdSoyad") %></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div style="text-align: center; margin: 5px; width: 660px">
        <asp:Label ID="Label1" runat="server" Text="Label" CssClass="arama_label"
            Height="20px"></asp:Label>
        <asp:HyperLink ID="linkPrev" runat="server" CssClass="arama_label"
            Height="20px" Width="60px">Geri</asp:HyperLink>
        <asp:HyperLink ID="linkNext" runat="server" CssClass="arama_label"
            Height="20px" Width="60px">İleri</asp:HyperLink>
    </div>


</asp:Content>
