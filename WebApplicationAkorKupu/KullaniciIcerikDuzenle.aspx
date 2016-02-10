<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="KullaniciIcerikDuzenle.aspx.cs" Inherits="WebApplicationAkorKupu.KullaniciIcerikDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 670px; height: auto; margin-top: 20px; margin-bottom: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #000000; font-weight: bold">
                Açıklama:
                <div style="width: 670px; height: auto; margin-top: 5px; margin-bottom: 5px">
                    <asp:TextBox ID="txtAciklama" runat="server" Height="46px"
                        TextMode="MultiLine" Width="560px"></asp:TextBox>
                </div>
            </div>

            <div style="width: 670px; height: auto; margin-top: 20px; margin-bottom: 20px; font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #000000; font-weight: bold">
                İçerik:
                <div style="width: 670px; height: auto; margin-top: 5px; margin-bottom: 5px">
                    <asp:TextBox ID="txtticerik" runat="server" Height="415px"
                        TextMode="MultiLine" Width="560px"></asp:TextBox>
                </div>

            </div>
            <div style="width: 670px; height: auto; margin-top: 10px; margin-bottom: 10px; text-align: center">
                <asp:Button ID="btnicerikguncelle" runat="server"
                    OnClick="btnicerikguncelle_Click" Text="Güncelle" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
