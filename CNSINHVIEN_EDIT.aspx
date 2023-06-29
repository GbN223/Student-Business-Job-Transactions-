<%@ Page Title="" Language="C#" MasterPageFile="~/CNSinhvien_Master.Master" AutoEventWireup="true" CodeBehind="CNSINHVIEN_EDIT.aspx.cs" Inherits="NCKH.CNSINHVIEN_EDIT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
     #profile-container {
     width:50%;
     margin-top:3%;
      background-color: #f2f2f2;
      padding: 20px;
      border-radius: 10px;
   
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td> <div class="container" id="profile-container">
    <form>
      <div class="row">
        <div class="col">
          <div class="form-group">
            <label for="tbxSDT">Số điện thoại</label>
              <asp:TextBox ID="tbxSDT" runat="server" class="form-control"></asp:TextBox>
          </div>
        </div>
        <div class="col">
          <div class="form-group">
            <label for="tbxEmail">Email</label>
            
              <asp:TextBox ID="tbxEmail" runat="server" class="form-control"></asp:TextBox>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label for="tbxKynang">Kỹ năng</label>
          <asp:TextBox ID="tbxKynang" runat="server" class="form-control" TextMode="MultiLine" Height="100px" ></asp:TextBox>
      </div>
      <div class="form-group">
        <label for="uploadFile_Bangdiem">Bảng điểm</label>
        <asp:FileUpload runat="server" ID="uploadFile_Bangdiem"   CssClass="form-control" />
        
      </div>
        <div class="form-group">
        <label for="FileUpload_Thanhtich">Thành tích:</label>
         <asp:FileUpload runat="server" ID="FileUpload_Thanhtich"   CssClass="form-control" />
      </div>

      <div class="form-group">
        <label for="FileUpload_Ava">Ảnh đại diện</label>
        <asp:FileUpload runat="server" ID="FileUpload_Ava"   CssClass="form-control" />
      </div>
      
        <asp:Button ID="Button1" runat="server" Text="Lưu" class="btn btn-primary" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Hủy"  class="btn btn-secondary"/>
     
    </form>
  </div>
</body></td>
        </tr>
    </table>
</asp:Content>
