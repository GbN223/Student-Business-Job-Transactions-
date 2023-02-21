<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CNKhoa_Giangvien.aspx.cs" Inherits="NCKH.CNKhoa_Giangvien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Style-GV.css" type="text/css" /> 
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
       
        .auto-style2 {
            width: 310px;
        }
        .auto-style3 {
            width: 121px;
        }
       .mota{
           width:70%;
       }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;
                <div class="row-1">
                    <div class="row-1-colum1">
                         <h1>GIỚI THIỆU DANH SÁCH GIẢNG VIÊN HƯỚNG DẪN HỌC PHẦN<br />THỰC TẬP NGHỀ NGHIỆP </h1>
                    </div>
                   <div class="row-1-colum2"> 
                       <asp:TextBox CssClass="text-box-search" placeholder="Tìm kiếm thông tin giảng viên" ID="tbxTimGV" runat="server" OnTextChanged="tbxTimGV_TextChanged"></asp:TextBox>
                       <asp:Button ID="btnTimGV" runat="server" CssClass="button-search" OnClick="btnTimGV_Click" BackColor="White" />
                   </div>
                        
                </div>
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-2">
                    <asp:Button ID="btnThemGV" runat="server" Text="THÊM THÔNG TIN" OnClick="btnThemGV_Click" CssClass="button-add" Font-Bold />
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-4">
                    
                   
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                <div class="row-3">
                <asp:DataList ID="DataList_GV" runat="server" DataKeyField="MaGV" DataSourceID="SqlDataSource_KHOAGV" CellPadding="2" CellSpacing="5" RepeatColumns="1" CssClass="auto-style2" Width="99%" OnItemCommand="DataList_GV_ItemCommand" OnItemDataBound="DataList_GV_ItemDataBound">
                    <ItemStyle BackColor="#E4E6EA" Width="100%" />
                    <ItemTemplate>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="auto-style1">
                            <tr>
                                <td class="auto-style3">
                                    <asp:Image ID="Image1" runat="server" Height="110px" ImageUrl='<%# Eval("Hinh") %>' Width="113px" />
                                </td>
                              
                                <td>&nbsp;</td>
                                <td class="mota">Giảng viên hướng dẫn:
                                    <asp:Label ID="TenGVLabel" runat="server" Text='<%# Eval("TenGV") %>' />
                                    <br />
                                    &nbsp;Học vị:
                                    <asp:Label ID="HocViLabel" runat="server" Text='<%# Eval("HocVi") %>' />
                                    <br />
                                    &nbsp;Chức vụ:
                                    <asp:Label ID="ChucvuLabel" runat="server" Text='<%# Eval("Chucvu") %>' />
                                    <br />
                                    &nbsp;Chỉ tiêu:
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Chitieu") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="MaGV" runat="server" Text='<%# Eval("MaGV") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="btnHuy" runat="server" CssClass="button-choose" Text="Hủy tham gia" CommandName="huythamgia" Enable="False" />
                                    <asp:Button ID="btnThamgia" runat="server" CssClass="button-choose"  Text="Tham gia" CommandName="thamgia" />
                                    <asp:Button ID="btnSua" runat="server" CssClass="button-choose" Text="Sửa" CommandName="sua" data-toggle="modal" data-target="#myModal" />
                                    <asp:Button ID="btnXoa" runat="server" CssClass="button-choose" Text="Xóa" CommandName="xoa" />
                               
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_KHOAGV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="Select*from tbGiangvien
" InsertCommand="INSERT INTO tbGiangvien(MaGV, TenGV, HocVi, Chucvu, Email, Chitieu, Hinh) VALUES (@MaGV, @TenGV, @Hocvi, @Chucvu, @Email, @Chitieu, @Hinh)"></asp:SqlDataSource>
            </div>
                    </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList_GVTK" runat="server" DataKeyField="MaGV" DataSourceID="SqlDataSource_GVTIM" CellPadding="2" CellSpacing="2" RepeatColumns="1" CssClass="auto-style2" OnItemCommand="DataList_GVTK_ItemCommand" OnItemDataBound="DataList_GVTK_ItemDataBound">
                    <ItemStyle BackColor="#E4E6EA" Width="1400px" />
                    <ItemTemplate>
                        <br />
                        &nbsp;<asp:Image ID="Image1" runat="server" Height="110px" Width="113px" ImageUrl='<%# Eval("Hinh") %>' />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        &nbsp;Giảng viên hướng dẫn:
                        <asp:Label ID="TenGVLabel" runat="server" Text='<%# Eval("TenGV") %>' />
                        <br />
                        &nbsp;Học vị:
                        <asp:Label ID="HocViLabel" runat="server" Text='<%# Eval("HocVi") %>' />
                        <br />
                        &nbsp;Chức vụ:
                        <asp:Label ID="ChucvuLabel" runat="server" Text='<%# Eval("Chucvu") %>' />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_GVTIM" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT MaGV, TenGV, HocVi, Chucvu, Email, Chitieu, Hinh FROM tbGiangvien WHERE (MaGV = @MaGV) OR (TenGV = @TenGV)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tbxTimGV" Name="MaGV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxTimGV" Name="TenGV" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Text="Label" Visible="False"></asp:Label>
                
            </td>
        </tr>
    </table>
</asp:Content>
