<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="report_summary.aspx.cs" Inherits="report_summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <style>
        table {
            margin-left: auto;
            margin-right: auto;
        }
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
        <asp:Button runat="server" ID="btnStart" Text="Start" CssClass="btn btn-sm btn-success" OnClick="btnStart_Click" />

        <div class="text-center">
            <img src="images/logo.jpg" /><br />
            <asp:Label runat="server" ID="lblPrinted" Font-Size="Small"></asp:Label>
        </div>

        <div class="text-center">
            <asp:Label runat="server" Font-Size="XX-Large" Font-Bold="true" Text="INSTALLER WEEKLY SUMMARY" ForeColor="#1A845C"></asp:Label>
            <br />
            <asp:Button runat="server" CssClass="btn btn-sm btn-success" Text="Print" ID="btnPrint" OnClientClick="javascript:window.print();" />
        </div>
        <asp:Panel runat="server" >
            <br />
            <asp:GridView Width="80%" Font-Names='Segoe UI' ShowFooter="true"
	            ID="gvMaster" runat="server" AutoGenerateColumns="false" DataKeyNames="job_id" OnRowDataBound="gvMaster_RowDataBound" CssClass="Grid">
                <HeaderStyle HorizontalAlign="Center" BackColor="white" ForeColor="black" />
                <FooterStyle Font-Bold="true" />
	            <Columns>
		            <asp:BoundField DataField="jobName" HeaderText="Job" ItemStyle-Width="200px" />
                    <asp:BoundField DataField="gutter_footage" DataFormatString="{0:n1}" ItemStyle-Width="60" HeaderText="Gutter<br />Footage" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="guard_footage" DataFormatString="{0:n1}" ItemStyle-Width="60" HeaderText="Guard<br />Footage" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="tearoff_total" DataFormatString="{0:n1}" ItemStyle-Width="60" HeaderText="Tearoff<br />Footage" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="flashing_total" DataFormatString="{0:n1}" ItemStyle-Width="60" HeaderText="Flashing<br />Footage" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="over500" DataFormatString="{0:n1}" ItemStyle-Width="60" HeaderText="Over 500'<br />6th Day" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="ttl" DataFormatString="{0:n1}" ItemStyle-Width="60" HeaderText="Total<br />Footage" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
	            </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:GridView Width="80%" Font-Names='Segoe UI' ShowFooter="true"
	            ID="gvDetail" runat="server" AutoGenerateColumns="false" DataKeyNames="job_id" OnRowDataBound="gvDetail_RowDataBound" CssClass="Grid">
                <HeaderStyle HorizontalAlign="Center" BackColor="WHITE" ForeColor="black" />
                <FooterStyle Font-Bold="true" />
	            <Columns>
		            <asp:BoundField DataField="jobName" HeaderText="Job" ItemStyle-Width="250px"/>
                    <asp:BoundField DataField="baserate" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Base<br />Rate" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="drivetime" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Drive<br />Time" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="multiple_jobs" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Multiple<br />Jobs" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="hourly" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Hourly<br />Rate" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="repair_cleanings" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Repairs /<br >Cleanings" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="unique_cleaning" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Unique<br />Cleaning" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="misc" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Misc" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="daily_bonus" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Daily<br />Bonus" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="vacation" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Vacation<br />Rate" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="holiday" DataFormatString="{0:f2}" ItemStyle-Width="80" HeaderText="Holiday<br />Rate" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
                    <asp:BoundField DataField="ttl" DataFormatString="{0:c2}" ItemStyle-Width="90" HeaderText="Total<br />Costs" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" />
	            </Columns>
            </asp:GridView>
        </asp:Panel>
    </div>

    <script src="Scripts/jquery-3.3.1.min.js"></script>
</asp:Content>