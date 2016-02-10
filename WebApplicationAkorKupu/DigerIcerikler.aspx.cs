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
    public partial class DigerIcerikler : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string KullaniciId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            KullaniciId = Request.QueryString["idkullanici"].ToString();
            ltrladsoyad.Text = klas.GetDataCell("Select AdSoyad from Kullanici where KullaniciId=" + KullaniciId);
            ltrlhaber.Text = klas.GetDataCell("Select AdSoyad from Kullanici where KullaniciId=" + KullaniciId);
            ltrldemo.Text = klas.GetDataCell("Select AdSoyad from Kullanici where KullaniciId=" + KullaniciId);

            DataTable dtakorlar = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Turler.TurAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId where dbo.Icerikler.Onay=1 and  dbo.Icerikler.KullaniciId=" + KullaniciId);
            dlakor.DataSource = dtakorlar;
            dlakor.DataBind();


            DataTable dtHaberler = klas.GetDataTable("select * from Icerikler where TurId=5 and Onay=1 and KullaniciId=" + KullaniciId);
            dlHaber.DataSource = dtHaberler;
            dlHaber.DataBind();

            DataTable dtDemolar = klas.GetDataTable("select * from Icerikler where TurId=4 and Onay=1 and KullaniciId=" + KullaniciId);
            dldemo.DataSource = dtDemolar;
            dldemo.DataBind();

        }
    }
}