using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebApplicationAkorKupu.adminpanel;
using System.Net;
using System.Net.Mail;

namespace WebApplicationAkorKupu
{
    public partial class UyeTamam : System.Web.UI.Page
    {
        Metodlarim klas = new Metodlarim();
        string Email = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            int sayi;

            try
            {
                Email = Request.QueryString["Email"];
            }
            catch (Exception)
            {
            }

            DataRow drSayi = klas.GetDataRow("Select * from Kullanici Where Email='" + Email + "'   ");
            sayi = Convert.ToInt32(drSayi["Sayi"].ToString());

            MailMessage msg = new MailMessage();//yeni bir mail nesnesi Oluşturuldu.
            msg.IsBodyHtml = true; //mail içeriğinde html etiketleri kullanılsın mı?

            msg.To.Add(Email);//Kime mail gönderilecek.
            msg.From = new MailAddress("akorkupu@gmail.com", "akorkupu.com", System.Text.Encoding.UTF8);//mail kimden geliyor, hangi ifade görünsün?
            msg.Subject = "Üyelik Onay Maili";//mailin konusu
            msg.Body = "<a href='http://www.akorkupu.com/UyeOnay.aspx?x=" + sayi + "&Email=" + Email + "'>Üyelik Onayı İçin Tıklayın</a>";//mailin içeriği

            SmtpClient smp = new SmtpClient();
            smp.Credentials = new NetworkCredential("akorkupu@gmail.com", "1526**rG");//kullanıcı adı şifre
            smp.Port = 587;
            smp.Host = "smtp.gmail.com";//gmail üzerinden gönderiliyor.
            smp.EnableSsl = true;
            smp.Send(msg);//msg isimli mail gönderiliyor.

        }
    }
}