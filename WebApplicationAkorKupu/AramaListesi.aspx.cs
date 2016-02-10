using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAkorKupu.adminpanel;
using System.Data;
using System.Data.SqlClient;

namespace WebApplicationAkorKupu
{
    public partial class AramaListesi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        string aramasarkici = ""; string aramasarki = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                aramasarkici = Request.QueryString["aramasarkici"];
                aramasarki = Request.QueryString["aramasarki"];
            }

            if (Page.IsPostBack == true)
            {
                Response.Redirect("Default.aspx");
            }

            if (aramasarkici != null)
            {

                DataTable dtsarkici = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Sarkicilar.SarkiciId AS Expr1, dbo.Sarkicilar.SarkiciAdi, dbo.Sarkilar.SarkiAdi, dbo.Sarkilar.SarkiciId AS Expr2, dbo.Kullanici.AdSoyad,dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId where dbo.Sarkicilar.SarkiciAdi Like '" + aramasarkici + "%' and dbo.Icerikler.Onay=1");
                if (dtsarkici.Rows.Count > 0)
                {
                    lblaramasonuc.Text = aramasarkici + " için sonuçlar:";
                    dlsarkici.DataSource = dtsarkici;
                    dlsarkici.DataBind();
                }
                else
                    lblaramasonuc.Text = aramasarkici + " için kayıtlı bir içerik bulunmadı.";

            }

            else if (aramasarki != null)
            {

                DataTable dtsarki = klas.GetDataTable("SELECT     dbo.Icerikler.*, dbo.Turler.TurAdi, dbo.Sarkicilar.SarkiciAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Sarkilar.SarkiAdi like '" + aramasarki + "%' and dbo.Icerikler.Onay=1   ");
                if (dtsarki.Rows.Count > 0)
                {
                    lblaramasonuc.Text = aramasarki + " için sonuçlar:";
                    dlsarki.DataSource = dtsarki;
                    dlsarki.DataBind();
                }
                else
                    lblaramasonuc.Text = aramasarki + " için kayıtlı bir içerik bulunmadı.";

            }

        }
    }
}