﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CNKHOA_QLTT.aspx.cs" Inherits="NCKH.CNKHOA_QLTT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <LINK REL=StyleSheet HREF="css/Style-CNKHOAQLTT.css" TYPE="text/css" >
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;
                <div class="row-1">
                    <h2>THÔNG TIN SINH VIÊN ĐĂNG KÍ THỰC TẬP NGHỀ NGHIỆP</h2>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                
                <div class="row-2">
                    <div class="row2-colum1">
                    <p>Năm học</p>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_NK" DataTextField="NAM" DataValueField="NAM" CssClass="dropdown-row2-colum1">
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource_NK" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT  distinct NAM FROM [tbDangky]"></asp:SqlDataSource>
                     </div>
                    <div class="row2-colum2">
                    <p>Học kì</p>  <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource_lop" DataTextField="HOCKI" DataValueField="HOCKI" AutoPostBack="True" CssClass="dropdown-row2-colum2"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource_lop" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT DISTINCT [HOCKI] FROM [tbDangky] ">
                        </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server" Text="XUẤT DANH SÁCH" CssClass="button-export" OnClick="Button1_Click" />
                        </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-3">
                    <div class="row-3-colum1">
                   
                    
                        </div>
                    <div class="row-3-colum2">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="row-4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSV" DataSourceID="SqlDataSource_DS">
                    <Columns>
                        <asp:BoundField DataField="MaSV" HeaderText="Mã số sinh viên" ReadOnly="True" SortExpression="MaSV" ItemStyle-Width="150px" HeaderStyle-Width="150px" >
<HeaderStyle Width="150px"></HeaderStyle>

<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TenSV" HeaderText="Họ và tên" SortExpression="TenSV" ItemStyle-Width="240px" HeaderStyle-Width="240px">
<HeaderStyle Width="200px"></HeaderStyle>

<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TenGV" HeaderText="Giảng viên" SortExpression="TenGV"  ItemStyle-Width="200px" HeaderStyle-Width="150px" >
<HeaderStyle Width="150px"></HeaderStyle>

<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TenDN" HeaderText="Doanh nghiệp" SortExpression="TenDN" ItemStyle-Width="200px" HeaderStyle-Width="150px" >
<HeaderStyle Width="450px"></HeaderStyle>

<ItemStyle Height="50px"  Width="200px"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_DS" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT tbSinhVien.MaSV,tbSinhVien.TenSV, tbGiangvien.TenGV, tbDoanhnghiep.TenDN FROM tbDangky INNER JOIN tbSinhVien ON tbDangky.MaSV = tbSinhVien.MaSV INNER JOIN tbDoanhnghiep ON tbDangky.MaDN = tbDoanhnghiep.MaDN INNER JOIN tbDangkyGV ON tbSinhVien.MaSV = tbDangkyGV.MaSV INNER JOIN tbGiangvien ON tbDangkyGV.MaGV = tbGiangvien.MaGV WHERE (tbDangky.Tinhtrang = 'True') AND (tbDangkyGV.Tinhtrang = 'True') AND (tbDangky.NAM=@Nam) AND tbDangky.HOCKI=@Hocki">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Nam" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="Hocki" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
