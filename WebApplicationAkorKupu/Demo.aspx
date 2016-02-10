<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="WebApplicationAkorKupu.Demo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
    <div class="satir_1"></div>
    <div class="satir_2">Eklemek istediğiniz demoyu seçiniz.</div>
    <div class="satir_3"></div>


    <div class="temizle"></div>
    <div class="satir_1">
    </div>
    <div class="satir_2">
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    <div class="satir_3">
        <asp:Label ID="lblUyari" runat="server"></asp:Label>
    </div>

    <div class="temizle"></div>
    <div class="satir_1">İçeriğin Başlığı:</div>
    <div class="satir_2">
        <asp:TextBox ID="txtBaslik" runat="server" Width="200px" Height="23px"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtBaslik" WatermarkText="Demonuzun ismini giriniz." WatermarkCssClass="water"></asp:TextBoxWatermarkExtender>
    </div>
    <div class="satir_3"></div>


    <div class="temizle"></div>
    <div class="satir_11">Açıklama:</div>
    <div class="satir_10">
        <asp:TextBox ID="txtAciklama" runat="server" TextMode="MultiLine" Width="500px"
            Height="60px"></asp:TextBox>
    </div>

    <div class="temizle"></div>
    <div class="satir_1"></div>
    <div class="satir_2">
        <asp:Button ID="btngonder" runat="server" OnClick="btngonder_Click"
            Text="GÖNDER" />
    </div>
    <div class="satir_3"></div>
</asp:Content>
