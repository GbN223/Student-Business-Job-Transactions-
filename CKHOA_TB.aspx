<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CKHOA_TB.aspx.cs" Inherits="NCKH.CKHOA_TB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" href="css/Style-KHOA_TB.css" type="text/css" /> 

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
        width: 1057px;
    }
    .auto-style5 {
        width: 32px;
    }
        .auto-style6 {
            width: 99%;
            height: 185px;
        }
        .auto-style7 {
            float: right;
            background: #D85124;
            border-radius: 25px;
            border-style: none;
            color: aliceblue;
            font-weight: bold;
            cursor: pointer;
            margin-left: 12;
        }
        .btnCapnhatxoa{
            border-radius: 15px;
        }
        
        .auto-style8 {
            width: 18px;
        }
        .auto-style10 {
            width: 19px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>           
            <td>&nbsp;
                <div class="row-1">
                    <div class="row-1-colum1 gradient-1">
                        <h1>
                            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="DANH SÁCH BÀI ĐĂNG THÔNG BÁO" Font-Bold="True" Font-Underline="false"  ></asp:Label>
                        </h1>
                    </div>
                    <div class="row-1-colum2">
                                            <asp:Button ID="btnThemTB" runat="server" Text="TẠO THÔNG BÁO" OnClick="btnThemTB_Click" CssClass="auto-style7" Height="45px" Width="158px" />

                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-2">
                    <asp:DataList ID="DataList_TB" runat="server" CellPadding="2" DataKeyField="MaTB" DataSourceID="SqlDataSource_KHOATB" RepeatColumns="1" Width="99%" OnItemCommand="DataList_TB_ItemCommand" OnSelectedIndexChanged="DataList_TB_SelectedIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black">
                        <AlternatingItemStyle BackColor="PaleGoldenrod" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <ItemTemplate>
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style8">
                                        &nbsp;</td>
                                    <td class="auto-style5">
                                        <asp:Image ID="Image1" runat="server" Height="157px" ImageUrl='<%# Eval("Hinh") %>' Width="200px" />
                                    </td>
                                    <td class="auto-style10">
                                        &nbsp;</td>
                                    <td class="auto-style4">
                                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="20px" Font-Underline="False" ForeColor="Black" NavigateUrl='<%# Eval("MaTB", "CNKHOA_CTTB.aspx?Ma={0}") %>' Text='<%# Eval("Tieude") %>'></asp:HyperLink>
                                        <br />
                                        <asp:Label ID="MaTB" runat="server" Text='<%# Eval("MaTB") %>' Visible="False"></asp:Label>
                                    </td>
                                    <td class="btnCX">
                                        <asp:Button ID="Button1" runat="server" Font-Size="Large" CssClass="btnCapnhat" OnClick="Button1_Click" CommandName="sua" ToolTip="Cập nhật" />
                                        <asp:Button ID="Button2" runat="server" CssClass="btnxoa" Font-Size="Large" ToolTip="Xóa" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource_KHOATB" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" InsertCommand="INSERT INTO tbThongbao(MaTB, Tieude, Noidung, Hinh, Link, MaKH) VALUES (@MaTB, @Tieude, @Noidung, @Hinh, @Link, @MaKH)" SelectCommand="SELECT * FROM [tbThongbao]"></asp:SqlDataSource>
                </div>
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
