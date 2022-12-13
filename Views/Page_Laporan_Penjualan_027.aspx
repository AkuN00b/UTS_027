<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/MainLayout.Master" AutoEventWireup="true" CodeBehind="Page_Laporan_Penjualan_027.aspx.cs" Inherits="UTS_027.Views.Page_Laporan_Penjualan_027" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Page Laporan Penjualan 027</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left: 30px; padding-right: 30px;">
        <asp:Panel runat="server" ID="panelView">
            <h2>Laporan Penjualan</h2>
            <hr />

            <asp:Calendar runat="server" ID="tanggal" />
            <asp:Button Text="Cari" ID="cariLaporan" runat="server" OnClick="cariLaporan_Click1" CssClass="d-block" />

            <asp:Literal Text="Total Penjualan: " runat="server" ID="totalPenjualan" /><br />
            <asp:Literal Text="Jumlah Transaksi: " runat="server" ID="jumlahTransaksi" /><br />
            <asp:Literal Text="Jumlah Barang Terjual: " runat="server" ID="jumlahBarangTerjual" /><br />
            <asp:Literal Text="Jumlah Keuntungan: " runat="server" ID="jumlahKeuntungan" /><br />
            <asp:Literal Text="Barang Terlaris: " runat="server" ID="barangTerlaris" /><br />

            <%--<asp:Button Text="+" ID="btnTambah" OnClick="btnTambah_Click" runat="server" />
            <asp:TextBox runat="server" ID="txtCari" placeholder="Pencarian" />
            <asp:Button Text="Cari" runat="server" ID="btnCari" OnClick="btnCari_Click" />

            <br />
            <br />

            <asp:GridView runat="server" ID="gridDataBarang" AutoGenerateColumns="false" EmptyDataText="Tidak ada Data Barang"
                ShowHeader="true" ShowHeaderWhenEmpty="true" PageSize="5" AllowPaging="true" AllowSorting="false"
                DataKeyNames="id_barang" OnPageIndexChanging="gridDataBarang_PageIndexChanging" OnRowCommand="gridDataBarang_RowCommand"
                HeaderStyle-HorizontalAlign="Center">

                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />

                <Columns>
                    <asp:BoundField DataField="rownum" HeaderText="No" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="nama_barang" HeaderText="Nama Barang" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="stok_barang" HeaderText="Stok Barang" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="harga_beli" HeaderText="Harga Beli" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="harga_jual" HeaderText="Harga Jual" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="satuan" HeaderText="Satuan" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton Text="[Ubah]" ID="btnUbah" CommandName="Ubah" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>
        </asp:Panel>
    </div>
</asp:Content>
