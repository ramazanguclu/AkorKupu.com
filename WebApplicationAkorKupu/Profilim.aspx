<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Profilim.aspx.cs" Inherits="WebApplicationAkorKupu.Profilim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="profil_butonlar">
        <ul>
            <li>
                <asp:LinkButton ID="lbKulBilgi" runat="server" OnClick="lbKulBilgi_Click">Kullanıcı Bilgilerim</asp:LinkButton></li>
            <li>
                <asp:LinkButton ID="lbSarkilar" runat="server" OnClick="lbSarkilar_Click">Şarkılarım</asp:LinkButton></li>
            <li>
                <asp:LinkButton ID="lbHaberlerim" runat="server" OnClick="lbHaberlerim_Click">Haberlerim</asp:LinkButton></li>
            <li>
                <asp:LinkButton ID="lbDemolarim" runat="server" OnClick="lbDemolarim_Click">Demolarım</asp:LinkButton></li>
        </ul>
    </div>
    <!--profil_butonlar bitti-->

    <asp:Panel ID="pnlkulbilgi" runat="server" Visible="false">
        <div id="Kul_bilgi">
            <div id="profil_resim">
                <img alt="" height="150" src='KullaniciResimleri/<asp:Literal ID="ltrlResim" runat="server"></asp:Literal>' />
            </div>
            <div id="profil_adsoyad" style="text-align: center">
                <asp:Label ID="lblAdSoyad" runat="server"></asp:Label>
            </div>

            <div class="profil_satir">
                <div class="profil_satir1">Meslek:</div>
                <div class="profil_satir2">
                    <asp:Label ID="lblMeslek" runat="server"></asp:Label>
                </div>
            </div>
            <div class="temizle"></div>

            <div class="profil_satir">
                <div class="profil_satir1">Email:</div>
                <div class="profil_satir2">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </div>
            </div>
            <div class="temizle"></div>


            <div class="profil_satir">
                <asp:Button ID="btnDuzenle" runat="server" Text="Profili Düzenle"
                    OnClick="btnDuzenle_Click" />
            </div>
        </div>
        <!--Kul_bilgi bitti-->
    </asp:Panel>

    <div class="temizle"></div>
    <div class="sarkilarim">
        <asp:Panel ID="pnlSarkilarim" runat="server" Visible="false">
            <asp:DataList ID="dlSarkilarim" runat="server" Width="100%" CellPadding="4"
                ForeColor="#333333">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td width="40%">Şarkı</td>
                            <td width="20%">Versiyon</td>
                            <td width="20%">Tür</td>
                            <td width="10%">Düzenle</td>
                            <td width="10%">Sil</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <ItemTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td width="40%">
                                <%#Eval("SarkiAdi") %>
                            </td>
                            <td width="20%">
                                <%#Eval("Baslik") %>
                            </td>
                            <td width="20%">
                                <%#Eval("TurAdi") %>
                            </td>
                            <td width="10%">
                                <a href="KullaniciIcerikDuzenle.aspx?IcerikId=<%#Eval("IcerikId") %>">
                                    <img alt="" border="0" src="images/icon/edit-icon.png" /></a>
                            </td>
                            <td width="10%">
                                <a href="Profilim.aspx?IcerikId=<%#Eval("IcerikId") %>&Islem=Sil&TurId=<%#Eval("TurId") %>">
                                    <img alt="" border="0" src="images/icon/delete_Icon.png" /></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            </asp:DataList>
        </asp:Panel>
    </div>
    <!--sarkilarim bitti-->
    <div class="temizle"></div>
    <div class="sarkilarim">
        <asp:Panel ID="pnlHaberierim" runat="server" Visible="false">
            <asp:DataList ID="dlHaberlerim" runat="server" CellPadding="4" ForeColor="#333333"
                Width="100%">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td width="50%">Haber Başlığı</td>
                            <td width="20%">Tarih</td>
                            <td width="15%">Düzenle</td>
                            <td width="15%">Sil</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemStyle BackColor="#E3EAEB" />
                <ItemTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td width="50%">
                                <%#Eval("Baslik") %></td>
                            <td width="20%">
                                <%#Eval("Tarih") %></td>
                            <td width="15%">
                                <a href="KullaniciHaberDuzenle.aspx?IcerikId=<%#Eval("IcerikId") %>">
                                    <img alt="" border="0" src="images/icon/edit-icon.png" />
                                </a></td>
                            <td width="15%">
                                <a href="Profilim.aspx?IcerikId=<%#Eval("IcerikId") %>&Islem=Sil&TurId=<%#Eval("TurId") %>">
                                    <img alt="" border="0" src="images/icon/delete_Icon.png" /></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>

        </asp:Panel>
    </div>


    <div class="temizle"></div>
    <div class="sarkilarim">
        <asp:Panel ID="pnlDemolarim" runat="server" Visible="false">
            <asp:DataList ID="dlDemolarim" runat="server" CellPadding="4" ForeColor="#333333"
                Width="100%">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td width="50%">Demo Başlığı</td>
                            <td width="20%">Tarih</td>
                            <td width="15%">Düzenle</td>
                            <td width="15%">Sil</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemStyle BackColor="#E3EAEB" />
                <ItemTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td width="50%">
                                <%#Eval("Baslik") %></td>
                            <td width="20%">
                                <%#Eval("Tarih") %></td>
                            <td width="15%">
                                <a href="KullaniciDemoDuzenle.aspx?IcerikId=<%#Eval("IcerikId") %>">
                                    <img alt="" border="0" src="images/icon/edit-icon.png" />
                                </a></td>
                            <td width="15%">
                                <a href="Profilim.aspx?IcerikId=<%#Eval("IcerikId") %>&Islem=Sil&TurId=<%#Eval("TurId") %>">
                                    <img alt="" border="0" src="images/icon/delete_Icon.png" /></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>

        </asp:Panel>
    </div>
</asp:Content>
