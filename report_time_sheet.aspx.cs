using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class report_time_sheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadEmployees();
            grdMaster.DataSource = null;
            grdMaster.DataBind();

            tblFootage.Visible = false;
            tblRates.Visible = false;
            tblTotals.Visible = false;

            lblBeginning.Text = string.Empty;
            lblInstaller.Text = string.Empty;

            lblPrinted.Text = "Printed: " + DateTime.Today.ToLongDateString() + " " +  DateTime.Now.ToLongTimeString();
        }
    }

    protected void LoadEmployees()
    {
        SqlConnection cnDB;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string sql = "Select 0 as value, '' as label UNION Select id as value, firstname + ' ' + lastname as label from UserProfile where active=1 order by label";
        try
        {
            cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
            cmd = new SqlCommand(sql, cnDB);
            cmd.CommandType = CommandType.Text;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cnDB.Close();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                ddlEmployee.DataSource = ds.Tables[0];
                ddlEmployee.DataTextField = "label";
                ddlEmployee.DataValueField = "value";
                ddlEmployee.DataBind();
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Error during Fetch of installers: '" + msg + ");", true);
            return;
        }
    }

    protected void LoadGrid()
    {
        SqlConnection cnDB;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string sql = "spGetTotals";
        double _ttlGutter = 0.0;
        double _ttlGuard = 0.0;
        double _ttlTearoff = 0.0;
        double _ttlFlashing = 0.0;
        double _ttlOver500 = 0.0;
        double _ttlBaseRate = 0.0;
        double _ttlDriveTime = 0.0;
        double _ttlMultipleJobs = 0.0;
        double _ttlHourlyRate = 0.0;
        double _ttlRepairs = 0.0;
        double _ttlUnique = 0.0;
        double _ttlMisc = 0.0;
        double _ttlDailyBonus = 0.0;
        double _ttlVacation = 0.0;
        double _ttlHoliday = 0.0;
        double _ttlFootagePay = 0.0;
        try
        {
            cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
            cmd = new SqlCommand(sql, cnDB);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user", ddlEmployee.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@startDate", dateBeginning.Text);
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cnDB.Close();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                grdMaster.DataSource = ds.Tables[0];
                grdMaster.DataBind();

                tblFootage.Visible = true;
                tblRates.Visible = true;
                tblTotals.Visible = true;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    _ttlGutter += Convert.ToDouble(ds.Tables[0].Rows[i]["gutter_footage"].ToString());
                    _ttlGuard += Convert.ToDouble(ds.Tables[0].Rows[i]["guard_footage"].ToString());
                    _ttlTearoff += Convert.ToDouble(ds.Tables[0].Rows[i]["tearoff_footage"].ToString());
                    _ttlFlashing += Convert.ToDouble(ds.Tables[0].Rows[i]["flashing_footage"].ToString());
                    _ttlOver500 += Convert.ToDouble(ds.Tables[0].Rows[i]["over_500"].ToString());

                    _ttlBaseRate += Convert.ToDouble(ds.Tables[0].Rows[i]["base_rate_total"].ToString());
                    _ttlDriveTime += Convert.ToDouble(ds.Tables[0].Rows[i]["drive_time_total"].ToString());
                    _ttlMultipleJobs += Convert.ToDouble(ds.Tables[0].Rows[i]["multiple_jobs_total"].ToString());
                    _ttlHourlyRate += Convert.ToDouble(ds.Tables[0].Rows[i]["hourly_total"].ToString());
                    _ttlRepairs += Convert.ToDouble(ds.Tables[0].Rows[i]["repair_cleanings_total"].ToString());
                    _ttlUnique += Convert.ToDouble(ds.Tables[0].Rows[i]["unique_cleaning_total"].ToString());
                    _ttlMisc += Convert.ToDouble(ds.Tables[0].Rows[i]["misc_total"].ToString());
                    _ttlDailyBonus += Convert.ToDouble(ds.Tables[0].Rows[i]["daily_bonus_total"].ToString());
                    _ttlVacation += Convert.ToDouble(ds.Tables[0].Rows[i]["vacation_total"].ToString());
                    _ttlHoliday += Convert.ToDouble(ds.Tables[0].Rows[i]["holiday_total"].ToString());
                    _ttlFootagePay += Convert.ToDouble(ds.Tables[0].Rows[i]["gutter_total"].ToString()) +
                                      Convert.ToDouble(ds.Tables[0].Rows[i]["guard_total"].ToString()) +
                                      Convert.ToDouble(ds.Tables[0].Rows[i]["tearoff_total"].ToString()) +
                                      Convert.ToDouble(ds.Tables[0].Rows[i]["flashing_total"].ToString()) +
                                      Convert.ToDouble(ds.Tables[0].Rows[i]["over_500_total"].ToString());
                }

                ttlGutter.Text = _ttlGutter.ToString("n2");
                ttlGuard.Text = _ttlGuard.ToString("n2");
                ttlTearoff.Text = _ttlTearoff.ToString("n2");
                ttlFlashing.Text = _ttlFlashing.ToString("n2");
                ttlOver500.Text = _ttlOver500.ToString("n2");
                ttlFinalFootage.Text = (_ttlGutter + _ttlGuard + _ttlTearoff + _ttlFlashing + _ttlOver500).ToString("n2");

                ttlBaseRate.Text = _ttlBaseRate.ToString("c2");
                ttlDriveTime.Text = _ttlDriveTime.ToString("c2");
                ttlMultipleJobs.Text = _ttlMultipleJobs.ToString("c2");
                ttlHourlyRate.Text = _ttlHourlyRate.ToString("c2");
                ttlRepairs.Text = _ttlRepairs.ToString("c2");
                ttlUnique.Text = _ttlUnique.ToString("c2");
                ttlMisc.Text = _ttlMisc.ToString("c2");
                ttlDailyBonus.Text = _ttlDailyBonus.ToString("c2");
                ttlVacation.Text = _ttlVacation.ToString("c2");
                ttlHoliday.Text = _ttlHoliday.ToString("c2");

                ttlPay.Text = (_ttlBaseRate + _ttlDriveTime + _ttlMultipleJobs + _ttlHourlyRate + _ttlRepairs + _ttlUnique + _ttlMisc + _ttlDailyBonus + _ttlVacation + _ttlHoliday).ToString("c2");
                ttlFootagePay.Text = _ttlFootagePay.ToString("c2");
                ttlWeeklyPay.Text = (_ttlBaseRate + _ttlDriveTime + _ttlMultipleJobs + _ttlHourlyRate + _ttlRepairs + _ttlUnique + _ttlMisc + _ttlDailyBonus + _ttlVacation + _ttlHoliday + _ttlFootagePay).ToString("c2");
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Error during Fetch of data: '" + msg + ");", true);
            return;
        }
    }

    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblInstaller.Text = "Installer : " + ddlEmployee.SelectedItem.ToString();
        lblBeginning.Text = "Week Beginning : " + dateBeginning.Text;
        LoadGrid();
    }

    protected void grdMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i=4; i < 19; i++)
            {
                string _val = e.Row.Cells[i].Text;
                if (_val == "0") e.Row.Cells[i].Text = "";
            }
        }
    }
}