<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="UyeOl.aspx.cs" Inherits="WebApplicationAkorKupu.UyeOl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="pnluyeol" runat="server" Visible="false">
        <div style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #CC0000; text-align: center">
            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
        </div>
        <div class="uyeol_satir">
            <div class="uyeol_sol">E-mail:</div>
            <div class="uyeol_orta">
                <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
            </div>
            <div class="uyeol_sag">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtEmail" CssClass="hata" Display="Dynamic"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email Adresiniz Uygun Değildir!</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtEmail" CssClass="hata" Display="Dynamic">Email Boş Geçilemez!</asp:RequiredFieldValidator>
            </div>

        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol">Şifre:</div>
            <div class="uyeol_orta">
                <asp:TextBox ID="txtSifre" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
            </div>
            <div class="uyeol_sag">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtSifre" CssClass="hata">Şifre Boş Geçilemez!</asp:RequiredFieldValidator>
            </div>
        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol">Şifre(Tekrar):</div>
            <div class="uyeol_orta">
                <asp:TextBox ID="txtSifre_2" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
            </div>
            <div class="uyeol_sag">
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ControlToCompare="txtSifre" ControlToValidate="txtSifre_2" CssClass="hata"
                    Display="Dynamic">Şifreler Uyuşmamaktadır!</asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="txtSifre_2" CssClass="hata" Display="Dynamic">Bu alan boş geçilemez!</asp:RequiredFieldValidator>
            </div>
        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol">Ad Soyad:</div>
            <div class="uyeol_orta">
                <asp:TextBox ID="txtAdSoyad" runat="server" Width="150px"></asp:TextBox>
            </div>
            <div class="uyeol_sag">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtAdSoyad" CssClass="hata">Ad Soyad Boş Geçilemez!</asp:RequiredFieldValidator>
            </div>
        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol">Meslek:</div>
            <div class="uyeol_orta">
                <asp:DropDownList ID="ddlMeslek" runat="server">
                </asp:DropDownList>
            </div>
            <div class="uyeol_sag"></div>
        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol">Cinsiyet:</div>
            <div class="uyeol_orta">
                <asp:RadioButton ID="rdBay" runat="server" Text="Bay" Checked="True"
                    GroupName="Cinsiyet" />
                <asp:RadioButton ID="rdBayan" runat="server" Text="Bayan"
                    GroupName="Cinsiyet" />
            </div>
            <div class="uyeol_sag"></div>
        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol">Doğum Tarihi:</div>
            <div class="uyeol_orta">
                <asp:TextBox ID="txtDogum" runat="server" Width="150px"></asp:TextBox>
                <asp:CalendarExtender DefaultView="Years" ID="CalendarExtender1" TargetControlID="txtDogum" runat="server"></asp:CalendarExtender>
            </div>
            <div class="uyeol_sag"></div>
        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol">Resim:</div>
            <div class="uyeol_orta">
                <asp:FileUpload ID="fuResim" runat="server" Width="187px" />
            </div>
            <div class="uyeol_sag"></div>
        </div>
        <!--uyeol_satir bitti-->

        <div class="uyeol_satir">
            <div class="uyeol_sol"></div>
            <div class="uyeol_orta">
                <asp:Button ID="btnKaydet" runat="server" Text="KAYDET" Width="89px"
                    OnClick="btnKaydet_Click" />
            </div>
            <div class="uyeol_sag"></div>
        </div>
        <!--uyeol_satir bitti-->
    </asp:Panel>

    <asp:Panel ID="pnlbilgi" runat="server" Visible="false">
        <div class="uyeolbilgi">
            Zaten üyesiniz profil sayfanızı görmek için <a href="Profilim.aspx">tıklayınız.</a>
        </div>
    </asp:Panel>
</asp:Content>
