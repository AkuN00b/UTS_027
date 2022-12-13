<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/MainLayout.Master" AutoEventWireup="true" CodeBehind="Page_Transaksi_Penjualan_027.aspx.cs" Inherits="UTS_027.Views.Page_Transaksi_Penjualan_027" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Page Transaksi Penjualan 027</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left: 30px; padding-right: 30px;">
        <asp:Panel runat="server" ID="panelView">
            <h2>Lihat Transaksi Penjualan</h2>
            <hr />

            <asp:Button Text="+" ID="btnTambah" OnClick="btnTambah_Click" runat="server" />
            <asp:TextBox runat="server" ID="txtCari" placeholder="Pencarian" />
            <asp:Button Text="Cari" runat="server" ID="btnCari" OnClick="btnCari_Click" />

            <br />
            <br />

            <asp:GridView runat="server" ID="gridDataTransaksiPenjualan" AutoGenerateColumns="false" EmptyDataText="Tidak ada Data Transaksi Penjualan"
                ShowHeader="true" ShowHeaderWhenEmpty="true" PageSize="5" AllowPaging="true" AllowSorting="false"
                DataKeyNames="id_transaksi" OnPageIndexChanging="gridDataTransaksiPenjualan_PageIndexChanging" OnRowCommand="gridDataTransaksiPenjualan_RowCommand"
                HeaderStyle-HorizontalAlign="Center">

                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />

                <Columns>
                    <asp:BoundField DataField="rownum" HeaderText="No" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="tanggal_transaksi" HeaderText="Tanggal Transaksi" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MMMM/yyyy}" />
                    <asp:BoundField DataField="nama_barang" HeaderText="Nama Barang" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="jumlah" HeaderText="Jumlah" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="harga" HeaderText="Harga" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="diskon" HeaderText="Diskon" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="harga_total" HeaderText="Harga Total" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="nama_kasir" HeaderText="Nama Kasir" ItemStyle-HorizontalAlign="Center" />
                </Columns>
            </asp:GridView>
        </asp:Panel>

        <asp:Panel runat="server" ID="panelManipulasiData" Visible="false">
            <h2>
                <asp:Literal ID="literalTitle" runat="server" />
            </h2>
            <hr />

            <asp:Label Text="Tanggal Transaksi" ID="lblTanggalTransaksi" runat="server" />

            <asp:TextBox runat="server" ID="txtTanggalTransaksi" CssClass="d-block mb-2" ReadOnly="true" />

            <asp:Label Text="Nama Barang" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="ddlNamaBarang"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:Label CssClass="d-block" runat="server" />
            <asp:DropDownList runat="server" ID="ddlNamaBarang" CssClass="d-block mb-2" OnSelectedIndexChanged="ddlNamaBarang_SelectedIndexChanged" OnTextChanged="ddlNamaBarang_TextChanged" AutoPostBack="true" />

            <asp:Label Text="Jumlah" ID="lblJumlah" runat="server"  />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtJumlah"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtJumlah" runat="server"
                ForeColor="Red" Text="Hanya Angka" ValidationGroup="ValTambah"
                ValidationExpression="^[0-9]*$" />
            <asp:RangeValidator ID="RangeValidator2" ControlToValidate="txtJumlah" runat="server"
                ForeColor="Red" Text="Tidak boleh 0 jumlahnya" ValidationGroup="ValTambah" MinimumValue="1" MaximumValue="max" />
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtJumlah" CssClass="d-block mb-2" OnTextChanged="txtJumlah_TextChanged" AutoPostBack="true" />

            <asp:Label Text="Harga" ID="lblHarga" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtHarga"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtHarga" runat="server"
                ForeColor="Red" Text="Hanya Angka" ValidationGroup="ValTambah"
                ValidationExpression="^[0-9]*$" />
            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtHarga" runat="server"
                ForeColor="Red" Text="Tidak boleh 0 harganya" ValidationGroup="ValTambah" MinimumValue="1" MaximumValue="max" />
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtHarga" CssClass="d-block mb-2" ReadOnly="true" />

            <asp:Label Text="Diskon" ID="lblDiskon" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtDiskon"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtDiskon" runat="server"
                ForeColor="Red" Text="Hanya Angka" ValidationGroup="ValTambah"
                ValidationExpression="^[0-9]*$" />
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtDiskon" CssClass="d-block mb-2" OnTextChanged="txtDiskon_TextChanged" AutoPostBack="true" />

            <asp:Label Text="Harga Total" ID="lblHargaTotal" runat="server"  />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtHargaTotal"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtHargaTotal" runat="server"
                ForeColor="Red" Text="Hanya Angka" ValidationGroup="ValTambah"
                ValidationExpression="^[0-9]*$" />
            <asp:RangeValidator ID="RangeValidator4" ControlToValidate="txtHargaTotal" runat="server"
                ForeColor="Red" Text="Tidak boleh 0 harganya" ValidationGroup="ValTambah" MinimumValue="1" MaximumValue="max" />
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtHargaTotal" CssClass="d-block mb-2" ReadOnly="true" />

            <asp:Label Text="Nama Kasir" ID="lblNamaKasir" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="ddlNamaKasir"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:Label CssClass="d-block" runat="server" />
            <asp:DropDownList runat="server" ID="ddlNamaKasir" CssClass="d-block mb-2" />

            <asp:Button ID="btnKirim" OnClick="btnKirim_Click" ValidationGroup="ValTambah" runat="server" />
        </asp:Panel>
    </div>
</asp:Content>
