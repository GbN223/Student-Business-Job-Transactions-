<%@ Page Title="" Language="C#" MasterPageFile="~/CNKhoa_Master.Master" AutoEventWireup="true" CodeBehind="CNKhoa_GVTTCT.aspx.cs" Inherits="NCKH.CNKhoa_GVTTCT" %>
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
            <td>
                <div class="container">
            <h2>Thông tin giảng viên</h2>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxTenGV" Text="Tên giảng viên" />
                <asp:TextBox runat="server" ID="tbxTenGV" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxHocvi" Text="Học vị" />
                <asp:TextBox runat="server" ID="tbxHocvi" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxChucvu" Text="Chức vụ" />
                <asp:TextBox runat="server" ID="tbxChucvu" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxEmail" Text="Email" />
                <asp:TextBox runat="server" ID="tbxEmail" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxChitieu" Text="Chỉ tiêu" />
                <asp:TextBox runat="server" ID="tbxChitieu" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="uploadFile" Text="Hình" />
                <asp:FileUpload runat="server" ID="uploadFile"   CssClass="form-control" onchange="validateFileUpload()" />
                <asp:Label ID="ErrorMessageLabel" runat="server" Text="" ForeColor="Red" />
            </div>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="btn btn-default" OnClick="btnLuu_Click" data-toggle="modal" data-target="#myModal" />
                     <asp:Button runat="server" ID="btnHuy" Text="Hủy" CssClass="btn btn-default" OnClick="btnHuy_Click" />
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
            </div>
            <div class="modal-body">
                Cập nhật thành công
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                
            </div>
        </div>
    </div>
</div>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    <script>
        function validateFileUpload() {
            var fileInput = document.getElementById("uploadFile");
            var filePath = fileInput.value;
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
            if (!allowedExtensions.exec(filePath)) {
                // The selected file is not an image file, so clear the selection and display an error message
                fileInput.value = "";
                document.getElementById("ErrorMessageLabel").innerHTML = "Only image files (.jpg, .jpeg, .png, .gif) are allowed.";
                return false;
            }
            else {
                // The selected file is an image file, so submit the form to upload the file
                document.getElementById("ErrorMessageLabel").innerHTML = "";
                return true;
            }
        }</script>
</asp:Content>
