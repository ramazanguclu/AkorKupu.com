using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplicationAkorKupu.adminpanel
{
    public partial class KullaniciDuzenle : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string KullaniciId = "";
        string cinsiyet = "";
        string engel = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            KullaniciId = Request.QueryString["KullaniciId"];
            if (Page.IsPostBack == false)
            {
                DataRow drKullanici = klas.GetDataRow("SELECT dbo.Kullanici.*, dbo.KullaniciGrup.GrupAdi FROM dbo.Kullanici INNER JOIN dbo.KullaniciGrup ON dbo.Kullanici.GrupId = dbo.KullaniciGrup.GrupId Where dbo.Kullanici.KullaniciId=" + KullaniciId);
                txtAdSoyad.Text = drKullanici["AdSoyad"].ToString();
                txtKullaniciAdi.Text = drKullanici["KullaniciAdi"].ToString();
                txtEmail.Text = drKullanici["Email"].ToString();
                txtSifre.Text = drKullanici["Sifre"].ToString();
                txtDogum.Text = drKullanici["Dogum"].ToString();
                Grup();
                DdlGörevi.SelectedValue = drKullanici["GrupId"].ToString();

                if (drKullanici["Cinsiyet"].ToString() == "Bay")
                {
                    rdBay.Checked = true;
                }
                else
                    rdBayan.Checked = true;

                if (drKullanici["Engel"].ToString() == "0")
                {
                    rdHayır.Checked = true;
                }
                else
                    rdEvet.Checked = true;
            }

        }

        void Grup()
        {
            DataTable dtGrup = klas.GetDataTable("Select * from KullaniciGrup");
            DdlGörevi.DataTextField = "GrupAdi";
            DdlGörevi.DataValueField = "GrupId";
            DdlGörevi.DataSource = dtGrup;
            DdlGörevi.DataBind();
        }
        protected void btnGüncelle_Click(object sender, EventArgs e)
        {
            if (rdBay.Checked == true)
                cinsiyet = "Bay";
            else
                cinsiyet = "Bayan";

            if (rdHayır.Checked == true)
                engel = "0";
            else
                engel = "1";

            DataRow drKul = klas.GetDataRow("Select * from Kullanici Where KullaniciId=" + KullaniciId);
            DataRow drKullanici = klas.GetDataRow("Select * from Kullanici Where KullaniciAdi='" + txtKullaniciAdi.Text + "' and KullaniciAdi!='" + drKul["KullaniciAdi"].ToString() + "'  ");
            if (drKullanici == null)
            {
                DataRow drEmail = klas.GetDataRow("Select * from Kullanici Where Email='" + txtEmail.Text + "' and Email!='" + drKul["Email"].ToString() + "'  ");
                if (drEmail == null)
                {
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd = new SqlCommand("Update Kullanici Set GrupId=@GrupId,KullaniciAdi=@KullaniciAdi,Sifre=@Sifre,AdSoyad=@AdSoyad,Email=@Email,Cinsiyet=@Cinsiyet,Dogum=@Dogum,Engel=@Engel Where KullaniciId=" + KullaniciId, baglanti);

                    cmd.Parameters.AddWithValue("GrupId", DdlGörevi.SelectedValue);
                    cmd.Parameters.AddWithValue("KullaniciAdi", txtKullaniciAdi.Text);
                    cmd.Parameters.AddWithValue("Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("AdSoyad", txtAdSoyad.Text);
                    cmd.Parameters.AddWithValue("Sifre", txtSifre.Text);
                    cmd.Parameters.AddWithValue("Cinsiyet", cinsiyet);
                    cmd.Parameters.AddWithValue("Dogum", txtDogum.Text);
                    cmd.Parameters.AddWithValue("Engel", engel);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("AdminYonetimi.aspx");
                }
                else lblBilgi.Text = "Bu Email kullanılmaktadır.";
            }
            else lblBilgi.Text = "Bu isimde bir kullanıcı bulunmaktadır.";
        }
    }
}