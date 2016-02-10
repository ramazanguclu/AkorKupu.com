<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Haber.aspx.cs" Inherits="WebApplicationAkorKupu.Haber" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="satir_1">İçeriğin Türü:</div>
            <div class="satir_2">
                <asp:DropDownList ID="ddliceriktur" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="satir_3">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="temizle"></div>
    <div class="satir_7">Haber Resmi:</div>
    <div class="satir_8">
        <asp:FileUpload ID="fuHaberResim" runat="server" />
    </div>
    <div class="satir_9">
    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="temizle"></div>
            <div class="satir_1">İçeriğin Başlığı:</div>
            <div class="satir_2">
                <asp:TextBox ID="txtBaslik" runat="server" Width="200px" Height="23px"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtBaslik" WatermarkCssClass="water" WatermarkText="Lütfen Haberinizin Başlığını Giriniz."></asp:TextBoxWatermarkExtender>
            </div>
            <div class="satir_3"></div>

            <div class="temizle"></div>
            <asp:Panel ID="pnlicerik" runat="server" Enabled="True">
                <div class="satir_5">İçerik:</div>
                <div class="satir_4">
                    <asp:TextBox ID="txtIcerik" runat="server" TextMode="MultiLine" Width="500px"
                        Height="600px" AutoPostBack="True"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txtIcerik"
                        WatermarkCssClass="water" WatermarkText="Bu alana haberin gövde kısmını giriniz."></asp:TextBoxWatermarkExtender>
                </div>
            </asp:Panel>

            <div class="temizle"></div>
            <div class="satir_11">Açıklama:</div>
            <div class="satir_10">
                <asp:TextBox ID="txtAciklama" runat="server" TextMode="MultiLine" Width="500px"
                    Height="60px"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="txtAciklama"
                    WatermarkCssClass="water" WatermarkText="Bu alana haberin giriş kısmını giriniz."></asp:TextBoxWatermarkExtender>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="temizle"></div>
    <div class="satir_1"></div>
    <div class="satir_2">
        <asp:Button ID="btnGonder" runat="server" Text="GÖNDER"
            OnClick="btnGonder_Click" />

    </div>
    <div class="satir_3"></div>
</asp:Content>
