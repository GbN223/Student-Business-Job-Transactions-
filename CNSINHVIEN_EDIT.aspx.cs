using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCKH
{
    public partial class CNSINHVIEN_EDIT : System.Web.UI.Page
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
            String MaSV = Request.QueryString["MaSV"];
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbSinhVien where MaSV='" + MaSV + "' ";
                    SqlCommand command = new SqlCommand(sqlQuery, connection);



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        tbxEmail.Text = reader.GetString(5);
                        tbxSDT.Text = reader.GetString(4);
                        tbxKynang.Text = reader.GetString(7);
                        uploadFile_Bangdiem.SaveAs(reader.GetString(6));
                        FileUpload_Thanhtich.SaveAs(reader.GetString(9));
                        FileUpload_Ava.SaveAs(reader.GetString(14));
                    }




                }
            }
            catch (Exception ex)
            {
                this.Title = "" + ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\CNSINHVIEN_TTSV.aspx");
        }
    }
}