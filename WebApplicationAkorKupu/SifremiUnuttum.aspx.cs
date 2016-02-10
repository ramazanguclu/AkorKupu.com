using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebApplicationAkorKupu.adminpanel;
using System.Net.Mail;
using System.Net;

namespace WebApplicationAkorKupu
{
    public partial class SifremiUnuttum : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void txtGonder_Click(object sender, EventArgs e)
        {
            DataRow drKul = klas.GetDataRow("Select * from Kullanici Where Email='" + txtEmail.Text + "'   ");
            if (drKul != null)
            {
                MailMessage msg = new MailMessage();//yeni bir mail nesnesi Oluşturuldu.
                msg.IsBodyHtml = true; //mail içeriğinde html etiketleri kullanılsın mı?
                msg.To.Add(txtEmail.Text);//Kime mail gönderilecek.
                msg.From = new MailAddress("akorkupu@gmail.com", "akorkupu.com", System.Text.Encoding.UTF8);//mail kimden geliyor, hangi ifade görünsün?
                msg.Subject = "Kullanıcı Bilgileri Hatırlatma Maili";//mailin konusu
                msg.Body = "Şifreniz:" + drKul["Sifre"].ToString() + "<br>Giriş için <a href='http://www.akorkupu.com'>tıklayınız.</a>";//mailin içeriği

                SmtpClient smp = new SmtpClient();
                smp.Credentials = new NetworkCredential("akorkupu@gmail.com", "1526**rG");//kullanıcı adı şifre
                smp.Port = 587;
                smp.Host = "smtp.gmail.com";//gmail üzerinden gönderiliyor.
                smp.EnableSsl = true;
                smp.Send(msg);//msg isimli mail gönderiliyor.

                lblEmail.Text = "Bilgileriniz Email Adresinize Gönderilmiştir.";
            }
            else
                lblEmail.Text = "Sitemizde Bu Mail Adresi Bulunmamaktadır.";

        }
    }
}