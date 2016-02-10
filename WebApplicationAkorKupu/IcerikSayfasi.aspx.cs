using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebApplicationAkorKupu.adminpanel;

namespace WebApplicationAkorKupu
{
    public partial class IcerikSayfasi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        string ip = "";
        string IcerikId = "";
        string adsoyad = "";
        string IpId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            IcerikId = Request.QueryString["IcerikId"].ToString();

            if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            }
            else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
            {
                ip = HttpContext.Current.Request.UserHostAddress;
            }


            DataRow drbilgiler = klas.GetDataRow("SELECT dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Sarkicilar.SarkiciAdi, dbo.Turler.TurAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.IcerikId=" + IcerikId);
            lblAdSoyad.Text = drbilgiler["AdSoyad"].ToString();
            lblHit.Text = drbilgiler["Hit"].ToString();
            lblSarki.Text = drbilgiler["SarkiAdi"].ToString();
            lblBaslik.Text = drbilgiler["Baslik"].ToString();
            lblSarkici.Text = drbilgiler["SarkiciAdi"].ToString();
            lblTarih.Text = drbilgiler["Tarih"].ToString();
            lblTur.Text = drbilgiler["TurAdi"].ToString();


            DataTable dticerik = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Sarkicilar.SarkiciAdi FROM dbo.Icerikler INNER JOIN  dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId where dbo.Icerikler.IcerikId=" + IcerikId);
            rpicerik.DataSource = dticerik;
            rpicerik.DataBind();

            string pu = klas.GetDataCell("select AVG(Puan) from Ip where IcerikId=" + IcerikId);
            lblPuan.Text = "%" + pu;
            if (lblPuan.Text == "%")
            {
                lblPuan.Visible = false;
            }
            else
            {
                lblPuan.Visible = true;
            }
            if (pu != string.Empty)
            {
                int a = Convert.ToInt32(pu);
                imgPuan.Visible = true;
                if (a > 90 && a <= 100)
                {
                    imgPuan.ImageUrl = "images/puan/200.png";
                }
                else if (a > 80 && a <= 90)
                {
                    imgPuan.ImageUrl = "images/puan/180.png";
                }
                else if (a > 70 && a <= 80)
                {
                    imgPuan.ImageUrl = "images/puan/160.png";
                }
                else if (a > 60 && a <= 70)
                {
                    imgPuan.ImageUrl = "images/puan/140.png";
                }
                else if (a > 50 && a <= 60)
                {
                    imgPuan.ImageUrl = "images/puan/120.png";
                }
                else if (a > 40 && a <= 50)
                {
                    imgPuan.ImageUrl = "images/puan/100.png";
                }
                else if (a > 30 && a <= 40)
                {
                    imgPuan.ImageUrl = "images/puan/80.png";
                }
                else if (a > 20 && a <= 30)
                {
                    imgPuan.ImageUrl = "images/puan/60.png";
                }
                else if (a > 10 && a <= 20)
                {
                    imgPuan.ImageUrl = "images/puan/40.png";
                }
                else if (5 > 40 && a <= 10)
                {
                    imgPuan.ImageUrl = "images/puan/20.png";
                }
                else if (0 > 40 && a <= 5)
                {
                    imgPuan.ImageUrl = "images/puan/0.png";
                }

            }


            DataTable dtYorumlar = klas.GetDataTable("Select  * from Yorumlar where IcerikId='" + IcerikId + "' order by[IcerikId]  desc");
            rpYorumlar.DataSource = dtYorumlar;
            rpYorumlar.DataBind();
            try
            {
                adsoyad = klas.GetDataCell("Select AdSoyad from Kullanici where KullaniciId=" + Session["KullaniciId"]);
            }
            catch (Exception)
            {
            }


            DataRow drIp = klas.GetDataRow("Select * from Ip Where IcerikId='" + IcerikId + "' and IpAdi='" + ip + "' ");
            if (drIp == null)
            {
                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("Insert into Ip (IcerikId,IpAdi,Tarih) values(@IcerikId,@IpAdi,@Tarih)", baglanti);
                cmd.Parameters.AddWithValue("IcerikId", IcerikId);
                cmd.Parameters.AddWithValue("IpAdi", ip);
                cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToString());
                cmd.ExecuteNonQuery();

                string hit = klas.GetDataCell("Select Hit from Icerikler where IcerikId=" + IcerikId);
                int gor = Convert.ToInt32(hit);
                gor = gor + 1;
                hit = gor.ToString();

                SqlConnection baglanti2 = klas.baglan();
                SqlCommand cmd2 = new SqlCommand("Update Icerikler set Hit=@Hit Where IcerikId=" + IcerikId, baglanti2);
                cmd2.Parameters.AddWithValue("Hit", hit);
                cmd2.ExecuteNonQuery();

            }
            IpId = klas.GetDataCell("Select IpId from Ip where IcerikId='" + IcerikId + "' and IpAdi='" + ip + "'  ");
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null)
            {
                lblUyari.Text = "Üye Girişi Yapmalısınız!";
                lblyorum.Visible = false;
            }
            else
            {
                lblyorum.Visible = true;
                SqlConnection baglanti1 = klas.baglan();
                SqlCommand cmd1 = new SqlCommand("Insert into Yorumlar (Yorum,IcerikId,Tarih,AdSoyad,Onay) values(@Yorum,@IcerikId,@Tarih,@AdSoyad,@Onay)", baglanti1);
                cmd1.Parameters.AddWithValue("Yorum", txtYorum.Text);
                cmd1.Parameters.AddWithValue("IcerikId", IcerikId);
                cmd1.Parameters.AddWithValue("Tarih", DateTime.Now.ToString());
                cmd1.Parameters.AddWithValue("AdSoyad", adsoyad);
                cmd1.Parameters.AddWithValue("Onay", "0");
                cmd1.ExecuteNonQuery();
                Response.Redirect("IcerikSayfasi.aspx?IcerikId=" + IcerikId);
            }

        }
        protected void btnPuan_Click(object sender, EventArgs e)
        {
            string Puan = klas.GetDataCell("Select Puan from Ip where IpId=" + IpId);
            if (Puan == string.Empty)
            {
                if (ddlPuan.SelectedItem.Text != "Seçiniz")
                {
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd = new SqlCommand("Update  Ip set Puan=@Puan where IpId=" + IpId, baglanti);
                    cmd.Parameters.AddWithValue("Puan", Convert.ToInt32(ddlPuan.SelectedItem.Text));
                    cmd.ExecuteNonQuery();
                    Response.Redirect("IcerikSayfasi.aspx?IcerikId=" + IcerikId);
                }
                else
                { lblPuanUyari.Text = "Lütfen Bir Seçim Yapınız!"; }
            }
            else
            {
                lblPuanUyari.Text = "Daha Önce Puanlama Yaptınız!";
            }
        }
    }
}