using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace NCKH
{
    public partial class CNKHOA_DN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DataList_DN.Items.Count.ToString();

        }



        protected void btnThemDN_Click(object sender, EventArgs e)
        {
            int soDN = DataList_DN.Items.Count;
            String SoDN = soDN.ToString();
            Response.Redirect("~\\CNKHOA_DNTTCT.aspx?SoDN=" + SoDN + "");
        }

        protected void DataList_DN_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataListItem dataListItem = e.Item as DataListItem;
            Button btnDangky = dataListItem.FindControl("btnDangkyDN") as Button;
            if (e.CommandName == "dangky")
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
                String MaDN = ((Label)e.Item.FindControl("MADN")).Text.Trim();
                try
                {
                    SqlDataSource_DangkyDN.InsertParameters.Clear();
                    SqlDataSource_DangkyDN.InsertParameters.Add("MaDN", MaDN);
                    SqlDataSource_DangkyDN.InsertParameters.Add("NAM", nam);
                    SqlDataSource_DangkyDN.InsertParameters.Add("HOCKI", hocki);
                    SqlDataSource_DangkyDN.Insert();
                    btnDangky.Text = "Đã chọn";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;

                }
                catch (Exception ex)
                {
                    // Label1.Text = "" + ex.Message;
                }
            }
            if (e.CommandName == "Xoa")
            {
                String MaDN = ((Label)e.Item.FindControl("MADN")).Text.Trim();
                SqlDataSource_DangkyDN.DeleteCommand = "Delete tbDoanhnghiep where MaDN=@MaDN";
                try
                {
                    SqlDataSource_DangkyDN.DeleteParameters.Clear();
                    SqlDataSource_DangkyDN.DeleteParameters.Add("MaDN", MaDN);
                    SqlDataSource_DangkyDN.Delete();
                    this.Title = "Thành công";
                    DataList_DN.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "" + ex.Message;
                }
            }
        }

        private int GetDataDangkyDN(String MaDN)
        {
            //int count = 0;
            List<String> list = new List<String>();
            string connectionString = "Data Source=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com;Initial Catalog=1G05NguyenChiBaoDangkykhoahoc;Persist Security Info=False;User ID=pop123_SQLLogin_1;Password=6f6yctis21;Packet Size=4096;Workstation ID=1G05NguyenChiBaoDangkykhoahoc.mssql.somee.com";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlQuery = "SELECT * FROM tbChonDN where   MaDN='" + MaDN + "'";
                    SqlCommand command = new SqlCommand(sqlQuery, connection);



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        list.Add(reader.GetString(0));

                    }
                    //lblError.Text = "" + list.Count;
                    this.Title = "" + list.Count;


                }
            }
            catch (Exception ex)
            {
                //lblError.Text = "" + ex.Message;
            }
            return list.Count;
        }
        protected void DataList_DN_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // access data item here
                String MaDN = ((Label)e.Item.FindControl("MADN")).Text.Trim();

                DataListItem dataListItem = e.Item as DataListItem;
                Button btnDangky = dataListItem.FindControl("btnDangkyDN") as Button;
                if (GetDataDangkyDN(MaDN) > 0)
                {
                    btnDangky.Text = "Đã chọn";
                    btnDangky.Enabled = false;
                    btnDangky.BackColor = Color.Brown;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }

}