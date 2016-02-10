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
    public partial class Haber : System.Web.UI.Page
    {
        string IcerikId = "";
        Metodlarim klas = new Metodlarim();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null)
            {
                Response.Redirect("GirisYap.aspx");


            }

            secim();

            if (Page.IsPostBack == false)
            {
                tur();
                ddliceriktur.SelectedValue = "5";
            }
        }

        void secim()
        {
            if (ddliceriktur.SelectedValue == "1")
            {
                Response.Redirect("IcerikEkle.aspx");
            }

            if (ddliceriktur.SelectedValue == "2")
            {
                Response.Redirect("IcerikEkle.aspx");
            }

            if (ddliceriktur.SelectedValue == "3")
            {
                Response.Redirect("IcerikEkle.aspx");
            }

            if (ddliceriktur.SelectedValue == "4")
            {
                Response.Redirect("Demo.aspx");
            }

        }

        void tur()
        {
            DataTable dtTur = klas.GetDataTable("Select * from Turler Order by [TurAdi]");
            ddliceriktur.DataTextField = "TurAdi";
            ddliceriktur.DataValueField = "TurId";
            ddliceriktur.DataSource = dtTur;
            ddliceriktur.DataBind();
            ddliceriktur.SelectedValue = "5";
        }

        string resimadi = ""; string uzanti = ""; string resimadi_iki = "";

        protected void btnGonder_Click(object sender, EventArgs e)
        {

            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd1 = new SqlCommand("Insert into Icerikler (TurId) values(@TurId)", baglanti);
            cmd1.Parameters.AddWithValue("TurId", "5");
            cmd1.ExecuteNonQuery();
            IcerikId = klas.GetDataCell("Select top 1 IcerikId from Icerikler Order by [IcerikId] desc");

            //resim yükleme
            if (fuHaberResim.HasFile)
            {
                uzanti = Path.GetExtension(fuHaberResim.PostedFile.FileName);
                resimadi = IcerikId + uzanti;
                fuHaberResim.SaveAs(Server.MapPath("Haber/Silinecek" + uzanti));

                int deger = 475;//resmimi ufaltacağım boyut

                Bitmap resim = new Bitmap(Server.MapPath("Haber/Silinecek" + uzanti));//silinecek resmimizi bitmap nesnesi yapıyoruz.
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
                        SonResim.Save(Server.MapPath("Haber/buyuk/" + resimadi));

                        SonResim.Dispose();
                        yeniResim.Dispose();
                        resim.Dispose();
                    }
                    else
                    {
                        fuHaberResim.SaveAs(Server.MapPath("Haber/buyuk/" + resimadi));//eğer yüklenecek resim değer değişkeninden ufaksa direk yüklenecek.
                    }

                }

                deger = 200;//resmimi ufaltacağım boyut
                int degerboy = 115;

                resim = new Bitmap(Server.MapPath("Haber/Silinecek" + uzanti));//silinecek resmimizi bitmap nesnesi yapıyoruz.
                using (Bitmap yeniResim = resim)
                {
                    double Yukseklik = yeniResim.Height;
                    double Genislik = yeniResim.Width;
                    //double Oran = 0;

                    if (Genislik >= deger && Yukseklik >= degerboy)//boyutlandırma burada yapılıyor.
                    {
                        //Oran = Genislik / Yukseklik;//yeni oranı belirliyoruz.
                        Genislik = deger; //genişlik belirlediğimiz değere ayarlanıyor.
                                          //Yukseklik = deger / Oran;//yeni yükseklik değeri hesaplanıyor.
                        Yukseklik = degerboy;

                        Size yenidegerler = new Size(Convert.ToInt32(Genislik), Convert.ToInt32(Yukseklik));
                        Bitmap SonResim = new Bitmap(yeniResim, yenidegerler);
                        SonResim.Save(Server.MapPath("Haber/kucuk/" + resimadi));

                        SonResim.Dispose();
                        yeniResim.Dispose();
                        resim.Dispose();
                    }
                    else
                    {
                        fuHaberResim.SaveAs(Server.MapPath("Haber/kucuk/" + resimadi));//eğer yüklenecek resim değer değişkeninden ufaksa direk yüklenecek.
                    }

                }



                FileInfo fisilinecek = new FileInfo(Server.MapPath("Haber/Silinecek" + uzanti));
                fisilinecek.Delete();
            }


            SqlCommand cmd = new SqlCommand("Update Icerikler set TurId=@TurId,KullaniciId=@KullaniciId,Baslik=@Baslik,Aciklama=@Aciklama,Tarih=@Tarih,Onay=@Onay,Vitrin=@Vitrin,Hit=@Hit,Icerik=@Icerik,Haber=@Haber Where IcerikId=" + IcerikId, baglanti);
            cmd.Parameters.AddWithValue("TurId", "5");
            cmd.Parameters.AddWithValue("KullaniciId", Session["KullaniciId"]);
            cmd.Parameters.AddWithValue("Baslik", txtBaslik.Text);
            cmd.Parameters.AddWithValue("Aciklama", txtAciklama.Text);
            cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("Haber", resimadi);
            cmd.Parameters.AddWithValue("Onay", "0");
            cmd.Parameters.AddWithValue("Vitrin", "0");
            cmd.Parameters.AddWithValue("Hit", "0");
            cmd.Parameters.AddWithValue("Icerik", txtIcerik.Text);
            cmd.ExecuteNonQuery();
            Response.Redirect("IcerikSon.aspx");

        }


    }
}