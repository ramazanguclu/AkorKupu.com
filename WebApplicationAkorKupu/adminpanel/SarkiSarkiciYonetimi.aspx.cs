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
    public partial class SarkiSarkiciYonetimi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Page.IsPostBack == false)
            {
                sarkici();
                ddlSarkici.Items.Insert(0, new ListItem("Seçiniz", "0"));
                sarki_sarkici();
                ddl_sarki_sarkici.Items.Insert(0, new ListItem("Seçiniz", "0"));
            }
        }

        void sarkici()
        {
            DataTable dtSarkici = klas.GetDataTable("Select * from Sarkicilar Order by [SarkiciAdi]");
            ddlSarkici.DataTextField = "SarkiciAdi";
            ddlSarkici.DataValueField = "SarkiciId";
            ddlSarkici.DataSource = dtSarkici;
            ddlSarkici.DataBind();
        }

        void sarki_sarkici()
        {
            DataTable dtSarkici = klas.GetDataTable("Select * from Sarkicilar Order by [SarkiciAdi]");
            ddl_sarki_sarkici.DataTextField = "SarkiciAdi";
            ddl_sarki_sarkici.DataValueField = "SarkiciId";
            ddl_sarki_sarkici.DataSource = dtSarkici;
            ddl_sarki_sarkici.DataBind();
        }

        void sarki()
        {
            DataTable dtSarki = klas.GetDataTable("Select * from Sarkilar Where SarkiciId=" + ddl_sarki_sarkici.SelectedValue + " Order by [SarkiAdi]");
            ddl_sarki_sarki.DataTextField = "SarkiAdi";
            ddl_sarki_sarki.DataValueField = "SarkiId";
            ddl_sarki_sarki.DataSource = dtSarki;
            ddl_sarki_sarki.DataBind();
        }

        protected void ddlSarkici_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtsarkici.Text = ddlSarkici.SelectedItem.Text;
        }
        protected void btngüncellesarkici_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand("Update Sarkicilar set SarkiciAdi=@SarkiciAdi Where SarkiciId=" + ddlSarkici.SelectedValue, baglanti);
            cmd.Parameters.AddWithValue("SarkiciAdi", klasyeni.TextLowerAndFirstUpper(txtsarkici.Text));
            cmd.ExecuteNonQuery();
            Response.Redirect("SarkiSarkiciYonetimi.aspx");
        }
        protected void btnsarkiciduzenle_Click(object sender, EventArgs e)
        {
            pnlsarkiciduzenle.Visible = true;
            pnlsarkiduzenle.Visible = false;
        }
        protected void ddl_sarki_sarkici_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_sarki_sarki.Enabled = true;
            sarki();
            ddl_sarki_sarki.Items.Insert(0, new ListItem("Seçiniz", "0"));

        }
        protected void ddl_sarki_sarki_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtsarki.Text = ddl_sarki_sarki.SelectedItem.Text;
        }
        protected void btnsarki_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand("Update Sarkilar set SarkiAdi=@SarkiAdi Where SarkiId=" + ddl_sarki_sarki.SelectedValue, baglanti);
            cmd.Parameters.AddWithValue("SarkiAdi", klasyeni.TextLowerAndFirstUpper(txtsarki.Text));
            cmd.ExecuteNonQuery();
            Response.Redirect("SarkiSarkiciYonetimi.aspx");
        }
        protected void btnsarkiduzenle_Click(object sender, EventArgs e)
        {
            pnlsarkiduzenle.Visible = true;
            pnlsarkiciduzenle.Visible = false;
        }
        protected void lnkbtndigerhaberler_Click(object sender, EventArgs e)
        {
            Response.Redirect("SarkiSarkiciEkle.aspx");
        }
    }
}