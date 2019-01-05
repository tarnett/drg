using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class transactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadEmployees();
            LoadJobs();
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
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('" + msg + "');", true);
            return;
        }
    }

    protected void LoadJobs()
    {
        SqlConnection cnDB;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string sql = "Select 0 as value, '' as label UNION Select id as value, jobName as label from Jobs where active=1 order by label";
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
                ddlJobs.DataSource = ds.Tables[0];
                ddlJobs.DataTextField = "label";
                ddlJobs.DataValueField = "value";
                ddlJobs.DataBind();
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('" + msg + "');", true);
            return;
        }
    }

    protected void ClearDailyTotals()
    {
        rate_GutterFootage.Text = string.Empty;
        rate_GuardFootage.Text = string.Empty;
        rate_TearoffFootage.Text = string.Empty;
        rate_FlashingTotal.Text = string.Empty;
        rate_Over500.Text = string.Empty;
        rate_BaseRate.Text = string.Empty;
        rate_DriveTime.Text = string.Empty;
        rate_MultipleJobs.Text = string.Empty;
        rate_Hourly.Text = string.Empty;
        rate_RepairCleanings.Text = string.Empty;
        rate_UniqueCleaning.Text = string.Empty;
        rate_Misc.Text = string.Empty;
        rate_DailyBonus.Text = string.Empty;
        rate_Vacation.Text = string.Empty;
        rate_Holiday.Text = string.Empty;

        dtThu.Text = string.Empty;
        dtFri.Text = string.Empty;
        dtSat.Text = string.Empty;
        dtSun.Text = string.Empty;
        dtMon.Text = string.Empty;
        dtTue.Text = string.Empty;
        dtWed.Text = string.Empty;

        daily_thu_footage.Text = string.Empty;
        misc_thu_footage.Text = string.Empty;
        jobs_thu_count.Text = string.Empty;

        daily_fri_footage.Text = string.Empty;
        misc_fri_footage.Text = string.Empty;
        jobs_fri_count.Text = string.Empty;

        daily_sat_footage.Text = string.Empty;
        misc_sat_footage.Text = string.Empty;
        jobs_sat_count.Text = string.Empty;

        daily_sun_footage.Text = string.Empty;
        misc_sun_footage.Text = string.Empty;
        jobs_sun_count.Text = string.Empty;

        daily_mon_footage.Text = string.Empty;
        misc_mon_footage.Text = string.Empty;
        jobs_mon_count.Text = string.Empty;

        daily_tue_footage.Text = string.Empty;
        misc_tue_footage.Text = string.Empty;
        jobs_tue_count.Text = string.Empty;

        daily_wed_footage.Text = string.Empty;
        misc_wed_footage.Text = string.Empty;
        jobs_wed_count.Text = string.Empty;

        dateWorked.Text = string.Empty;
        ddlJobs.SelectedIndex = -1;
    }

    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dateBeginning.Text != "")
        {
            ClearDailyTotals();

            DateTime dt = Convert.ToDateTime(dateBeginning.Text);
            dtThu.Text = dateBeginning.Text;
            dtFri.Text = dt.AddDays(1).ToShortDateString();
            dtSat.Text = dt.AddDays(2).ToShortDateString();
            dtSun.Text = dt.AddDays(3).ToShortDateString();
            dtMon.Text = dt.AddDays(4).ToShortDateString();
            dtTue.Text = dt.AddDays(5).ToShortDateString();
            dtWed.Text = dt.AddDays(6).ToShortDateString();

            string[] dateArray = new string[8];
            dateArray[1] = dtThu.Text;
            dateArray[2] = dtFri.Text;
            dateArray[3] = dtSat.Text;
            dateArray[4] = dtSun.Text;
            dateArray[5] = dtMon.Text;
            dateArray[6] = dtTue.Text;
            dateArray[7] = dtWed.Text;

            SqlConnection cnDB;
            SqlCommand cmd;
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string sql = "Select * from UserSettings Where workerid=@p0";
            try
            {
                cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
                cmd = new SqlCommand(sql, cnDB);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@p0", ddlEmployee.SelectedValue.ToString());
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                cnDB.Close();
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    rate_GutterFootage.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["gutterfootage"].ToString()).ToString("f2");
                    rate_GuardFootage.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["guardfootage"].ToString()).ToString("f2");
                    rate_TearoffFootage.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["tearoff"].ToString()).ToString("f2");
                    rate_FlashingTotal.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["flashing"].ToString()).ToString("f2");
                    rate_Over500.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["over500"].ToString()).ToString("f2");
                    rate_BaseRate.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["base"].ToString()).ToString("f2");
                    rate_DriveTime.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["drivetime"].ToString()).ToString("f2");
                    rate_MultipleJobs.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["multiplejobs"].ToString()).ToString("f2");
                    rate_Hourly.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["hourlyrate"].ToString()).ToString("f2");
                    rate_RepairCleanings.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["repaircleanings"].ToString()).ToString("f2");
                    rate_UniqueCleaning.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["uniquecleaning"].ToString()).ToString("f2");
                    rate_Misc.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["misc"].ToString()).ToString("f2");
                    rate_DailyBonus.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["dailybonus"].ToString()).ToString("f2");
                    rate_Vacation.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["vacation"].ToString()).ToString("f2");
                    rate_Holiday.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["holiday"].ToString()).ToString("f2");
                }
            }
            catch (Exception ex)
            {
                string msg = ex.Message;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('" + msg + "');", true);
                return;
            }
            //
            // start gathering totals by date for this user
            //
            sql = "spGetTotalsByDate";
            ds.Clear();

            double _footage = 0.0;
            double _total = 0.0;
            double _tFootage = 0.0;
            double _tPay = 0.0;
            int _tJobs = 0;

            for (int d = 1; d < 8; d++)
            {
                try
                {
                    cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
                    cmd = new SqlCommand(sql, cnDB);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user", ddlEmployee.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@StartDate", dateArray[d]);
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    cnDB.Close();
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        _footage = 0.0;
                        _total = 0.0;

                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            _footage += Convert.ToDouble(ds.Tables[0].Rows[i]["gutter_footage"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["guard_footage"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["tearoff_footage"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["flashing_footage"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["over_500"].ToString());

                            _total += Convert.ToDouble(ds.Tables[0].Rows[i]["gutter_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["guard_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["tearoff_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["flashing_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["over_500_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["base_rate_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["drive_time_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["multiple_jobs_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["hourly_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["repair_cleanings_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["unique_cleaning_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["misc_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["daily_bonus_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["vacation_total"].ToString()) +
                                        Convert.ToDouble(ds.Tables[0].Rows[i]["holiday_total"].ToString());
                        }
                        switch (d)
                        {
                            case 1:
                                daily_thu_footage.Text = _footage.ToString("f2");
                                misc_thu_footage.Text = _total.ToString("c2");
                                jobs_thu_count.Text = ds.Tables[0].Rows.Count.ToString("n0");
                                _tFootage += _footage;
                                _tPay += _total;
                                _tJobs += ds.Tables[0].Rows.Count;
                                break;
                            case 2:
                                daily_fri_footage.Text = _footage.ToString("f2");
                                misc_fri_footage.Text = _total.ToString("c2");
                                jobs_fri_count.Text = ds.Tables[0].Rows.Count.ToString("n0");
                                _tFootage += _footage;
                                _tPay += _total;
                                _tJobs += ds.Tables[0].Rows.Count;
                                break;
                            case 3:
                                daily_sat_footage.Text = _footage.ToString("f2");
                                misc_sat_footage.Text = _total.ToString("c2");
                                jobs_sat_count.Text = ds.Tables[0].Rows.Count.ToString("n0");
                                _tFootage += _footage;
                                _tPay += _total;
                                _tJobs += ds.Tables[0].Rows.Count;
                                break;
                            case 4:
                                daily_sun_footage.Text = _footage.ToString("f2");
                                misc_sun_footage.Text = _total.ToString("c2");
                                jobs_sun_count.Text = ds.Tables[0].Rows.Count.ToString("n0");
                                _tFootage += _footage;
                                _tPay += _total;
                                _tJobs += ds.Tables[0].Rows.Count;
                                break;
                            case 5:
                                daily_mon_footage.Text = _footage.ToString("f2");
                                misc_mon_footage.Text = _total.ToString("c2");
                                jobs_mon_count.Text = ds.Tables[0].Rows.Count.ToString("n0");
                                _tFootage += _footage;
                                _tPay += _total;
                                _tJobs += ds.Tables[0].Rows.Count;
                                break;
                            case 6:
                                daily_tue_footage.Text = _footage.ToString("f2");
                                misc_tue_footage.Text = _total.ToString("c2");
                                jobs_tue_count.Text = ds.Tables[0].Rows.Count.ToString("n0");
                                _tFootage += _footage;
                                _tPay += _total;
                                _tJobs += ds.Tables[0].Rows.Count;
                                break;
                            case 7:
                                daily_wed_footage.Text = _footage.ToString("f2");
                                misc_wed_footage.Text = _total.ToString("c2");
                                jobs_wed_count.Text = ds.Tables[0].Rows.Count.ToString("n0");
                                _tFootage += _footage;
                                _tPay += _total;
                                _tJobs += ds.Tables[0].Rows.Count;
                                break;
                        }
                        ds.Clear();
                    }
                }
                catch (Exception ex)
                {
                    string msg = ex.Message;
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('" + msg + "');", true);
                    return;
                }
            }
            daily_weekly_footage.Text = _tFootage.ToString("f2");
            misc_weekly_footage.Text = _tPay.ToString("c2");
            jobs_weekly_count.Text = _tJobs.ToString("n0");
        }
    }

    protected void ddlJobs_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("transactions.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlEmployee.SelectedValue.ToString() == "0")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Employee not selected.');", true);
            return;
        }
        if (dateBeginning.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Date not selected.');", true);
            return;
        }
        if (ddlJobs.SelectedValue.ToString() == "0")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Job not selected.');", true);
            return;
        }

        SqlConnection cnDB;
        SqlCommand cmd;
        DataSet ds = new DataSet();
        string sql = "spWorksheets_Add";
        try
        {
            cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
            cnDB.Open();
            cmd = new SqlCommand(sql, cnDB);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@job_id", ddlJobs.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@user_id", ddlEmployee.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@work_date", dateWorked.Text);
            cmd.Parameters.AddWithValue("@gutter_footage", thu_gutter_footage.Text);
            cmd.Parameters.AddWithValue("@guard_footage", thu_guard_footage.Text);
            cmd.Parameters.AddWithValue("@tearoff_total", thu_tearoff_footage.Text);
            cmd.Parameters.AddWithValue("@flashing_total", thu_flashing_total.Text);
            cmd.Parameters.AddWithValue("@over500", thu_over500.Text);
            cmd.Parameters.AddWithValue("@baserate", thu_base_rate.Text);
            cmd.Parameters.AddWithValue("@drivetime", thu_drive_time.Text);
            cmd.Parameters.AddWithValue("@multiple_jobs", thu_multiple_jobs.Text);
            cmd.Parameters.AddWithValue("@hourly", thu_hourly.Text);
            cmd.Parameters.AddWithValue("@repair_cleanings", thu_repair_cleanings.Text);
            cmd.Parameters.AddWithValue("@unique_cleaning", thu_unique_cleaning.Text);
            cmd.Parameters.AddWithValue("@misc", thu_misc.Text);
            cmd.Parameters.AddWithValue("@daily_bonus", thu_daily_bonus.Text);
            cmd.Parameters.AddWithValue("@vacation", thu_vacation.Text);
            cmd.Parameters.AddWithValue("@holiday", thu_holiday.Text);
            cmd.Parameters.AddWithValue("@rate_gutter", rate_GutterFootage.Text);
            cmd.Parameters.AddWithValue("@rate_guard", rate_GuardFootage.Text);
            cmd.Parameters.AddWithValue("@rate_tearoff", rate_TearoffFootage.Text);
            cmd.Parameters.AddWithValue("@rate_flashing", rate_FlashingTotal.Text);
            cmd.Parameters.AddWithValue("@rate_over500", rate_Over500.Text);
            cmd.Parameters.AddWithValue("@rate_base", rate_BaseRate.Text);
            cmd.Parameters.AddWithValue("@rate_drive", rate_DriveTime.Text);
            cmd.Parameters.AddWithValue("@rate_multiple", rate_MultipleJobs.Text);
            cmd.Parameters.AddWithValue("@rate_hourly", rate_Hourly.Text);
            cmd.Parameters.AddWithValue("@rate_repair", rate_RepairCleanings.Text);
            cmd.Parameters.AddWithValue("@rate_unique", rate_UniqueCleaning.Text);
            cmd.Parameters.AddWithValue("@rate_misc", rate_Misc.Text);
            cmd.Parameters.AddWithValue("@rate_daily", rate_DailyBonus.Text);
            cmd.Parameters.AddWithValue("@rate_vacation", rate_Vacation.Text);
            cmd.Parameters.AddWithValue("@rate_holiday", rate_Holiday.Text);
            cmd.Parameters.AddWithValue("@time_in", thu_time_in.Text);
            cmd.Parameters.AddWithValue("@partner", thu_partner.Text);
            cmd.Parameters.AddWithValue("@active", 1);
            cmd.Parameters.AddWithValue("@date_added", DateTime.Today.ToString());
            int iRec = cmd.ExecuteNonQuery();
            ClearFields();
            ddlEmployee_SelectedIndexChanged(null, null);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Error during SAVE: '" + msg + ");", true);
            return;
        }
    }

    protected void ClearFields()
    {
        dateWorked.Text = string.Empty;
        thu_base_rate.Text = string.Empty;
        thu_daily_bonus.Text = string.Empty;
        thu_drive_time.Text = string.Empty;
        thu_flashing_total.Text = string.Empty;
        thu_guard_footage.Text = string.Empty;
        thu_gutter_footage.Text = string.Empty;
        thu_holiday.Text = string.Empty;
        thu_hourly.Text = string.Empty;
        thu_misc.Text = string.Empty;
        thu_multiple_jobs.Text = string.Empty;
        thu_over500.Text = string.Empty;
        thu_partner.Text = string.Empty;
        thu_repair_cleanings.Text = string.Empty;
        thu_tearoff_footage.Text = string.Empty;
        thu_time_in.Text = string.Empty;
        thu_unique_cleaning.Text = string.Empty;
        thu_vacation.Text = string.Empty;
        ddlJobs.SelectedIndex = -1;
    }
}