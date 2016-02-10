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
    public partial class UyeOnay : System.Web.UI.Page
    {
        string x = ""; string Email = "";

        Metodlarim klas = new Metodlarim();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                x = Request.QueryString["x"];
                Email = Request.QueryString["Email"];
            }
            catch (Exception)
            {

            }

            DataRow drsayi = klas.GetDataRow("  Select Sayi from Kullanici Where Email='" + Email + "'  ");
            if (x == drsayi["Sayi"].ToString())
            {
                klas.cmd_iki("Update Kullanici set Onay=1 Where Email='" + Email + "'  ");
            }
        }
    }
}