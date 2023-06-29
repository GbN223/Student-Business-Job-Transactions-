<%@ Page Title="" Language="C#" MasterPageFile="~/CNSinhvien_Master.Master" AutoEventWireup="true" CodeBehind="CNSINHVIEN_TTSV.aspx.cs" Inherits="NCKH.CNSINHVIEN_TTSV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .white-bg {
    background: white;
  }
  
  .black-icon {
    color: black;
  }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/b589c62f46.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://kit.fontawesome.com/b589c62f46.css" crossorigin="anonymous">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td> <div class="container mt-5">
		<div class="row">
			<div class="col-md-4">
                <asp:Image ID="imgAvatar" runat="server" CssClass="img-fluid rounded-circle" ImageUrl="~/Image/Bao.jpg"  />
			</div>
			<div class="col-md-8">
				<h1>
                    <asp:Label ID="lblTen" runat="server" Text="Nguyễn Chí Bảo"></asp:Label></h1>
                
				<div class="row mt-5">
			<div class="col-md-12">
				<ul>
					<li><strong>Họ tên:</strong> <asp:Label ID="lblHoTen" runat="server" Text="Nguyễn Chí Bảo"></asp:Label></li>
					<li><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" Text="baoathlean@gmail.com"></asp:Label></li>
					<li><strong>Số điện thoại:</strong> <asp:Label ID="lblSDT" runat="server" Text="0384781763"></asp:Label></li>
					<li><strong>Giới tính:</strong> <asp:Label ID="lblGioitinh" runat="server" Text=Nam></asp:Label></li>
					<li><strong>Lớp:</strong> <asp:Label ID="lblLop" runat="server" Text="20DTH2"></asp:Label></li>
                    <li><strong>Kỹ năng:</strong> <asp:Label ID="lblKynang" runat="server" Text="SQL căn bản, Java căn bản, C# căn bản"></asp:Label></li>
                    <li><strong>Khoa:</strong> <asp:Label ID="lblKhoa" runat="server" Text="Công nghệ thông tin"></asp:Label></li>
				
                </ul>
                 <div class="form-group">
                     <div class="row">
                         <asp:HyperLink ID="googleLink" runat="server" NavigateUrl="CNSINHVIEN_EDIT.aspx?MaSV=2021010112" CssClass="btn btn-primary" style="background:white;border:none"><i class="fa fa-edit black-icon fa-lg"></i></asp:HyperLink>
                          
  

                     </div>
                 </div>
                <div class="form-group">
                <div class="row">
				<div class="col-md-4">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cv1Modal">
  					Bảng điểm
				</button>
				<div class="modal fade" id="cv1Modal" tabindex="-1" role="dialog" aria-labelledby="cv1ModalLabel" aria-hidden="true" >
  					<div class="modal-dialog" role="document" style="width:720px; margin-left:23%">
    					<div class="modal-content" style="width:720px">
      						<div class="modal-header" style="width:720px">
        						<h5 class="modal-title" id="cv1ModalLabel">Bảng điểm</h5>
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          							<span aria-hidden="true">&times;</span>
        						</button>
      						</div>
      						<div class="modal-body" style="width:800px" >
                                  <asp:Image Width="700px"  ID="imgBangdiem" runat="server" ImageUrl="~/Image/Bangdiem.jpg"  />
      						</div>
      						<div class="modal-footer">
        						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      						</div>
    					</div>
  					</div>
				</div>
			</div>
			<div class="col-md-4">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cv2Modal">
  					Thành tích
				</button>
				<div class="modal fade" id="cv2Modal" tabindex="-1" role="dialog" aria-labelledby="cv2ModalLabel" aria-hidden="true">
  					<div class="modal-dialog" role="document" style="width:720px; margin-left:23%">
    					<div class="modal-content" style="width:720px">
      						<div class="modal-header" style="width:720px">
        						<h5 class="modal-title" id="cv2ModalLabel">Thành tích</h5>
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          							<span aria-hidden="true">&times;</span>
        						</button>
      						</div>
      						<div class="modal-body">
                                  <asp:Image Width="700px" ID="Image1" runat="server"  />
      						</div>
      						<div class="modal-footer">
        						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      						</div>
    					</div>
  					</div>
				</div>
			</div>
                    </div>
                
                    </div>
			</div>
		</div>
			</div>
		</div>
		
		
	</div></td>
        </tr>
       
    </table>
</asp:Content>
