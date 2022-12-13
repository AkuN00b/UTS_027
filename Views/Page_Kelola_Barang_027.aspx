<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/MainLayout.Master" AutoEventWireup="true" CodeBehind="Page_Kelola_Barang_027.aspx.cs" Inherits="UTS_027.Views.Page_Kelola_Barang_027" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Page Kelola Barang 027</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left: 30px; padding-right: 30px;">
        <asp:Panel runat="server" ID="panelView">
            <h2>Lihat Barang</h2>
            <hr />

            <asp:Button Text="+" ID="btnTambah" OnClick="btnTambah_Click" runat="server" />
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
            </asp:GridView>
        </asp:Panel>

        <asp:Panel runat="server" ID="panelManipulasiData" Visible="false">
            <h2>
                <asp:Literal ID="literalTitle" runat="server" />
            </h2>
            <hr />

            <asp:TextBox runat="server" ID="hiddenID" Visible="false" />

            <asp:Label Text="Nama Barang" ID="lblNamaBarang" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtNamaBarang"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtNamaBarang" CssClass="d-block mb-2" />


            <asp:Label Text="Stok Barang" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtStokBarang"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtStokBarang" runat="server"
                ForeColor="Red" Text="Hanya Angka" ValidationGroup="ValTambah"
                ValidationExpression="^[0-9]*$" />
            <asp:RangeValidator ID="val" ControlToValidate="txtStokBarang" runat="server"
                ForeColor="Red" Text="Tidak boleh 0 stoknya" ValidationGroup="ValTambah" MinimumValue="1" MaximumValue="max" />
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtStokBarang" CssClass="d-block mb-2" />


            <asp:Label Text="Harga Beli" ID="lblHargaBeli" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtHargaBeli"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtHargaBeli" runat="server"
                ForeColor="Red" Text="Hanya Angka" ValidationGroup="ValTambah"
                ValidationExpression="^[0-9]*$" />
            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtHargaBeli" runat="server"
                ForeColor="Red" Text="Tidak boleh 0 harganya" ValidationGroup="ValTambah" MinimumValue="1" MaximumValue="max" />
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtHargaBeli" CssClass="d-block mb-2" />


            <asp:Label Text="Harga Jual" ID="lblHargaJual" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtHargaJual"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtHargaJual" runat="server"
                ForeColor="Red" Text="Hanya Angka" ValidationGroup="ValTambah"
                ValidationExpression="^[0-9]*$" />
            <asp:RangeValidator ID="RangeValidator2" ControlToValidate="txtHargaJual" runat="server"
                ForeColor="Red" Text="Tidak boleh 0 harganya" ValidationGroup="ValTambah" MinimumValue="1" MaximumValue="max" />
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtHargaJual" CssClass="d-block mb-2" />


            <asp:Label Text="Satuan" ID="lblSatuan" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtSatuan"
                ErrorMessage="Harus Diisi" ForeColor="Red" ValidationGroup="ValTambah"></asp:RequiredFieldValidator>
            <asp:Label CssClass="d-block" runat="server" />
            <asp:TextBox runat="server" ID="txtSatuan" CssClass="d-block mb-2" />


            <asp:Button ID="btnKirim" OnClick="btnKirim_Click" runat="server" ValidationGroup="ValTambah" />
        </asp:Panel>
    </div>
</asp:Content>
