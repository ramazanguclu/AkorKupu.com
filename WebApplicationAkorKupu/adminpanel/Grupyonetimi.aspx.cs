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
    public partial class Grupyonetimi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string GrupId = ""; string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {


            GrupId = Request.QueryString["GrupId"];
            islem = Request.QueryString["islem"];

            if (islem == "sil")
            {
                klas.cmd("Delete from KullaniciGrup where GrupId=" + GrupId);
            }

            DataTable dtGruplar = klas.GetDataTable("Select * from KullaniciGrup");
            RpGruplar.DataSource = dtGruplar;
            RpGruplar.DataBind();

        }
        protected void btnekle_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand("Insert into KullaniciGrup (GrupAdi) values(@GrupAdi)", baglanti);
            cmd.Parameters.AddWithValue("GrupAdı", txtGrupAdi.Text);
            cmd.ExecuteNonQuery();
            Response.Redirect("Grupyonetimi.aspx");
        }
    }
}