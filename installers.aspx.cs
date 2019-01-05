using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class installers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadInstallers();
            ClearFields();
        }
    }

    protected void LoadInstallers()
    {
        SqlConnection cnDB;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string sql = "Select 0 as value, '' as label UNION Select id as value, firstname + ' ' + lastname as label from UserProfile order by label";
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
                ddlInstaller.DataSource = ds.Tables[0];
                ddlInstaller.DataTextField = "label";
                ddlInstaller.DataValueField = "value";
                ddlInstaller.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void ddlInstaller_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection cnDB;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string sql = "Select * from UserProfile Where id=@p0";
        try
        {
            cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
            cmd = new SqlCommand(sql, cnDB);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@p0", ddlInstaller.SelectedValue.ToString());
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                btnSave.Text = "Update";
                lblMode.Text = "Modifying Installer";
                Session["UserProfileKey"] = ddlInstaller.SelectedValue.ToString();
                txtLastName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                txtFirstName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                txtAddr1.Text = ds.Tables[0].Rows[0]["address1"].ToString();
                txtAddr2.Text = ds.Tables[0].Rows[0]["address2"].ToString();
                txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                txtState.Text = ds.Tables[0].Rows[0]["state"].ToString();
                txtZip.Text = ds.Tables[0].Rows[0]["zip"].ToString();
                txtHomePhone.Text = ds.Tables[0].Rows[0]["homephone"].ToString();
                txtCellPhone.Text = ds.Tables[0].Rows[0]["cellphone"].ToString();
                chkActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["active"].ToString());

                ds.Clear();
                sql = "Select * from UserSettings Where workerid=@p1";
                cmd = new SqlCommand(sql, cnDB);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@p1", ddlInstaller.SelectedValue.ToString());
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    Session["UserSettingsKey"] = ds.Tables[0].Rows[0]["id"].ToString();
                    txtGutterFootage.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["gutterfootage"].ToString()).ToString("f2");
                    txtGuardFootage.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["guardfootage"].ToString()).ToString("f2");
                    txtTearoffFootage.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["tearoff"].ToString()).ToString("f2");
                    txtFlashingFootage.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["flashing"].ToString()).ToString("f2");
                    txtOver500.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["over500"].ToString()).ToString("f2");
                    txtBaseRate.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["base"].ToString()).ToString("f2");
                    txtDriveTime.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["drivetime"].ToString()).ToString("f2");
                    txtMultipleJobs.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["multiplejobs"].ToString()).ToString("f2");
                    txtHourlyRate.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["hourlyrate"].ToString()).ToString("f2");
                    txtRepairCleanings.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["repaircleanings"].ToString()).ToString("f2");
                    txtUnique.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["uniquecleaning"].ToString()).ToString("f2");
                    txtMisc.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["misc"].ToString()).ToString("f2");
                    txtDriveTime.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["drivetime"].ToString()).ToString("f2");
                    txtVacation.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["vacation"].ToString()).ToString("f2");
                    txtHoliday.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["holiday"].ToString()).ToString("f2");
                    txtBonus.Text = Convert.ToDouble(ds.Tables[0].Rows[0]["dailybonus"].ToString()).ToString("f2");
                }
                cnDB.Close();
                ds.Dispose();
                da.Dispose();
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void newInstaller_Click(object sender, EventArgs e)
    {
        ClearFields();
        Session["UserProfileKey"] = "-1";
        Session["UserSettingsKey"] = "-1";
        lblMode.Text = "Adding New Installer";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection cnDB;
        SqlCommand cmd;
        DataSet ds = new DataSet();
        string sql = "spUserProfileMaint";
        try
        {
            cnDB = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
            cnDB.Open();
            cmd = new SqlCommand(sql, cnDB);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
            cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@address1", txtAddr1.Text);
            cmd.Parameters.AddWithValue("@address2", txtAddr2.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@state", txtState.Text);
            cmd.Parameters.AddWithValue("@zip", txtZip.Text);
            cmd.Parameters.AddWithValue("@homephone", txtHomePhone.Text);
            cmd.Parameters.AddWithValue("@cellphone", txtCellPhone.Text);
            cmd.Parameters.AddWithValue("@active", chkActive.Checked);
            cmd.Parameters.AddWithValue("@key", Session["UserProfileKey"].ToString());

            cmd.Parameters.AddWithValue("@usersettingsid", Session["UserSettingsKey"].ToString());
            cmd.Parameters.AddWithValue("@gutterfootage", txtGutterFootage.Text);
            cmd.Parameters.AddWithValue("@guardfootage", txtGuardFootage.Text);
            cmd.Parameters.AddWithValue("@tearoff", txtTearoffFootage.Text);
            cmd.Parameters.AddWithValue("@flashing", txtFlashingFootage.Text);
            cmd.Parameters.AddWithValue("@over500", txtOver500.Text);
            cmd.Parameters.AddWithValue("@base", txtBaseRate.Text);
            cmd.Parameters.AddWithValue("@drivetime", txtDriveTime.Text);
            cmd.Parameters.AddWithValue("@multiplejobs", txtMultipleJobs.Text);
            cmd.Parameters.AddWithValue("@hourlyrate", txtHourlyRate.Text);
            cmd.Parameters.AddWithValue("@repaircleanings", txtRepairCleanings.Text);
            cmd.Parameters.AddWithValue("@uniquecleaning", txtUnique.Text);
            cmd.Parameters.AddWithValue("@misc", txtMisc.Text);
            cmd.Parameters.AddWithValue("@dailybonus", txtBonus.Text);
            cmd.Parameters.AddWithValue("@vacation", txtVacation.Text);
            cmd.Parameters.AddWithValue("@holiday", txtHoliday.Text);

            int iRecs = cmd.ExecuteNonQuery();
            cnDB.Close();
            ClearFields();
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showError", "alert('Error during SAVE: '" + msg + ");", true);
        }
    }

    protected void ClearFields()
    {
        Session["UserProfileKey"] = string.Empty;
        Session["UserSettingsKey"] = string.Empty;

        txtLastName.Text = string.Empty;
        txtFirstName.Text = string.Empty;
        txtAddr1.Text = string.Empty;
        txtAddr2.Text = string.Empty;
        txtCity.Text = string.Empty;
        txtState.Text = string.Empty;
        txtZip.Text = string.Empty;
        txtHomePhone.Text = string.Empty;
        txtCellPhone.Text = string.Empty;
        btnSave.Text = "Save";
        chkActive.Checked = false;
        lblMode.Text = string.Empty;

        txtGuardFootage.Text = string.Empty;
        txtGutterFootage.Text = string.Empty;
        txtTearoffFootage.Text = string.Empty;
        txtFlashingFootage.Text = string.Empty;
        txtOver500.Text = string.Empty;
        txtBaseRate.Text = string.Empty;
        txtDriveTime.Text = string.Empty;
        txtMultipleJobs.Text = string.Empty;
        txtHourlyRate.Text = string.Empty;
        txtRepairCleanings.Text = string.Empty;
        txtUnique.Text = string.Empty;
        txtMisc.Text = string.Empty;
        txtBonus.Text = string.Empty;
        txtVacation.Text = string.Empty;
        txtHoliday.Text = string.Empty;

        LoadInstallers();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("installers.aspx");
    }
}