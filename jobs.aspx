<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="jobs.aspx.cs" Inherits="jobs" %>

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
            width: 220px;
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
        .divLeft {
            float: left;
            display: inline-block;
            width: 45%;
        }
        .divRight {
            float: right;
            display: inline-block;
            width: 45%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="masterContent" Runat="Server">
    <div class="container">
        <br />
        <asp:Label runat="server" Text="Job :"></asp:Label>&nbsp;
        <asp:DropDownList runat="server" ID="ddlJobs" CssClass="myDropDown" AutoPostBack="true" OnSelectedIndexChanged="ddlJobs_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:LinkButton runat="server" id="newJob" Text="Click to Add New Job..." OnClick="newJob_Click"></asp:LinkButton>
        <div class="text-right" style="margin-top: -30px">
            <asp:Button runat="server" CssClass="btn btn-sm btn-success" ID="btnSave" Text="Save" OnClick="btnSave_Click"/>&nbsp;
            <asp:Button runat="server" CssClass="btn btn-sm btn-warning" ID="btnReset" Text="Reset" OnClick="btnReset_Click" />
        </div>
        <br /><br />
        <div id="divJobs" class="divLeft">
            <asp:Table runat="server" ID="tblJobs" Width="100%">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Job Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtJobName"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>
</asp:Content>