<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CNKHOA_CTTB.aspx.cs" Inherits="NCKH.CNKHOA_CTTB" %>
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
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MaTB" DataSourceID="SqlDataSource_CTTB">
                <EditItemTemplate>
                    MaTB:
                    <asp:Label ID="MaTBLabel1" runat="server" Text='<%# Eval("MaTB") %>' />
                    <br />
                    Tieude:
                    <asp:TextBox ID="TieudeTextBox" runat="server" Text='<%# Bind("Tieude") %>' />
                    <br />
                    Noidung:
                    <asp:TextBox ID="NoidungTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("Noidung") %>' />
                    <br />
                    Hinh:
                    <asp:TextBox ID="HinhTextBox" runat="server" Text='<%# Bind("Hinh") %>' />
                    <br />
                    Link:
                    <asp:TextBox ID="LinkTextBox" runat="server" Text='<%# Bind("Link") %>' />
                    <br />
                    MaKH:
                    <asp:TextBox ID="MaKHTextBox" runat="server" Text='<%# Bind("MaKH") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    MaTB:
                    <asp:TextBox ID="MaTBTextBox" runat="server" Text='<%# Bind("MaTB") %>' />
                    <br />
                    Tieude:
                    <asp:TextBox ID="TieudeTextBox" runat="server" Text='<%# Bind("Tieude") %>' />
                    <br />
                    Noidung:
                    <asp:TextBox ID="NoidungTextBox" runat="server" Text='<%# Bind("Noidung") %>' />
                    <br />
                    Hinh:
                    <asp:TextBox ID="HinhTextBox" runat="server" Text='<%# Bind("Hinh") %>' />
                    <br />
                    Link:
                    <asp:TextBox ID="LinkTextBox" runat="server" Text='<%# Bind("Link") %>' />
                    <br />
                    MaKH:
                    <asp:TextBox ID="MaKHTextBox" runat="server" Text='<%# Bind("MaKH") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="118px" ImageUrl='<%# Eval("Hinh") %>' Width="140px" />
                    <br />
                    Tieude:
                    <asp:Label ID="TieudeLabel" runat="server" Text='<%# Bind("Tieude") %>' />
                    <br />
                    Noidung:
                    <asp:Label ID="NoidungLabel" runat="server" Text='<%# Bind("Noidung") %>' />
                    <br />
                    <br />
                    Link:
                    <asp:Label ID="LinkLabel" runat="server" Text='<%# Bind("Link") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource_CTTB" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT * FROM [tbThongbao] WHERE ([MaTB] = @MaTB)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="MaTB" QueryStringField="Ma" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
