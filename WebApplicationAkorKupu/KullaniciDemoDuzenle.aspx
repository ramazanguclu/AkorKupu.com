<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="KullaniciDemoDuzenle.aspx.cs" Inherits="WebApplicationAkorKupu.KullaniciDemoDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div style="margin: 10px; width: 670px; height: auto">
        <asp:FileUpload ID="fudemo" runat="server" />
        <asp:Label ID="lblUyari" runat="server"></asp:Label>
    </div>

    <div style="width: 670px; height: auto; margin-top: 10px; margin-bottom: 10px; text-align: center">
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
    </div>
    <div class="temizle"></div>
    <div style="width: 670px; height: auto; margin-top: 20px; margin-bottom: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #000000; font-weight: bold">
        Demonun İsmi:
        <div style="width: 670px; height: auto; margin-top: 5px; margin-bottom: 5px">
            <asp:TextBox ID="txtBaslik" runat="server" Height="28px" Width="560px"></asp:TextBox>
        </div>
    </div>
    <div style="width: 670px; height: auto; margin-top: 20px; margin-bottom: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #000000; font-weight: bold">
        Açıklama:
        <div style="width: 670px; height: auto; margin-top: 5px; margin-bottom: 5px">
            <asp:TextBox ID="txtAciklama" runat="server" Height="119px"
                TextMode="MultiLine" Width="560px"></asp:TextBox>
        </div>
    </div>
    <div style="width: 670px; height: auto; margin-top: 10px; margin-bottom: 10px; text-align: center">
        <asp:Button ID="btnicerikguncelle" runat="server"
            OnClick="btnicerikguncelle_Click" Text="Güncelle" />
    </div>

</asp:Content>
