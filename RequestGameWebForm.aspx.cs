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
    public partial class RequestGameWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RequestGame_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectGladosDBConnectionString2"].ConnectionString))
            {
                sqlCon.Open();
                string query = "INSERT INTO VideoGames (Title, Price, Company, Genre, Description, Rating, Requested) VALUES (@title, @price, @company, @genre, @description, 0, 1)";

                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@title", title.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@price", price.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@company", company.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@genre", genre.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@description", description.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();

                Response.Redirect("ModeratorWebForm.aspx");
            }
        }
    }
}