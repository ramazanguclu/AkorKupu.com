using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WebApplicationAkorKupu.adminpanel
{
    public partial class IcerikYonetimi : System.Web.UI.Page
    {
        string IcerikId = ""; string islem = "";
        Metodlarim klas = new Metodlarim();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack == false)
            {
                dlOnaysiz.Visible = true;
                dlOnayli.Visible = false;
            }
            DataTable dtonaysiz = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=0");
            dlOnaysiz.DataSource = dtonaysiz;
            dlOnaysiz.DataBind();

            DataTable dtonayli = klas.GetDataTable("SELECT dbo.Icerikler.*, dbo.Kullanici.AdSoyad, dbo.Turler.TurAdi FROM dbo.Icerikler INNER JOIN dbo.Kullanici ON dbo.Icerikler.KullaniciId = dbo.Kullanici.KullaniciId INNER JOIN dbo.Turler ON dbo.Icerikler.TurId = dbo.Turler.TurId where dbo.Icerikler.Onay=1");
            dlOnayli.DataSource = dtonayli;
            dlOnayli.DataBind();

            IcerikId = Request.QueryString["IcerikId"];
            islem = Request.QueryString["islem"];

            if (islem == "Onay")
            {
                klas.cmd("Update Icerikler set Onay=1 Where IcerikId=" + IcerikId);
                Response.Redirect("IcerikYonetimi.aspx");
            }

            if (islem == "Sil")
            {
                DataRow resim = klas.GetDataRow("Select * from Icerikler Where IcerikId=" + IcerikId);
                try
                {
                    FileInfo firesim = new FileInfo(Server.MapPath("../Haber/buyuk/" + resim["Haber"].ToString()));
                    firesim.Delete();
                    firesim = new FileInfo(Server.MapPath("../Haber/kucuk/" + resim["Haber"].ToString()));
                    firesim.Delete();
                }
                catch (Exception)
                { }

                try
                {
                    FileInfo fidemo = new FileInfo(Server.MapPath("../Demolar/" + resim["Icerik"].ToString()));
                    fidemo.Delete();
                }
                catch (Exception)
                { }

                klas.cmd("Delete from Icerikler where IcerikId=" + IcerikId);
                Response.Redirect("IcerikYonetimi.aspx");
            }

        }

        protected void ddlOnay_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlOnay.SelectedItem.Text == "Onaylı")
            {
                dlOnayli.Visible = true;
                dlOnaysiz.Visible = false;
            }
            else
            {
                dlOnayli.Visible = false;
                dlOnaysiz.Visible = true;
            }
        }
    }
}