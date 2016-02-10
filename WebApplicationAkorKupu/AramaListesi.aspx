<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="AramaListesi.aspx.cs" Inherits="WebApplicationAkorKupu.AramaListesi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">



    <table style="width: 100%">
        <tr>
            <td style="text-align: center; color: #CC0000; font-style: italic; font-weight: bold;">
                <asp:Label ID="lblaramasonuc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlsarkici" runat="server" BackColor="White"
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    GridLines="Both" Width="100%">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <HeaderTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td width="50%">Şarkı İsmi</td>
                                <td width="25%">Tür</td>
                                <td width="25%">Görüntülenme</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" ForeColor="#003399" />
                    <ItemTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td width="50%">
                                    <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>" style="text-decoration: none; color: #CC0000"><%#Eval("SarkiAdi") %>&nbsp;<%#Eval("Baslik") %></a></td>
                                <td width="25%">
                                    <%#Eval("TurAdi") %></td>
                                <td width="25%">
                                    <%#Eval("Hit") %></td>
                            </tr>
                        </table>
                        </a>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlsarki" runat="server" Width="100%" BackColor="White"
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    GridLines="Both">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <HeaderTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td width="40%">Şarkı</td>
                                <td width="30%">Şarkıcı</td>
                                <td width="15%">Tarih</td>
                                <td width="15%">Görüntülenme</td>

                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" ForeColor="#003399" />
                    <ItemTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td width="40%">
                                    <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>" style="text-decoration: none; color: #CC0000"><%#Eval("SarkiAdi") %>&nbsp;<%#Eval("Baslik") %></a></td>
                                <td width="30%">
                                    <a href="SarkiciListe.aspx?SarkiciId=<%#Eval("SarkiciId") %>" style="text-decoration: none; color: #CC0000"><%#Eval("SarkiciAdi") %></a></td>
                                <td width="15%">
                                    <%#Eval("Tarih") %></td>
                                <td width="15%">
                                    <%#Eval("Hit") %></td>
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
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>



</asp:Content>
