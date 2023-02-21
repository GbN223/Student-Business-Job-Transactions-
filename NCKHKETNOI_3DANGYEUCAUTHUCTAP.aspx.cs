using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NVCK
{
    public partial class NCKHKETNOI_3DANGYEUCAUTHUCTAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            String result = SqlDataSource1.SelectCommand;
            SqlDataSource1.SelectCommand = "Select Count(*) From [tbBaituyendung] Where [Tinhtrang] = N'Đã đăng'";
            lbposted.Text = result.ToString();
        }
    }
}