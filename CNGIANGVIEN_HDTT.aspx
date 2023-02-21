<%@ Page Title="" Language="C#" MasterPageFile="~/CNGIANGVIEN.Master" AutoEventWireup="true" CodeBehind="CNGIANGVIEN_HDTT.aspx.cs" Inherits="NCKH.CNGIANGVIEN_HDTT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <LINK REL=StyleSheet HREF="css/Style-CNGVHDTT.css" TYPE="text/css" >
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
                <div class="row-1">
                    <h3>DUYỆT DANH SÁCH SINH VIÊN</h3>
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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSV" DataSourceID="SqlDataSource_DSV" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="TenSV" HeaderText="Tên hồ sơ" SortExpression="TenSV" />
                            <asp:TemplateField HeaderText="Mã sinh viên" SortExpression="MaSV">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaSV") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaSV") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NgayDangky" HeaderText="Thời gian đăng ký" SortExpression="NgayDangky" />
                            <asp:TemplateField HeaderText="Thông tin cá nhân">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text="Xem thông tin cá nhân" NavigateUrl='~/CNGIANGVIEN_TTSV.aspx?MaSV=2021001022'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng thái tuyển dụng" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="button-duyet" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="False"  CssClass="button-duyet" Text="Duyệt" OnClick="LinkButton1_Click" CommandName="duyet"></asp:Button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_DSV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select TenSV,tbSinhVien.MaSV,NgayDangky,Tinhtrang
from tbDangkyGV join tbSinhVien on tbDangkyGV.MaSV=tbSinhVien.MaSV
where Tinhtrang=N'Chưa biết' and tbDangkyGV.MaGV=@MaGV and NgayDangky is not null" UpdateCommand="UPDATE tbDangkyGV SET Tinhtrang = @Tinhtrang, NgayDangky = @NgayDangky WHERE (MaSV = @MaSV) AND (MaGV = @MaGV)">
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
