using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace SINHVIEN
{
    public partial class CNSinhvien_Dangkydn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


            }
        }

        //protected void btnDangky_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~\\CNSinhvien_Chongv.aspx");
        //}

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            String MaDN = ((Label)e.Item.FindControl("MaDNLabel")).Text.Trim();
            String MaSV = Request.QueryString["MaSV"];
            DataListItem dataListItem = e.Item as DataListItem;
            Button btnDangky = dataListItem.FindControl("btnDangky") as Button;

            if (e.CommandName == "dangkydn")
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
                    SqlDataSource_SVDangkyDN.InsertParameters.Clear();
                    SqlDataSource_SVDangkyDN.InsertParameters.Add("MaDN", MaDN);
                    SqlDataSource_SVDangkyDN.InsertParameters.Add("MASV", MaSV);
                    SqlDataSource_SVDangkyDN.InsertParameters.Add("HOCKI", hocki);
                    SqlDataSource_SVDangkyDN.InsertParameters.Add("NAM", nam);
                    SqlDataSource_SVDangkyDN.InsertParameters.Add("TINHTRANG", "null");
                    SqlDataSource_SVDangkyDN.InsertParameters.Add("KHOAHOC", "null");
                    SqlDataSource_SVDangkyDN.InsertParameters.Add("NGAYDANGKY", ngaydangky);
                    SqlDataSource_SVDangkyDN.Insert();
                    lblError.Text = "Đăng ký thành công";

                    btnDangky.Text = "Đã đăng ký";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;
                    if (GetDataDangkyGV(MaSV) < 1)
                    {
                        btnDangky.OnClientClick = "return confirm('B1.Đăng ký doanh nghiệp thành công\n\nB2. Đăng ký giảng viên hướng dẫn\n\nMời bạn sang B2!')";
                        lblError.Text = "B1.Đăng ký doanh nghiệp thành công\n\nB2. Đăng ký giảng viên hướng dẫn\n\nMời bạn sang B2!";
                        Response.Redirect("~\\CNSinhvien_Chongv.aspx?MaSV=" + MaSV + "");
                    }
                    else
                    {
                        btnDangky.OnClientClick = "return confirm('Bạn đã hoàn tất quy trình đăng ký')";

                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "" + ex.Message;
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

                    string sqlQuery = "SELECT * FROM tbDangky where MaSV='" + MaSV + "' and MaDN='" + MaDN + "'";
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
        private int GetDataDangkyGV(String MaSV)
        {
            //int count = 0;
            List<String> list = new List<String>();
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbDangkyGV where MaSV='" + MaSV + "'";
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

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // access data item here
                String MaDN = ((Label)e.Item.FindControl("MaDNLabel")).Text.Trim();
                String MaSV = Request.QueryString["MaSV"];
                DataListItem dataListItem = e.Item as DataListItem;
                Button btnDangky = dataListItem.FindControl("btnDangky") as Button;
                if (GetDataDangkyDN(MaSV, MaDN) > 0)
                {
                    btnDangky.Text = "Đã đăng ký";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;
                }
            }
        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {

        }
    }

}