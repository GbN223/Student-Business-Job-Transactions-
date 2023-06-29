using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using VisioForge.MediaFramework.ONVIF;

namespace NCKH
{
    public partial class CNKHOACTTB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getThongtin();
            }
        }
        private void getThongtin()
        {
            String MaTB = Request.QueryString["MaTB"];
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbThongBao where MaTB='" + MaTB + "' ";
                    SqlCommand command = new SqlCommand(sqlQuery, connection);



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        tbxTieude.Text = reader.GetString(1);
                        tbxNoidung.Text = reader.GetString(2);
                        FileUpload_Hinh.SaveAs(reader.GetString(3));
                        FileUpload_File.SaveAs(reader.GetString(4));

                    }




                }
            }
            catch (Exception ex)
            {
                this.Title = "" + ex.Message;
            }
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            
            SqlDataSource SqlDataSource_KHOATB = new SqlDataSource();
            SqlDataSource_KHOATB.ID = "SqlDataSource1";
            SqlDataSource_KHOATB.ConnectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            SqlDataSource_KHOATB.InsertCommand = "INSERT INTO tbThongBao (MATB,TIEUDE,NOIDUNG,HINH,LINK,MAKH)VALUES(@MATB,@TIEUDE,@NOIDUNG,@HINH,@LINK,@MAKH)";
            System.DateTime t = System.DateTime.Now;
            String MaTB=t.Millisecond+t.Minute.ToString() + t.Day.ToString() + t.Month.ToString() + t.Year.ToString();
            try
            {
                //1Đinh nghĩa các tham số parameters cho Insertcommnand : tham số cho field hinh có dạng ~\\Images\\Tên file hình được uploadfilename
                SqlDataSource_KHOATB.InsertParameters.Clear();
                SqlDataSource_KHOATB.InsertParameters.Add("MaTB", MaTB);
                SqlDataSource_KHOATB.InsertParameters.Add("Tieude", tbxTieude.Text);
                SqlDataSource_KHOATB.InsertParameters.Add("Noidung", tbxNoidung.Text.Trim());
                SqlDataSource_KHOATB.InsertParameters.Add("Hinh", "~\\Image\\" + FileUpload_Hinh.FileName); //Add Path của file Hình vào DB
                SqlDataSource_KHOATB.InsertParameters.Add("MaKH", "");
                SqlDataSource_KHOATB.InsertParameters.Add("Link", "~\\PDF\\" + FileUpload_Hinh.FileName);
                //2Chạy lệnh Insert để lưu thông tin mặt hàng mới vào DB
                SqlDataSource_KHOATB.Insert();
                //3 Lưu (copy) hình vửa được nsd Upload vào thư mục ~\\Images\\ của App
                //OFFLINE
                FileUpload_Hinh.SaveAs("~\\Image\\" + FileUpload_Hinh.FileName.Trim());
                FileUpload_File.SaveAs("~\\PDF\\" + FileUpload_File.FileName.Trim());
              
               
                Response.Redirect("~\\CKHOA_TB.aspx");
                
            }
            catch (System.Exception ex) { Response.Redirect("~\\CKHOA_TB.aspx"); }
           
        
    }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\CNKHOA_TB.aspx");
        }
    }
}