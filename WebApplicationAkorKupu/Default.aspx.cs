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
    public partial class Default : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        int i;
        string duzenlesarkici = ""; string duzenlesarki = "";

        protected void Page_Load(object sender, EventArgs e)
        {


            DataTable drHaber = klas.GetDataTable("SELECT top 3  dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.TurId=5 and dbo.Icerikler.Onay=1 " + " Order by [IcerikId] desc");

            rpHaber.DataSource = drHaber;
            rpHaber.DataBind();

            DataTable drsoneklenen = klas.GetDataTable("SELECT top 10 dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Sarkicilar.SarkiciAdi, dbo.Turler.TurAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where  dbo.Icerikler.Onay=1 and dbo.Icerikler.TurId=1 or dbo.Icerikler.TurId=2 or dbo.Icerikler.TurId=3 order by[IcerikId] desc");

            rpsoneklenen.DataSource = drsoneklenen;
            rpsoneklenen.DataBind();

            DataTable drpopuler = klas.GetDataTable("SELECT top 10 dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Sarkicilar.SarkiciAdi, dbo.Turler.TurAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where  dbo.Icerikler.Onay=1 and dbo.Icerikler.TurId=1 or dbo.Icerikler.TurId=2 or dbo.Icerikler.TurId=3  order by[Hit] desc");

            rppopulersarkilar.DataSource = drpopuler;
            rppopulersarkilar.DataBind();

            DataTable drdemosoneklenen = klas.GetDataTable("SELECT top 10 dbo.Icerikler.IcerikId, dbo.Icerikler.TurId, dbo.Icerikler.Baslik, dbo.Icerikler.KullaniciId, dbo.Icerikler.Aciklama, dbo.Icerikler.Tarih, dbo.Icerikler.Onay, dbo.Icerikler.Hit, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=1 and dbo.Icerikler.TurId=4 order by[IcerikId] desc");

            rpdemosoneklenen.DataSource = drdemosoneklenen;
            rpdemosoneklenen.DataBind();

            DataTable drdemopopuler = klas.GetDataTable("SELECT top 10 dbo.Icerikler.IcerikId, dbo.Icerikler.TurId, dbo.Icerikler.Baslik, dbo.Icerikler.KullaniciId, dbo.Icerikler.Aciklama, dbo.Icerikler.Tarih, dbo.Icerikler.Onay, dbo.Icerikler.Hit, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=1 and dbo.Icerikler.TurId=4 order by[Hit] desc");

            rppopulerdemolar.DataSource = drdemopopuler;
            rppopulerdemolar.DataBind();

            DataTable drsonuyeler = klas.GetDataTable("SELECT TOP 10 * from Kullanici where Onay=1 order by[KullaniciId] desc");
            rpsonuye.DataSource = drsonuyeler;
            rpsonuye.DataBind();
        }

        protected void btnsarkici_Click(object sender, EventArgs e)
        {
            if (txtsarkiciara.Text != string.Empty)
            {
                duzenlesarkici = klasyeni.TextLowerAndFirstUpper(txtsarkiciara.Text);
                Response.Redirect("AramaListe.aspx?aramasarkici=" + duzenlesarkici);
            }
        }

        protected void btnsarki_Click(object sender, EventArgs e)
        {
            if (txtsarkiara.Text != string.Empty)
            {
                duzenlesarki = klasyeni.TextLowerAndFirstUpper(txtsarkiara.Text);
                Response.Redirect("AramaListe.aspx?aramasarki=" + duzenlesarki);
            }
        }
    }
}