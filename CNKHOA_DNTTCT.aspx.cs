using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCKH
{
    public partial class CNKHOA_DNTTCT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            
            SqlDataSource sqlDataSourceDN = new SqlDataSource();
            sqlDataSourceDN.ConnectionString= "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            String soDN = Request.QueryString["SoDN"];
            int sdn = Int32.Parse(soDN) + 1;
            String MaDN = "DN" + sdn;
            sqlDataSourceDN.InsertCommand = "Insert into tbDoanhnghiep(MaDN,TenDN,Email,SDT,Mota,Yeucau, Hinh,Chitieu,Diachi,Sldangky) Values(@MaDN,@TenDN,@Email,@SDT,@Mota,@Yeucau,@Hinh,CAST(@Chitieu AS int),@Diachi,0)";

            try
            {
                //1Đinh nghĩa các tham số parameters cho Insertcommnand : tham số cho field hinh có dạng ~\\Images\\Tên file hình được uploadfilename
                sqlDataSourceDN.InsertParameters.Clear();
                sqlDataSourceDN.InsertParameters.Add("MaDN", MaDN);
                sqlDataSourceDN.InsertParameters.Add("TenDN", tbxTenDN.Text);
                sqlDataSourceDN.InsertParameters.Add("Mota", tbxMota.Text.Trim());
                sqlDataSourceDN.InsertParameters.Add("SDT", tbxSDT.Text.Trim());
                sqlDataSourceDN.InsertParameters.Add("Hinh", "~\\Image\\" + FileUpload_Hinh.FileName); //Add Path của file Hình vào DB
                sqlDataSourceDN.InsertParameters.Add("Yeucau", tbxYeucau.Text);
                sqlDataSourceDN.InsertParameters.Add("Email", tbxEmail.Text);
                sqlDataSourceDN.InsertParameters.Add("Chitieu", tbxChitieu.Text);
                sqlDataSourceDN.InsertParameters.Add("Diachi", tbxEmail.Text);
                //2Chạy lệnh Insert để lưu thông tin mặt hàng mới vào DB
                sqlDataSourceDN.Insert();
                //3 Lưu (copy) hình vửa được nsd Upload vào thư mục ~\\Images\\ của App
                //OFFLINE
                FileUpload_Hinh.SaveAs("~\\Image\\" + FileUpload_Hinh.FileName.Trim());
                //Khi App này được Copy đi nơi khác => thì Update lại path này 
                //ONLINE (khi upload lên Host, VD: somee thì phải dùng path vật lý của somee - tuy nhiên: tùy thuộc vào bảo mật của Host có thể không SaveAs được
                //FileUploadHinhSaveAs("D:\\DZHosts\\LocalUser\\gtwovxthe\\wwwdrunkshopg206vxthesomeecom\\" + FileUploadHinhFileNameTrim());
                lblError.Text = "Thành công";
                this.Title = "Thành công";
            }
            catch (System.Exception ex) { lblError.Text = "LỖI THÊM DN MỚI = " + ex.Message; this.Title = "" + ex.Message; }

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            
      
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }
    }
}