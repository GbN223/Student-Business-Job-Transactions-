<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CNKHOA_DN.aspx.cs" Inherits="NCKH.CNKHOA_DN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="css/Style-KHOA_DN.css" type="text/css" /> 
       

    <script type="text/javascript">
  function ConfirmDelete() {
      if (confirm("Bạn có muốn xóa doanh nghiệp?")) {
          return true;
      } else {
          return false;
      }
  }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
     
  .button{
      width:185px;
      height:110px;
      float:right;
      margin-right:5%;
  }
        .auto-style2 {
            width: 2px;
        }
        .auto-style3 {
            width: 20px;
        }
     
   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <div class="row-1">
                    <div class="row-1-colum1">
                         <h3>Tổng số lượng doanh nghiệp hiện tại: <asp:Label ID="Label1" runat="server" Text="" AutoPostBack="true"></asp:Label>
                         </h3>
                    </div>
                   <div class="row-1-colum2">
                       <asp:Button ID="btnThemDN" runat="server" Text="THÊM THÔNG TIN" CssClass="button-add"  OnClick="btnThemDN_Click" />

                   </div>
                
                    </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select count(*) as count from tbDoanhnghiep"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <div class="row-3">
                    </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="row-2">
                <asp:DataList ID="DataList_DN" runat="server" DataKeyField="MaDN" DataSourceID="SqlDataSource_KHOADN" CellPadding="10" CellSpacing="10" RepeatColumns="1" Width="96%" OnItemCommand="DataList_DN_ItemCommand" OnSelectedIndexChanged="Page_Load" OnItemDataBound="DataList_DN_ItemDataBound"  >
                    <ItemStyle BackColor="#DBE3EE" />
                    <ItemTemplate>
                        <br />
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Image ID="Image1" runat="server" Height="104px" ImageUrl='<%# Eval("Hinh") %>' Width="151px" />
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                                <td class="auto-style4">
                                    <div class="mota">
                                    <asp:Label ID="TenDNLabel" runat="server" CssClass="title_name" Text='<%# Eval("TenDN") %>' Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="MotaLabel" runat="server" CssClass="title_detail" Text='<%# Eval("Mota") %>' Width="85%" Font-Size="Medium" />
                                    <br />
                                    <asp:Label ID="MADN" runat="server" Text='<%# Eval("MaDN") %>' Visible="False"></asp:Label>
                                </div>
                                        </td>
                                <td class="auto-style3">
                                    &nbsp;</td>
                                <td class="auto-style4">
                                    <div class="button">
                                    <asp:Button ID="btnDangkyDN" runat="server" CssClass="button-choose" Text="Chọn" CommandName="dangky"  />
                                    <asp:Button ID="Button1" runat="server"  CssClass="button-delete" />
                                    <asp:Button ID="Button2" runat="server" OnClientClick="return ConfirmDelete();" CssClass="button-update" CommandName="Xoa" OnClick="Button2_Click"  />
                                        </div>
                                </td>
                            </tr>
                        </table>
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_KHOADN" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT * FROM [tbDoanhnghiep]" InsertCommand="INSERT INTO tbDoanhnghiep(MaDN, TenDN, Email, SDT, Mota, Yeucau, Hinh) VALUES (@MaDN, @TenDN, @Email, @SDT, @Mota, @Yeucau, @Hinh)"></asp:SqlDataSource>
            </div>
                    </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource_DangkyDN" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" InsertCommand="INSERT INTO tbChonDN(MADN, HOCKI, NAM) VALUES (@MADN, @HOCKI, @NAM)" SelectCommand="SELECT * FROM [tbChonDN]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
