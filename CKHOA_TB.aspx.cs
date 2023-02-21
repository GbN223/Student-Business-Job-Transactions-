using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCKH
{
    public partial class CKHOA_TB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThemTB_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\CNKHOACTTB.aspx");
        }//if ...else  ....btnThemNV.Text.Trim()

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DataList_TB_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sua")
            {
                String MaTB= ((System.Web.UI.WebControls.Label)e.Item.FindControl("MaTB")).Text.Trim();
                Response.Redirect("~\\CNKHOACTTB.aspx?MaTB="+MaTB+"");
            }
        }
    }
}