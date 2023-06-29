<%@ Page Title="" Language="C#" MasterPageFile="~/CNGIANGVIEN.Master" AutoEventWireup="true" CodeBehind="CNGIANGVIEN_TTSV.aspx.cs" Inherits="NCKH.CNGIANGVIEN_TTSV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <table class="auto-style1">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource_CNDNTTSV" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="select *from tbSinhVien where MaSV=@MaSV">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MaSV" QueryStringField="MaSV" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>

                <div class="container mt-5">
		<div class="row">
			<div class="col-md-4">
                <asp:Image ID="imgAvatar" runat="server" CssClass="img-fluid rounded-circle"  />
			</div>
			<div class="col-md-8">
				<h1>
                    <asp:Label ID="lblTen" runat="server" Text="Label"></asp:Label></h1>
				<div class="row mt-5">
			<div class="col-md-12">
				<ul>
					<li><strong>Họ tên:</strong> <asp:Label ID="lblHoTen" runat="server" Text='<%# Eval("TenSV") %>'></asp:Label></li>
					<li><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label></li>
					<li><strong>Số điện thoại:</strong> <asp:Label ID="lblSDT" runat="server" Text='<%# Eval("SDT") %>'></asp:Label></li>
					<li><strong>Kỹ năng:</strong> <asp:Label ID="lblKynang" runat="server" Text='<%# Eval("Kynang") %>'></asp:Label></li>
					
				</ul>
                <div class="form-group">
                <div class="row">
				<div class="col-md-4">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cv1Modal">
  					Bảng điểm
				</button>
				<div class="modal fade" id="cv1Modal" tabindex="-1" role="dialog" aria-labelledby="cv1ModalLabel" aria-hidden="true" >
  					<div class="modal-dialog" role="document" style="width:720px;margin-left:23%">
    					<div class="modal-content" style="width:720px">
      						<div class="modal-header" style="width:720px">
        						<h5 class="modal-title" id="cv1ModalLabel">Bảng điểm</h5>
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          							<span aria-hidden="true">&times;</span>
        						</button>
      						</div>
      						<div class="modal-body" style="width:7200px" >
                                  <asp:Image Width="700px"  ID="imgBangdiem" runat="server"  />
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
  					<div class="modal-dialog" role="document" style="width:720px;margin-left:23%">
    					<div class="modal-content" style="width:720px">
      						<div class="modal-header" style="width:720px">
        						<h5 class="modal-title" id="cv2ModalLabel">CV 2</h5>
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          							<span aria-hidden="true">&times;</span>
        						</button>
      						</div>
      						<div class="modal-body">
                                  <asp:Image Width="700px" ID="Image1" runat="server" />
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
		
		
	</div>
				
</body></td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThucTapConnectionString %>" SelectCommand="SELECT * FROM [tbSinhVien] WHERE ([MaSV] = @MaSV)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MaSV" QueryStringField="MaSV" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
