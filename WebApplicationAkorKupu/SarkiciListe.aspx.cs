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
    public partial class SarkiciListe : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        string SarkiciId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            SarkiciId = Request.QueryString["SarkiciId"].ToString();
            if (Page.IsPostBack == false)
            {
                DataTable dtSarkilar = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Turler.TurAdi, dbo.Sarkicilar.SarkiciId AS Expr1, dbo.Sarkicilar.SarkiciAdi, dbo.Sarkilar.SarkiAdi FROM dbo.Icerikler INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId where dbo.Icerikler.SarkiciId=" + SarkiciId);
                dlSarkici.DataSource = dtSarkilar;
                dlSarkici.DataBind();
            }

            lblSarkici.Text = klas.GetDataCell("Select SarkiciAdi from Sarkicilar where SarkiciId=" + SarkiciId);
        }
    }
}