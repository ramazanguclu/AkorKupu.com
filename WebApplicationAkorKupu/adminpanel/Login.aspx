<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationAkorKupu.adminpanel.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 400px;
        }

        .style3 {
            width: 9%;
        }
    </style>
</head>
<body style="background-image: url('images/bg_login.png'); background-repeat: repeat-x;">
    <form id="form1" runat="server">
        <table class="style1">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center; font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-style: normal; color: #0000FF; font-weight: bolder;">&nbsp;Akor Kupu.com Yönetim Paneli</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table align="center" class="style2" style="border: medium double #3333CC">
                        <tr>
                            <td colspan="2" style="text-align: center" width="30%">
                                <asp:Label ID="lblBilgi" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">Email:</td>
                            <td>
                                <asp:TextBox ID="txtKullaniciGiris" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">Şifre:</td>
                            <td>
                                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">&nbsp;</td>
                            <td>
                                <asp:Button ID="BtnGiris" runat="server" OnClick="BtnGiris_Click"
                                    Text="Giriş" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
