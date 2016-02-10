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
    public partial class AdminYonetimi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string aranacak = ""; string islem = ""; string KullaniciId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                aranacak = Request.QueryString["aranacak"];
                islem = Request.QueryString["islem"];
                KullaniciId = Request.QueryString["KullaniciId"];
            }
            catch (Exception)
            { }

            if (islem == "sil")
            {
                klas.cmd_iki("Delete from Kullanici Where KullaniciId=" + KullaniciId);
                Response.Redirect("AdminYonetimi.aspx");
            }

            if (aranacak != null)
            {
                DataTable dtAra = klas.GetDataTable("SELECT dbo.Kullanici.*, dbo.Kullanici_Grup.GrupAdı FROM dbo.Kullanici INNER JOIN dbo.Kullanici_Grup ON dbo.Kullanici.GrupId = dbo.Kullanici_Grup.GrupId Where AdSoyad like '%" + aranacak + "%' or KullaniciAdi like '%" + aranacak + "%' ");
                dlAra.DataSource = dtAra;
                dlAra.DataBind();

                if (dtAra.Rows.Count > 0)
                {
                    lblAra.Text = dtAra.Rows.Count.ToString() + " Adet Kullanıcı Bulunmuştur.";
                    dlAra.Visible = true;
                }

                else
                {
                    lblAra.Text = "Üzgünüz aradığınız isimde bir kullanıcı bulunamdı.";
                    dlAra.Visible = false;
                }
            }

            else
            {
                lblAra.Text = "Lüffen bir isim giriniz.";
            }
        }
        protected void btnyonetici_Click(object sender, EventArgs e)
        {
            DataRow drKullanici = klas.GetDataRow("Select GrupId from KullaniciGrup Where GrupAdi='" + "Yönetici" + "'");
            DataTable dtKullanici = klas.GetDataTable("SELECT dbo.Kullanici.*, dbo.KullaniciGrup.GrupAdi FROM dbo.Kullanici INNER JOIN dbo.KullaniciGrup ON dbo.Kullanici.GrupId = dbo.KullaniciGrup.GrupId Where dbo.Kullanici.GrupId=" + drKullanici["GrupId"].ToString());
            dlKullanici.DataSource = dtKullanici;
            dlKullanici.DataBind();
            if (dtKullanici.Rows.Count == 0)
                dlKullanici.Visible = false;
            else
                dlKullanici.Visible = true;
        }
        protected void btnkullanici_Click(object sender, EventArgs e)
        {
            DataRow drKullanici = klas.GetDataRow("Select GrupId from KullaniciGrup Where GrupAdi='" + "Kullanıcı" + "'");
            DataTable dtKullanici = klas.GetDataTable("SELECT dbo.Kullanici.*, dbo.KullaniciGrup.GrupAdi FROM dbo.Kullanici INNER JOIN dbo.KullaniciGrup ON dbo.Kullanici.GrupId = dbo.KullaniciGrup.GrupId Where dbo.Kullanici.GrupId=" + drKullanici["GrupId"].ToString());
            dlKullanici.DataSource = dtKullanici;
            dlKullanici.DataBind();
            if (dtKullanici.Rows.Count == 0)
                dlKullanici.Visible = false;
            else
                dlKullanici.Visible = true;
        }
        protected void btnson_Click(object sender, EventArgs e)
        {
            DataTable dtKullanici = klas.GetDataTable("SELECT Top 20 dbo.Kullanici.*, dbo.KullaniciGrup.GrupAdi FROM dbo.Kullanici INNER JOIN dbo.KullaniciGrup ON dbo.Kullanici.GrupId = dbo.KullaniciGrup.GrupId");
            dlKullanici.DataSource = dtKullanici;
            dlKullanici.DataBind();
            if (dtKullanici.Rows.Count == 0)
                dlKullanici.Visible = false;
            else
                dlKullanici.Visible = true;
        }
        protected void btnAra_Click(object sender, EventArgs e)
        {
            if (txtAra.Text == string.Empty)
            {
                lblAra.Text = "Lüffen bir isim giriniz.";
            }

            else
            {
                Response.Redirect("AdminYonetimi.aspx?aranacak=" + Seo.Temizle(txtAra.Text));
            }
        }
    }
}