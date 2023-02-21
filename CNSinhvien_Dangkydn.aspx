<%@ Page Title="" Language="C#" MasterPageFile="~/CNSinhvien_Master.Master" AutoEventWireup="true" CodeBehind="CNSinhvien_Dangkydn.aspx.cs" Inherits="SINHVIEN.CNSinhvien_Dangkydn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btnDangkydn{
            border-radius:20px;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 1350px;
            height: 317px;
            margin-left: 0px;
        }
        .auto-style3 {
            height: 62px;
            border-radius 20px;
        }
        .auto-style5 {
            height: 62px;
            width: 251px;
        }
        .auto-style6 {
            height: 62px;
            width: 309px;
        }
        .auto-style7 {
            width: 99%;
            height: 101px;
            margin-bottom: 278;
            margin-left: 8px;
        }
        .auto-style8 {
            height: 62px;
            width: 553px;
        }
        .auto-style9 {
            width: 239px;
        }
        .auto-style10 {
            width: 468px;
        }
        .auto-style14 {
            width: 211px;
        }
        .auto-style17 {
            height: 62px;
            width: 115px;
        }
        .auto-style18 {
            width: 32px;
        }
        .auto-style24 {
            font-weight: bold;
        }
        .btndangky{
               
        }
        .auto-style25 {
            height: 62px;
            width: 201px;
        }
        .auto-style26 {
            height: 62px;
            width: 87px;
        }
        #Label2{
            float:left;
          
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <img  class="auto-style2"  src="Image/bannerDN.png" /></td>
        </tr>
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style10"><strong __designer:mapid="19">
                            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" ForeColor="#FF3300" Text="Yêu cầu"></asp:Label>
                            </strong></td>
                        <td class="auto-style14"><strong __designer:mapid="19">
                            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" ForeColor="#FF3300" Text="Chỉ tiêu"></asp:Label>
                            </strong></td>
                        <td class="auto-style18">&nbsp;</td>
                        <td><strong __designer:mapid="1a">
                            <asp:Label ID="Label3" runat="server" Font-Size="X-Large" ForeColor="#FF3300" Text="Số lượt đăng ký"></asp:Label>
                            </strong></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaDN" DataSourceID="SqlDataSourceDN" Height="527px" Width="1325px" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" style="margin-left:1%">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#E3EAEB" />
                

                    <ItemTemplate>
                        <table class="auto-style7">
                            <tr>
                                <td class="auto-style5">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh") %>' Width="200px" />
                                    <br />
                                    <asp:Label ID="MaDNLabel" runat="server" Text='<%# Eval("MaDN") %>' Visible="False" />
                                </td>
                                <td class="auto-style8">
                                    <asp:Label ID="YeucauLabel" runat="server" Font-Size="Large" Text='<%# Eval("Yeucau") %>' />
                                </td>
                                <td class="auto-style26">&nbsp;</td>
                                <td class="auto-style17">
                                    <asp:Label ID="ChitieuLabel" runat="server" Font-Size="Large" Text='<%# Eval("Chitieu") %>' CssClass="auto-style24" />
                                </td>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style6">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Sldangky") %>'></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    <asp:Button ID="btnDangky" runat="server" CssClass="btnDangkydn" BackColor="#FF6600" BorderColor="#FF6600" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="48px" Text="Đăng ký" Width="134px"  CommandName="dangkydn" OnClick="btnDangky_Click" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSourceDN" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select [MaDN], [Hinh], [Yeucau], [Chitieu], [Sldangky]
from tbDoanhnghiep
where MADN in (select MADN from tbChonDN
				where HOCKI='HK01' and NAM=2023 )"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_SVDangkyDN" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" InsertCommand="INSERT INTO tbDangky(MaSV, MaDN, NAM, HOCKI, TINHTRANG, KHOAHOC, NGAYDANGKY) VALUES (@MaSV, @MaDN, @NAM, @HOCKI, @TINHTRANG, @KHOAHOC, @NGAYDANGKY)" SelectCommand="SELECT * FROM [tbDangky]"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
