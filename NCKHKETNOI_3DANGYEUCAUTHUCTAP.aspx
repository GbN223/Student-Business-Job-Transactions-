<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep_Master.Master" AutoEventWireup="true" CodeBehind="NCKHKETNOI_3DANGYEUCAUTHUCTAP.aspx.cs" Inherits="NVCK.NCKHKETNOI_3DANGYEUCAUTHUCTAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @font-face {
            font-family: Myriad;
            src: url(myriadpro-semicn_0.otf);
        }
        .auto-style1 {
            width: 100%;
            border-collapse:collapse
        }
        .auto-style4 {
            width:100%;
            border-collapse:collapse;
        }
       
        .tablecontainer1 {
            width:100%;
            padding: 0 1%;
            padding-top:1.5em;
        }
       .tablecontainer2 {
            width:100%;
            padding: 0 1%;
            padding-top:0.6em;
        }
       .tablecontainer3 {
            width:100%;
            padding: 0 1%;
            padding-top:1.5em;
       }
       .buttongroup {
           font-family:Myriad;
           height:9vh;
           display: grid;
           justify-content:end;
           float:right;
           position:relative;
           gap: 1.2em;
           grid-template-columns: repeat(3, 1fr); 
           padding-right: 1em;
           align-items:center;
           margin-inline: auto;
          
       }
        .auto-style2 {
            height: 16vh;
            width: 20%;
        }
        .btndelete {
           
            width: 85px;
            height: 6.4vh;
            border:none;
            background-color: #cdd6e5;
            border-radius:  15px;
            cursor:pointer;
            float:right
            
        }
        .btnuploadnew {
            width: 150px;
            height: 6.4vh;
            border:none;
            background-color:#ff7e28;
            border-radius: 15px;
            cursor: pointer;
        }
        .btnprintlist {
            width: 195px;
            height: 6.4vh;
            border:none;
            background-image:linear-gradient(to right, #3394C4, #2430B3);
            border-radius: 15px;
            cursor: pointer;
            
        }
       
        
       
        .auto-style6 {
            width: 100%;
            margin-top: 0px;
        }
       
        
       
        .auto-style8 {
            width: 124px;
        }
       
        
       
        .auto-style9 {
            height: 24px;
        }
        .auto-style12 {
            width: 113px;
        }
       
        
       
        .auto-style13 {
            width: 5%;
        }
       
        
       
        .auto-style15 {
            width: 20%;
        }
        .auto-style16 {
            width: 40%;
        }
       
        
       
        </style>
    <link href="https://fonts.googleapis.com/css?family=Baloo" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tablecontainer1">
    <table class="auto-style1">
        <tr style="background-color:#E5E5E5; height:12vh; border-spacing:0; overflow:auto; border-collapse:collapse">
            <td style="width:31%;padding:0px; border:none"  class="auto-style2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div style="padding:0px 0px 5px 80px ;">
                <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="baloo" Font-Size="27px" ForeColor="#5B5C5E" Text="THỐNG KÊ TIN"></asp:Label>
                </div>
            </td>
            <td style ="background-color:#FECBA8;padding:0px; border:none;width:23% " class="auto-style2">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="baloo" Font-Size="20px" ForeColor="#5B5C5E" Text="Tổng số tin đã đăng"></asp:Label>
                <br />
                <div style ="text-align:center">
                <asp:Label ID="lbposted" runat="server" Font-Bold="False" Font-Names="baloo" Font-Size="40px" ForeColor="#5B5C5E">0</asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1G05NguyenChiBaoDangkykhoahocConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT COUNT(*) FROM [tbBaituyendung] WHERE [Trangthai] = N'Đã đăng'"></asp:SqlDataSource>
                </div>
            </td>
            <td style ="background-color:#cdd6e5;width:23%; " class="auto-style3">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="baloo" Font-Size="20px" ForeColor="#5B5C5E" Text="Tin nháp"></asp:Label>
                <br />
                <div style ="text-align:center">
                <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Names="baloo" Font-Size="40px" ForeColor="#5B5C5E">0</asp:Label>
                </div>
                </td>
            
            <td  style ="background-color:#FECBA8; width:23%;" class="auto-style3">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Names="baloo" Font-Size="20px" ForeColor="#5B5C5E" Text="Tin đã lưu trữ"></asp:Label>
                <br />
                <div style="text-align:center">
                <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Names="baloo" Font-Size="40px" ForeColor="#5B5C5E" Font-Strikeout="False">0</asp:Label>
                </div>
            </td>
      
        </tr>
        </table>
       </div>
    <div class ="tablecontainer2">
    <table class="auto-style4">
        <tr style ="background-color:#E5E5E5; ">
            <td class="auto-style15">

            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="barlow" Font-Size="24px" ForeColor="#5B5C5E" Text="Bộ lọc"></asp:Label>

            </td>
            <td class="auto-style16" ></td>
            <td style = "width:35%" class="buttongroup">

                <asp:Button class="btndelete" ID="btndelete" runat="server" Text="Xóa" Font-Names="Arial" Font-Size="13pt" Font-Bold="True" />
                <asp:Button class ="btnuploadnew" ID="Button2" runat="server" Text="Đăng bài mới" Font-Names="Arial" Font-Size="13pt" Font-Bold="True" />
                <asp:LinkButton runat="server" class="btnprintlist">
                    <asp:Image runat="server" ImageUrl="~/Image/excel.png" width="35" style="float:left;margin:6px;padding-left:2px; transform:translateX(8px)"/>
                    <asp:Label runat="server" Text="Xuất danh sách" style="margin:13px 0px 12px 8px; float:left;color:#fefffe" Font-Names="Arial" Font-Size="13pt" Font-Bold="True"/>
                </asp:LinkButton></td></tr><tr style="padding:0 2%">
                    <asp:DataList ID="DataList1" runat="server" CellPadding="3" CssClass="auto-style6" DataKeyField="MaB" DataSourceID="SqlDataSourceTTD" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Vertical"><AlternatingItemStyle BackColor="#DCDCDC" /><FooterStyle BackColor="#CCCCCC" ForeColor="Black" /><HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" /><ItemStyle BackColor="#EEEEEE" ForeColor="Black" /><ItemTemplate><br /><table class="auto-style6"><tr><td style="width:25%" class="auto-style12"><asp:Label ID="TenCVLabel" runat="server" Text='<%# Eval("TenCV") %>' Font-Bold="True" Font-Names="Arial" Font-Size="14pt" /></td><td rowspan="2" class="auto-style13">&nbsp;</td><td style="width:12%"><asp:Label ID="NgaydangLabel" runat="server" Text='<%# Eval("Ngaydang", "{0: dd/MM/yyyy}") %>' Font-Bold="True" Font-Names="Arial" Font-Size="14pt" /></td><td style="width:3%" class="auto-style9">&nbsp;</td><td style="width:12%"><asp:Label ID="ThoihanLabel" runat="server" Text='<%# Eval("Thoihan", "{0: dd/MM/yyyy}") %>' Font-Bold="True" Font-Names="Arial" Font-Size="14pt" /></td><td style="width:3%" class="auto-style9">&nbsp;</td><td style="width:12%"><asp:Label ID="LuotdangkyLabel" runat="server" Text='<%# Eval("Luotdangky") %>' Font-Bold="True" Font-Names="Arial" Font-Size="14pt" /></td><td style="width:3%" class="auto-style9">&nbsp;</td><td style="width:12%" class="auto-style8"><asp:Label ID="LuotxemLabel" runat="server" Text='<%# Eval("Luotxem") %>' Font-Bold="True" Font-Names="Arial" Font-Size="14pt" /></td><td style="width:3%" class="auto-style9">&nbsp;</td><td style=""><asp:Label ID="TrangthaiLabel" runat="server" Text='<%# Eval("Trangthai") %>' Font-Bold="True" Font-Names="Arial" Font-Size="14pt" /></td></tr><tr><td class="auto-style12">Mã tin: <asp:Label ID="MaBLabel" runat="server" Text='<%# Eval("MaB") %>' Font-Bold="False" Font-Names="Arial" Font-Size="12.5pt" /></td><td style="width:12%">&nbsp;</td><td style="width:12%">&nbsp;</td><td style="width:12%">&nbsp;</td><td class="auto-style8" style="width:12%">&nbsp;</td><td style="width:12%">&nbsp;</td></tr></table><br /><br /></ItemTemplate><SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" /></asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourceTTD" runat="server" ConnectionString="<%$ ConnectionStrings:1G05NguyenChiBaoDangkykhoahocConnectionString %>" SelectCommand="SELECT [MaB], [TenCV], [Ngaydang], [Thoihan], [Luotdangky], [Luotxem], [Trangthai] FROM [tbBaituyendung] join [tbCongviec] ON [tbBaituyendung].[MaCV] = [tbCongviec].[MaCV]"></asp:SqlDataSource>
            </tr>
    </table></div></asp:Content>