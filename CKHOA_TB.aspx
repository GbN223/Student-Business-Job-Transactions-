<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CKHOA_TB.aspx.cs" Inherits="NCKH.CKHOA_TB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" href="css/Style-KHOA_TB.css" type="text/css" /> 

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 149px;
        }
    .auto-style3 {
        margin-top: 10px;
        padding-left: 5px;
    }
    .auto-style4 {
        width: 1155px;
    }
    .auto-style5 {
        width: 55px;
    }
        .auto-style6 {
            width: 100%;
            height: 185px;
        }
        .auto-style7 {
            float: right;
            width: 140px;
            height: 40px;
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
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;
                <div class="row-1">
                    <div class="row-1-colum1">
                        <h1>
                            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="DANH SÁCH BÀI ĐĂNG THÔNG BÁO" Font-Bold="True" Font-Underline="false"  ></asp:Label>
                        </h1>
                    </div>
                    <div class="row-1-colum2">
                                            <asp:Button ID="btnThemTB" runat="server" Text="TẠO THÔNG BÁO" OnClick="btnThemTB_Click" CssClass="auto-style7" />

                    </div>
                </div>
            </td>
        </tr>
        <tr>
         
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-2">
                    <asp:DataList ID="DataList_TB" runat="server" CellPadding="10" CellSpacing="10" DataKeyField="MaTB" DataSourceID="SqlDataSource_KHOATB" RepeatColumns="1" Width="99%" OnItemCommand="DataList_TB_ItemCommand">
                        <ItemStyle BackColor="#EDE8F7" />
                        <ItemTemplate>
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style2">
                                        <asp:Image ID="Image1" runat="server" Height="157px" ImageUrl='<%# Eval("Hinh") %>' Width="200px" />
                                    </td>
                                    <td class="auto-style5">&nbsp;</td>
                                    <td class="auto-style4">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MaTB", "CNKHOA_CTTB.aspx?Ma={0}") %>' Text='<%# Eval("Tieude") %>' Font-Size="X-Large" ForeColor="Black" Font-Underline="False"></asp:HyperLink>
                                        <br />
                                        <asp:Label ID="MaTB" runat="server" Text='<%# Eval("MaTB") %>' Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" Text="Cập nhật" Font-Size="Large" BackColor="#CC3300" BorderColor="#CC3300" CssClass="btnCapnhatxoa" Width="105px" ForeColor="White" OnClick="Button1_Click" CommandName="sua" />
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Button ID="Button2" runat="server" BackColor="#CC3300" BorderColor="#CC3300" CssClass="btnCapnhatxoa" Font-Size="Large" ForeColor="White" Text="Xóa" Width="104px" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
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
