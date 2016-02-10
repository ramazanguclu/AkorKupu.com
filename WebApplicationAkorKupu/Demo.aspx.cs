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
    public partial class Demo : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string IcerikId = "";
        harfler klasyeni = new harfler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null)
            {
                Response.Redirect("GirisYap.aspx");

            }
            secim();

            if (Page.IsPostBack == false)
            {
                tur();
                ddliceriktur.SelectedValue = "4";

            }
        }

        void secim()
        {
            if (ddliceriktur.SelectedValue == "1")
            {
                Response.Redirect("IcerikEkle.aspx");
            }

            if (ddliceriktur.SelectedValue == "2")
            {
                Response.Redirect("IcerikEkle.aspx");
            }

            if (ddliceriktur.SelectedValue == "3")
            {
                Response.Redirect("IcerikEkle.aspx");
            }

            if (ddliceriktur.SelectedValue == "5")
            {

                Response.Redirect("Haber.aspx");
            }
        }

        void tur()
        {
            DataTable dtTur = klas.GetDataTable("Select * from Turler Order by [TurAdi]");
            ddliceriktur.DataTextField = "TurAdi";
            ddliceriktur.DataValueField = "TurId";
            ddliceriktur.DataSource = dtTur;
            ddliceriktur.DataBind();
            ddliceriktur.SelectedValue = "4";
        }

        protected void btngonder_Click(object sender, EventArgs e)
        {
            string sesadi = ""; string uzanti = "";
            uzanti = Path.GetExtension(FileUpload1.PostedFile.FileName);

            if (FileUpload1.HasFile)
            {
                if (uzanti == ".mp3")
                {
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd1 = new SqlCommand("Insert into Icerikler (TurId) values(@TurId)", baglanti);
                    cmd1.Parameters.AddWithValue("TurId", "4");
                    cmd1.ExecuteNonQuery();
                    IcerikId = klas.GetDataCell("Select top 1 IcerikId from Icerikler Order by [IcerikId] desc");

                    sesadi = IcerikId + uzanti;

                    FileUpload1.SaveAs(Server.MapPath("~/Demolar/" + sesadi));

                    SqlCommand cmd = new SqlCommand("Update Icerikler set TurId=@TurId,KullaniciId=@KullaniciId,Baslik=@Baslik,Aciklama=@Aciklama,Tarih=@Tarih,Onay=@Onay,Vitrin=@Vitrin,Hit=@Hit,Icerik=@Icerik Where IcerikId=" + IcerikId, baglanti);
                    cmd.Parameters.AddWithValue("TurId", "4");
                    cmd.Parameters.AddWithValue("KullaniciId", Session["KullaniciId"]);
                    cmd.Parameters.AddWithValue("Baslik", klasyeni.TextLowerAndFirstUpper(txtBaslik.Text));
                    cmd.Parameters.AddWithValue("Aciklama", txtAciklama.Text);
                    cmd.Parameters.AddWithValue("Tarih", DateTime.Now.ToShortDateString());
                    cmd.Parameters.AddWithValue("Onay", "0");
                    cmd.Parameters.AddWithValue("Vitrin", "0");
                    cmd.Parameters.AddWithValue("Hit", "0");
                    cmd.Parameters.AddWithValue("Icerik", sesadi);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("IcerikSon.aspx");
                }
                else
                {
                    lblUyari.Text = "Yalnızca mp3 uzantılı dosya yükleyebilirsiniz.";
                }
            }



        }
    }
}