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
    public partial class Page_Transaksi_Penjualan_027 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }

            gridDataTransaksiPenjualan.Width = Unit.Percentage(100);
        }

        protected void loadData()
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            connection.Open();

            SqlCommand cmd = new SqlCommand("sp_getDataTransaksiPenjualan", connection);
            cmd.Parameters.AddWithValue("@query", txtCari.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            dt.Load(cmd.ExecuteReader());

            gridDataTransaksiPenjualan.DataSource = dt;
            gridDataTransaksiPenjualan.DataBind();

            connection.Close();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            clearForm();
            panelView.Visible = false;
            panelManipulasiData.Visible = true;
            literalTitle.Text = "Form Tambah Transaksi Penjualan";
            btnKirim.Text = "Tambah Transaksi";
        }

        protected void clearForm()
        {
            txtTanggalTransaksi.Text = DateTime.Now.ToString("yyyy/MM/dd");
            loadDDL();
            txtJumlah.Text = "";
            txtHarga.Text = "";
            txtDiskon.Text = "";
            txtHargaTotal.Text = "";
        }

        public void loadDDL()
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();

            ddlNamaBarang.DataSource = "";
            ddlNamaBarang.Items.Clear();

            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "sp_getDataBarangForDDLBarangTrs";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@query", "");

            SqlDataAdapter adap = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adap.Fill(dt);

            ddlNamaBarang.DataSource = dt;
            ddlNamaBarang.DataTextField = "nama_barang";
            ddlNamaBarang.DataValueField = "id_barang";
            ddlNamaBarang.DataBind();
            ddlNamaBarang.Items.Insert(0, new ListItem("-- Pilih Barang --", ""));


            ddlNamaKasir.Items.Clear();
            ddlNamaKasir.Items.Insert(0, new ListItem("-- Pilih Kasir --", ""));
            ddlNamaKasir.Items.Insert(1, new ListItem("Gerlando", "Gerlando"));
            ddlNamaKasir.Items.Insert(2, new ListItem("Shandy", "Shandy"));
            ddlNamaKasir.Items.Insert(2, new ListItem("Richard", "Richard"));

        }

        protected void btnCari_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void gridDataTransaksiPenjualan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataTransaksiPenjualan.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void gridDataTransaksiPenjualan_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnKirim_Click(object sender, EventArgs e)
        {
            createDataTransaksiPenjualan();

            panelView.Visible = true;
            panelManipulasiData.Visible = false;
        }

        protected void createDataTransaksiPenjualan()
        {
            try
            {
                DataTable dt = new DataTable();
                DataTable ddt = new DataTable();
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();

                SqlCommand dd = new SqlCommand("sp_getDataForUpdateBarang", conn);
                dd.Parameters.AddWithValue("@id_barang", ddlNamaBarang.SelectedValue);
                dd.CommandType = CommandType.StoredProcedure;
                ddt.Load(dd.ExecuteReader());

                if (Convert.ToInt32(ddt.Rows[0][0].ToString()) < Convert.ToInt32(txtJumlah.Text))
                {
                    Response.Write("<script>alert('Jumlah pembelian melebihi stok');</script>");
                } else
                {
                    SqlCommand command = new SqlCommand("sp_InsertTransaksiPenjualan", conn);
                    command.Parameters.AddWithValue("@tanggal_transaksi", txtTanggalTransaksi.Text);
                    command.Parameters.AddWithValue("@id_barang", ddlNamaBarang.SelectedValue);
                    command.Parameters.AddWithValue("@jumlah", txtJumlah.Text);
                    command.Parameters.AddWithValue("@harga", txtHarga.Text);
                    command.Parameters.AddWithValue("@diskon", txtDiskon.Text);
                    command.Parameters.AddWithValue("@harga_total", txtHargaTotal.Text);
                    command.Parameters.AddWithValue("@nama_kasir", ddlNamaKasir.SelectedValue);
                    command.CommandType = CommandType.StoredProcedure;
                    dt.Load(command.ExecuteReader());
                }

                conn.Close();

                loadData();
            }
            catch { }
        }

        protected void txtJumlah_TextChanged(object sender, EventArgs e)
        {
            if (ddlNamaBarang.SelectedValue != "")
            {
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();

                SqlCommand com = new SqlCommand();
                com.Connection = conn;
                com.CommandText = "sp_getDataForUpdateBarang";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@id_barang", Convert.ToInt32(ddlNamaBarang.SelectedValue));

                SqlDataReader dr = com.ExecuteReader();
                dr.Read();

                if (txtDiskon.Text == "")
                {
                    txtHargaTotal.Text = (Convert.ToInt32(dr[1].ToString()) * Convert.ToInt32(txtJumlah.Text)).ToString();
                }
                else
                {
                    txtHargaTotal.Text = ((Convert.ToInt32(dr[1].ToString()) * Convert.ToInt32(txtJumlah.Text)) - Convert.ToInt32(txtDiskon.Text)).ToString();
                }

                conn.Close();
            }
            else
            {
                txtHargaTotal.Text = "0";
            }
        }

        protected void ddlNamaBarang_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();

            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "sp_getDataForUpdateBarang";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@id_barang", Convert.ToInt32(ddlNamaBarang.SelectedValue));

            SqlDataReader dr = com.ExecuteReader();
            dr.Read();

            txtHarga.Text = (Convert.ToInt32(dr[1].ToString()).ToString());

            conn.Close();
        }

        protected void ddlNamaBarang_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDiskon_TextChanged(object sender, EventArgs e)
        {
            int diskon = Convert.ToInt32(txtDiskon.Text);
            int harga = Convert.ToInt32(txtHarga.Text);

            if (txtHarga.Text != "0" || txtHargaTotal.Text != "0")
            {
                txtHargaTotal.Text = (Convert.ToInt32(txtHargaTotal.Text) - Convert.ToInt32(txtDiskon.Text)).ToString();
            } else if (diskon > harga)
            {
                txtDiskon.Text = txtHarga.Text;
                txtHargaTotal.Text = "0";
            }
        }
    }
}