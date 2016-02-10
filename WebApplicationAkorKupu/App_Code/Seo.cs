using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAkorKupu.App_Code
{
    public class Seo
    {
        public static string Temizle(string Metin)
        {
            string ifade = Metin;
            ifade = ifade.Replace(" ", "");
            ifade = ifade.Replace("'", "");
            ifade = ifade.Replace(",", "");
            ifade = ifade.Replace("%", "");
            ifade = ifade.Replace("(", "");
            ifade = ifade.Replace(")", "");
            ifade = ifade.Replace("?", "");
            ifade = ifade.Replace("&", "");

            return ifade;
        }
    }
}