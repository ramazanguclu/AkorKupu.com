<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="MailYonetimi.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.MailYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 26px;
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
                    <asp:ListItem Value="2" Selected="True">Seçiniz</asp:ListItem>
                    <asp:ListItem Value="1">Okunan</asp:ListItem>
                    <asp:ListItem Value="0">Okunmayan</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOkunmayan" runat="server" CellPadding="4"
                    ForeColor="#333333" Visible="False"
                    Width="100%">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table class="style1">
                            <tr>
                                <td width="10%">İçerik</td>
                                <td width="20%">Konu</td>
                                <td width="40%">Adres</td>
                                <td width="20%">AdSoyad</td>
                                <td width="10%">Okundu</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td width="10%">
                                    <a href="MailYonetimi.aspx?MailId=<%#Eval("MailId") %>&islem=bak">
                                        <img alt="" src="images/icon/bak.png" /></a></td>
                                <td width="20%">
                                    <%#Eval("Konu") %></td>
                                <td width="40%">
                                    <%#Eval("EmailAdres") %></td>
                                <td width="20%">
                                    <%#Eval("AdSoyad") %></td>
                                <td width="10%">
                                    <a href="MailYonetimi.aspx?MailId=<%#Eval("MailId") %>&islem=okundu">
                                        <img alt="" src="images/icon/onay.png" /></a></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOkunan" runat="server" CellPadding="4"
                    ForeColor="#333333" Visible="False"
                    Width="100%">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table class="style1">
                            <tr>
                                <td width="10%">İçerik</td>
                                <td width="20%">Konu</td>
                                <td width="40%">Adres</td>
                                <td width="20%">AdSoyad</td>
                                <td width="10%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td width="10%">
                                    <a href="MailYonetimi.aspx?MailId=<%#Eval("MailId") %>&islem=bak">
                                        <img alt="" src="images/icon/bak.png" /></a></td>
                                <td width="20%">
                                    <%#Eval("Konu") %></td>
                                <td width="40%">
                                    <%#Eval("EmailAdres") %></td>
                                <td width="20%">
                                    <%#Eval("AdSoyad") %></td>
                                <td width="10%">
                                    <a href="MailYonetimi.aspx?MailId=<%#Eval("MailId") %>&islem=sil">
                                        <img alt="" src="images/icon/sil.png" /></a></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlmail" runat="server" Visible="true">
                    <div class="iletisim">
                        <br />
                        <br />
                        <div class="iletisimsatir">Gönderen:</div>
                        <div class="iletisimsatir">
                            <asp:Label ID="lblAdSoyad" runat="server"></asp:Label></div>
                        <div class="iletisimsatir"></div>
                        <div class="temizle"></div>
                        <div class="iletisimsatir">E-mail:</div>
                        <div class="iletisimsatir">
                            <asp:Label ID="lblMailAdres" runat="server"></asp:Label></div>
                        <div class="iletisimsatir"></div>
                        <div class="temizle"></div>
                        <div class="iletisimsatir">Konu:</div>
                        <div class="iletisimsatir">
                            <asp:Label ID="lblKonu" runat="server"></asp:Label></div>
                        <div class="iletisimsatir"></div>
                        <div class="temizle">
                        </div>
                        <asp:Label ID="lblMailIcerik" runat="server"></asp:Label>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
