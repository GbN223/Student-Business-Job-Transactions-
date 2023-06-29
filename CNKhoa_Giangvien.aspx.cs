using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace NCKH
{
    public partial class CNKhoa_Giangvien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tbxTimGV_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnThemGV_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\CNKhoa_GVTTCT.aspx");
        }

        protected void btnTimGV_Click(object sender, EventArgs e)
        {
            DataList_GV.Visible = false;
            DataList_GVTK.DataBind();
        }

        protected void DataList_GV_ItemCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSource SqlDataSource_ChonGV = new SqlDataSource();
            SqlDataSource_ChonGV.ID = "SqlDataSource1";
            DataListItem dataListItem = e.Item as DataListItem;
            SqlDataSource_ChonGV.ConnectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            Button btnThamgia = dataListItem.FindControl("btnThamgia") as Button;
            Button btnHuy = dataListItem.FindControl("btnHuy") as Button;
            SqlDataSource_ChonGV.InsertCommand = "INSERT INTO tbChonGV (MAGV,HOCKI,NAM)VALUES(@MAGV,@HOCKI,@NAM)";
            String MAGV = ((Label)e.Item.FindControl("MaGV")).Text.Trim();
            if (e.CommandName == "thamgia")
            {

                DateTime dateTime = DateTime.Now;
                String nam = dateTime.Year.ToString();
                String thang = dateTime.Month.ToString();
                int thangHK = Int32.Parse(thang);
                String hocki = "";
                if (0 < thangHK || thangHK < 6)
                {
                    hocki = "HK01";
                }
                else if (thangHK < 9)
                {
                    hocki = "HK02";
                }
                else
                {
                    hocki = "HK03";
                }

                try
                {
                    SqlDataSource_ChonGV.InsertParameters.Clear();
                    SqlDataSource_ChonGV.InsertParameters.Add("MAGV", MAGV);
                    SqlDataSource_ChonGV.InsertParameters.Add("NAM", nam);
                    SqlDataSource_ChonGV.InsertParameters.Add("HOCKI", hocki);
                    SqlDataSource_ChonGV.Insert();
                    btnThamgia.Text = "Đã tham gia";
                    btnThamgia.Enabled = false;
                    btnThamgia.BackColor = Color.Brown;
                    btnHuy.Enabled = true;
                    btnHuy.BackColor = System.Drawing.ColorTranslator.FromHtml("#D85121");
                    sendMail();
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
            else if (e.CommandName == "huythamgia")
            {
                try
                {
                    SqlDataSource_ChonGV.DeleteCommand = "Delete tbChonGV where MaGV=@MaGV";
                    SqlDataSource_ChonGV.DeleteParameters.Clear();
                    SqlDataSource_ChonGV.DeleteParameters.Add("MaGV", MAGV);
                    SqlDataSource_ChonGV.Delete();
                    btnThamgia.Text = "Tham gia";
                    btnThamgia.Enabled = true;
                    btnThamgia.BackColor = System.Drawing.ColorTranslator.FromHtml("#D85121");
                    btnHuy.Enabled = false;
                    btnHuy.BackColor = Color.Brown;
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
            else if (e.CommandName == "sua")
            {
                lblError.Text = "" + MAGV;
                Response.Redirect("~\\CNKhoa_GVTTCT.aspx?Update=sua&MaGV=" + MAGV + "");
            }
            else if (e.CommandName == "xoa")
            {

            }
        }
        private void sendMail()
        {
            try
            {
                MailMessage mailMessage = new MailMessage();

                // set the properties of the MailMessage object
                mailMessage.From = new MailAddress("baoathlean@gmail.com");
                mailMessage.To.Add(new MailAddress("baoathlean@gmail.com"));
                mailMessage.Subject = "Thông báo hướng dẫn thực tập";
                mailMessage.Body = "Khoa công nghệ thông tin xin trân trọng thông báo thầy cô đã được mời hướng dẫn thực tập cho đợt III năm 2022";

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
                this.lblError.Text = ex.Message;
            }
        }
        private int GetDataChonGV(String MaSV)
        {
            //int count = 0;
            List<String> list = new List<String>();
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbChonGV where MaGV='" + MaSV + "'";
                    SqlCommand command = new SqlCommand(sqlQuery, connection);



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        list.Add(reader.GetString(0));

                    }
                    lblError.Text = "" + list.Count;



                }
            }
            catch (Exception ex)
            {
                lblError.Text = "" + ex.Message;
            }
            return list.Count;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

        }
        protected void DataList_GVTK_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }

        protected void DataList_GVTK_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void DataList_GV_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // access data item here
                String MaGV = ((Label)e.Item.FindControl("MaGV")).Text.Trim();

                DataListItem dataListItem = e.Item as DataListItem;
                Button btnDangky = dataListItem.FindControl("btnThamgia") as Button;
                Button btnHuy = dataListItem.FindControl("btnHuy") as Button;

                if (GetDataChonGV(MaGV) > 0)
                {
                    btnDangky.Text = "Đã tham gia";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;
                    lblError.Text = "" + GetDataChonGV(MaGV);
                    btnHuy.BackColor = System.Drawing.ColorTranslator.FromHtml("#D85121");
                    btnHuy.Enabled = true;
                }
                else
                {
                    btnHuy.BackColor = Color.Brown;
                    btnHuy.Enabled = false;
                }
            }
        }


    }
}