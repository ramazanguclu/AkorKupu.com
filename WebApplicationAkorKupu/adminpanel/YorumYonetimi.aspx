<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="YorumYonetimi.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.YorumYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 26px;
        }

        .style3 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DropDownList ID="ddlOnay" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlOnay_SelectedIndexChanged">
                    <asp:ListItem>Onaylı</asp:ListItem>
                    <asp:ListItem Selected="True">Onaysız</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOnaysiz" runat="server" BackColor="White"
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    GridLines="Both" Width="100%">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <HeaderTemplate>
                        <table class="style1">
                            <tr>
                                <td width="70%">Yorum</td>
                                <td width="15%">Onayla</td>
                                <td width="15%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" ForeColor="#003399" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td width="70%">
                                    <%#Eval("Yorum") %></td>
                                <td width="15%">
                                    <a href="YorumYonetimi.aspx?YorumId=<%#Eval("YorumId") %>&islem=Onay">
                                        <img alt="" border="0" src="images/icon/onay.png" /></a></td>
                                <td width="15%">
                                    <a href="YorumYonetimi.aspx?YorumId=<%#Eval("YorumId") %>&islem=Sil">
                                        <img alt="" border="0" src="images/icon/sil.png" /></a></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOnayli" runat="server" BackColor="White"
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    GridLines="Both" Width="100%">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <HeaderTemplate>
                        <table class="style1">
                            <tr>
                                <td width="85%">Yorum</td>
                                <td width="15%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" ForeColor="#003399" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style3" width="85%">
                                    <%#Eval("Yorum") %></td>
                                <td class="style3" width="15%">
                                    <a href="YorumYonetimi.aspx?YorumId=<%#Eval("YorumId") %>&islem=Sil">
                                        <img alt="" border="0" src="images/icon/sil.png" /></a></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
