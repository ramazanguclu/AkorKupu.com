<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="SarkiciListe.aspx.cs" Inherits="WebApplicationAkorKupu.SarkiciListe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="width: 660px; height: auto; margin: 10px 5px 10px 5px; text-align: center; font-size: 20px; font-weight: bold; font-style: italic; color: #000000; background-color: #0066FF;">
        <asp:Label ID="lblSarkici" runat="server"></asp:Label>
        akor-tab ve şarkı sözleri:<br />
    </div>
    <asp:DataList ID="dlSarkici" runat="server" BackColor="White"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
        GridLines="Both" Width="100%">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <HeaderTemplate>
            <table style="width: 100%">
                <tr>
                    <td width="35%">Şarkı</td>
                    <td width="25%">Tür</td>
                    <td width="20%">Tarih</td>
                    <td width="20%">Görüntülenme</td>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemStyle BackColor="White" ForeColor="#003399" />
        <ItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td width="35%">
                        <a style="text-decoration: none; color: #CC0000;" href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>"><%#Eval("SarkiAdi") %>&nbsp;<%#Eval("Baslik") %></a></td>
                    <td width="25%">
                        <%#Eval("TurAdi") %></td>
                    <td width="20%">
                        <%#Eval("Tarih") %></td>
                    <td width="20%">
                        <%#Eval("Hit") %></td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
    </asp:DataList>
</asp:Content>

