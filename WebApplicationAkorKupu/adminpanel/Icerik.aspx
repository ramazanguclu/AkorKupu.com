<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/AdminPaneli.Master" AutoEventWireup="true" CodeBehind="Icerik.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.Icerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 10px; width: 750px; height: auto">
        <asp:Image ID="imgresim" runat="server" Visible="false" /></div>
    <div style="width: 750px; height: auto; margin-top: 10px; margin-bottom: 10px;">
        <asp:TextBox ID="txticerikakor" runat="server" Height="466px"
            TextMode="MultiLine" Width="725px"></asp:TextBox>
    </div>

    <div style="width: 740px; height: auto; background-color: #339933">
        <asp:Repeater ID="rphaberbilgi" runat="server">
            <ItemTemplate>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Başlik:<%#Eval("Baslik") %></div>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Açıklama:<%#Eval("Aciklama") %></div>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Tarih:<%#Eval("Tarih") %></div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


    <div style="width: 740px; height: auto; background-color: #339933">
        <asp:Repeater ID="rpiceribilgi" runat="server">
            <ItemTemplate>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Başlik:<%#Eval("Baslik") %></div>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Açıklama:<%#Eval("Aciklama") %></div>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Şarkı:<%#Eval("SarkiAdi") %></div>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Şarkıcı:<%#Eval("SarkiciAdi") %></div>
                <div style="height: auto; width: 740px; margin-top: 5px; margin-bottom: 5px;">Tarih:<%#Eval("Tarih") %></div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div style="width: 750px; height: auto">
        <div style="height: auto; width: 750px; float: left; bottom: 30px; background-color: #CC6600;">
            <div style="height: auto; width: 300px; float: left; bottom: 30px; background-color: #993300;">
                <asp:Repeater ID="rponaydemo" runat="server">
                    <ItemTemplate>
                        <object type="application/x-shockwave-flash" data="dewplayer-bubble.swf?mp3=../Demolar/<%#Eval("Icerik") %>"
                            width="250" height="65" id="dewplayer">
                            <param name="wmode" value="transparent" />
                            <param name="movie" value="dewplayer-vol.swf?mp3=mp3/test1.mp3" />
                        </object>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <asp:Repeater ID="rpdemobilgi" runat="server">
                <ItemTemplate>
                    <div style="width: 450px; height: auto; float: right">Demo İsmi: <%#Eval("Baslik") %></div>
                    <div style="width: 450px; height: auto; float: right">Açıklama: <%#Eval("Aciklama") %></div>
                    <div style="width: 450px; height: auto; float: right">Eklenme: <%#Eval("Tarih") %></div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
