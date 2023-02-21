<%@ Page Title="" Language="C#" MasterPageFile="~/CNGIANGVIEN.Master" AutoEventWireup="true" CodeBehind="CNGIANGVIEN_TTSV.aspx.cs" Inherits="NCKH.CNGIANGVIEN_TTSV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="MaSV" DataSourceID="SqlDataSource_TTSV">
                    <EditItemTemplate>
                        MaSV:
                        <asp:Label ID="MaSVLabel1" runat="server" Text='<%# Eval("MaSV") %>' />
                        <br />
                        TenSV:
                        <asp:TextBox ID="TenSVTextBox" runat="server" Text='<%# Bind("TenSV") %>' />
                        <br />
                        GioiTinh:
                        <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' />
                        <br />
                        Lop:
                        <asp:TextBox ID="LopTextBox" runat="server" Text='<%# Bind("Lop") %>' />
                        <br />
                        SDT:
                        <asp:TextBox ID="SDTTextBox" runat="server" Text='<%# Bind("SDT") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        MaSV:
                        <asp:TextBox ID="MaSVTextBox" runat="server" Text='<%# Bind("MaSV") %>' />
                        <br />
                        TenSV:
                        <asp:TextBox ID="TenSVTextBox" runat="server" Text='<%# Bind("TenSV") %>' />
                        <br />
                        GioiTinh:
                        <asp:TextBox ID="GioiTinhTextBox" runat="server" Text='<%# Bind("GioiTinh") %>' />
                        <br />
                        Lop:
                        <asp:TextBox ID="LopTextBox" runat="server" Text='<%# Bind("Lop") %>' />
                        <br />
                        SDT:
                        <asp:TextBox ID="SDTTextBox" runat="server" Text='<%# Bind("SDT") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        MaSV:
                        <asp:Label ID="MaSVLabel" runat="server" Text='<%# Eval("MaSV") %>' />
                        <br />
                        TenSV:
                        <asp:Label ID="TenSVLabel" runat="server" Text='<%# Bind("TenSV") %>' />
                        <br />
                        GioiTinh:
                        <asp:Label ID="GioiTinhLabel" runat="server" Text='<%# Bind("GioiTinh") %>' />
                        <br />
                        Lop:
                        <asp:Label ID="LopLabel" runat="server" Text='<%# Bind("Lop") %>' />
                        <br />
                        SDT:
                        <asp:Label ID="SDTLabel" runat="server" Text='<%# Bind("SDT") %>' />
                        <br />
                        Email:
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource_TTSV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT [MaSV], [TenSV], [GioiTinh], [Lop], [SDT], [Email] FROM [tbSinhVien] WHERE ([MaSV] = @MaSV)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MaSV" QueryStringField="MaSV" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
