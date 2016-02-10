<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="SarkiSarkiciEkle.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.SarkiSarkiciEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 600px;
        }

        .style2 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td width="50%">
                            <asp:Button ID="btnsarkiciekle" runat="server" OnClick="btnsarkiciekle_Click"
                                Text="Şarkıcı Ekle" />
                        </td>
                        <td width="50%">
                            <asp:Button ID="btnsarkiekle" runat="server" OnClick="btnsarkiekle_Click"
                                Text="Şarkı Ekle" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlsarkici" runat="server" Visible="False">
                    <table class="style2">
                        <tr>
                            <td width="40%">
                                <asp:TextBox ID="txtsarkici" runat="server"></asp:TextBox>
                            </td>
                            <td width="15%">
                                <asp:Button ID="btnekle" runat="server" Text="Ekle" OnClick="btnekle_Click" />
                            </td>
                            <td width="45%">
                                <asp:Label ID="lbluyarisarkici" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlsarki" runat="server" Visible="False">
                    <table class="style2">
                        <tr>
                            <td width="25%">
                                <asp:DropDownList ID="ddlSarkici" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td width="35%">
                                <asp:TextBox ID="txtsarki" runat="server"></asp:TextBox>
                            </td>
                            <td width="10%">
                                <asp:Button ID="btnsarki" runat="server" Text="Ekle" OnClick="btnsarki_Click" />
                            </td>
                            <td width="30%">
                                <asp:Label ID="lbluyarisarki" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
