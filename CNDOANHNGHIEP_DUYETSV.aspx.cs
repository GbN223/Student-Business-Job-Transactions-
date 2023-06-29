using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NCKH
{
    public partial class CNDOANHNGHIEP_DUYETSV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        private void sendMail()
        {
            try
            {
                MailMessage mailMessage = new MailMessage();

                // set the properties of the MailMessage object
                mailMessage.From = new MailAddress("baoathlean@gmail.com");
                mailMessage.To.Add(new MailAddress("baoathlean@gmail.com"));
                mailMessage.Subject = "Thông báo từ doanh nghiệp";
                mailMessage.Body = "Chúng tôi xin thông báo bạn đã được chọn cho đợt thực tập đợt I năm 2023";

                // create a new SmtpClient object
                SmtpClient smtpClient = new SmtpClient();

                // set the properties of the SmtpClient object
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential("baoathlean@gmail.com", "fpwptltbkevihlxu");


                // send the email
                smtpClient.Send(mailMessage);

                // display a message indicating that the email was sent
                this.Title = "Done";
            }
            catch (Exception ex)
            {
               
            }
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName=="duyetsv") {
                SqlDataSource dataSource = new SqlDataSource();
                String MaSV = ((Label)e.Item.FindControl("MaSVLabel")).Text.Trim();
                String TenDN = ((Label)e.Item.FindControl("MaSVLabel")).Text.Trim();
                String MaDN = Request.QueryString["MaDN"];
                dataSource.ConnectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
                try
                {
                    dataSource.UpdateCommand = "UPDATE tbDangky SET TINHTRANG=@TINHTRANG WHERE  MaDN=@MaDN and MaSV=@MaSV";
                    dataSource.UpdateParameters.Add("TINHTRANG", "True");
                    dataSource.UpdateParameters.Add("MaSV", MaSV);
                    dataSource.UpdateParameters.Add("MaDN", MaDN);
                    dataSource.Update();
                    DataListItem dataListItem = e.Item as DataListItem;
                    Button btnDangky = dataListItem.FindControl("DuyetSV") as Button;
                    btnDangky.Text = "Đã duyệt";
                    btnDangky.BackColor = System.Drawing.Color.Black;
                    this.Title = "Duyệt thành công";

                    sendMail();
                }
                catch (Exception ex) {
                    this.Title = ""+ex.Message;
                }
            }
        }
        private int GetDataDangkyDN(String MaSV, String MaDN)
        {
            //int count = 0;
            List<String> list = new List<String>();
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbDangky where MaSV='" + MaSV + "' and MaDN='" + MaDN + "' and TINHTRANG='True'";
                    SqlCommand command = new SqlCommand(sqlQuery, connection);



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        list.Add(reader.GetString(0));

                    }
                   



                }
            }
            catch (Exception ex)
            {
                
            }
            return list.Count;
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // access data item here
                String MaDN = Request.QueryString["MaDN"];
                String MaSV = ((Label)e.Item.FindControl("MaSVLabel")).Text.Trim();
                DataListItem dataListItem = e.Item as DataListItem;
                Button btnDangky = dataListItem.FindControl("DuyetSV") as Button;
                if (GetDataDangkyDN(MaSV, MaDN) > 0)
                {
                    btnDangky.Text = "Đã duyệt";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = System.Drawing.Color.Black;
                }
            }
        }
    }
}