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

namespace WebApplicationAkorKupu
{
    public partial class DemoListe : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string harf = ""; string TurId = "4";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {

                DataTable dtharfler = klas.GetDataTable("select * from Harfler");

                dlharf.DataSource = dtharfler;
                dlharf.DataBind();
                try
                {
                    harf = Request.QueryString["Harf"].ToString();
                }
                catch (Exception)
                {

                }
            }

            if (harf != string.Empty)
            {
                DataTable dtdemoliste = klas.GetDataTable("SELECT dbo.Turler.TurAdi, dbo.Kullanici.AdSoyad, dbo.Icerikler.IcerikId, dbo.Icerikler.TurId, dbo.Icerikler.Baslik, dbo.Icerikler.Tarih, dbo.Icerikler.Onay, dbo.Icerikler.Hit FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=1 and  dbo.Icerikler.TurId='" + TurId + "' and  dbo.Icerikler.Baslik like  '" + harf + "%'   ");
                if (dtdemoliste.Rows.Count > 0)
                {
                    pnlakorarama.Visible = true;

                    PagedDataSource pds = new PagedDataSource();
                    pds.DataSource = dtdemoliste.DefaultView;
                    pds.AllowPaging = true;
                    pds.PageSize = 1;
                    int currentPage;

                    if (Request.QueryString["page"] != null)
                    {
                        currentPage = Int32.Parse(Request.QueryString["page"]);
                    }
                    else
                    {
                        currentPage = 1;
                    }

                    pds.CurrentPageIndex = currentPage - 1;
                    Label1.Text = "Sayfa: " + currentPage + " / " + pds.PageCount;

                    if (!pds.IsFirstPage)
                    {
                        linkPrev.NavigateUrl = "DemoListe.aspx?page=" + (currentPage - 1) + "&Harf=" + harf;
                    }

                    if (!pds.IsLastPage)
                    {
                        linkNext.NavigateUrl = "DemoListe.aspx?page=" + (currentPage + 1) + "&Harf=" + harf;
                    }

                    rparama.DataSource = pds;
                    rparama.DataBind();
                }

                else
                {
                    pnlakorarama.Visible = false;
                }


            }

            DataTable drdemosoneklenen = klas.GetDataTable("SELECT dbo.Icerikler.IcerikId, dbo.Icerikler.TurId, dbo.Icerikler.Baslik, dbo.Icerikler.KullaniciId, dbo.Icerikler.Aciklama, dbo.Icerikler.Tarih, dbo.Icerikler.Onay, dbo.Icerikler.Hit, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=1 and dbo.Icerikler.TurId=4 order by[IcerikId] desc");

            rpdemosoneklenen.DataSource = drdemosoneklenen;
            rpdemosoneklenen.DataBind();

            DataTable drdemopopuler = klas.GetDataTable("SELECT dbo.Icerikler.IcerikId, dbo.Icerikler.TurId, dbo.Icerikler.Baslik, dbo.Icerikler.KullaniciId, dbo.Icerikler.Aciklama, dbo.Icerikler.Tarih, dbo.Icerikler.Onay, dbo.Icerikler.Hit, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=1 and dbo.Icerikler.TurId=4 order by[Hit] desc");

            rppopulerdemolar.DataSource = drdemopopuler;
            rppopulerdemolar.DataBind();
        }
    }
}