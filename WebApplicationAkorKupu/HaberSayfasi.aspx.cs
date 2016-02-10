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
    public partial class HaberSayfasi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string IcerikId = "";
        string ip = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            IcerikId = Request.QueryString["IcerikId"].ToString();

            if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            }
            else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
            {
                ip = HttpContext.Current.Request.UserHostAddress;
            }


            IcerikId = Request.QueryString["IcerikId"].ToString();
            DataTable drHaber = klas.GetDataTable("SELECT top 1  dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where IcerikId=" + IcerikId);

            rpHaber.DataSource = drHaber;
            rpHaber.DataBind();

            DataRow drIp = klas.GetDataRow("Select * from Ip Where IcerikId='" + IcerikId + "' and IpAdi='" + ip + "' ");
            if (drIp == null)
            {
                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("Insert into Ip (IcerikId,IpAdi,Tarih) values(@IcerikId,@IpAdi,@Tarih)", baglanti);
                cmd.Parameters.AddWithValue("IcerikId", IcerikId);
                cmd.Parameters.AddWithValue("IpAdi", ip);
                cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToString());
                cmd.ExecuteNonQuery();

                string hit = klas.GetDataCell("Select Hit from Icerikler where IcerikId=" + IcerikId);
                int gor = Convert.ToInt32(hit);
                gor = gor + 1;
                hit = gor.ToString();

                SqlCommand cmd1 = new SqlCommand("Update Icerikler set Hit=@Hit Where IcerikId=" + IcerikId, baglanti);
                cmd1.Parameters.AddWithValue("Hit", hit);
                cmd1.ExecuteNonQuery();

            }
        }
        protected void lnkbtndigerhaberler_Click(object sender, EventArgs e)
        {
            Response.Redirect("HaberListe.aspx");
        }
    }
}