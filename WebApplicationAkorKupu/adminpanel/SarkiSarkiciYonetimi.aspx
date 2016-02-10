<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="SarkiSarkiciYonetimi.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.SarkiSarkiciYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 600px;
        }

        .style2 {
            width: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td style="text-align: center">
                <asp:LinkButton ID="lbtneklesarkisarkici" runat="server" Text="Şarkı-Şarkıcı Ekle"
                    BorderColor="#000099" BorderStyle="Solid" BorderWidth="2px"
                    Font-Overline="False" ForeColor="#CC0000" OnClick="lnkbtndigerhaberler_Click"></asp:LinkButton></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table align="center" class="style1">
                    <tr>
                        <td style="text-align: center" width="50%">
                            <asp:Button ID="btnsarkiciduzenle" runat="server" Text="Şarkıcı Düzenle"
                                OnClick="btnsarkiciduzenle_Click" />
                        </td>
                        <td style="text-align: center" width="50%">
                            <asp:Button ID="btnsarkiduzenle" runat="server" Text="Şarkı Düzenle"
                                OnClick="btnsarkiduzenle_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlsarkiciduzenle" runat="server" Visible="False">
                    <table class="style2">
                        <tr>
                            <td width="40%">
                                <asp:DropDownList ID="ddlSarkici" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlSarkici_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td width="40%">
                                <asp:TextBox ID="txtsarkici" runat="server"></asp:TextBox>
                            </td>
                            <td width="20%">
                                <asp:Button ID="btngüncellesarkici" runat="server" Text="Güncelle"
                                    OnClick="btngüncellesarkici_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>


            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlsarkiduzenle" Visible="false" runat="server">
                    <table class="style1">
                        <tr>
                            <td width="25%">
                                <asp:DropDownList ID="ddl_sarki_sarkici" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddl_sarki_sarkici_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td width="30%">
                                <asp:DropDownList ID="ddl_sarki_sarki" runat="server" AutoPostBack="True"
                                    Enabled="False" OnSelectedIndexChanged="ddl_sarki_sarki_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td width="30%">
                                <asp:TextBox ID="txtsarki" runat="server"></asp:TextBox>
                            </td>
                            <td width="15%">
                                <asp:Button ID="btnsarki" runat="server" OnClick="btnsarki_Click"
                                    Text="Güncelle" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

            </td>
        </tr>
    </table>
</asp:Content>
