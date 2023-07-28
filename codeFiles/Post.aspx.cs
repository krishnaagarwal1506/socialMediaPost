using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Post : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter ad;
    SqlCommand cmd;



    protected void Page_Load(object sender, EventArgs e)
    {
       
        string path = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(path);
        con.Open();
        string query = "SELECT * FROM posts";
        ad = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        r1.DataSource = ds;
        r1.DataBind();
        for (int i = 0; i < r1.Items.Count; i++)
        {

            LinkButton l = r1.Items[i].FindControl("LinkButton1") as LinkButton;

            //string s1 = "select * from posts where username='" + Session[""].ToString() + "'";
            ad = new SqlDataAdapter(query, con);
            DataSet ds1 = new DataSet();
            ad.Fill(ds1);
            if (ds.Tables[0].Rows.Count == 0)
            {
                l.Text = "like";
            }
            else
            {
                l.Text = "unlike";
            }

        }
        



    }
    protected void l1_click(object sender, CommandEventArgs e)
    {
        string s = e.CommandName;
        Response.Redirect("ProfilePage.aspx?a="+s+"");
    }
    protected void likes_click(object sender, CommandEventArgs e)
    {
        string s = e.CommandName;

        LinkButton l = (LinkButton)sender;
        if (l.Text == "Like")
        {
            string s1 = "update posts set likes=like+1 where id=" + s + "";
            cmd = new SqlCommand(s1, con);
            cmd.ExecuteNonQuery();

        }
        else
        {
            string s1 = "update posts set likes=like-1 where id=" + s + "";
            cmd = new SqlCommand(s1, con);
            cmd.ExecuteNonQuery();
        }
        
    }

}