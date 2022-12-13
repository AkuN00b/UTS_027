using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace UTS_027.Views
{
    public partial class Page_Laporan_Penjualan_027 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cariLaporan_Click(object sender, EventArgs e)
        {

        }

        protected void cariLaporan_Click1(object sender, EventArgs e)
        {
            string date = tanggal.SelectedDate.ToString("yyyy-MM-dd");
            if (date == "0001-01-01")
            {
                Response.Write("<script>alert('Isi data tanggal !!');</script>");
            } else
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();

                SqlCommand command = new SqlCommand("sp_getLap1", conn);
                command.CommandType = CommandType.StoredProcedure;
                dt.Load(command.ExecuteReader());

                totalPenjualan.Text += dt.Rows[0][0].ToString();

                conn.Close();
            }
        }
    }
}