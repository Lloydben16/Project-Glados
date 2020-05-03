using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Glados_master
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "SELECT [Title], [Price], [Genre], [Company] FROM [VideoGames] WHERE [VideoGameId] = " + Request.QueryString["VideoGameId"];
            SqlDataSource1.SelectCommand = query;
            SqlDataSource1.DataBind();
        }

        protected void BtnMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}