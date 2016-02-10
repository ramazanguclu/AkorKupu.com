using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAkorKupu
{
    public class Metodlar
    {
        public Metodlar()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public SqlConnection baglan()
        {
            SqlConnection baglanti = new SqlConnection("Data Source=PC;Initial Catalog=proje;Integrated Security=True");
            baglanti.Open();
            return (baglanti);
        }

        public SqlConnection baglan_iki()
        {
            SqlConnection baglanti_iki = new SqlConnection("Data Source=PC;Initial Catalog=proje;Integrated Security=True");
            baglanti_iki.Open();
            return (baglanti_iki);
        }

        public int cmd(string sqlcumle)
        {
            SqlConnection baglan = this.baglan();
            SqlCommand sorgu = new SqlCommand(sqlcumle, baglan);
            int sonuc = 0;

            try
            {
                sonuc = sorgu.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message + " (" + sqlcumle + ")");
            }
            sorgu.Dispose();
            baglan.Close();
            baglan.Dispose();
            return (sonuc);
        }

        public int cmd_iki(string sqlcumle)
        {
            SqlConnection baglan_iki = this.baglan_iki();
            SqlCommand sorgu = new SqlCommand(sqlcumle, baglan_iki);
            int sonuc = 0;

            try
            {
                sonuc = sorgu.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message + " (" + sqlcumle + ")");
            }
            sorgu.Dispose();
            baglan_iki.Close();
            baglan_iki.Dispose();
            return (sonuc);
        }

        public DataTable GetDataTable(string sql)
        {
            SqlConnection baglanti = this.baglan();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, baglanti);
            DataTable dt = new DataTable();
            try
            {
                adapter.Fill(dt);
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message + " (" + sql + ")");
            }
            adapter.Dispose();
            baglanti.Close();
            baglanti.Dispose();
            return dt;
        }

        public DataRow GetDataRow(string sql)
        {
            DataTable table = GetDataTable(sql);
            if (table.Rows.Count == 0) return null;
            return table.Rows[0];
        }

        public string GetDataCell(string sql)
        {
            DataTable table = GetDataTable(sql);
            if (table.Rows.Count == 0) return null;
            return table.Rows[0][0].ToString();
        }
    }
}
