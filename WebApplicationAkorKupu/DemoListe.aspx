<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="DemoListe.aspx.cs" Inherits="WebApplicationAkorKupu.DemoListe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="harfler" style="border: medium solid #FFFF00">
<div class="arama_alani">
<div class="harf_alani">
<asp:DataList ID="dlharf" runat="server" CellPadding="4" ForeColor="#333333" 
        RepeatColumns="4" Width="16px">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <table>
                <tr  ">
                    <td>
                        ARA</td>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>       
            <table>
                <tr>
                    <td>
                        <a href="DemoListe.aspx?Harf=<%#Eval("Harf") %>" style="text-decoration: none; color: #0000FF"><%#Eval("Harf") %></a></td>
                </tr>
            </table>            
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    </div>
    <asp:Panel ID="pnlakorarama" runat="server" Visible="False">
    <div class="akor_arama_alani">
<div class="demo_baslik">Arama</div>
<div class="demo_satir">
<div class="demo_sutun">Demo İsmi</div>
<div class="demo_sutun">Ekleyen</div>
<div class="demo_sutun">Görüntülenme</div>
</div>
<asp:Repeater ID="rparama" runat="server">
    <ItemTemplate>
    <div class="demo_satir">
<a href="DemoSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>"><div class="demo_sutun_iki"><%#Eval("Baslik") %></div></a>
<div class="demo_sutun_iki"><%#Eval("Adsoyad") %></div>
<div class="demo_sutun_iki"><%#Eval("Hit") %></div>
</div>

    </ItemTemplate>
    </asp:Repeater>
    <br />
    <br />
        <asp:Label ID="Label1" runat="server" Text="Label" CssClass="arama_label" 
            Height="20px"></asp:Label>
        <asp:HyperLink ID="linkPrev" runat="server" CssClass="arama_label" 
            Height="20px" Width="60px">Geri</asp:HyperLink>
         <asp:HyperLink ID="linkNext" runat="server" CssClass="arama_label" 
            Height="20px" Width="60px">İleri</asp:HyperLink>
</div>
   
    </asp:Panel>
    

</div>

    <br />
    <br />

<div class="temizle"></div>
    
 <div class="demoliste">
<div class="akor_son_eklenen">
<div class="demo_baslik">Son Eklenen Demolar</div>
<div class="demo_satir">
<div class="demo_sutun">Demo İsmi</div>
<div class="demo_sutun">Ekleyen</div>
<div class="demo_sutun">Tarih</div>
</div>
<asp:Repeater ID="rpdemosoneklenen" runat="server">
    <ItemTemplate>
    <div class="demo_satir">
 <a href="DemoSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>"><div class="demo_sutun_iki"><%#Eval("Baslik") %></div></a>
<div class="demo_sutun_iki"><%#Eval("AdSoyad") %></div>
<div class="demo_sutun_iki"><%#Eval("Tarih") %></div>
</div>
    </ItemTemplate>
    </asp:Repeater>
</div>
</div>

<div class="temizle"></div>
 <div class="demoliste">
<div class="akor_son_eklenen">
<div class="demo_baslik">Populer Demolar</div>
<div class="demo_satir">
<div class="demo_sutun">Demo İsmi</div>
<div class="demo_sutun">Ekleyen</div>
<div class="demo_sutun">Görüntülenme</div>
</div>
<asp:Repeater ID="rppopulerdemolar" runat="server">
    <ItemTemplate>
    <div class="demo_satir">
<a href="DemoSayfasi.aspx?IcerikId=<%#Eval("IcerikId") %>"><div class="demo_sutun_iki"><%#Eval("Baslik")%></div></a>
<div class="demo_sutun_iki"><%#Eval("AdSoyad")%></div>
<div class="demo_sutun_iki"><%#Eval("Hit") %></div>
</div>
    </ItemTemplate>
    </asp:Repeater>
</div>
</div>




    
    </div>
</asp:Content>
