using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCKH
{
    public partial class CNGIANGVIEN_HDTT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.Title = "Bạn đã chọn sinh viên";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName=="duyet")
            {
                try
                {
                    this.Title = "Bạn đã chọn sinh viên";
                }
                catch (System.Exception ex) { this.Title = "LỖI THÊM = " + ex.Message; }
                GridView1.DataBind();
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}