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
    public partial class KullaniciHaberDuzenle : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        string IcerikId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            IcerikId = Request.QueryString["IcerikId"].ToString();

            if (Page.IsPostBack == false)
            {
                DataRow drIcerik = klas.GetDataRow("Select * from Icerikler where IcerikId=" + IcerikId);
                txtAciklama.Text = drIcerik["Aciklama"].ToString();
                txtticerik.Text = drIcerik["Icerik"].ToString();
                txtBaslik.Text = drIcerik["Baslik"].ToString();
                imgresim.ImageUrl = "Haber/buyuk/" + drIcerik["Haber"].ToString();
            }
        }

        protected void btnicerikguncelle_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand("Update Icerikler Set Aciklama=@Aciklama,Icerik=@Icerik,Tarih=@Tarih,Onay=@Onay,Baslik=@Baslik Where IcerikId=" + IcerikId, baglanti);
            cmd.Parameters.AddWithValue("Aciklama", txtAciklama.Text);
            cmd.Parameters.AddWithValue("Icerik", txtticerik.Text);
            cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("Onay", "0");
            cmd.Parameters.AddWithValue("Baslik", txtBaslik.Text);
            cmd.ExecuteNonQuery();
            Response.Redirect("Profilim.aspx");
        }
    }
}