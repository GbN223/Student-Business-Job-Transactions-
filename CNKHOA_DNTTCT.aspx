<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CNKHOA_DNTTCT.aspx.cs" Inherits="NCKH.CNKHOA_DNTTCT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <table class="nav-justified">
        <tr>
            <td>
                 <div class="container">
            <h2>Thông tin doanh nghiệp</h2>
            <div class="form-group">
                <asp:Label ID="lblError" runat="server" AssociatedControlID="tbxTenDN" Text="Tên doanh nghiệp" />
                <asp:TextBox  runat="server" ID="tbxTenDN" CssClass="form-control" Font-Size="Medium" />
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-6">
                <asp:Label runat="server" AssociatedControlID="tbxEmail" Text="Email" />
                <asp:TextBox runat="server" ID="tbxEmail" CssClass="form-control" Font-Size="Medium" />
                        </div>
                    <div class="col-sm-6">
             <asp:Label runat="server" AssociatedControlID="tbxSDT" Text="Số điện thoại" />
                <asp:TextBox runat="server" ID="tbxSDT" CssClass="form-control" />
                        </div>
            </div>
           
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxMota" Text="Mô tả" />
                <asp:TextBox Height="150px" runat="server" ID="tbxMota" TextMode="MultiLine" CssClass="form-control" Font-Size="Medium" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxYeucau" Text="Yêu cầu" />
                <asp:TextBox runat="server" ID="tbxYeucau" TextMode="MultiLine" Height="150px" CssClass="form-control" Font-Size="Medium" />
            </div>
                <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxDiachi" Text="Địa chỉ" />
                <asp:TextBox  runat="server" ID="tbxDiachi" CssClass="form-control" Font-Size="Medium" />
            </div>
             <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FileUpload_Hinh" Text="Upload File:" />
                <asp:FileUpload runat="server" ID="FileUpload_Hinh" CssClass="form-control" />
            </div>
                      <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxChitieu" Text="Chỉ tiêu" />
                <asp:TextBox runat="server" ID="tbxChitieu" CssClass="form-control" />
            </div>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="btn btn-default" OnClick="btnLuu_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-default" OnClick="btnHuy_Click" />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
                     </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
   
</asp:Content>
