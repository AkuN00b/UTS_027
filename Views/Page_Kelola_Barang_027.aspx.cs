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
    public partial class Page_Kelola_Barang_027 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }

            gridDataBarang.Width = Unit.Percentage(100);
        }

        protected void loadData()
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            connection.Open();

            SqlCommand cmd = new SqlCommand("sp_getDataBarang", connection);
            cmd.Parameters.AddWithValue("@query", txtCari.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            dt.Load(cmd.ExecuteReader());

            gridDataBarang.DataSource = dt;
            gridDataBarang.DataBind();

            connection.Close();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            clearForm();
            panelView.Visible = false;
            panelManipulasiData.Visible = true;
            literalTitle.Text = "Form Tambah Data Barang";
            btnKirim.Text = "Tambah";
        }

        protected void btnCari_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void gridDataBarang_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataBarang.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void gridDataBarang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                string tempId = gridDataBarang.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();

                if (e.CommandName == "Ubah")
                {
                    hiddenID.Text = tempId;
                    panelView.Visible = false;
                    panelManipulasiData.Visible = true;

                    txtNamaBarang.Visible = false;
                    txtNamaBarang.Text = "aa";
                    lblNamaBarang.Visible = false;

                    txtHargaBeli.Text = "11";
                    txtHargaBeli.Visible = false;
                    lblHargaBeli.Visible = false;

                    txtHargaJual.Text = "11";
                    txtHargaJual.Visible = false;
                    lblHargaJual.Visible = false;

                    txtSatuan.Text = "11";
                    txtSatuan.Visible = false;
                    lblSatuan.Visible = false;

                    literalTitle.Text = "Form Ubah Data Barang";
                    btnKirim.Text = "Perbarui";

                    try
                    {
                        DataTable dt = new DataTable();

                        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                        conn.Open();

                        SqlCommand command = new SqlCommand("sp_getDataForUpdateBarang", conn);
                        command.Parameters.AddWithValue("@id_barang", tempId);
                        command.CommandType = CommandType.StoredProcedure;

                        dt.Load(command.ExecuteReader());

                        txtStokBarang.Text = dt.Rows[0][0].ToString();

                        conn.Close();
                    }
                    catch { }
                }
            }
        }

        protected void btnKirim_Click(object sender, EventArgs e)
        {
            if (hiddenID.Text.Equals(""))
                createDataBarang();
            else
                updateDataBarang(hiddenID.Text);

            panelView.Visible = true;
            panelManipulasiData.Visible = false;
        }

        protected void createDataBarang()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();

                SqlCommand command = new SqlCommand("sp_InsertBarang", conn);
                command.Parameters.AddWithValue("@nama_barang", txtNamaBarang.Text);
                command.Parameters.AddWithValue("@stok_barang", txtStokBarang.Text);
                command.Parameters.AddWithValue("@harga_beli", txtHargaBeli.Text);
                command.Parameters.AddWithValue("@harga_jual", txtHargaJual.Text);
                command.Parameters.AddWithValue("@satuan", txtSatuan.Text);
                command.CommandType = CommandType.StoredProcedure;
                dt.Load(command.ExecuteReader());

                conn.Close();

                loadData();
            }
            catch { }
        }

        protected void updateDataBarang(string id)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();

                SqlCommand command = new SqlCommand("sp_UpdateBarang", conn);
                command.Parameters.AddWithValue("@id_barang", id);
                command.Parameters.AddWithValue("@stok_barang", txtStokBarang.Text);
                command.CommandType = CommandType.StoredProcedure;
                dt.Load(command.ExecuteReader());

                conn.Close();

                loadData();
            }
            catch { }
        }

        protected void clearForm()
        {
            hiddenID.Text = "";
            txtNamaBarang.Text = "";
            txtStokBarang.Text = "";
            txtHargaBeli.Text = "";
            txtHargaJual.Text = "";
            txtSatuan.Text = "";
        }
    }
}