using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Project_Glados_master
{
    public partial class CommentWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CommentGame_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectGladosDBConnectionString2"].ConnectionString))
            {
                sqlCon1.Open();
                string query = "INSERT INTO Comments (Rating, Comments, UserId, VideoGameId, isDeleted) VALUES (@Rating, @Comments, "  +  Session["userId"] + ", " + Session["currentVideoGame"] + ", 0)";

                SqlCommand sqlCmd = new SqlCommand(query, sqlCon1);
                sqlCmd.Parameters.AddWithValue("@Rating", rating.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Comments", comment.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                sqlCon1.Close();
            }

            Response.Redirect(Session["VideoGamePage"].ToString());
        }
    }
}