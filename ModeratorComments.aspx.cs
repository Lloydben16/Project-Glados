using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Project_Glados_master {
    public partial class ModeratorComments : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            string query = "SELECT [Title], [Rating], [Price], [Genre], [Company] FROM [VideoGames] WHERE [VideoGameId] = " + Request.QueryString["VideoGameId"];
            SqlDataSource1.SelectCommand = query;
            SqlDataSource1.DataBind();

            string query2 = "SELECT U.[userName], C.[Rating], C.[Comments] FROM [Comments] C , Users U WHERE C.UserId = U.UserId AND C.IsDeleted=0 AND C.videoGameId = " + Request.QueryString["VideoGameId"];
            SqlDataSource2.SelectCommand = query2;
            SqlDataSource2.DataBind();
        }

        protected void BtnMain_Click(object sender, EventArgs e) {
            Response.Redirect(Session["webpage"].ToString());
        }

        protected void ButtonClick(object sender, CommandEventArgs e) {
            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectGladosDBConnectionString2"].ConnectionString)) {
                sqlCon.Open();

                String commentId = e.CommandArgument.ToString();
                String query = "SELECT COUNT(1) FROM Comments WHERE CommentsId = " + commentId;

                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1) {
                    query = "UPDATE Comments SET IsDeleted=1 WHERE CommentsId = " + commentId;
                    sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.ExecuteNonQuery();
                    sqlCon.Close();
                }
            }

            String query2 = "SELECT U.[userName], C.[Rating], C.[Comments] FROM [Comments] C , Users U WHERE C.UserId = U.UserId AND C.IsDeleted=0 AND C.videoGameId = " + Request.QueryString["VideoGameId"];
            SqlDataSource2.SelectCommand = query2;
            SqlDataSource2.DataBind();
        }
    }
}