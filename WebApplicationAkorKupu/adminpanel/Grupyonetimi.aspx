<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="Grupyonetimi.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.Grupyonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 500px;
        }

        .style2 {
            width: 400px;
        }

        .style4 {
            width: 20%;
        }

        .style5 {
            width: 20%;
            height: 26px;
        }

        .style6 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="style1">
        <tr>
            <td class="style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="font-weight: bold" class="style5">Grup Adı:</td>
            <td class="style6">
                <asp:TextBox ID="txtGrupAdi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">&nbsp;</td>
            <td>
                <asp:Button ID="btnekle" runat="server" OnClick="btnekle_Click" Text="Ekle" />
            </td>
        </tr>

    </table>

    <table align="center" class="style2">
        <asp:Repeater ID="RpGruplar" runat="server">
            <ItemTemplate>
                <tr>
                    <td width="80%">
                        <%#Eval("GrupAdi") %></td>
                    <td width="10%">
                        <a href="GrupGuncelle.aspx?GrupId=<%#Eval("GrupId") %>">
                            <img border="0" align="middle" width="30" src="images/icon/edit-icon.png" /></td>
                    </a>
            <td width="10%">
                <a href="Grupyonetimi.aspx?GrupId=<%#Eval("GrupId") %>&islem=sil">
                    <img border="0" align="middle" width="30" src="images/icon/delete_Icon.png" /></td>
                    </a>
                </tr>

            </ItemTemplate>
        </asp:Repeater>

    </table>
</asp:Content>
