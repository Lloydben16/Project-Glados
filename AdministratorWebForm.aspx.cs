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
    public partial class AdministratorWebForm : System.Web.UI.Page
    {
        //string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lloyd\Documents\ProjectGladosDB.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string name = Session["username"].ToString();
                usernameDisplay.InnerHtml = "<h4 style = 'color: RoyalBlue;' > username:" + name + "</ h4 >";
            }
            else
            {
                usernameDisplay.InnerHtml = "<h4 style = 'color: RoyalBlue;' > no username </ h4 >";
            }
            // using (SqlConnection sqlCon = new SqlConnection(connectionString)) {
            // sqlCon.Open();
            //SqlDataAdapter sqlData = new SqlDataAdapter("SELECT Title, Price, GenreId, Description FROM VideoGames", sqlCon);
            //DataTable dtbl = new DataTable();
            //sqlData.Fill(dtbl);
            //GridView1.DataSource = dtbl;
            //GridView1.DataBind();
            //}
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String query = "SELECT VideoGameId, Title, Genre, Company, Price, Rating, Requested FROM VideoGames WHERE Title LIKE '%" + gameTitle.Text + "%' AND Company LIKE '%" + gameDeveloper.Text + "%'";
            if (gameRating.Text != "Rating") {
                query += " AND Rating >= " + gameRating.Text + " ORDER BY Rating DESC";
            }
            SqlDataSource1.SelectCommand = query;
            SqlDataSource1.DataBind();
        }

        //protected void AddGame_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("AddGameWebForm.aspx");
        //}

        // Use this method to make a game deleted or to make a game confirmed
        protected void ButtonClick(object sender, CommandEventArgs e) {
            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectGladosDBConnectionString2"].ConnectionString)) {
                sqlCon.Open();

                String videoGameId = e.CommandArgument.ToString();
                String query = "SELECT COUNT(1) FROM VideoGames WHERE Requested=0 AND VideoGameId = " + videoGameId;

                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1) {
                    string query3 = "DELETE FROM Comments WHERE VideoGameId = " + videoGameId;
                    sqlCmd = new SqlCommand(query3, sqlCon);
                    sqlCmd.ExecuteNonQuery();
                    query = "DELETE FROM VideoGames WHERE VideoGameId = " + videoGameId;
                } else {
                    query = "UPDATE VideoGames SET Requested=0 WHERE VideoGameId = " + videoGameId;
                }

                sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
            }

            String query2 = "SELECT VideoGameId, Title, Genre, Company, Price, Rating, Requested FROM VideoGames WHERE Title LIKE '%" + gameTitle.Text + "%' AND Company LIKE '%" + gameDeveloper.Text + "%'";
            if (gameRating.Text != "Rating") {
                query2 += " AND Rating >= " + gameRating.Text + " ORDER BY Rating DESC";
            }
            SqlDataSource1.SelectCommand = query2;
            SqlDataSource1.DataBind();
        }
    }
}