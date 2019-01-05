using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class report_summary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }

    protected void LoadData()
    {
        lblPrinted.Text = "Printed: " + DateTime.Today.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();
        SqlConnection cnDB;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "spSummary";
        try
        {
            cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
            cnDB.Open();
            cmd = new SqlCommand(sql, cnDB);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@startDate", dateBeginning.Text);
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            da.Fill(dt);
            cnDB.Close();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                gvMaster.DataSource = dt;
                gvMaster.DataBind();

                double ttl1 = dt.AsEnumerable().Sum(row => row.Field<double>("gutter_footage"));
                gvMaster.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Right;
                gvMaster.FooterRow.Cells[1].Text = ttl1.ToString("n1");

                double ttl2 = dt.AsEnumerable().Sum(row => row.Field<double>("guard_footage"));
                gvMaster.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                gvMaster.FooterRow.Cells[2].Text = ttl2.ToString("n1");

                double ttl3 = dt.AsEnumerable().Sum(row => row.Field<double>("tearoff_total"));
                gvMaster.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                gvMaster.FooterRow.Cells[3].Text = ttl3.ToString("n1");

                double ttl4 = dt.AsEnumerable().Sum(row => row.Field<double>("flashing_total"));
                gvMaster.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                gvMaster.FooterRow.Cells[4].Text = ttl4.ToString("n1");

                double ttl5 = dt.AsEnumerable().Sum(row => row.Field<double>("over500"));
                gvMaster.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                gvMaster.FooterRow.Cells[5].Text = ttl5.ToString("n1");

                gvMaster.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                gvMaster.FooterRow.Cells[6].Text =( ttl1 + ttl2 + ttl3 + ttl4 + ttl5).ToString("n1");

                gvDetail.DataSource = dt;
                gvDetail.DataBind();

                ttl1 = dt.AsEnumerable().Sum(row => row.Field<double>("baserate"));
                gvDetail.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[1].Text = ttl1.ToString("f2");

                ttl2 = dt.AsEnumerable().Sum(row => row.Field<double>("drivetime"));
                gvDetail.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[2].Text = ttl2.ToString("f2");

                ttl3 = dt.AsEnumerable().Sum(row => row.Field<double>("multiple_jobs"));
                gvDetail.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[3].Text = ttl3.ToString("f2");

                ttl4 = dt.AsEnumerable().Sum(row => row.Field<double>("hourly"));
                gvDetail.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[4].Text = ttl4.ToString("f2");

                ttl5 = dt.AsEnumerable().Sum(row => row.Field<double>("repair_cleanings"));
                gvDetail.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[5].Text = ttl5.ToString("f2");

                double ttl6 = dt.AsEnumerable().Sum(row => row.Field<double>("unique_cleaning"));
                gvDetail.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[6].Text = ttl6.ToString("f2");

                double ttl7 = dt.AsEnumerable().Sum(row => row.Field<double>("misc"));
                gvDetail.FooterRow.Cells[7].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[7].Text = ttl7.ToString("f2");

                double ttl8 = dt.AsEnumerable().Sum(row => row.Field<double>("daily_bonus"));
                gvDetail.FooterRow.Cells[8].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[8].Text = ttl8.ToString("f2");

                double ttl9 = dt.AsEnumerable().Sum(row => row.Field<double>("vacation"));
                gvDetail.FooterRow.Cells[9].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[9].Text = ttl9.ToString("f2");

                double ttl10 = dt.AsEnumerable().Sum(row => row.Field<double>("holiday"));
                gvDetail.FooterRow.Cells[10].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[10].Text = ttl10.ToString("f2");

                gvDetail.FooterRow.Cells[11].HorizontalAlign = HorizontalAlign.Right;
                gvDetail.FooterRow.Cells[11].Text = (ttl1 + ttl2 + ttl3 + ttl4 + ttl5 + ttl6 + ttl7 + ttl8 + ttl9 + ttl10).ToString("c2");
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Error during Fetch of data: '" + msg + ");", true);
            return;
        }
    }

    protected void gvMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            double ttl = 0.0;
            for (int i = 1; i < 7; i++)
            {
                string _val = e.Row.Cells[i].Text;
                ttl += Convert.ToDouble(_val);
                if (_val == "0.0") e.Row.Cells[i].Text = "";
            }
            e.Row.Cells[6].Text = ttl.ToString("n1");
        }
    }

    protected void gvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                double ttl = 0.0;
                for (int i = 1; i < 11; i++)
                {
                    string _val = e.Row.Cells[i].Text;
                    ttl += Convert.ToDouble(_val);
                    if (_val == "0.00") e.Row.Cells[i].Text = "";
                }
                e.Row.Cells[11].Text = ttl.ToString("f2");
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Error during Fetch of data: '" + msg + ");", true);
            return;
        }
    }

    protected void btnStart_Click(object sender, EventArgs e)
    {
        LoadData();
    }
}