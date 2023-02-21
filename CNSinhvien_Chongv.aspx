<%@ Page Title="" Language="C#" MasterPageFile="~/CNSinhvien_Master.Master" AutoEventWireup="true" CodeBehind="CNSinhvien_Chongv.aspx.cs" Inherits="NCKH.CNSinhvien_Chongv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btnDangkygv{
            border-radius:20px;
        }
        .auto-style1 {
        width: 100%;
        border-radius 32px;
    }
    .auto-style2 {
        height: 64px;
    }
        .auto-style23 {
            width: 257px;
            height: 72px;
        }
        .auto-style24 {
            width: 442px;
            height: 72px;
        }
        .auto-style25 {
            width: 209px;
            height: 72px;
        }
        .auto-style26 {
            width: 100%;
            height:100px;
        }
        .auto-style28 {
            width: 502px;
            height: 24px;
        }
        .auto-style30 {
            width: 240px;
            height: 24px;
        }
        .auto-style31 {
            height: 24px;
            width: 297px;
        }
        .auto-style35 {
            width: 283px;
            height: 24px;
        }
        .auto-style36 {
            height: 72px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table class="auto-style1">
    <tr>
        <td><strong>
            <asp:Label ID="Label1" runat="server" ForeColor="#FF6600" Text="ĐĂNG KÝ GIẢNG VIÊN HƯỚNG DẪN HỌC PHẦN THỰC TẬP NGHỀ NGHIỆP" Font-Size="X-Large"></asp:Label>
            </strong></td>
    </tr>
</table>
    <table class="auto-style1">
        <tr>
            <td><strong>
                <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="HỌC KÌ I - 2023" Font-Size="X-Large"></asp:Label>
    </strong>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style23">
                            <asp:SqlDataSource ID="SqlDataSource_DangkyGV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [tbDangkyGV]"></asp:SqlDataSource>
                        </td>
                        <td class="auto-style24"><strong __designer:mapid="3a">
                            <asp:Label ID="Label3" runat="server" Text="Thông tin giảng viên" Font-Size="X-Large" ForeColor="#FF6600"></asp:Label>
                            </strong></td>
                        <td class="auto-style25"><strong __designer:mapid="3d">
                            <asp:Label ID="Label4" runat="server" Text="Chỉ tiêu" Font-Size="X-Large" ForeColor="#FF6600"></asp:Label>
                            </strong></td>
                        <td class="auto-style36"><strong __designer:mapid="3e">
                            <asp:Label ID="Label5" runat="server" Text="Số lượt đăng ký" Font-Size="X-Large" ForeColor="#FF6600"></asp:Label>
                            </strong></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
<table class="auto-style1">
    <tr>
        <td class="auto-style2">
            <asp:DataList ID="DataListThongtingv" runat="server" CellPadding="4" DataSourceID="SqlDataSourceCNSinhvien_Chongv" ForeColor="#333333" Height="90px" HorizontalAlign="Center" Width="1350px" OnItemCommand="DataListThongtingv_ItemCommand" OnItemDataBound="DataListThongtingv_ItemDataBound">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" Height="100px" />
                <ItemTemplate>
                    <div style="height:200px">
                    &nbsp;<table class="auto-style26">
                        <tr>
                            <td class="auto-style35">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh") %>' Width="180px" Height="170px" />
                                <strong>
                                <asp:Label ID="MagvLabel" runat="server" Text='<%# Eval("MaGV") %>' Visible="False"></asp:Label>
                                </strong>
                            </td>
                            <td class="auto-style28">
                                <strong>
                                <asp:Label ID="TenGVLabel" runat="server" Font-Size="Large" Text='<%# Eval("TenGV") %>' />
                                </strong>
                                <br />
                                <br />
                                <strong>
                                <asp:Label ID="HocViLabel" runat="server" Font-Size="Large" Text='<%# Eval("HocVi") %>' />
                                </strong>
                            </td>
                            <td class="auto-style30">
                                <strong>
                                <asp:Label ID="ChitieuLabel" runat="server" Font-Size="Large" Text='<%# Eval("Chitieu") %>' />
                                </strong>
                            </td>
                            <td class="auto-style31">
                                <strong>
                                <asp:Label ID="SldangkyLabel" runat="server" Font-Size="Large" Text='<%# Eval("Sldangky") %>' />
                                </strong>
                            </td>
                            <td>
                                <asp:Button ID="btnDangky" runat="server" Text="Đăng ký" BackColor="#FF6600" BorderColor="#FF6600" CssClass="btnDangkygv" Font-Bold="True" ForeColor="White" Height="48px" Width="134px" CommandName="DangkyGV" OnClick="btnDangky_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
<br />
                    <br />
                    <br />
                        </div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:SqlDataSource ID="SqlDataSourceCNSinhvien_Chongv" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT [Hinh], [TenGV], [HocVi], [Chitieu], [Sldangky], [MaGV] FROM [tbGiangvien]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            &nbsp;</td>
    </tr>
</table>
<br />
</asp:Content>
