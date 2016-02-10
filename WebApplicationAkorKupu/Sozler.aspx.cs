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
    public partial class Sozler : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string harf = ""; string TurId = "3";
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
                DataTable dtakorliste = klas.GetDataTable("SELECT dbo.Sarkicilar.SarkiciAdi, dbo.Sarkilar.SarkiAdi, dbo.Icerikler.IcerikId, dbo.Icerikler.Icerik,dbo.Icerikler.Baslik, dbo.Icerikler.SarkiId, dbo.Icerikler.SarkiciId, dbo.Icerikler.Hit,dbo.Icerikler.Onay FROM dbo.Icerikler INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=1 and  dbo.Icerikler.TurId='" + TurId + "' and  dbo.Sarkilar.SarkiAdi like  '" + harf + "%'   ");
                if (dtakorliste.Rows.Count > 0)
                {
                    pnlakorarama.Visible = true;

                    PagedDataSource pds = new PagedDataSource();
                    pds.DataSource = dtakorliste.DefaultView;
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
                        linkPrev.NavigateUrl = "Sozler.aspx?page=" + (currentPage - 1) + "&Harf=" + harf;
                    }

                    if (!pds.IsLastPage)
                    {
                        linkNext.NavigateUrl = "Sozler.aspx?page=" + (currentPage + 1) + "&Harf=" + harf;
                    }

                    rparama.DataSource = pds;
                    rparama.DataBind();
                }

                else
                {
                    pnlakorarama.Visible = false;
                }


            }

            DataTable drsonakorlar = klas.GetDataTable("SELECT top 10 dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Sarkicilar.SarkiciAdi, dbo.Turler.TurAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.TurId='" + TurId + "'  and dbo.Icerikler.Onay=1 order by[IcerikId] desc");
            rpsonakorlar.DataSource = drsonakorlar;
            rpsonakorlar.DataBind();


            DataTable drpopulerakor = klas.GetDataTable("SELECT top 10 dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Sarkicilar.SarkiciAdi, dbo.Turler.TurAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.TurId='" + TurId + "'  and dbo.Icerikler.Onay=1 order by[Hit] desc");
            rppopulerakor.DataSource = drpopulerakor;
            rppopulerakor.DataBind();


        }
    }
}