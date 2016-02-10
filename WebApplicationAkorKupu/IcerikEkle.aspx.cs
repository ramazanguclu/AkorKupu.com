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
    public partial class IcerikEkle : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        string baslik = "";
        string baslik_1 = "";
        string versiyon;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null)
            {
                Response.Redirect("GirisYap.aspx");

            }
            secim();

            if (Page.IsPostBack == false)
            {
                tur();
                sarkici();
                ddlSarkici.Items.Insert(0, new ListItem("Seçiniz", "0"));
            }
        }

        void secim()
        {

            if (ddliceriktur.SelectedValue == "4")
            {
                Response.Redirect("Demo.aspx");
            }

            if (ddliceriktur.SelectedValue == "5")
            {
                Response.Redirect("Haber.aspx");
            }
        }
        void tur()
        {
            DataTable dtTur = klas.GetDataTable("Select * from Turler Order by [TurAdi]");
            ddliceriktur.DataTextField = "TurAdi";
            ddliceriktur.DataValueField = "TurId";
            ddliceriktur.DataSource = dtTur;
            ddliceriktur.DataBind();
        }

        void sarkici()
        {
            DataTable dtSarkici = klas.GetDataTable("Select * from Sarkicilar Order by [SarkiciAdi]");
            ddlSarkici.DataTextField = "SarkiciAdi";
            ddlSarkici.DataValueField = "SarkiciId";
            ddlSarkici.DataSource = dtSarkici;
            ddlSarkici.DataBind();
        }

        void sarki()
        {

            DataTable dtSarki = klas.GetDataTable("Select * from Sarkilar Where SarkiciId=" + ddlSarkici.SelectedValue + " Order by [SarkiAdi]");
            ddlSarki.DataTextField = "SarkiAdi";
            ddlSarki.DataValueField = "SarkiId";
            ddlSarki.DataSource = dtSarki;
            ddlSarki.DataBind();
        }

        protected void btnSarkiciEkle_Click(object sender, EventArgs e)
        {
            sarkici();
            ltrlHata.Visible = false;
            ddlSarkici.Items.Insert(0, new ListItem("Seçiniz", "0"));
            lblYeniSarkici.Visible = true;
            txtYeniSarkici.Visible = true;
            btnSarkiciKaydet.Visible = true;
            pnlSarki.Visible = false;
            pnlicerik.Visible = false;
        }
        protected void btnSarkiciKaydet_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan_iki();
            SqlCommand cmd = new SqlCommand("Insert into Sarkicilar (SarkiciAdi) values(@SarkiciAdi)", baglanti);
            baslik = klasyeni.TextLowerAndFirstUpper(txtYeniSarkici.Text);
            cmd.Parameters.AddWithValue("SarkiciAdi", baslik);
            cmd.ExecuteNonQuery();
            sarkici();
            ddlSarkici.Enabled = true;
            DataRow drSarkici = klas.GetDataRow("Select * from Sarkicilar Where SarkiciAdi='" + txtYeniSarkici.Text + "'  ");
            ddlSarkici.SelectedValue = drSarkici["SarkiciId"].ToString();
            lblYeniSarkici.Visible = false;
            txtYeniSarkici.Visible = false;
            btnSarkiciKaydet.Visible = false;
            pnlSarki.Visible = false;
            pnlicerik.Visible = false;
        }

        protected void ddlSarkici_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSarki.Enabled = true;
            btnSarkiEkle.Visible = true;
            sarki();
        }
        protected void btnSarkiSec_Click(object sender, EventArgs e)
        {
            if (ddlSarkici.SelectedValue != "0")
            {
                ltrlHata.Text = " ";
                pnlSarki.Visible = true;
                pnlicerik.Visible = false;
                sarki();
                ddlSarki.Items.Insert(0, new ListItem("Seçiniz", "0"));
                btnSarkiSec.Visible = false;
                lblSarkiSec.Visible = true;
                ddlSarkici.Enabled = false;
                btnSarkiciEkle.Visible = false;
                txtYeniSarkici.Visible = false;
                btnSarkiciKaydet.Visible = false;
            }
            else
            {
                ltrlHata.Visible = true;
                ltrlHata.Text = "Lüffen Şarkıcı Seçiniz!";
            }
        }
        protected void btnSarkiEkle_Click(object sender, EventArgs e)
        {
            sarki();
            ddlSarki.Items.Insert(0, new ListItem("Seçiniz", "0"));
            ltrlŞarkiHata.Visible = false;
            lblYeniSarki.Visible = true;
            txtYeniSarki.Visible = true;
            btnSarkiKaydet.Visible = true;
            pnlSarki.Visible = true;
            pnlicerik.Visible = false;
        }
        protected void btnSarkiKaydet_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand("Insert into Sarkilar (SarkiAdi,SarkiciId) values(@SarkiAdi,@SarkiciId)", baglanti);
            baslik_1 = klasyeni.TextLowerAndFirstUpper(txtYeniSarki.Text);
            cmd.Parameters.AddWithValue("SarkiAdi", baslik_1);
            cmd.Parameters.AddWithValue("SarkiciId", ddlSarkici.SelectedValue);
            cmd.ExecuteNonQuery();
            ddlSarki.Enabled = true;
            sarki();
            DataRow drSarki = klas.GetDataRow("Select * from Sarkilar Where SarkiAdi='" + txtYeniSarki.Text + "'  ");
            ddlSarki.SelectedValue = drSarki["SarkiId"].ToString();
            lblYeniSarki.Visible = false;
            txtYeniSarki.Visible = false;
            btnSarkiKaydet.Visible = false;
            pnlSarki.Visible = true;
            pnlicerik.Visible = false;
        }

        protected void btnSarkiOnay_Click(object sender, EventArgs e)
        {

            if (ddlSarki.SelectedValue != "0")
            {
                pnlSarki.Visible = true;
                pnlicerik.Visible = true;
                ltrlŞarkiHata.Text = " ";
                lblSarkiSec.Visible = false;
                ddlSarki.Enabled = false;
                btnSarkiEkle.Visible = false;
                btnSarkiKaydet.Visible = false;
                txtYeniSarki.Visible = false;
                btnSarkiOnay.Visible = false;


            }
            else
            {
                ltrlŞarkiHata.Visible = true;
                ltrlŞarkiHata.Text = "Lüffen Şarkı Seçiniz!";
            }

        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            if (txtIcerik.Text != string.Empty)
            {
                DataTable dtversiyon = klas.GetDataTable("Select * from Icerikler Where TurId='" + ddliceriktur.SelectedValue + "' and SarkiId='" + ddlSarki.SelectedValue + "' and SarkiciId='" + ddlSarkici.SelectedValue + "' ");
                if (dtversiyon.Rows.Count > 0)
                {
                    DataRow drbaslik = klas.GetDataRow("Select top 1  * from Icerikler Where TurId='" + ddliceriktur.SelectedValue + "' and SarkiId='" + ddlSarki.SelectedValue + "' and SarkiciId='" + ddlSarkici.SelectedValue + "' order by[IcerikId] desc");
                    if (drbaslik["Baslik"].ToString() != string.Empty)
                    {
                        string a = drbaslik["Baslik"].ToString();
                        int b = Convert.ToInt32(a);
                        if ((b + 1) != dtversiyon.Rows.Count)
                        {
                            versiyon = (b + 1).ToString();
                        }

                        else
                        {
                            versiyon = Convert.ToString(dtversiyon.Rows.Count);
                        }
                    }
                    else
                    {
                        versiyon = Convert.ToString(dtversiyon.Rows.Count);
                    }

                }
                else
                {
                    versiyon = "";
                }

                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("insert into Icerikler (TurId,KullaniciId,SarkiciId,SarkiId,Baslik,Aciklama,Tarih,Onay,Vitrin,Hit,Icerik) values(@TurId,@KullaniciId,@SarkiciId,@SarkiId,@Baslik,@Aciklama,@Tarih,@Onay,@Vitrin,@Hit,@Icerik)", baglanti);
                cmd.Parameters.AddWithValue("TurId", ddliceriktur.SelectedValue);
                cmd.Parameters.AddWithValue("KullaniciId", Session["KullaniciId"]);
                cmd.Parameters.AddWithValue("SarkiId", ddlSarki.SelectedValue);
                cmd.Parameters.AddWithValue("SarkiciId", ddlSarkici.SelectedValue);
                cmd.Parameters.AddWithValue("Baslik", versiyon);
                cmd.Parameters.AddWithValue("Icerik", txtIcerik.Text);
                cmd.Parameters.AddWithValue("Aciklama", txtAciklama.Text);
                cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("Onay", "0");
                cmd.Parameters.AddWithValue("Vitrin", "0");
                cmd.Parameters.AddWithValue("Hit", "0");
                cmd.ExecuteNonQuery();
                Response.Redirect("IcerikSon.aspx");
            }
        }
    }
}