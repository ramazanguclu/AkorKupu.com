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
    public partial class MailYonetimi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string MailId = "";
        string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MailId = Request.QueryString["MailId"];
                islem = Request.QueryString["islem"];
            }
            catch (Exception)
            {
            }

            pnlmail.Visible = false;

            DataTable dtokunmayan = klas.GetDataTable("Select * from Dilek where Okundu=0");
            dlOkunmayan.DataSource = dtokunmayan;
            dlOkunmayan.DataBind();

            DataTable dtokunan = klas.GetDataTable("Select * from Dilek where Okundu=1");
            dlOkunan.DataSource = dtokunan;
            dlOkunan.DataBind();

            if (islem == "okundu")
            {
                pnlmail.Visible = false;
                klas.cmd("Update Dilek set Okundu=1 Where MailId=" + MailId);
                Response.Redirect("MailYonetimi.aspx");
            }

            if (islem == "sil")
            {
                pnlmail.Visible = false;
                klas.cmd("Delete from Dilek where MailId=" + MailId);
                Response.Redirect("MailYonetimi.aspx");
            }

            if (islem == "bak")
            {
                pnlmail.Visible = true;
                DataRow drmailicerik = klas.GetDataRow("select * from Dilek where MailId=" + MailId);
                string deger = drmailicerik["Okundu"].ToString();
                if (deger == "0")
                {
                    dlOkunmayan.Visible = true;
                    dlOkunan.Visible = false;
                }
                else if (deger == "1")
                {
                    dlOkunmayan.Visible = false;
                    dlOkunan.Visible = true;
                }
                lblAdSoyad.Text = drmailicerik["AdSoyad"].ToString();
                lblKonu.Text = drmailicerik["Konu"].ToString();
                lblMailIcerik.Text = drmailicerik["EmailIcerik"].ToString();
                lblMailAdres.Text = drmailicerik["EmailAdres"].ToString();
            }

        }
        protected void ddlOnay_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlOnay.SelectedItem.Text == "Okunmayan")
            {
                dlOkunmayan.Visible = true;
                dlOkunan.Visible = false;
                pnlmail.Visible = false;
            }
            else
            {
                dlOkunmayan.Visible = false;
                dlOkunan.Visible = true;
                pnlmail.Visible = false;
            }

        }
    }
}