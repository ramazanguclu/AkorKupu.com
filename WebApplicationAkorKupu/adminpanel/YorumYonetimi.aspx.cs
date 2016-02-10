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
    public partial class YorumYonetimi : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        harfler klasyeni = new harfler();
        string YorumId = ""; string islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                dlOnaysiz.Visible = true;
                dlOnayli.Visible = false;
            }

            DataTable dtonaysiz = klas.GetDataTable("Select * from Yorumlar where Onay=0");
            dlOnaysiz.DataSource = dtonaysiz;
            dlOnaysiz.DataBind();

            DataTable dtonayli = klas.GetDataTable("Select * from Yorumlar where Onay=1");
            dlOnayli.DataSource = dtonayli;
            dlOnayli.DataBind();

            YorumId = Request.QueryString["YorumId"];
            islem = Request.QueryString["islem"];

            if (islem == "Onay")
            {
                klas.cmd("Update Yorumlar set Onay=1 Where YorumId=" + YorumId);
                Response.Redirect("YorumYonetimi.aspx");
            }

            if (islem == "Sil")
            {
                klas.cmd("Delete from Yorumlar where YorumId=" + YorumId);
                Response.Redirect("YorumYonetimi.aspx");
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