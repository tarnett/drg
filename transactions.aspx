<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="transactions.aspx.cs" Inherits="transactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <style>
        .myDropDown {
            border-radius: 7px;
            height: 24px;
        }
        .myLabel {
            color: green;
        }
        .myTextSmall {
            border-radius: 7px;
            height: 24px;
            width: 100px;
        }
        .bigBold {
            font-size: 2.0em;
            font-weight: 600;
            color: green;
        }
        .bdr {
            border-style: inset;
            border-width: 1px;
            background-color: lightgray;
        }
        .leftAlign {
            text-align: left;
        }
        .lblSmall {
            font-size: 0.85em;
        }
        .lblSmallRate {
            font-size: 0.85em;
            color: blue;
            font-weight: 600;
        }
        .lblSmallRed {
            font-size: 0.85em;
            color: red;
            font-weight: 600;
        }
        .bdr2 {
            border-style: inset;
            border-width: 1px;
            background-color: lightgreen;
        }
        .txtSmall {
            width: 60px;
            font-size: 0.85em;
        }
        .txtLarge {
            width: 100px;
            font-size: 0.85em;
        }
        .txtLarger {
            width: 160px;
            font-size: 0.85em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="masterContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container">
        <br />
        <div class="row">
            <div class="col-4 text-left">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right" Width="39%">
                            <asp:Label runat="server" Text="Work Week :" CssClass="myLabel"></asp:Label>&nbsp;
                        </asp:TableCell>
                        <asp:TableCell HorizontalAlign="Left">
                            <asp:TextBox runat="server" CssClass="myTextSmall" ID="dateBeginning"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="datePopup1" runat="server" Format="MM/dd/yyyy" PopupButtonID="txtBegin" TargetControlID="dateBeginning" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>

            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Thu" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Fri" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Sat" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Sun" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Mon" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Tue" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Wed" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" Text="Weekly" CssClass="lblSmall"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-4 text-left">
                <asp:Table runat="server" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right" Width="39%">
                            <asp:Label runat="server" Text="Installer :" CssClass="myLabel"></asp:Label>&nbsp;
                        </asp:TableCell>
                        <asp:TableCell HorizontalAlign="Left">
                            <asp:DropDownList runat="server" ID="ddlEmployee" CssClass="myDropDown" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="dtThu" Text="" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="dtFri" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="dtSat" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="dtSun" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="dtMon" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="dtTue" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="dtWed" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:Label runat="server" ID="Label1" Text="" CssClass="lblSmall"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 bdr text-right">
                <asp:Label runat="server" Text="Footage Quantity :" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_thu_footage" Text="" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_fri_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_sat_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_sun_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_mon_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_tue_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_wed_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="daily_weekly_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 bdr text-right">
                <asp:Label runat="server" Text="Total Pay :" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_thu_footage" Text="" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_fri_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_sat_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_sun_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_mon_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_tue_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_wed_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="misc_weekly_footage" Text="" CssClass="lblSmall"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 bdr text-right">
                <asp:Label runat="server" Text="Jobs Worked :" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_thu_count" Text="" CssClass="lblSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_fri_count" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_sat_count" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_sun_count" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_mon_count" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_tue_count" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_wed_count" Text="" CssClass="lblSmall"></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr2">
                <asp:Label runat="server" ID="jobs_weekly_count" Text="" CssClass="lblSmall"></asp:Label>
            </div>
        </div>

        <div class="row"><div class="col-1">&nbsp;</div></div>

        <div class="row">
            <div class="col-md-4 bdr text-right">
                <asp:Label runat="server" Text="Date Worked :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-2 bdr text-center">
                <asp:TextBox runat="server" ID="dateWorked" CssClass="myTextSmall"></asp:TextBox>
                <%--<ajaxToolkit:CalendarExtender ID="datePopup2" runat="server" Format="MM/dd/yyyy" PopupButtonID="txtWorked" TargetControlID="dateWorked" />--%>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 bdr text-right">
                <asp:Label runat="server" Text="Job Site :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-2 bdr text-center">
                <asp:DropDownList runat="server" ID="ddlJobs" CssClass="myDropDown" AutoPostBack="true" OnSelectedIndexChanged="ddlJobs_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>

        <div class="row">  
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_GutterFootage" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Gutter Footage :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_gutter_footage" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_GuardFootage" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Guard Footage :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_guard_footage" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_TearoffFootage" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Tearoff Total Footage :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_tearoff_footage" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_FlashingTotal" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Flashing Total :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_flashing_total" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_Over500" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Over 500' & 6th Day :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_over500" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_BaseRate" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Base Rate :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_base_rate" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_DriveTime" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Drive Time :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_drive_time" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_MultipleJobs" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Multiple Jobs :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_multiple_jobs" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_Hourly" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Hourly :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_hourly" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_RepairCleanings" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Repair / Cleanings :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_repair_cleanings" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_UniqueCleaning" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Unique Cleaning Repair :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_unique_cleaning" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_Misc" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Miscellaneous :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_misc" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_DailyBonus" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="DAILY BONUS :" CssClass="lblSmallRed" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_daily_bonus" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_Vacation" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Vacation :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_vacation" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-1 bdr text-right">
                <asp:Label runat="server" ID="rate_Holiday" Text="" CssClass="lblSmallRate"></asp:Label>
            </div>
            <div class="col-md-3 bdr text-right">
                <asp:Label runat="server" Text="Holiday :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_holiday" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 bdr text-right">
                <asp:Label runat="server" Text="Time In :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-1 text-center bdr">
                <asp:TextBox runat="server" ID="thu_time_in" CssClass="txtSmall"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 bdr text-right">
                <asp:Label runat="server" Text="Partner :" CssClass="txtSmall" ></asp:Label>
            </div>
            <div class="col-md-2 text-center bdr">
                <asp:TextBox runat="server" ID="thu_partner" CssClass="txtLarger"></asp:TextBox>
            </div>
            <div class="offset-md-1 col-md-3">
                <asp:Button runat="server" CssClass="btn btn-sm bg-success" Text="Save" ID="btnSave" OnClick="btnSave_Click" />
                <asp:Button runat="server" CssClass="btn btn-sm bg-warning" Text="Reset" id="btnReset" OnClick="btnReset_Click"/>
            </div>
        </div>

    </div>
</asp:Content>