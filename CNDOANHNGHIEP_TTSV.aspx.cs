using System;
using System.Data.SqlClient;

namespace NCKH
{
    public partial class CNDOANHNGHIEP_TTSV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String MaSV = "2021010172";
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbSinhvien where MaSV='" + MaSV + "' ";
                    SqlCommand command = new SqlCommand(sqlQuery, connection);



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Image1.ImageUrl = reader.GetString(9);
                        imgBangdiem.ImageUrl = reader.GetString(6);
                        imgAvatar.ImageUrl = reader.GetString(14);
                        lblHoTen.Text = reader.GetString(1);
                        lblTen.Text = reader.GetString(1);
                        lblEmail.Text = reader.GetString(5);
                        lblSDT.Text = reader.GetString(4);
                        lblKynang.Text = reader.GetString(7);
                    }




                }
            }
            catch (Exception ex)
            {
                this.Title = "" + ex.Message;
            }
        }
    }
}