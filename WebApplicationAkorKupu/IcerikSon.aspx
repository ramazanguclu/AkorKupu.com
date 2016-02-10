<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="IcerikSon.aspx.cs" Inherits="WebApplicationAkorKupu.IcerikSon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="ilan_tamam_ad">
        Sayın  
    <asp:Literal ID="ltrlAdSoyad" runat="server"></asp:Literal>
    </div>
    <div class="ilan_tamam">
        <asp:Literal ID="ltrlilanId" runat="server"></asp:Literal>
        nolu içeriğiniz başarıyla kaydedilmiştir. Onaylandıktan sonra sitemizde görüntülenecektir.
    </div>
</asp:Content>
