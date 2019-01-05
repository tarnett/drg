<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="installers.aspx.cs" Inherits="installers" %>

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
            width: 180px;
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
            margin-left: 50px;
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
        <asp:Label runat="server" Text="Installer :"></asp:Label>&nbsp;
        <asp:DropDownList runat="server" ID="ddlInstaller" CssClass="myDropDown" AutoPostBack="true" OnSelectedIndexChanged="ddlInstaller_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:LinkButton runat="server" id="newInstaller" Text="Click to Add New Installer..." OnClick="newInstaller_Click"></asp:LinkButton>
        <div class="text-right" style="margin-top: -30px">
            <asp:Button runat="server" CssClass="btn btn-sm btn-success" ID="btnSave" Text="Save" OnClick="btnSave_Click" />&nbsp;
            <asp:Button runat="server" CssClass="btn btn-sm btn-warning" ID="btnReset" Text="Reset" OnClick="btnReset_Click" />
        </div>

        <div class="text-center">
            <asp:Label runat="server" ID="lblMode" Font-Bold="true" Font-Size="2.0em"></asp:Label>
        </div>
        <hr />
        <div id="divInstaller" class="divLeft">
            <asp:Table runat="server" ID="tblInstaller" Width="100%">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Last Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtLastName"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="First Name:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtFirstName"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Address:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtAddr1"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Address:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtAddr2"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="City:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtCity" Text=""></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="State:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtState" Text="Alabama"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Zip:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtZip"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Home Phone:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtHomePhone"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Cell Phone:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtCellPhone"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        &nbsp;
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:CheckBox runat="server" ID="chkActive" Text="&nbsp;Active" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>

        <div id="divRates" class="divRight">
            <asp:Table runat="server" ID="tblRates" Width="100%">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Gutter Footage:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtGutterFootage"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Guard Footage:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtGuardFootage"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Tearoff Footage:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtTearoffFootage"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Flashing Footage:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtFlashingFootage"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Over 500' & 6th Day:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtOver500"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Base Rate:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtBaseRate"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Drive Time:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtDriveTime"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Multiple Jobs:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtMultipleJobs"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Hourly Rate:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtHourlyRate"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Repair / Cleanings:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtRepairCleanings"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Unique Cleaning Repairs:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtUnique"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Miscellaneous:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtMisc"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Daily Bonus:" ForeColor="Red"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtBonus"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Vacation:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtVacation"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:Label runat="server" Text="Holiday:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left" Width="7%">
                        <asp:TextBox runat="server" CssClass="myTextSmall" ID="txtHoliday"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>
</asp:Content>