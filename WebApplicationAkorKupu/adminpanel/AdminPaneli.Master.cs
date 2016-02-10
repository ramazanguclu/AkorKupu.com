using System;
using System.Data;

namespace WebApplicationAkorKupu.adminpanel
{
    public partial class AdminPaneli : System.Web.UI.MasterPage
    {
        Metodlarim klas = new Metodlarim();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dticerik = klas.GetDataTable("Select * from Icerikler where Onay=0");
            if (dticerik.Rows.Count > 0)
            {
                lbicerik.Visible = true;
            }
            else
            {
                lbicerik.Visible = false;
            }

            lbicerik.Text = "  (" + dticerik.Rows.Count.ToString() + ")";


            DataTable dtyorum = klas.GetDataTable("Select * from Yorumlar where Onay=0");
            if (dtyorum.Rows.Count > 0)
            {
                lblyorum.Visible = true;
            }
            else
            {
                lblyorum.Visible = false;
            }

            lblyorum.Text = "  (" + dtyorum.Rows.Count.ToString() + ")";

            DataTable dtmail = klas.GetDataTable("Select * from Dilek where Okundu=0");
            if (dtmail.Rows.Count > 0)
            {
                lblmail.Visible = true;
            }
            else
            {
                lblmail.Visible = false;
            }

            lblmail.Text = "  (" + dtmail.Rows.Count.ToString() + ")";
        }
    }
}