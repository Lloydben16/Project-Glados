using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Net.Cache;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Project_Glados_master {
    public partial class ConfirmDelete : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            String query = "SELECT C.[CommentsId], U.[userName], C.[Rating], C.[Comments] FROM [Comments] C , Users U WHERE C.UserId = U.UserId AND C.IsDeleted=0 AND C.videoGameId = " + Session["GameID"] + "AND C.CommentsId = " + Request.QueryString["CommentsId"];
            SqlDataSource1.SelectCommand = query;
            SqlDataSource1.DataBind();
        }

        protected void BtnMain_Click(object sender, EventArgs e) {
            Response.Redirect(Session["webpage"].ToString());
        }

        protected void DeleteComment(object sender, EventArgs e) {
            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectGladosDBConnectionString2"].ConnectionString)) {
                sqlCon.Open();

                String query = "SELECT COUNT(1) FROM Comments WHERE CommentsId = " + Request.QueryString["CommentsId"];

                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1) {
                    query = "UPDATE Comments SET IsDeleted=1 WHERE CommentsId = " + Request.QueryString["CommentsId"];
                    sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.ExecuteNonQuery();
                    sqlCon.Close();
                }
            }

            Response.Redirect("./ModeratorComments.aspx?VideoGameId=" + Session["GameID"]);
        }

        protected void Redirect(object sender, EventArgs e) {
            Response.Redirect("./ModeratorComments.aspx?VideoGameId=" + Session["GameID"]);
        }
    }
}