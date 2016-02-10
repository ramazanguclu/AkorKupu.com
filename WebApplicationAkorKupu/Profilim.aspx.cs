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
    public partial class Profilim : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string IcerikId = ""; string TurId = ""; string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null)
                Response.Redirect("Default.aspx");
            else
            {
                try
                {
                    IcerikId = Request.QueryString["IcerikId"].ToString();
                    TurId = Request.QueryString["TurId"].ToString();
                    islem = Request.QueryString["Islem"].ToString();
                }
                catch (Exception)
                {
                }

                pnlkulbilgi.Visible = true;

                LinkButton lblprofil = (LinkButton)Master.Master.FindControl("lbProfilim");
                lblprofil.Visible = false;
                DataRow drKul = klas.GetDataRow("SELECT dbo.Kullanici.*, dbo.Meslekler.MeslekAdi FROM dbo.Kullanici INNER JOIN dbo.Meslekler ON dbo.Kullanici.MeslekId = dbo.Meslekler.MeslekId Where dbo.Kullanici.KullaniciId=" + Session["KullaniciId"]);
                lblAdSoyad.Text = drKul["AdSoyad"].ToString();
                lblMeslek.Text = drKul["MeslekAdi"].ToString();
                lblEmail.Text = drKul["Email"].ToString();
                //ltrlResim.Text = drKul["Resim"].ToString();
            }

            DataTable dtSarkilar = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Sarkicilar.SarkiciAdi, dbo.Sarkilar.SarkiAdi, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.TurId=1 or dbo.Icerikler.TurId=2 or dbo.Icerikler.TurId=3 and KullaniciId=" + Session["KullaniciId"]);
            dlSarkilarim.DataSource = dtSarkilar;
            dlSarkilarim.DataBind();

            DataTable dtHaberler = klas.GetDataTable("select * from Icerikler where TurId=5 and KullaniciId=" + Session["KullaniciId"]);
            dlHaberlerim.DataSource = dtHaberler;
            dlHaberlerim.DataBind();

            DataTable dtDemolar = klas.GetDataTable("select * from Icerikler where TurId=4 and KullaniciId=" + Session["KullaniciId"]);
            dlDemolarim.DataSource = dtDemolar;
            dlDemolarim.DataBind();



            if (islem == "Sil")
            {
                DataRow resim = klas.GetDataRow("Select * from Icerikler Where IcerikId=" + IcerikId);
                if (TurId == "5")
                {
                    FileInfo firesim = new FileInfo(Server.MapPath("Haber/buyuk/" + resim["Haber"].ToString()));
                    firesim.Delete();
                    firesim = new FileInfo(Server.MapPath("Haber/kucuk/" + resim["Haber"].ToString()));
                    firesim.Delete();
                }

                if (TurId == "4")
                {
                    FileInfo fidemo = new FileInfo(Server.MapPath("Demolar/" + resim["Icerik"].ToString()));
                    fidemo.Delete();
                }

                klas.cmd("Delete from Icerikler where IcerikId=" + IcerikId);
                Response.Redirect("Profilim.aspx");
            }

        }
        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfilDuzenle.aspx");
        }
        protected void lbKulBilgi_Click(object sender, EventArgs e)
        {
            pnlkulbilgi.Visible = true;
            pnlSarkilarim.Visible = false;
            pnlHaberierim.Visible = false;
            pnlDemolarim.Visible = false;
        }
        protected void lbSarkilar_Click(object sender, EventArgs e)
        {
            pnlSarkilarim.Visible = true;
            pnlkulbilgi.Visible = false;
            pnlHaberierim.Visible = false;
            pnlDemolarim.Visible = false;
        }


        protected void lbHaberlerim_Click(object sender, EventArgs e)
        {
            pnlHaberierim.Visible = true;
            pnlkulbilgi.Visible = false;
            pnlSarkilarim.Visible = false;
            pnlDemolarim.Visible = false;
        }
        protected void lbDemolarim_Click(object sender, EventArgs e)
        {
            pnlDemolarim.Visible = true;
            pnlHaberierim.Visible = false;
            pnlkulbilgi.Visible = false;
            pnlSarkilarim.Visible = false;
        }
    }
}