<%@ Page Title="" Language="C#" MasterPageFile="~/CNGIANGVIEN.Master" AutoEventWireup="true" CodeBehind="CNGIANGVIEN_HDTT.aspx.cs" Inherits="NCKH.CNGIANGVIEN_HDTT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <LINK REL=StyleSheet HREF="css/Style-CNGVHDTT.css" TYPE="text/css" >
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .row-3{
            padding-left:4%;
        }
        .grid td{
            padding-left:5%;
        }
        .headergrid th{
            padding-right:3%;
        }
        .headergrid th:first-of-type{
             padding-right:-3%;
        }
        .ten {
           margin-left:4%;
        }
        .masv{
            padding-left:5%;
        }
        .ngay th{
            margin-left:4%;
        }
        .row-1 h3{
            padding-left:1%;
            font-family:Arial;
            color:#D85121;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <div class="row-1">
                    <h3>DANH SÁCH SINH VIÊN ĐĂNG KÝ HƯỚNG DẪN THỰC TẬP</h3>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-2">
                    <div class="row-2-colum1">
                    </div>
                    <div class="row-2-colum2">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSV" DataSourceID="SqlDataSource_DSV" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCommand="GridView1_RowCommand" Width="90%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" CssClass="grid"> 
                        <Columns>
                            <asp:BoundField DataField="TenSV" HeaderText="Tên hồ sơ" SortExpression="TenSV" ItemStyle-Width="360px" ItemStyle-CssClass="ten" />
                            <asp:TemplateField HeaderText="Mã sinh viên" SortExpression="MaSV">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaSV") %>'  CssClass="masv"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaSV") %>' Width="180px"   CssClass="masv"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField   DataField="NGAYDANGKY" HeaderText="Thời gian đăng ký" SortExpression="NgayDangky" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-Width="180px" HeaderStyle-CssClass="ngay" />
                            <asp:TemplateField HeaderText="Thông tin cá nhân">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text="Xem thông tin sinh viên" NavigateUrl='~/CNGIANGVIEN_TTSV.aspx?MaSV=2021001022'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="headergrid" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"  />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_DSV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select TenSV,tbSinhVien.MaSV,NgayDangky,Tinhtrang
from tbDangkyGV join tbSinhVien on tbDangkyGV.MaSV=tbSinhVien.MaSV
where   tbDangkyGV.MaGV=@MaGV " UpdateCommand="UPDATE tbDangkyGV SET Tinhtrang = @Tinhtrang, NgayDangky = @NgayDangky WHERE (MaSV = @MaSV) AND (MaGV = @MaGV)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MaGV" QueryStringField="MaGV" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Tinhtrang" />
                            <asp:Parameter Name="NgayDangky" />
                            <asp:Parameter Name="MaSV" />
                            <asp:QueryStringParameter Name="MaGV" QueryStringField="MaGV" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource_DKGV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select TenSV,tbSinhVien.MaSV,NgayDangky,Tinhtrang
from tbDangkyGV join tbSinhVien on tbDangkyGV.MaSV=tbSinhVien.MaSV
where Tinhtrang is NULL and tbDangkyGV.MaGV=@MaGV">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MaGV" QueryStringField="MaGV" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
