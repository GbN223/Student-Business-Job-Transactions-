<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="NCKH.LoginForm" %>
<!DOCTYPE html>
<script runat="server">



</script>

<html>
  <head>
     <meta charset="utf-8" />
    <title>Login Form</title>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Bungee"
      rel="stylesheet"
    />
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>
  <body>
    <div class="container">
      <div class="img">
          <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/Theme.png" />
      </div>
      <div class="login-content">
        <form runat ="server">
          <h2 class = "headerstyle" style = "color: #1D478C">UFM KẾT NỐI</h2>
          <p class = "style">Kết nối Doanh nghiệp và Sinh viên</p>
          <br/>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT [MaSV], [Matkhau] FROM [tbSinhVien]"></asp:SqlDataSource>

          <div class="input-div one">
            <div class="i">
              <i class="fas fa-user"></i>
            </div>
            <div class="div">
              
                <asp:TextBox class ="input" ID="iuser" placeholder="Tên đăng nhập" runat="server"></asp:TextBox>
            </div>
          </div>

            <%-- Password --%>
          <div class="input-div pass">
            <div class="i">
              <i class="fas fa-lock"></i>
            </div>
            <div class="div">
              
                <asp:TextBox class ="input" placeholder="Mật khẩu" type="password" ID="ipass" runat="server"></asp:TextBox>
             </div>
          </div>


          <div class ="checkbox">
          <asp:RadioButton ID="RadioButton1" runat="server" Text="Sinh viên" Checked="True" GroupName="Grant"/>
          <asp:RadioButton ID="RadioButton2" runat="server" Text="Doanh nghiệp" GroupName="Grant"/>
          <asp:RadioButton ID="RadioButton3" runat="server" Text="Giảng viên" GroupName="Grant"/>
          <asp:RadioButton ID="RadioButton4" runat="server" Text="Khoa" GroupName="Grant"/>
          </div>
        <%--Button container--%> 
          <div>
              <asp:Button ID="Button1" CssClass="btn" runat="server" Text="Đăng Nhập" OnClick="Button1_Click" />
            <br>
              <br />
            <span class="psw" style="width: 360px">
                <span>
              <asp:Button ID="Button2" CssClass="btn" runat="server" Text="Quay lại" OnClick="Button2_Click" />
              </span></span>
          </div>
        </form>
      </div>
    </div>
    <script type="text/javascript" src="login.js"></script>
  </body>
</html>