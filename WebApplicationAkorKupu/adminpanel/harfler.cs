using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAkorKupu.adminpanel
{
    public class harfler
    {
        public string TextLowerAndFirstUpper(string str)
        {
            str = str.ToLower();
            char[] stra = str.ToCharArray();
            for (int i = 0; i < stra.Length; i++)
            {
                if (i == 0)
                {
                    str = string.Empty;
                    str += stra[i].ToString().ToUpper();
                }
                else
                {
                    if (stra[i].ToString() == " ")
                    {
                        str += stra[i].ToString();
                        i = i + 1;
                        str += stra[i].ToString().ToUpper();
                    }
                    else
                    {
                        str += stra[i].ToString();
                    }
                }
            }
            return str;
        }
    }


}