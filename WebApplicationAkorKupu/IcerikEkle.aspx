<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="IcerikEkle.aspx.cs" Inherits="WebApplicationAkorKupu.IcerikEkle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="temizle"></div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="satir_1">İçeriğin Türü:</div>
            <div class="satir_2">
                <asp:DropDownList ID="ddliceriktur" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="satir_3">
            </div>

            <div class="temizle"></div>
            <div class="satir_1">Şarkıcı:</div>
            <div class="satir_2">
                <asp:DropDownList ID="ddlSarkici" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlSarkici_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Button ID="btnSarkiciEkle" runat="server" Text="Yeni Ekle"
                    OnClick="btnSarkiciEkle_Click" />
            </div>
            <div class="satir_3">
                <asp:Literal ID="ltrlHata" runat="server" Visible="False"></asp:Literal>
            </div>

            <div class="temizle"></div>
            <div class="satir_7">
                <asp:Label ID="lblYeniSarkici" runat="server" Text="Şarkıcı İsmini Giriniz:"
                    Height="30px" Visible="False"></asp:Label>
            </div>
            <div class="satir_8">
                <asp:TextBox ID="txtYeniSarkici" runat="server" Height="30px" Visible="False"></asp:TextBox>
                <asp:Button ID="btnSarkiciKaydet" runat="server" Text="Kaydet" Height="30px"
                    OnClick="btnSarkiciKaydet_Click" Visible="False" Width="81px" />
            </div>
            <div class="satir_9">
                <asp:Button ID="btnSarkiSec" runat="server" OnClick="btnSarkiSec_Click"
                    Text="Şarkı Seç" />
            </div>

            <div class="temizle"></div>
            <div class="satir_1"></div>
            <div class="satir_2">
                <asp:Label ID="lblSarkiSec" runat="server" Visible="false"
                    Text="Listede İçeriğinize Ait Şarkı Yoksa Ekleyiniz!"></asp:Label>
            </div>
            <div class="satir_3"></div>

            <asp:Panel ID="pnlSarki" runat="server" Visible="False">
                <div class="temizle"></div>
                <div class="satir_1">Şarkı</div>
                <div class="satir_2">
                    <asp:DropDownList ID="ddlSarki" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:Button ID="btnSarkiEkle" runat="server" Text="Yeni Ekle"
                        OnClick="btnSarkiEkle_Click" Height="30px" Width="80px" />
                </div>
                <div class="satir_3">
                    <asp:Literal ID="ltrlŞarkiHata" runat="server" Visible="False"></asp:Literal>
                </div>

                <div class="temizle"></div>
                <div class="satir_7">
                    <asp:Label ID="lblYeniSarki" runat="server" Text="Şarkı İsmini Giriniz:"
                        Height="30px" Visible="False"></asp:Label>
                </div>
                <div class="satir_8">
                    <asp:TextBox ID="txtYeniSarki" runat="server" Height="30px" Visible="False"></asp:TextBox>
                    <asp:Button ID="btnSarkiKaydet" runat="server" Text="Kaydet" Height="30px"
                        Visible="False" Width="80px" OnClick="btnSarkiKaydet_Click" />
                </div>
                <div class="satir_9">
                    <asp:Button ID="btnSarkiOnay" runat="server" OnClick="btnSarkiOnay_Click"
                        Text="Şarkı Onay" />
                </div>
            </asp:Panel>

            <div class="temizle"></div>
            <asp:Panel ID="pnlicerik" runat="server" Enabled="True" Visible="False">
                <div class="satir_5">İçerik:</div>
                <div class="satir_4">
                    <asp:TextBox ID="txtIcerik" runat="server" TextMode="MultiLine" Width="500px"
                        Height="600px" AutoPostBack="True"></asp:TextBox>
                </div>
            </asp:Panel>

            <div class="temizle"></div>
            <div class="satir_11">Açıklama:</div>
            <div class="satir_10">
                <asp:TextBox ID="txtAciklama" runat="server" TextMode="MultiLine" Width="500px"
                    Height="60px"></asp:TextBox>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="temizle"></div>
    <div class="satir_1"></div>
    <div class="satir_2">
        <asp:Button ID="btnGonder" runat="server" Text="GÖNDER"
            OnClick="btnGonder_Click" Enabled="True" />

    </div>
    <div class="satir_3"></div>

</asp:Content>
