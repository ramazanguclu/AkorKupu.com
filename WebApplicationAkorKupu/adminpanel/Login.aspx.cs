using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplicationAkorKupu.adminpanel
{
    public partial class Login : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnGiris_Click(object sender, EventArgs e)
        {
            DataRow drGiris = klas.GetDataRow("Select * from Kullanici Where Email='" + Seo.Temizle(txtKullaniciGiris.Text) + "' and  Sifre='" + Seo.Temizle(txtSifre.Text) + "' and GrupId=29");
            if (drGiris != null)
            {
                Session["KullaniciId"] = drGiris["KullaniciId"].ToString();
                Response.Redirect("Default.aspx");
            }
            else
                lblBilgi.Text = "Kullanıcı Adı veya Şifre Hatalı";
        }
    }
}