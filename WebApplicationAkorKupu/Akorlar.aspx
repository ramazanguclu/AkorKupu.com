<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Akorlar.aspx.cs" Inherits="WebApplicationAkorKupu.Akorlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="harfler" style="border: medium solid #FFFF00">
        <div class="arama_alani">
            <div class="harf_alani">
                <asp:DataList ID="dlharf" runat="server" CellPadding="4" ForeColor="#333333"
                    RepeatColumns="4" Width="16px">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>ARA</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="#E3EAEB" />
                    <ItemTemplate>

                        <table>
                            <tr>
                                <td>
                                    <a href="Akorlar.aspx?Harf=<%#Eval("Harf") %>" style="color: #0000FF; text-decoration: none;"><%#Eval("Harf") %></a>
                                </td>
                            </tr>
                        </table>

                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            </div>

            <asp:Panel ID="pnlakorarama" runat="server" Visible="False">
                <div class="akor_arama_alani">
                    <div class="akor_arama_baslik">Arama</div>
                    <div class="akor_arama_satir">
                        <div class="akor_arama_sutun_baslik">Şarkı</div>
                        <div class="akor_arama_sutun_iki_baslik">Versiyon</div>
                        <div class="akor_arama_sutun_baslik">Şarkıcı</div>
                        <div class="akor_arama_sutun_iki_baslik">Görüntülenme</div>
                    </div>
                    <asp:Repeater ID="rparama" runat="server">
                        <ItemTemplate>
                            <div class="akor_arama_satir">
                                <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                                    <div class="akor_arama_sutun"><%#Eval("SarkiAdi") %></div>
                                </a>
                                <div class="akor_arama_sutun_iki"><%#Eval("Baslik") %></div>
                                <a href="SarkiciListe.aspx?SarkiciId=<%#Eval("SarkiciId") %>">
                                    <div class="akor_arama_sutun"><%#Eval("SarkiciAdi") %></div>
                                </a>
                                <div class="akor_arama_sutun_iki"><%#Eval("Hit") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="arama_label"
                        Height="20px"></asp:Label>
                    <asp:HyperLink ID="linkPrev" runat="server" CssClass="arama_label"
                        Height="20px" Width="60px">Geri</asp:HyperLink>
                    <asp:HyperLink ID="linkNext" runat="server" CssClass="arama_label"
                        Height="20px" Width="60px">İleri</asp:HyperLink>
                </div>
            </asp:Panel>
        </div>
        <br />
        <br />

        <div class="temizle"></div>


        <div class="akor_sonek">
            <div class="akor_sonek_baslik">Son Eklenen Akorlar</div>
            <div class="akor_son_satir">
                <div class="akor_son_sutun_baslik">Şarkı</div>
                <div class="akor_son_sutun_iki_baslik">Versiyon</div>
                <div class="akor_son_sutun_baslik">Şarkıcı</div>
                <div class="akor_son_sutun_iki_baslik">Tarih</div>
            </div>
            <asp:Repeater ID="rpsonakorlar" runat="server">
                <ItemTemplate>

                    <div class="akor_son_satir">
                        <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                            <div class="akor_son_sutun"><%#Eval("SarkiAdi") %></div>
                        </a>
                        <div class="akor_son_sutun_iki"><%#Eval("Baslik") %></div>
                        <a href="SarkiciListe.aspx?SarkiciId=<%#Eval("SarkiciId") %>">
                            <div class="akor_son_sutun"><%#Eval("SarkiciAdi") %></div>
                        </a>
                        <div class="akor_son_sutun_iki"><%#Eval("Tarih") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="temizle"></div>

        <div class="akor_sonek">
            <div class="akor_sonek_baslik">Populer Akorlar</div>
            <div class="akor_son_satir">
                <div class="akor_son_sutun_baslik">Şarkı</div>
                <div class="akor_son_sutun_iki_baslik">Versiyon</div>
                <div class="akor_son_sutun_baslik">Şarkıcı</div>
                <div class="akor_son_sutun_iki_baslik">Görüntülenme</div>
            </div>
            <asp:Repeater ID="rppopulerakor" runat="server">
                <ItemTemplate>
                    <div class="akor_son_satir">
                        <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                            <div class="akor_son_sutun"><%#Eval("SarkiAdi")%></div>
                        </a>
                        <div class="akor_son_sutun_iki"><%#Eval("Baslik")%></div>
                        <a href="SarkiciListe.aspx?SarkiciId=<%#Eval("SarkiciId") %>">
                            <div class="akor_son_sutun"><%#Eval("SarkiciAdi")%></div>
                        </a>
                        <div class="akor_son_sutun_iki"><%#Eval("Hit") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

