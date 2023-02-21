using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\CNKHOA_TB.aspx");
        }
    }
}