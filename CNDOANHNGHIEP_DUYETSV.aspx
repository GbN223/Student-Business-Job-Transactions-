<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep_Master.Master" AutoEventWireup="true" CodeBehind="CNDOANHNGHIEP_DUYETSV.aspx.cs" Inherits="NCKH.CNDOANHNGHIEP_DUYETSV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width:100%;
            height: 100%;
            border-collapse: collapse;
            
            padding-left:10%;
        }

        .auto-style3 {
            width: 100%;
            margin: 0px;
            height: 63px;
            border-collapse: collapse;
        }

        .label {
            font-family: 'Baloo';
            font-size: 15pt;
            color: #5A5C5E;
            top: -20px;
        }

        .buttongroup {
            font-family: Myriad;
            height: 9vh;
            display: grid;
            justify-content: end;
            float: right;
            position: relative;
            padding-right: 1em;
            align-items: center;
            margin-inline: auto;
        }

        .btnprintlist {
            width: 195px;
            height: 6.4vh;
            border: none;
            background-image: linear-gradient(to right, #3394C4, #2430B3);
            border-radius: 17px;
            cursor: pointer;
        }

        .btnapprove {
            width: 153px;
            height: 38px;
            border: none;
            background-image: linear-gradient(to right, #3394C4, #2430B3);
            border-radius: 22px;
            cursor: pointer;
        }

            .btnapprove.approved {
                background-image: linear-gradient(to right, #989898, #5A5C5E);
            }

        .dropdownlist {
            border-radius: 10px;
            border: solid 2.4px;
            border-color: #247EF1;
            font-family: Arial;
            font-size: 11.5pt;
            text-align: center;
        }

        .auto-style5 {
            width: 50%;
            margin: 0px;
            height: 63px;
            border-collapse: collapse;
        }

        .warning {
            padding-top: 4.5em;
            font-family: Arial;
            padding-left: 67px;
            align-items: center;
        }


        .auto-style6 {
            height: 80px;
        }


        .auto-style7 {
            height: 44px;
            width: 23%;
        }

        .auto-style8 {
            width: 257px;
        }


        .auto-style9 {
            width: 6%;
        }

        .auto-style10 {
            width: 2px;
        }

        .auto-style11 {
            font-family: Myriad;
            height: 22px;
            display: grid;
            justify-content: end;
            float: right;
            position: relative;
            padding-right: 1em;
            align-items: center;
            margin-inline: auto;
            left: 0px;
            top: 0px;
        }
        .auto-style12 {
            width: 96%;
        }
        .auto-style16 {
            width: 23%;
        }
        .auto-style17 {
            width: 27%;
            padding-right:2%;
        }
        .button-add {
    float: right;
    width:140px;
    height: 40px;
    background: #D85124;
    border-radius:25px;
    border-style: none;
    color: aliceblue;
    font-weight: bold;
    cursor: pointer;
}
        .auto-style18 {
            width: 22%;
        }
        .headerdatalist{
            padding-left:7%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr style="border-spacing: 0; overflow: auto; border-collapse: collapse;">
                        <td style="background-color: #E5E5E5; transform: translateY(2em); margin: -100px; border-spacing: 0; overflow: auto; border-collapse: collapse;" class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <asp:Label ID="Label3" runat="server" Text="Lọc theo thời gian" Font-Names="baloo" CssClass="label"></asp:Label>
                            &nbsp;
                            <asp:DropDownList ID="DropDownList1" runat="server" ForeColor="#5A5C5E" Height="34px" Width="152px" CssClass="dropdownlist">
                                <asp:ListItem Value="*">Tất cả thời gian</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td style="background-color: #E5E5E5; transform: translateY(2em)" class="auto-style3">

                            <div class="buttongroup">
                                <asp:LinkButton ID="LinkButton1" runat="server" class="btnprintlist">
                    <asp:Image runat="server" ImageUrl="~/Image/excel.png" style="float:left;margin:6px;padding-left:2px; transform:translateX(8px)" width="35" />
                    <asp:Label runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="13pt" style="margin:13px 0px 12px 8px; float:left;color:#fefffe" Text="Xuất danh sách" />
                                </asp:LinkButton></div></td></tr><tr style="border-spacing: 0; overflow: auto; border-collapse: collapse;">
                        <td style="" class="auto-style6" colspan="2">
                            <div class="warning">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/warning-01.png" Width="18pt" />
                                <div style="transform: translate(1.8em,-1.65em)">
                                    <asp:Label ID="Label4" runat="server" Text="Hồ sơ sẽ tự động xóa sau 3 tháng" Font-Size="14.5pt" Font-Bold="True"></asp:Label></div></div></td></tr></table></td></tr><tr>
            <td class="auto-style2">
                <asp:SqlDataSource ID="SqlDataSource_DuyetSV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select tbSinhVien.MaSV,TenSV,CAST(CONVERT(VARCHAR, NGAYDANGKY, 101) AS DATE) as NGAY from tbDangky join tbSinhVien on tbDangky.MaSV=tbSinhVien.MaSV where MaDN=@MaDN and tbDangky.NAM=2023 and tbDangky.HOCKI='HK01'">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MaDN" QueryStringField="MaDN" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <table class="auto-style12"><tr>
                    <td class="auto-style17">  
                        <div class="headerdatalist">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="14pt" Text="Thông tin sinh viên">

                        </asp:Label></td><td class="auto-style16" style="padding-left:4%">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="14pt" Text="Ngày nộp hồ sơ"></asp:Label></td><td class="auto-style18" style="">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="14pt" Text="Thông tin cá nhân"></asp:Label></td><td style="width:100%;padding-left:3%">   
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="14pt" Text="Trạng thái tuyển dụng"></asp:Label></td></tr></table><br />
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource_DuyetSV" BackColor="#FFD6C2" OnItemCommand="DataList1_ItemCommand" Width="90%" BorderColor="Silver" BorderWidth="3px" GridLines="Horizontal" OnItemDataBound="DataList1_ItemDataBound">
                            <ItemTemplate>
                               <div style="height:100px">
                      
                            <br />
                        <table class="auto-style1" style="height:40%">
                            <tr>
                                <td class="auto-style6" style="height:40%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="TenSVLabel" runat="server" Text='<%# Eval("TenSV") %>' Font-Names="Arial" Font-Size="13pt" Width="180px" />
                                </td>
                                <td rowspan="2" class="auto-style9"style="height:40%">&nbsp;</td><td class="auto-style6" style="height:40%">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NGAY", "{0: dd/MM/yyyy}") %>' Font-Names="Arial" Font-Size="13pt"></asp:Label></td><td rowspan="2" class="auto-style9"></td>
                                <td class="auto-style7">
                                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0066FF"  NavigateUrl='<%# "CNDOANHNGHIEP_TTSV.aspx?MaSV="+Eval("MaSV", "{0}") %>' Font-Names="Arial" Font-Size="13pt">Xem thông tin cá nhân</asp:HyperLink></td><td rowspan="2" class="auto-style10"></td>
                                <td class="auto-style6">
                                    <div class="buttongroup">
                                        <div class="auto-style11">
                                        <asp:Button ID="DuyetSV" runat="server"  Text="Duyệt hồ sơ" CommandName="duyetsv" CssClass="button-add" on/></div></div></td></tr><tr>
                                                
                                <td>
                                    <asp:Label ID="MaSVLabel" runat="server" Text='<%# Eval("MaSV") %>' Visible="False" Font-Names="Arial" Font-Size="13pt"></asp:Label></td><td>&nbsp;</td><td class="auto-style8">&nbsp;</td><td>&nbsp;</td></tr></table><br /></div></ItemTemplate></asp:DataList><br />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT * FROM [tbDoanhnghiep] WHERE ([MaDN] = @MaDN)"><SelectParameters><asp:QueryStringParameter Name="MaDN" QueryStringField="MaDN" Type="String" /></SelectParameters></asp:SqlDataSource></td></tr></table><script>
        
        function statechange(event) {
            event.preventDefault();
           
            const target = event.target;
            const mybutton = target.closest('.btnapprove')

            mybutton.classList.add('approved');
            mybutton.lastElementChild.innerHTML = 'Đã duyệt';

            // mybutton.innerHTML = "Test";
            return false;
        }

        document.querySelectorAll('.btnapprove').forEach((btn) => btn.addEventListener('click', statechange     ))
    </script></asp:Content>