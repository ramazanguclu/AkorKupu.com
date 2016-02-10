using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebApplicationAkorKupu.adminpanel;

namespace WebApplicationAkorKupu
{
    public partial class HaberListe : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dthaber = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Kullanici.AdSoyad FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId where dbo.Icerikler.TurId=5 and dbo.Icerikler.Onay=1 order by [IcerikId] desc");

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dthaber.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 5;
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
                linkPrev.NavigateUrl = "HaberListe.aspx?page=" + (currentPage - 1);
            }

            if (!pds.IsLastPage)
            {
                linkNext.NavigateUrl = "HaberListe.aspx?page=" + (currentPage + 1);
            }

            rphaber.DataSource = pds;
            rphaber.DataBind();

        }
    }
}