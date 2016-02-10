<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="IcerikSayfasi.aspx.cs" Inherits="WebApplicationAkorKupu.IcerikSayfasi" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <table style="width: 100%; border: 2px solid #000066; background-color: #00CCFF">
        <tr>
            <td style="font-family: Arial, Helvetica, sans-serif; width: auto; color: #CC0000; font-weight: bold; text-align: center">BİLGİLER</td>
        </tr>
        <tr style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #000000">
            <td>
                <table style="width: 100%; border: 1px solid #006600; background-color: #00CC00; font-family: Arial, Helvetica, sans-serif; color: #000000; padding-left: 20px;">
                    <tr>
                        <td width="50%">Şarkıcı İsmi:</td>
                        <td>
                            <asp:Label ID="lblSarkici" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Şarkı İsmi:</td>
                        <td>
                            <asp:Label ID="lblSarki" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 23px">Versiyon:</td>
                        <td style="height: 23px">
                            <asp:Label ID="lblBaslik" runat="server"></asp:Label>
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
                        <td style="height: 23px">Tür:</td>
                        <td style="height: 23px">
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
    <div class="icerik">
        <asp:Repeater ID="rpicerik" runat="server">
            <ItemTemplate>
                <pre>
                <%#Eval("Icerik") %>
                <br />
                <br />
                 <%#Eval("Aciklama") %>
                </pre>
                <br />
                <br />
                <div class="sarkiciadi"><a href="SarkiciListe.aspx?SarkiciId=<%#Eval("SarkiciId") %>" style="color: #FF0000">Diğer <%#Eval("SarkiciAdi") %> akor-tab ve şarkı sözleri</a></div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="temizle"></div>

    <asp:Repeater ID="rpYorumlar" runat="server">
        <ItemTemplate>
            <div id="yorum">
                <div class="yorum_satir1">
                    <pre><%# Eval("Yorum")%></pre>
                </div>
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
