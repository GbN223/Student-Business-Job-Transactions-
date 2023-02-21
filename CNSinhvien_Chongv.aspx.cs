using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCKH
{
    public partial class CNSinhvien_Chongv : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void DataListThongtingv_ItemCommand(object source, DataListCommandEventArgs e)
        {
            SqlDataSource dataSource = new SqlDataSource();
            dataSource.ID = "SqlDataSource1";
            dataSource.ConnectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            dataSource.SelectCommand = "SELECT * FROM tbDangkyGV";
            dataSource.InsertCommand = "INSERT INTO tbDangkyGV (MASV,MAGV,NAM,HOCKI,TINHTRANG,KHOAHOC,NGAYDANGKY)VALUES(@MASV,@MAGV,@NAM,@HOCKI,@TINHTRANG,@KHOAHOC,@NGAYDANGKY)";
            String MaGV = ((Label)e.Item.FindControl("MagvLabel")).Text.Trim();
            String MaSV = Request.QueryString["MaSV"];
            DataListItem dataListItem = e.Item as DataListItem;
            Button btnDangky = dataListItem.FindControl("btnDangky") as Button;

            if (e.CommandName == "DangkyGV")
            {

                DateTime dateTime = DateTime.Now;
                String nam = dateTime.Year.ToString();
                String thang = dateTime.Month.ToString();
                String ngay = dateTime.Day.ToString();
                String ngaydangky = thang + "/" + ngay + "/" + nam;
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
                    dataSource.InsertParameters.Clear();
                    dataSource.InsertParameters.Add("MAGV", MaGV);
                    dataSource.InsertParameters.Add("MASV", MaSV);
                    dataSource.InsertParameters.Add("HOCKI", hocki);
                    dataSource.InsertParameters.Add("NAM", nam);
                    dataSource.InsertParameters.Add("TINHTRANG", "True");
                    dataSource.InsertParameters.Add("KHOAHOC", "null");
                    dataSource.InsertParameters.Add("NGAYDANGKY", ngaydangky);
                    dataSource.Insert();
                   // lblError.Text = "Đăng ký thành công";

                    btnDangky.Text = "Đã đăng ký";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;
                    //if (GetDataDangkyGV(MaSV) < 1)
                    //{
                    //    btnDangky.OnClientClick = "return confirm('B1.Đăng ký doanh nghiệp thành công\n\nB2. Đăng ký giảng viên hướng dẫn\n\nMời bạn sang B2!')";
                    //    //lblError.Text = "B1.Đăng ký doanh nghiệp thành công\n\nB2. Đăng ký giảng viên hướng dẫn\n\nMời bạn sang B2!";
                    //    Response.Redirect("~\\CNSinhvien_Chongv.aspx?MaSV=2021010112");
                    //}
                    //else
                    //{
                    //    btnDangky.OnClientClick = "return confirm('Bạn đã hoàn tất quy trình đăng ký')";

                    //}
                }
                catch (Exception ex)
                {
                   this.Title= ex.Message;
                    //lblErro.Text = "" + ex.Message;
                }
            }
        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            


        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        private int GetDataDangkyGV(String MaSV, String MaGV)
        {
            //int count = 0;
            List<String> list = new List<String>();
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbDangkyGV where MaSV='" + MaSV + "' and MaGV='"+MaGV+"'";
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
                this.Title = "" + ex.Message;
            }
            return list.Count;
        }
        protected void DataListThongtingv_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // access data item here
               
                String MaSV = Request.QueryString["MaSV"];
                DataListItem dataListItem = e.Item as DataListItem;
                dataListItem.ID = "DataListThongtingv";
                Button btnDangky = e.Item.FindControl("btnDangky") as Button;
                Label lblSldangky = e.Item.FindControl("SldangkyLabel") as Label;
                Label lblChitieu = e.Item.FindControl("ChitieuLabel") as Label;
                int sldangky=Int32.Parse( lblSldangky.Text);
                int chitieu = Int32.Parse(lblChitieu.Text);
                String MaGV = ((Label)e.Item.FindControl("MagvLabel")).Text.Trim();
                if (sldangky >= chitieu)
                {
                    btnDangky.Text = "Đã đầy";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;
                }
                if (GetDataDangkyGV(MaSV,MaGV) > 0)
                {

                    btnDangky.Text = "Đã đăng ký";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;
                }
            }
        }
    }
}