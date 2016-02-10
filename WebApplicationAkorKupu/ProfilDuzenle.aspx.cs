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
    public partial class ProfilDuzenle : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null)
                Response.Redirect("Default.aspx");
            if (Page.IsPostBack == false)
            {
                meslek();
                DataRow drKul = klas.GetDataRow("SELECT dbo.Meslekler.MeslekAdi, dbo.Kullanici.*  FROM dbo.Kullanici INNER JOIN dbo.Meslekler ON dbo.Kullanici.MeslekId = dbo.Meslekler.MeslekId where dbo.Kullanici.KullaniciId=" + Session["KullaniciId"]);
                txtAdSoyad.Text = drKul["AdSoyad"].ToString();
                ddlMeslek.SelectedValue = drKul["MeslekId"].ToString();
                imgResim.ImageUrl = "KullaniciResimleri/" + drKul["Resim"].ToString();
            }
        }
        void meslek()
        {
            DataTable dtMeslekler = klas.GetDataTable("Select * from Meslekler " + " order by [MeslekAdi]");
            ddlMeslek.DataTextField = "MeslekAdi";
            ddlMeslek.DataValueField = "MeslekId";
            ddlMeslek.DataSource = dtMeslekler;
            ddlMeslek.DataBind();
        }



        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            DataRow drKul = klas.GetDataRow("SELECT dbo.Meslekler.MeslekAdi, dbo.Kullanici.*  FROM dbo.Kullanici INNER JOIN dbo.Meslekler ON dbo.Kullanici.MeslekId = dbo.Meslekler.MeslekId where dbo.Kullanici.KullaniciId=" + Session["KullaniciId"]);
            if (txtsifre.Text != string.Empty)
                if (txtsifre.Text == drKul["Sifre"].ToString())
                {
                    if (txtyenisifre.Text == string.Empty)
                    {
                        txtyenisifre.Text = txtsifre.Text;
                    }

                    {
                        string resimadi = ""; string uzanti = "";
                        if (fuResim.HasFile)
                        {
                            //eski resimler siliniyor.
                            string resimadi2 = "";
                            resimadi2 = klas.GetDataCell("Select Resim from Kullanici Where KullaniciId=" + Session["KullaniciId"]);
                            if (resimadi2 != "ResimYok.png")
                            {
                                if (resimadi2 != "ResimYok2.png")
                                {
                                    FileInfo fiResim = new FileInfo(Server.MapPath("KullaniciResimleri/" + resimadi2));
                                    fiResim.Delete();
                                }
                            }
                            //resim yükleniyor
                            DataRow drEmail = klas.GetDataRow("Select Email from Kullanici Where KullaniciId=" + Session["KullaniciId"]);
                            uzanti = Path.GetExtension(fuResim.PostedFile.FileName);
                            resimadi = Seo.Temizle(drEmail["Email"].ToString()) + DateTime.Now.Day + uzanti;
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
                            DataRow drResimadi = klas.GetDataRow("Select Resim from Kullanici Where KullaniciId=" + Session["KullaniciId"]);
                            resimadi = drResimadi["Resim"].ToString();
                        }
                        SqlConnection baglanti = klas.baglan();
                        SqlCommand cmd = new SqlCommand("Update Kullanici Set Resim=@Resim, AdSoyad=@AdSoyad, MeslekId=@MeslekId,Sifre=@Sifre Where KullaniciId=" + Session["KullaniciId"], baglanti);
                        cmd.Parameters.AddWithValue("Resim", resimadi);
                        cmd.Parameters.AddWithValue("AdSoyad", txtAdSoyad.Text);
                        cmd.Parameters.AddWithValue("Sifre", txtyenisifre.Text);
                        cmd.Parameters.AddWithValue("MeslekId", ddlMeslek.SelectedValue);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("Profilim.aspx");
                    }


                }
                else
                {
                    Label1.Text = "Şifrenizi Yanlış Girdiniz.";
                }
            else
            {
                Label1.Text = " Şifrenizi Giriniz.";
            }
        }
    }
}