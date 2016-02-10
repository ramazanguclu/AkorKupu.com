<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="IcerikYonetimi.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.IcerikYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                <asp:DropDownList ID="ddlOnay" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlOnay_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Onaysız</asp:ListItem>
                    <asp:ListItem>Onaylı</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOnaysiz" runat="server" CellPadding="4" ForeColor="#333333"
                    Width="100%">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table class="style1">
                            <tr>
                                <td width="5%">Gör</td>
                                <td width="25%">Başlık</td>
                                <td width="20%">İçeriğin Türü</td>
                                <td width="30%">Ekleyen</td>
                                <td align="center" width="10%">Onayla</td>
                                <td align="center" width="10%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td align="left" width="5%">
                                    <a href="Icerik.aspx?IcerikId=<%#Eval("IcerikId")  %>&TurId=<%#Eval("TurId")  %> ">
                                        <img alt="" border="0" src="images/icon/bak.png" /></td>
                                </a>
                                <td width="25%">
                                    <%#Eval("Baslik") %></td>
                                <td width="20%">
                                    <%#Eval("TurAdi") %></td>
                                <td width="30%">
                                    <%#Eval("AdSoyad") %></td>
                                <td align="center" width="10%">
                                    <a href="IcerikYonetimi.aspx?IcerikId=<%#Eval("IcerikId") %>&islem=Onay">
                                        <img alt="" border="0" src="images/icon/onay.png" /></td>
                                </a>
                                <td align="center" width="10%">
                                    <a href="IcerikYonetimi.aspx?IcerikId=<%#Eval("IcerikId") %>&islem=Sil">
                                        <img alt="" border="0" src="images/icon/sil.png" /></td>
                                </a>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOnayli" runat="server" CellPadding="4" ForeColor="#333333"
                    Width="100%">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table class="style1">
                            <tr>
                                <td width="40%">İçerik</td>
                                <td width="20%">İçeriğin Türü</td>
                                <td width="30%">Ekleyen</td>
                                <td align="center" width="10%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td width="40%">
                                    <%#Eval("Icerik") %>
                                </td>
                                <td width="20%">
                                    <%#Eval("TurAdi") %></td>
                                <td width="30%">
                                    <%#Eval("AdSoyad") %></td>
                                <td align="center" width="10%">
                                    <a href="IcerikYonetimi.aspx?IcerikId=<%#Eval("IcerikId") %>&islem=Sil">
                                        <img alt="" border="0" src="images/icon/sil.png" /></td>
                                </a>
                                    
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>
