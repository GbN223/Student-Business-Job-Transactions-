using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCKH
{
    public partial class CNKhoa_GVTTCT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String update = Request.QueryString["Update"];
                if (update!=null)
                {
                    
                    getThongtin();
                }
            }
        }
        private void getThongtin()
        {
            String MaGV = Request.QueryString["MaGV"];
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbGiangvien where MaGV='" + MaGV + "' ";
                    SqlCommand command = new SqlCommand(sqlQuery, connection);



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        tbxTenGV.Text=reader.GetString(1);
                        tbxHocvi.Text=reader.GetString(2);
                        tbxChucvu.Text=reader.GetString(3);
                        tbxEmail.Text=reader.GetString(4);
                        tbxChitieu.Text=reader.GetString(5);
                        uploadFile.SaveAs(reader.GetString(6));   
                    }




                }
            }
            catch (Exception ex)
            {
                this.Title = "" + ex.Message;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\CNKhoa_Giangvien.aspx");
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                String MaGV = Request.QueryString["MaGV"];
                SqlDataSource sqlData = new SqlDataSource();
                sqlData.ConnectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;";
                sqlData.UpdateCommand = "Update tbGiangvien set TenGV=@TenGV,Hocvi=@Hocvi,Chucvu=@Chucvu,Email=@Email,Chitieu=@Chitieu" +
                    " where MaGV='" + MaGV + "'";
                String Hoten = tbxTenGV.Text.Trim();
                String Hocvi= tbxHocvi.Text.Trim();
                String Chucvu = tbxChucvu.Text.Trim();
                String Email = tbxEmail.Text.Trim();
                String Chitieu=tbxChitieu.Text.Trim();
                sqlData.UpdateParameters.Clear();
                sqlData.UpdateParameters.Add("TenGV", Hoten);
                sqlData.UpdateParameters.Add("Hocvi", Hocvi);
                sqlData.UpdateParameters.Add("Chucvu", Chucvu);
                sqlData.UpdateParameters.Add("Email", Email);
                sqlData.UpdateParameters.Add("Chitieu", Chitieu);
                sqlData.Update();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal('show');", true);
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal('show');", true);
                this.Title= ex.Message;
            }
        }
    }
}