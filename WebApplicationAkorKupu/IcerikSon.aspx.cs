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
    public partial class IcerikSon : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string icerikId = ""; string AdSoyad = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            icerikId = klas.GetDataCell("Select top 1 IcerikId from Icerikler Where KullaniciId=" + Session["KullaniciId"] + "Order by [IcerikId] desc");
            AdSoyad = klas.GetDataCell("Select AdSoyad from Kullanici Where KullaniciId=" + Session["KullaniciId"]);
            ltrlilanId.Text = icerikId;
            ltrlAdSoyad.Text = AdSoyad;
        }
    }
}