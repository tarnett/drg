<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="report_time_sheet.aspx.cs" Inherits="report_time_sheet" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <style>
        .myDropDown {
            border-radius: 7px;
            height: 24px;
            width: 200px;
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
        .tblClass {
            float: left;
            display: inline-block;
            margin: 0 auto;
        }
        .tblRight{
            float: right;
            margin: 0 auto;
        }
    </style>

    <style type="text/css" media="print">
        @page { size: landscape; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="masterContent" Runat="Server">
    <div class="container-fluid">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
        <asp:Label runat="server" Text="Work Week :" CssClass="myLabel"></asp:Label>&nbsp;
        <asp:TextBox runat="server" CssClass="myTextSmall" ID="dateBeginning"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <ajaxToolkit:CalendarExtender ID="datePopup1" runat="server" Format="MM/dd/yyyy" PopupButtonID="txtBegin" TargetControlID="dateBeginning" />

        <asp:Label runat="server" Text="Installer :" CssClass="myLabel"></asp:Label>&nbsp;
        <asp:DropDownList runat="server" ID="ddlEmployee" CssClass="myDropDown" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
        <div class="text-center">
            <img src="images/logo.jpg" /><br />
            <asp:Label runat="server" ID="lblPrinted" Font-Size="Small"></asp:Label>
        </div>

        <div class="text-center">
            <asp:Label runat="server" Font-Size="XX-Large" Font-Bold="true" Text="INSTALLER WEEKLY TIME RECORD" ForeColor="#1A845C"></asp:Label>
            <br />
            <asp:Label runat="server" Font-size="X-Large" Font-Bold="true" ID="lblInstaller"></asp:Label><br />
            <asp:Label runat="server" Font-Size="X-Large" Font-Bold="true" ID="lblBeginning"></asp:Label>
            <br /><br />
            <asp:Button runat="server" CssClass="btn btn-sm btn-success" Text="Print" ID="btnPrint" OnClientClick="javascript:window.print();" />
        </div>
        <div>
            <br />
            <asp:GridView Width="96%" Font-Names='Segoe UI'
	            ID="grdMaster" runat="server" AutoGenerateColumns="false" DataKeyNames="job_id" OnRowDataBound="grdMaster_RowDataBound" CssClass="Grid">
                <HeaderStyle HorizontalAlign="Center" BackColor="#1A845C" ForeColor="white" />
	            <Columns>
		            <asp:BoundField DataField="jobName" HeaderText="Job" />
		            <asp:BoundField DataField="work_date" ItemStyle-Width="130" ItemStyle-HorizontalAlign="Right" HeaderText="Date Worked" DataFormatString="{0:ddd MM/dd/yyyy&nbsp;}" HtmlEncode="false" />
                    <asp:BoundField DataField="partner" HeaderText="Partner" />
                    <asp:BoundField DataField="time_in" ItemStyle-Width="80" HeaderText="Time In" />
                    <asp:BoundField DataField="gutter_footage" ItemStyle-Width="80" HeaderText="Gutter<br />Footage" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="guard_footage" ItemStyle-Width="80" HeaderText="Guard<br />Footage" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="tearoff_footage" ItemStyle-Width="80" HeaderText="Tearoff<br />Footage" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="flashing_footage" ItemStyle-Width="80" HeaderText="Flashing<br />Footage" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="over_500" ItemStyle-Width="80" HeaderText="Over 500'<br />6th Day" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="base_rate" ItemStyle-Width="80" HeaderText="Base<br />Rate" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="drive_time" ItemStyle-Width="80" HeaderText="Drive<br />Time" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="multiple_jobs" ItemStyle-Width="80" HeaderText="Multiple<br />Jobs" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="hourly" ItemStyle-Width="80" HeaderText="Hourly<br />Rate" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="repair_cleanings" ItemStyle-Width="80" HeaderText="Repairs /<br >Cleanings" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="unique_cleaning" ItemStyle-Width="80" HeaderText="Unique<br />Cleaning" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="misc" ItemStyle-Width="80" HeaderText="Misc" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="daily_bonus" ItemStyle-Width="80" HeaderText="Daily<br />Bonus" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="vacation" ItemStyle-Width="80" HeaderText="Vacation<br />Rate" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
                    <asp:BoundField DataField="holiday" ItemStyle-Width="80" HeaderText="Holiday<br />Rate" ItemStyle-HorizontalAlign="Center" HtmlEncode="false" />
	            </Columns>
            </asp:GridView>
            <br />
            <br />

            <div style="margin: 0 auto; text-align: center;width: 46%">
                <div class="tblClass">
                    <asp:Table runat="server" GridLines="Both" ID="tblFootage">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Gutter Footage"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right" Width="100">
                                <asp:Label runat="server" ID="ttlGutter" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:Label runat="server" Text="Guard Footage"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlGuard" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:Label runat="server" Text="Tearoff Footage"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlTearoff" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:Label runat="server" Text="Flashing Footage"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlFlashing" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:Label runat="server" Text="Over 500' Footage"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlOver500" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">
                                <asp:Label runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlFinalFootage" Text="" Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                    <asp:Table runat="server" GridLines="Both" ID="tblTotals">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Total Job Pay" Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlPay" Text="" Width="100" Font-Bold="true" ></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Total Footage Pay" Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlFootagePay" Text="" Width="100" Font-Bold="true" ></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Total Weekly Pay" Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlWeeklyPay" Text="" Width="100" Font-Bold="true" ForeColor="Red"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
                
                <div class="tblRight">
                    <asp:Table runat="server" GridLines="Both" ID="tblRates">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Base Rate"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlBaseRate" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Drive Time"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlDriveTime" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Multiple Jobs"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlMultipleJobs" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Hourly Rate"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlHourlyRate" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Repairs/Cleanings"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlRepairs" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Unique Cleanings"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlUnique" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Miscellaneous"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlMisc" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Daily Bonus" ForeColor="Red" Font-Bold="true"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlDailyBonus" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Vacation Pay"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlVacation" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left" Width="270">
                                <asp:Label runat="server" Text="Holiday Pay"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="ttlHoliday" Text="" Width="100"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>