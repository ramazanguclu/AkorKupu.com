using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebApplicationAkorKupu.adminpanel;
using System.Web.Security;

namespace WebApplicationAkorKupu
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        string adres = "/proje/UyeOl.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
            if (Request.Cookies["cerezim"] != null)
            {
                HttpCookie yakalanancerez = Request.Cookies["cerezim"];
                Session["KullaniciId"] = yakalanancerez.Values["KullaniciId"];
                Session["AdSoyad"] = yakalanancerez.Values["AdSoyad"];
            }
            if (Session["KullaniciId"] != null)
            {
                pnlKulGiris.Visible = false;
                pnlKulBilgi.Visible = true;
                lblAdSoyad.Text = Session["AdSoyad"].ToString();
            }
            else
            {
                if (adres == Request.ServerVariables["URL"].ToString())
                {
                    pnlKulGiris.Visible = false;
                    pnlKulBilgi.Visible = false;

                }
                else
                {
                    pnlKulGiris.Visible = true;
                    pnlKulBilgi.Visible = false;
                }

            }

            if (adres == Request.ServerVariables["URL"].ToString())
            {
                pnlhakkımızda.Visible = false;

            }
            else
            {
                pnlhakkımızda.Visible = true;
            }
        }
        protected void imgGiriş_Click(object sender, ImageClickEventArgs e)
        {
            DataRow drEmail = klas.GetDataRow("Select * from Kullanici Where Email='" + txtEmail.Text + "' ");
            if (drEmail != null)
            {
                DataRow drOnay = klas.GetDataRow("Select * from Kullanici Where Email='" + txtEmail.Text + "' and Onay=1 ");
                if (drOnay != null)
                {
                    DataRow drGiris = klas.GetDataRow("Select * from Kullanici Where Email='" + txtEmail.Text + "' and Sifre='" + txtSifre.Text + "' ");
                    if (drGiris != null)
                    {
                        Session["KullaniciId"] = drGiris["KullaniciId"].ToString();
                        Session["AdSoyad"] = drGiris["AdSoyad"].ToString();
                        if (chckHatirla.Checked)
                        {
                            HttpCookie cerez = new HttpCookie("cerezim");//cerezim isminde bir cookie oluşturuldu.
                            cerez.Values.Add("KullaniciId", drGiris["KullaniciId"].ToString());//cookie ye değer atandı.
                            cerez.Values.Add("AdSoyad", drGiris["AdSoyad"].ToString());//cookie ye değer atandı.
                            cerez.Expires = DateTime.Now.AddDays(30);//cookie 30 gün boyunca kullanılabilir.
                            Response.Cookies.Add(cerez);//cookie eklendi.
                        }
                        Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                    else
                        lblGirisHata.Text = "Şifreyi Hatalı Girdiniz.";
                }
                else
                    lblGirisHata.Text = "Üyeliğiniz henüz onaylanmamıştır.";
            }

            else
                lblGirisHata.Text = "Bu mail adresi sitemizde kayıtlı değildir.";
        }
        protected void lbCikis_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["cerezim"] != null)
            {
                Response.Cookies["cerezim"].Expires = DateTime.Now.AddDays(-1);
            }
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("Default.aspx");

        }
        protected void lbUnuttum_Click(object sender, EventArgs e)
        {
            Response.Redirect("SifremiUnuttum.aspx");
        }
        protected void lbProfilim_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profilim.aspx");
        }
        protected void lbKulBilgi_Click(object sender, EventArgs e)
        {
            Response.Redirect("Hakkımızda.aspx");
        }
        protected void lbSarkilar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Iletisim.aspx");
        }
    }
}