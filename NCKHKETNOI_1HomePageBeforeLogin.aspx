<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="NCKHKETNOI_1HomePageBeforeLogin.aspx.cs" Inherits="NCKH.NCKHKETNOI_1HomePageAfterLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style10 {
            margin-left: 80px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td colspan="2">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/hp.jpg" Width="1355px" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:TextBox ID="TextBox1" runat="server" BorderColor="CornflowerBlue" Height="40px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~\\Media\\search.png" />
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="background-color:#DCE4EF">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="MaB" DataSourceID="SqlDataSourceBTD">
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="MaBLabel" runat="server" Text='<%# Eval("MaB") %>' />
                    <br />
                    &nbsp;
                    <asp:Image ID="Image2" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="NoidungLabel" runat="server" Text='<%# Eval("Noidung") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceBTD" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT [MaB], [Noidung] FROM [tbBaituyendung]"></asp:SqlDataSource>
        </td>
        <td style="background-color:#DCE4EF">
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSourceTB" OnItemCommand="DataList2_ItemCommand">
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
                    <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("Hinh") %>' Width="160px" />
                    <asp:Label ID="TieudeLabel" runat="server" Text='<%# Eval("Tieude") %>' />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceTB" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT [Tieude], [Hinh] FROM [tbThongbao]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
</table>
</asp:Content>
