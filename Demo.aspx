<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep_Master.Master" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="NCKH.Demo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
               <div class="row align-items-center">
  <div class="col-3 bg-light py-2">
    <!-- Banner -->
    <asp:Image ID="BannerImage" runat="server" CssClass="img-fluid" ImageUrl="~/Image/bannerDN.png" />
  </div>
  <div class="col-3 py-2">
    <!-- Search bar -->
    <div class="input-group">
      <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="Search..." />
      <div class="input-group-append">
        <button class="btn btn-outline-secondary" type="button"><i class="fas fa-search"></i></button>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaDN" DataSourceID="SqlDataSourceDN" Height="527px" Width="1325px" CellPadding="4" ForeColor="#333333"  style="margin-left:1%">
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
                                    <asp:Button ID="btnDangky" runat="server" CssClass="btnDangkydn" BackColor="#FF6600" BorderColor="#FF6600" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="48px" Text="Đăng ký" Width="134px"  CommandName="dangkydn"  />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
      </div>
    </div>
  </div>
  <div class="col-3 py-2">
    <!-- Datalist 1 -->
    <asp:Label ID="DataList1Label" runat="server" AssociatedControlID="DataList1TextBox" Text="Data 1:" />
                <asp:SqlDataSource ID="SqlDataSourceDN" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select [MaDN], [Hinh], [Yeucau], [Chitieu], [Sldangky]
from tbDoanhnghiep
where MADN in (select MADN from tbChonDN
				where HOCKI='HK01' and NAM=2023 )"></asp:SqlDataSource>
    <asp:TextBox ID="DataList1TextBox" runat="server" CssClass="form-control" />
  </div>
  <div class="col-3 py-2">
    <!-- Datalist 2 -->
    <asp:Label ID="DataList2Label" runat="server" AssociatedControlID="DataList2TextBox" Text="Data 2:" />
    <asp:TextBox ID="DataList2TextBox" runat="server" CssClass="form-control" />
  </div>
</div>
            </td>
        </tr>
    </table>
</asp:Content>
