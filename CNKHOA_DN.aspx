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
        function changeText() {
            document.getElementById("Button1").innerHTML = "New Text";
        }

        function resetText() {
            document.getElementById("Button1").innerHTML = "Button 2";
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
            padding-left:1%;
        }
             
   
        .auto-style4 {
            width: 541px;
        }
        .auto-style5 {
            width: 1111px;
        }
        .auto-style6 {
            width: 39px;
        }
     
   
        .auto-style7 {
            width: 335px;
        }
        .auto-style8 {
            width: 185px;
            height: 110px;
            float: right;
            margin-right: 5%;
            margin-left: 18px;
        }
        .auto-style9 {
            font-family: Arial;
            font-size: 12px;
            padding-left: 2%;
            text-align: justify;
            text-justify: inter-word;
            font-family: Arial;
            margin-top: 1%;
        }
     
   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <div class="row-1">
                    <div class="row-1-colum1">
                         <br />
                         <h2 class="gradient-1 auto-style4">Tổng số lượng doanh nghiệp hiện tại: <asp:Label ID="Label1" runat="server" Text="" AutoPostBack="true"></asp:Label>
                         </h2>
                    </div>
                   <div class="row-1-colum2">
                       <asp:Button ID="btnThemDN" runat="server" Text="THÊM THÔNG TIN" CssClass="button-add"  OnClick="btnThemDN_Click" />

                   </div>
                
                    </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select count(*) as count from tbDoanhnghiep order by MaDN ASC"></asp:SqlDataSource>
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
                <asp:DataList ID="DataList_DN" runat="server" DataKeyField="MaDN" DataSourceID="SqlDataSource_KHOADN" CellPadding="10" CellSpacing="10" RepeatColumns="1" Width="100%" OnItemCommand="DataList_DN_ItemCommand" OnSelectedIndexChanged="Page_Load" OnItemDataBound="DataList_DN_ItemDataBound"  >
                    <ItemStyle BackColor="#DBE3EE" />
                    <ItemTemplate>
                        <br />
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Image ID="Image1" runat="server" Height="104px" ImageUrl='<%# Eval("Hinh") %>' Width="151px" />
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                                <td class="auto-style5">
                                    <div class="mota">
                                        <asp:Label ID="TenDNLabel" runat="server" CssClass="title_name" Font-Size="Large" Text='<%# Eval("TenDN") %>' />
                                        <br />
                                        <asp:Label ID="MotaLabel" runat="server" CssClass="title_detail" Font-Size="Medium" Text='<%# Eval("Mota") %>' Width="151%" Height="19px" />
                                        <br />
                                        <asp:Label ID="MADN" runat="server" Text='<%# Eval("MaDN") %>' Visible="False"></asp:Label>
                                    </div>
                                </td>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td class="auto-style4">
                                    <div class="auto-style8">
                                    <asp:Button ID="btnDangkyDN" runat="server" CssClass="button-choose" Text="Chọn" CommandName="dangky"  />
                                    <asp:Button ID="Button1" runat="server" BackColor="#1C4487"  CssClass="button-delete" ToolTip="Chỉnh sửa" />
                                    <asp:Button ID="Button2" runat="server" BackColor="#1C4487"   OnClientClick="return ConfirmDelete();" CssClass="button-update" CommandName="Xoa" OnClick="Button2_Click" ToolTip="Xóa"  />
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
