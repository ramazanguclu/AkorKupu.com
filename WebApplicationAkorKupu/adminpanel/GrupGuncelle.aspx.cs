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
    public partial class GrupGuncelle : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string GrupId = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            GrupId = Request.QueryString["GrupId"];

            if (Page.IsPostBack == false)
            {
                DataRow drGrup = klas.GetDataRow("Select * from KullaniciGrup Where GrupId=" + GrupId);
                txtGrupAdi.Text = drGrup["GrupAdi"].ToString();
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {           
            try
            {
                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("Update KullaniciGrup Set GrupAdi=@GrupAdi Where GrupId=" + GrupId, baglanti);
                cmd.Parameters.AddWithValue("GrupAdi", txtGrupAdi.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect("Grupyonetimi.aspx");
            }
            catch (Exception)
            {

            }       
        }
    }
}