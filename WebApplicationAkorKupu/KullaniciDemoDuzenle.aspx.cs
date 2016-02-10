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

namespace WebApplicationAkorKupu
{
    public partial class KullaniciDemoDuzenle : System.Web.UI.Page
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
                txtBaslik.Text = drIcerik["Baslik"].ToString();

                DataTable dtdemo = klas.GetDataTable("Select Icerik from Icerikler where IcerikId=" + IcerikId);
                rpDemo.DataSource = dtdemo;
                rpDemo.DataBind();
            }
        }
        protected void btnicerikguncelle_Click(object sender, EventArgs e)
        {
            string sesadi = ""; string uzanti = "";
            uzanti = Path.GetExtension(fudemo.PostedFile.FileName);

            if (fudemo.HasFile)
            {
                if (uzanti == ".mp3")
                {
                    DataRow drIcerik = klas.GetDataRow("Select * from Icerikler where IcerikId=" + IcerikId);
                    FileInfo fidemo = new FileInfo(Server.MapPath("Demolar/" + drIcerik["Icerik"].ToString()));
                    fidemo.Delete();

                    sesadi = IcerikId + uzanti;

                    fudemo.SaveAs(Server.MapPath("Demolar/" + sesadi));
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd = new SqlCommand("Update Icerikler set Baslik=@Baslik,Aciklama=@Aciklama,Tarih=@Tarih,Onay=@Onay,Icerik=@Icerik Where IcerikId=" + IcerikId, baglanti);
                    cmd.Parameters.AddWithValue("Baslik", txtBaslik.Text);
                    cmd.Parameters.AddWithValue("Aciklama", txtAciklama.Text);
                    cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToShortDateString());
                    cmd.Parameters.AddWithValue("Onay", "0");
                    cmd.Parameters.AddWithValue("Icerik", sesadi);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Profilim.aspx");
                }
                else
                {
                    lblUyari.Text = "Yalnızca mp3 uzantılı dosya yükleyebilirsiniz.";
                }
            }
            else
            {
                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("Update Icerikler set Baslik=@Baslik,Aciklama=@Aciklama,Tarih=@Tarih,Onay=@Onay Where IcerikId=" + IcerikId, baglanti);
                cmd.Parameters.AddWithValue("Baslik", txtBaslik.Text);
                cmd.Parameters.AddWithValue("Aciklama", txtAciklama.Text);
                cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("Onay", "0");
                cmd.ExecuteNonQuery();
                Response.Redirect("Profilim.aspx");
            }
        }
    }
}