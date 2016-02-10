<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="DemoSayfasi.aspx.cs" Inherits="WebApplicationAkorKupu.DemoSayfasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <table style="width: 100%; border: 2px solid #000066; background-color: #00CCFF">
        <tr>
            <td style="font-family: Arial, Helvetica, sans-serif; width: auto; color: #CC0000; font-weight: bold; text-align: center">BİLGİLER</td>
        </tr>
        <tr style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #000000">
            <td>
                <table style="width: 100%; border: 1px solid #006600; background-color: #00CC00; font-family: Arial, Helvetica, sans-serif; color: #000000; padding-left: 20px;">
                    <tr>
                        <td width="50%">Demo İsmi:</td>
                        <td>
                            <asp:Label ID="lbldemoismi" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Ekleyen:</td>
                        <td>
                            <asp:Label ID="lblAdSoyad" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Görüntülenme:</td>
                        <td>
                            <asp:Label ID="lblHit" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Tür:</td>
                        <td>
                            <asp:Label ID="lblTur" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Tarih:</td>
                        <td>
                            <asp:Label ID="lblTarih" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Puan:</td>
                        <td>
                            <div style="border: thin solid #000000; height: 18px; width: 200px; text-align: left;">
                                <asp:Image ID="imgPuan" runat="server" Visible="False" /></div>
                            <asp:Label ID="lblPuan" runat="server" Visible="False" Font-Italic="True"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Puan Ver:</td>
                        <td>
                            <asp:DropDownList ID="ddlPuan" runat="server">
                                <asp:ListItem Selected="True">Seçiniz</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>50</asp:ListItem>
                                <asp:ListItem>60</asp:ListItem>
                                <asp:ListItem>70</asp:ListItem>
                                <asp:ListItem>80</asp:ListItem>
                                <asp:ListItem>90</asp:ListItem>
                                <asp:ListItem>100</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPuanUyari" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnPuan" runat="server" OnClick="btnPuan_Click" Text="Gönder" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <div style="margin: 10px 5px 10px 5px; width: 660px; height: auto;">
        <div style="height: auto; width: 300px; float: left; bottom: 30px;">
            <asp:Repeater ID="rpDemo" runat="server">
                <ItemTemplate>
                    <object type="application/x-shockwave-flash" data="dewplayer-bubble.swf?mp3=Demolar/<%#Eval("Icerik") %>"
                        width="250" height="65" id="dewplayer">
                        <param name="wmode" value="transparent" />
                        <param name="movie" value="dewplayer-vol.swf?mp3=mp3/test1.mp3" />
                    </object>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div style="text-align: right;">
            <asp:LinkButton ID="lnkbtndigerhaberler" runat="server" Text="Kullanıcının Diğer Gönderileri"
                BorderColor="#000099" BorderStyle="Solid" BorderWidth="2px"
                Font-Overline="False" ForeColor="#CC0000"
                OnClick="lnkbtnDiger_Click" CssClass="arama_label"></asp:LinkButton>
        </div>
    </div>
    <div class="temizle"></div>

    <div style="width: 652px; height: auto; margin: 2px; border: 2px solid #669900; background-color: #CCFF99; padding-left: 5px; float: left; padding-right: 5px;">
        <asp:Label ID="lblaciklama" runat="server"></asp:Label>
    </div>
    <div class="temizle"></div>

    <asp:Repeater ID="rpYorumlar" runat="server">
        <ItemTemplate>
            <div id="yorum">
                <div class="yorum_satir1"><%#Eval("Yorum")%></div>
                <div class="yorum_satir">
                    <div class="yorum_sutun1"><%#Eval("AdSoyad")%></div>
                    <div class="yorum_sutun2"><%#Eval("Tarih")%></div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>



    <div class="yorum_ekle">
        <asp:Label ID="lblUyari" runat="server" CssClass="hata"></asp:Label>
        <br />
        <asp:Label ID="lblyorum" runat="server" Text="Bu Alandan Yorum Yapabilirsiniz.Yorumlarınız Onaylandıktan Sonra Sayfada Gözükecektir."
            ForeColor="#003399"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtYorum" runat="server" Height="110px" TextMode="MultiLine"
            Width="638px"></asp:TextBox>
        <asp:Button ID="btnGonder" runat="server" Text="Yorumu Gönder"
            OnClick="btnGonder_Click" />
    </div>



</asp:Content>
