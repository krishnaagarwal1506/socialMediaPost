using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ProfilePage : System.Web.UI.Page{
    SqlConnection con ;
    SqlDataAdapter ad;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        string path = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(path);
        con.Open();
        string username = Request.QueryString["a"].ToString();
        Label1.Text = username;
        string query = "select * from posts where userName='" + username + "'";
        ad = new SqlDataAdapter(query,con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        r1.DataSource = ds;
        r1.DataBind();
    }
}