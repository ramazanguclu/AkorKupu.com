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
    public partial class SarkiSarkiciEkle : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Page.IsPostBack == false)
            {
                sarkici();
                ddlSarkici.Items.Insert(0, new ListItem("Seçiniz", "0"));
            }
        }
        protected void btnsarkiciekle_Click(object sender, EventArgs e)
        {
            pnlsarkici.Visible = true;
            pnlsarki.Visible = false;

        }
        protected void btnekle_Click(object sender, EventArgs e)
        {
            DataRow drsarkici = klas.GetDataRow("Select * from Sarkicilar where SarkiciAdi='" + klasyeni.TextLowerAndFirstUpper(txtsarkici.Text) + "'   ");
            if (drsarkici == null)
            {
                if (txtsarkici.Text != string.Empty)
                {
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd = new SqlCommand("Insert into Sarkicilar (SarkiciAdi) values(@SarkiciAdi)", baglanti);
                    cmd.Parameters.AddWithValue("SarkiciAdi", klasyeni.TextLowerAndFirstUpper(txtsarkici.Text));
                    cmd.ExecuteNonQuery();
                    Response.Redirect("SarkiSarkiciYonetimi.aspx");
                }
                else
                    lbluyarisarkici.Text = "Lütfen şarkıcı ismini giriniz.";
            }
            else
                lbluyarisarkici.Text = "Bu şarkıcı zaten kayıtlı!";
        }
        protected void btnsarkiekle_Click(object sender, EventArgs e)
        {
            pnlsarkici.Visible = false;
            pnlsarki.Visible = true;
        }

        void sarkici()
        {
            DataTable dtSarkici = klas.GetDataTable("Select * from Sarkicilar Order by [SarkiciAdi]");
            ddlSarkici.DataTextField = "SarkiciAdi";
            ddlSarkici.DataValueField = "SarkiciId";
            ddlSarkici.DataSource = dtSarkici;
            ddlSarkici.DataBind();
        }
        protected void btnsarki_Click(object sender, EventArgs e)
        {
            DataRow drsarki = klas.GetDataRow("Select * from Sarkilar where SarkiAdi='" + klasyeni.TextLowerAndFirstUpper(txtsarki.Text) + "'   ");
            if (drsarki == null)
            {
                if (txtsarki.Text != string.Empty && ddlSarkici.SelectedValue != "0")
                {
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd = new SqlCommand("Insert into Sarkilar (SarkiAdi,SarkiciId) values(@SarkiAdi,@SarkiciId)", baglanti);
                    cmd.Parameters.AddWithValue("SarkiAdi", klasyeni.TextLowerAndFirstUpper(txtsarki.Text));
                    cmd.Parameters.AddWithValue("SarkiciId", ddlSarkici.SelectedValue);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("SarkiSarkiciYonetimi.aspx");
                }
                else
                    lbluyarisarki.Text = "Lütfen şarkı ismini giriniz.";
            }
            else
                lbluyarisarki.Text = "Bu isimde şarkı zaten kayıtlı!";
        }
    }
}