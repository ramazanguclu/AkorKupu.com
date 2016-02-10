using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebApplicationAkorKupu.adminpanel;
using System.IO;
using System.Drawing;

namespace WebApplicationAkorKupu
{
    public partial class UyeOl : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        int sayi; int sayi2;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] != null)
            {
                pnlbilgi.Visible = true;
                pnluyeol.Visible = false;
            }

            else
            {
                pnlbilgi.Visible = false;
                pnluyeol.Visible = true;

            }

            Random sayi2 = new Random();
            sayi = sayi2.Next();

            if (Page.IsPostBack == false)
            {

                meslek();
            }


        }

        void meslek()
        {
            DataTable dtmeslek = klas.GetDataTable("Select * from Meslekler " + "order by [MeslekAdi]");
            ddlMeslek.DataTextField = "MeslekAdi";
            ddlMeslek.DataValueField = "MeslekId";
            ddlMeslek.DataSource = dtmeslek;
            ddlMeslek.DataBind();
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string cinsiyet = ""; string resimadi = ""; string uzanti = "";

            if (rdBay.Checked == true)
                cinsiyet = "Bay";
            else
                cinsiyet = "Bayan";

            DataRow drMail = klas.GetDataRow("Select * from Kullanici where Email='" + Seo.Temizle(txtEmail.Text) + "' ");

            //resim yükleme
            if (fuResim.HasFile)
            {
                uzanti = Path.GetExtension(fuResim.PostedFile.FileName);
                resimadi = Seo.Temizle(txtEmail.Text) + DateTime.Now.Day + uzanti;
                fuResim.SaveAs(Server.MapPath("KullaniciResimleri/Silinecek" + uzanti));

                int deger = 250;//resmimi ufaltacağım boyut

                Bitmap resim = new Bitmap(Server.MapPath("KullaniciResimleri/Silinecek" + uzanti));//silinecek resmimizi bitmap nesnesi yapıyoruz.
                using (Bitmap yeniResim = resim)
                {
                    double Yukseklik = yeniResim.Height;
                    double Genislik = yeniResim.Width;
                    double Oran = 0;

                    if (Genislik >= deger)//boyutlandırma burada yapılıyor.
                    {
                        Oran = Genislik / Yukseklik;//yeni oranı belirliyoruz.
                        Genislik = deger; //genişlik belirlediğimiz değere ayarlanıyor.
                        Yukseklik = deger / Oran;//yeni yükseklik değeri hesaplanıyor.

                        Size yenidegerler = new Size(Convert.ToInt32(Genislik), Convert.ToInt32(Yukseklik));
                        Bitmap SonResim = new Bitmap(yeniResim, yenidegerler);
                        SonResim.Save(Server.MapPath("KullaniciResimleri/" + resimadi));

                        SonResim.Dispose();
                        yeniResim.Dispose();
                        resim.Dispose();
                    }
                    else
                    {
                        fuResim.SaveAs(Server.MapPath("KullaniciResimleri/" + resimadi));//eğer yüklenecek resim değer değişkeninden ufaksa direk yüklenecek.
                    }
                }

                FileInfo fisilinecek = new FileInfo(Server.MapPath("KullaniciResimleri/Silinecek" + uzanti));
                fisilinecek.Delete();
            }
            else
            {
                if (rdBay.Checked)
                    resimadi = "ResimYok.png";
                else
                    resimadi = "ResimYok2.png";
            }


            if (drMail == null)
            {
                SqlConnection baglanti = klas.baglan_iki();
                SqlCommand cmd = new SqlCommand("Insert into Kullanici (Email,Sifre,AdSoyad,MeslekId,Cinsiyet,Dogum,Resim,Sayi,GrupId) values(@Email,@Sifre,@AdSoyad,@MeslekId,@Cinsiyet,@Dogum,@Resim,@Sayi,@GrupId)", baglanti);
                cmd.Parameters.AddWithValue("Email", Seo.Temizle(txtEmail.Text));
                cmd.Parameters.AddWithValue("Sifre", Seo.Temizle(txtSifre.Text));
                cmd.Parameters.AddWithValue("AdSoyad", txtAdSoyad.Text);
                cmd.Parameters.AddWithValue("MeslekId", ddlMeslek.SelectedValue);
                cmd.Parameters.AddWithValue("Cinsiyet", cinsiyet);

                cmd.Parameters.AddWithValue("Dogum", txtDogum.Text);
                cmd.Parameters.AddWithValue("GrupId", "31");
                cmd.Parameters.AddWithValue("Resim", resimadi);
                cmd.Parameters.AddWithValue("Sayi", sayi);
                cmd.ExecuteNonQuery();
                Response.Redirect("UyeTamam.aspx?Email=" + txtEmail.Text);
            }
            else
                lblBilgi.Text = "Bu Email Adresi Sitemizde Kullanılmaktadır.";
        }
    }
}