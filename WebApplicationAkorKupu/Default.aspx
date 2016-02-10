<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationAkorKupu.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="temizle"></div>

    <div id="vitrin">

        <asp:Repeater ID="rpHaber" runat="server">
            <ItemTemplate>
                <div class="haber_alani">
                    <div class="haber_baslik">
                        <asp:Label ID="lblbaslik" runat="server" Font-Bold="True"
                            Font-Size="25pt" ForeColor="Red"><%#Eval("Baslik") %></asp:Label>
                    </div>
                    <div class="temizle"></div>
                    <div class="haber_aciklama">
                        <asp:Label ID="lblaciklama" runat="server"
                            Font-Size="15pt" ForeColor="Black" Font-Bold="True" Font-Italic="True"><%#Eval("Aciklama") %></asp:Label>
                    </div>
                    <div class="temizle"></div>
                    <div class="haber_resim">
                        <img alt="" src="Haber/buyuk/<%#Eval("Haber") %>" />
                    </div>
                    <div class="temizle"></div>
                    <a href="HaberSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>" style="color: #FF0000; overflow: hidden; font-size: 12px">
                        <div class="haber_metin"><%# Eval("Icerik").ToString().Length > 250 ? Eval("Icerik").ToString().Substring(0, 250) + " ..." : Eval("Icerik")%></div>
                        Devamını Oku</a>
                    <div class="temizle"></div>
                    <div class="haber_tarih">
                        <div class="haber_tarih_bir">
                            <asp:Label ID="lbltarih" runat="server" Font-Size="10pt"><%#Eval("Tarih") %></asp:Label>
                        </div>
                        <div class="haber_tarih_iki">
                            <asp:Label ID="lbladsoyad" runat="server" Font-Size="10pt"><%#Eval("AdSoyad") %></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="reklam_alani">
            <div class="arama">
                <div class="arama_baslik">İçerik Arama</div>
                <div class="arama_satir"></div>
                <div class="arama_satir">Şarkıcı Ara</div>
                <div class="arama_satir">
                    <asp:TextBox ID="txtsarkiciara" runat="server"></asp:TextBox>
                </div>
                <div class="arama_satir">
                </div>
                <div class="arama_satir">
                    <asp:Button ID="btnsarkici" runat="server" Text="ARA"
                        OnClick="btnsarkici_Click" />
                </div>
                <div class="arama_satir"></div>
                <div class="arama_satir"></div>
                <div class="arama_satir">Şarkı Ara</div>
                <div class="arama_satir">
                    <asp:TextBox ID="txtsarkiara" runat="server"></asp:TextBox>
                </div>
                <div class="arama_satir">
                </div>
                <div class="arama_satir">
                    <asp:Button ID="btnsarki" runat="server" Text="ARA" OnClick="btnsarki_Click" />
                </div>
            </div>

            <div class="son_uyeler">
                <div class="arama_baslik">Son Üyeler</div>
                <asp:Repeater ID="rpsonuye" runat="server">
                    <ItemTemplate>
                        <div class="sonuye_satir"></div>
                        <div class="sonuye_satir"><a href="DigerIcerikler.aspx?idkullanici=<%#Eval("KullaniciId") %>" style="text-decoration: none; color: #CC0000"><%#Eval("AdSoyad") %></a></div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!--reklam_alani bitti-->



    </div>
    <!--vitrin bitti-->
    <div class="temizle"></div>
    <div class="son_eklenen">
        <div class="baslik_son_eklenen">Son Eklenen Akor-Tab-Şarkı Sözleri</div>
        <div class="son_eklenen_satir">
            <div class="son_eklenen_sutun_a">Şarkılar</div>
            <div class="son_eklenen_sutun_d">Versiyon</div>
            <div class="son_eklenen_sutun_a">Şarkıcılar</div>
            <div class="son_eklenen_sutun_c">İçerik Türü</div>
            <div class="son_eklenen_sutun_b">Ekleyen</div>
            <div class="son_eklenen_sutun_c">Tarih</div>
        </div>
        <asp:Repeater ID="rpsoneklenen" runat="server">
            <ItemTemplate>
                <div class="son_eklenen_satir">
                    <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                        <div class="son_eklenen_sutun_iki_a"><%#Eval("SarkiAdi") %></div>
                    </a>
                    <div class="son_eklenen_sutun_iki_d"><%#Eval("Baslik") %></div>
                    <a href="SarkiciListe.aspx?SarkiciId=<%#Eval("SarkiciId") %>">
                        <div class="son_eklenen_sutun_iki_a"><%#Eval("SarkiciAdi") %></div>
                    </a>
                    <div class="son_eklenen_sutun_iki_c"><%#Eval("TurAdi") %></div>
                    <a href="DigerIcerikler.aspx?idkullanici=<%#Eval("KullaniciId") %>">
                        <div class="son_eklenen_sutun_iki_b"><%#Eval("AdSoyad") %></div>
                    </a>
                    <div class="son_eklenen_sutun_iki_c"><%#Eval("Tarih") %></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!--son_eklenen bitti-->
    <div class="temizle"></div>

    <div class="son_eklenen">
        <div class="baslik_son_eklenen">Popüler Akor-Tab-Şarkı Sözleri</div>
        <div class="son_eklenen_satir">
            <div class="son_eklenen_sutun_a">Şarkılar</div>
            <div class="son_eklenen_sutun_d">Versiyon</div>
            <div class="son_eklenen_sutun_a">Şarkıcılar</div>
            <div class="son_eklenen_sutun_c">İçerik Türü</div>
            <div class="son_eklenen_sutun_b">Ekleyen</div>
            <div class="son_eklenen_sutun_c">Görüntülenme</div>
        </div>
        <asp:Repeater ID="rppopulersarkilar" runat="server">
            <ItemTemplate>
                <div class="son_eklenen_satir">
                    <a href="IcerikSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                        <div class="son_eklenen_sutun_iki_a"><%#Eval("SarkiAdi") %></div>
                    </a>
                    <div class="son_eklenen_sutun_iki_d"><%#Eval("Baslik") %></div>
                    <a href="SarkiciListe.aspx?SarkiciId=<%#Eval("SarkiciId") %>">
                        <div class="son_eklenen_sutun_iki_a"><%#Eval("SarkiciAdi") %></div>
                    </a>
                    <div class="son_eklenen_sutun_iki_c"><%#Eval("TurAdi") %></div>
                    <a href="DigerIcerikler.aspx?idkullanici=<%#Eval("KullaniciId") %>">
                        <div class="son_eklenen_sutun_iki_b"><%#Eval("AdSoyad") %></div>
                    </a>
                    <div class="son_eklenen_sutun_iki_c"><%#Eval("Hit") %></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!--son_eklenen bitti-->

    <div class="temizle"></div>
    <div class="orta_alan">
        <div class="orta_resim"></div>
    </div>
    <div class="temizle"></div>

    <div class="demo">

        <div class="demo_son_eklenen">
            <div class="demo_baslik">Son Eklenen Demolar</div>
            <div class="demo_satir">
                <div class="demo_sutun">Demo İsmi</div>
                <div class="demo_sutun">Ekleyen</div>
                <div class="demo_sutun">Tarih</div>
            </div>
            <asp:Repeater ID="rpdemosoneklenen" runat="server">
                <ItemTemplate>

                    <div class="demo_satir">
                        <a href="DemoSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                            <div class="demo_sutun_iki"><%#Eval("Baslik") %></div>
                        </a>
                        <a href="DigerIcerikler.aspx?idkullanici=<%#Eval("KullaniciId") %>">
                            <div class="demo_sutun_iki"><%#Eval("AdSoyad") %></div>
                        </a>
                        <div class="demo_sutun_iki"><%#Eval("Tarih") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="demo_son_eklenen_iki">
            <div class="demo_baslik">Populer Demolar</div>
            <div class="demo_satir">
                <div class="demo_sutun">Demo İsmi</div>
                <div class="demo_sutun">Ekleyen</div>
                <div class="demo_sutun">Görüntülenme</div>
            </div>
            <asp:Repeater ID="rppopulerdemolar" runat="server">
                <ItemTemplate>
                    <div class="demo_satir">
                        <a href="DemoSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>">
                            <div class="demo_sutun_iki"><%#Eval("Baslik") %></div>
                        </a>
                        <a href="DigerIcerikler.aspx?idkullanici=<%#Eval("KullaniciId") %>">
                            <div class="demo_sutun_iki"><%#Eval("AdSoyad") %></div>
                        </a>
                        <div class="demo_sutun_iki"><%#Eval("Hit") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!--demo_son_eklenen_iki bitti-->
    </div>
    <!--demo bitti-->

    <div class="temizle"></div>

</asp:Content>
