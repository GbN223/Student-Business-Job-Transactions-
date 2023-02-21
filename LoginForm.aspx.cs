using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCKH
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
           
            if (checkLoginSV(iuser.Text, ipass.Text)>0 && RadioButton1.Checked)
            {
                Response.Redirect("~\\CNSinhvien_Dangkydn.aspx?MaSV="+ iuser.Text + "");
            }
            else if (iuser.Text.Trim() == "DN01" && ipass.Text.Trim() == "123" && RadioButton2.Checked)
            {
                Response.Redirect("~\\CNDOANHNGHIEP_DUYETSV.aspx?MaDN=DN01");
            }
            else if (iuser.Text.Trim() == "khoa" && ipass.Text.Trim() == "123" && RadioButton4.Checked)
            {
                Response.Redirect("~\\CKHOA_TB.aspx");
            }
            else if (iuser.Text.Trim() == "GV01" && ipass.Text.Trim() == "123" && RadioButton3.Checked)
            {
                Response.Redirect("~\\CNGIANGVIEN_HDTT.aspx?MaGV=GV01");
                
            }
            }
        private int checkLoginSV(String MaSV,String MATKHAU)
        {
            int count = 0;
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string sql = "SELECT COUNT(*) FROM tbSinhVien WHERE MASV = @username AND MATKHAU = @password";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@username", MaSV);
                        command.Parameters.AddWithValue("@password", MATKHAU);
                         count = Convert.ToInt32(command.ExecuteScalar());
                        
                    }
                }
                catch (Exception ex)
                {
                    // show an error message
                    
                }
            }
            return count;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\NCKHKETNOI_1HomePageBeforeLogin.aspx");
        }
    }
}