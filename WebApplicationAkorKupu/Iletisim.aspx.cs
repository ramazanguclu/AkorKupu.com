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
    public partial class Iletisim : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlmail.Visible = true;
            pnlbilgi.Visible = false;
        }
        protected void btnGonder_Click(object sender, EventArgs e)
        {
            if (txtemail.Text != string.Empty)
            {
                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("insert into Dilek (AdSoyad,EmailAdres,Konu,EmailIcerik) values(@AdSoyad,@EmailAdres,@Konu,@EmailIcerik)", baglanti);
                cmd.Parameters.AddWithValue("AdSoyad", txtadsoyad.Text);
                cmd.Parameters.AddWithValue("EmailAdres", txtemail.Text);
                cmd.Parameters.AddWithValue("Konu", txtkonu.Text);
                cmd.Parameters.AddWithValue("EmailIcerik", txticeikmail.Text);
                cmd.ExecuteNonQuery();
                pnlmail.Visible = false;
                pnlbilgi.Visible = true;
            }
        }
    }
}
