<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="AdminYonetimi.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.AdminYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 300px;
            float: left;
        }

        .style3 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                <table class="style2">
                    <tr>
                        <td width="40%">Kullanıcı Adı:</td>
                        <td>
                            <asp:TextBox ID="txtAra" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnAra" runat="server" Text="ARA" OnClick="btnAra_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblAra" runat="server" Font-Size="11pt" ForeColor="#0000CC"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlAra" runat="server" BackColor="White"
                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    GridLines="Both" Width="100%">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <HeaderTemplate>
                        <table class="style1" style="font-size: 12px">
                            <tr>
                                <td width="30%">Kullanıcı Adı</td>
                                <td width="30%">Adı Soyadı</td>
                                <td width="20%">Görevi</td>
                                <td width="10%">Düzenle</td>
                                <td width="10%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" ForeColor="#330099" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td width="30%">
                                    <%#Eval("KullaniciAdi") %></td>
                                <td width="30%">
                                    <%#Eval("AdSoyad") %></td>
                                <td width="20%">
                                    <%#Eval("GrupAdı") %></td>
                                <td width="10%">
                                    <img border="0" width="30" src="images/icon/edit-icon.png" />
                                </td>
                                <td width="10%">
                                    <a href="AdminYonetimi.aspx?KullaniciId=<%#Eval("KullaniciId") %>&islem=sil">
                                        <img border="0" width="30" src="images/icon/delete_Icon.png" /></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="style1" style="font-family: 12">
                    <tr>
                        <td>
                            <asp:Button ID="btnyonetici" runat="server" Text="YÖNETİCİ"
                                OnClick="btnyonetici_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnkullanici" runat="server" Text="KULLANICI"
                                OnClick="btnkullanici_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnson" runat="server" Text="SON 2O ÜYE"
                                OnClick="btnson_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style3"></td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlKullanici" runat="server" BackColor="White"
                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    GridLines="Both" Width="100%">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <HeaderTemplate>
                        <table class="style1" style="font-size: 12px">
                            <tr>
                                <td width="30%">Kullanıcı Adı</td>
                                <td width="30%">Adı Soyadı</td>
                                <td width="20%">Görevi</td>
                                <td width="10%">Düzenle</td>
                                <td width="10%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" ForeColor="#330099" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td width="30%">
                                    <%#Eval("Email") %></td>
                                <td width="30%">
                                    <%#Eval("AdSoyad") %></td>
                                <td width="20%">
                                    <%#Eval("GrupAdi") %></td>
                                <td width="10%">
                                    <a href="KullaniciDüzenle.aspx?KullaniciId=<%#Eval("KullaniciId") %>">
                                        <img alt="" border="0" width="30" src="images/icon/edit-icon.png" /></a>
                                </td>
                                <td width="10%">
                                    <a href="AdminYonetimi.aspx?KullaniciId=<%#Eval("KullaniciId") %>&islem=sil">
                                        <img alt="" border="0" width="30" src="images/icon/delete_Icon.png" /></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
