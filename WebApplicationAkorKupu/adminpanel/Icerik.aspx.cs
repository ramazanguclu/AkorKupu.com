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
    public partial class Icerik : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string IcerikId = ""; string TurId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                IcerikId = Request.QueryString["IcerikId"].ToString();
                TurId = Request.QueryString["TurId"].ToString();
            }

            if (TurId == "5")
            {
                DataTable dthaberbilgi = klas.GetDataTable("Select * from Icerikler where IcerikId=" + IcerikId);
                rphaberbilgi.DataSource = dthaberbilgi;
                rphaberbilgi.DataBind();

                DataRow dricerik = klas.GetDataRow("Select * from Icerikler where IcerikId=" + IcerikId);
                imgresim.Visible = true;
                imgresim.ImageUrl = "../Haber/kucuk/" + dricerik["Haber"].ToString();
                txticerikakor.Text = dricerik["Icerik"].ToString();
            }

            else if (TurId == "1" || TurId == "2" || TurId == "3")
            {
                imgresim.Visible = false;

                DataTable dticerik = klas.GetDataTable("SELECT dbo.Sarkicilar.SarkiciAdi, dbo.Sarkilar.SarkiAdi, dbo.Icerikler.* FROM dbo.Icerikler INNER JOIN dbo.Sarkicilar ON dbo.Icerikler.SarkiciId = dbo.Sarkicilar.SarkiciId INNER JOIN dbo.Sarkilar ON dbo.Icerikler.SarkiId = dbo.Sarkilar.SarkiId where dbo.Icerikler.IcerikId=" + IcerikId);
                rpiceribilgi.DataSource = dticerik;
                rpiceribilgi.DataBind();

                DataRow dricerik = klas.GetDataRow("Select * from Icerikler where IcerikId=" + IcerikId);
                txticerikakor.Text = dricerik["Icerik"].ToString();

            }

            else if (TurId == "4")
            {
                txticerikakor.Visible = false;
                imgresim.Visible = false;
                DataTable dtdemo = klas.GetDataTable("Select * from Icerikler where IcerikId=" + IcerikId);
                rponaydemo.DataSource = dtdemo;
                rponaydemo.DataBind();

                rpdemobilgi.DataSource = dtdemo;
                rpdemobilgi.DataBind();
            }
        }
    }
}