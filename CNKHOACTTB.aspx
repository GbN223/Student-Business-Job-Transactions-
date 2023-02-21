<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CNKHOACTTB.aspx.cs" Inherits="NCKH.CNKHOACTTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
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
            <td><div class="container">
            <h2>Thông báo</h2>
            <div class="form-group">
                <asp:Label ID="lblError" runat="server" AssociatedControlID="tbxTieude" Text="Tiêu đề" />
                <asp:TextBox  runat="server" ID="tbxTieude" CssClass="form-control" Font-Size="Medium" />
            </div>
            <div class="form-group">
                
           
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxNoidung" Text="Nội dung" />
                <asp:TextBox Height="150px" runat="server" ID="tbxNoidung" TextMode="MultiLine" CssClass="form-control" Font-Size="Medium" />
            </div>
           
              
             <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FileUpload_Hinh" Text="Hình:" />
                <asp:FileUpload runat="server" ID="FileUpload_Hinh" CssClass="form-control" />
            </div>
                      <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FileUpload_File" Text="File đính kèm:" />
                <asp:FileUpload runat="server" ID="FileUpload_File" CssClass="form-control" />
            </div>  
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="btn btn-default" OnClick="btnLuu_Click"  />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-default" OnClick="btnHuy_Click" />
        </div>
                     </div></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
