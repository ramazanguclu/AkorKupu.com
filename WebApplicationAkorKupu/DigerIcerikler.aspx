<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="DigerIcerikler.aspx.cs" Inherits="WebApplicationAkorKupu.DigerIcerikler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style3 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="temizle"></div>
    <div class="digericerikler_dis">
        <div style="width: 970px; height: auto; margin-top: 20px; margin-bottom: 10px; text-align: center; font-family: Arial, Helvetica, sans-serif; font-size: 15px; font-weight: bold; font-style: italic; color: #000000; background-color: #C0C0C0">
            <asp:Literal ID="ltrladsoyad" runat="server"></asp:Literal>
            Kullanıcısına Ait Akor-Tab ve Şarkı Sözleri:
        </div>

        <table class="style1">
            <tr>
                <td>
                    <asp:DataList ID="dlakor" runat="server" CellPadding="4" ForeColor="#333333"
                        Width="98%">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            <table class="style3">
                                <tr>
                                    <td width="40%">Şarkı</td>
                                    <td width="20%">Tür</td>
                                    <td width="20%">Tarih</td>
                                    <td width="20%">Görüntülenme</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                            <table class="style3">
                                <tr>
                                    <td width="40%">
                                        <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>" style="color: #CC0000; text-decoration: none;"><%#Eval("SarkiAdi") %>&nbsp;<%#Eval("Baslik") %></a></td>
                                    <td width="20%">
                                        <%#Eval("TurAdi") %></td>
                                    <td width="20%">
                                        <%#Eval("Tarih") %></td>
                                    <td width="20%">
                                        <%#Eval("Hit") %></td>
                                </tr>
                            </table>
                            </a>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="width: 967px; height: auto; margin-top: 20px; margin-bottom: 10px; text-align: center; font-family: Arial, Helvetica, sans-serif; font-size: 15px; font-weight: bold; font-style: italic; color: #000000; background-color: #C0C0C0">
                        <asp:Literal ID="ltrlhaber" runat="server"></asp:Literal>
                        Kullanıcısına Ait Haberler:
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="dlHaber" runat="server" CellPadding="4" ForeColor="#333333"
                        Width="98%">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            <table class="style3">
                                <tr>
                                    <td width="50%">Haber Başlığı</td>
                                    <td width="25%">Tarih</td>
                                    <td width="25%">Görüntülenme</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                            <table class="style3">
                                <tr>
                                    <td width="50%">
                                        <a href="HaberSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>" style="color: #CC0000; text-decoration: none;"><%#Eval("Baslik") %></a></td>
                                    <td width="25%">
                                        <%#Eval("Tarih") %></td>
                                    <td width="25%">
                                        <%#Eval("Hit") %></td>
                                </tr>
                            </table>

                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="width: 967px; height: auto; margin-top: 20px; margin-bottom: 10px; text-align: center; font-family: Arial, Helvetica, sans-serif; font-size: 15px; font-weight: bold; font-style: italic; color: #000000; background-color: #C0C0C0">
                        <asp:Literal ID="ltrldemo" runat="server"></asp:Literal>
                        Kullanıcısına Ait Demolar:
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="dldemo" runat="server" CellPadding="4" ForeColor="#333333"
                        Width="98%">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            <table class="style3">
                                <tr>
                                    <td width="50%">Demo İsmi</td>
                                    <td width="25%">Tarih</td>
                                    <td width="25%">Görüntülenme</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>

                            <table class="style3">
                                <tr>
                                    <td width="50%">
                                        <a href="DemoSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>" style="color: #CC0000; text-decoration: none;"><%#Eval("Baslik") %> </a></td>
                                    <td width="25%">
                                        <%#Eval("Tarih") %></td>
                                    <td width="25%">
                                        <%#Eval("Hit") %></td>
                                </tr>
                            </table>

                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>

</asp:Content>
