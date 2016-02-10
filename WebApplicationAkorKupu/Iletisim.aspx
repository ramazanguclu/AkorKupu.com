<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="WebApplicationAkorKupu.Iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="pnlmail" runat="server" Visible="false">
        <div class="iletisim">
            Görüş ve Dilekleriniz Bizim İçin Önemlidir.Dilerseniz Aşağıdaki Mail Kutusundan Bize Ulaşabilirsiniz.
            <br />
            <br />
            <div class="iletisimsatir">Ad Soyad:</div>
            <div class="iletisimsatir">
                <asp:TextBox ID="txtadsoyad" runat="server" Height="27px" Width="250px"></asp:TextBox>
            </div>
            <div class="iletisimsatir"></div>
            <div class="temizle"></div>
            <div class="iletisimsatir">E-mail:</div>
            <div class="iletisimsatir">
                <asp:TextBox ID="txtemail" runat="server" Height="27px" Width="250px"></asp:TextBox>
                *
            </div>
            <div class="iletisimsatir"></div>
            <div class="temizle"></div>
            <div class="iletisimsatir">Konu:</div>
            <div class="iletisimsatir">
                <asp:TextBox ID="txtkonu" runat="server" Height="27px" Width="250px"></asp:TextBox>
            </div>
            <div class="iletisimsatir"></div>
            <div class="temizle"></div>
            <asp:TextBox ID="txticeikmail" runat="server" Height="178px" TextMode="MultiLine"
                Width="630px"></asp:TextBox>
            <div class="temizle"></div>
            <asp:Button ID="btnGonder" runat="server" Text="GÖNDER"
                OnClick="btnGonder_Click" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlbilgi" runat="server" Visible="false">
        <div class="iletisim">Mailiniz Başarıyla Gönderilmiştir.Anasayfaya Gitmek İçin <a href="Default.aspx">tıklayınız.</a></div>
    </asp:Panel>

</asp:Content>
