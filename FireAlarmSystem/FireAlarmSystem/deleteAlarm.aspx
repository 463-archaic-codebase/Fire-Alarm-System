<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="deleteAlarm.aspx.cs" Inherits="FireAlarmSystem.deleteAlarm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <br />
    </div>

    <div class="row ">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="panel">
                <div class="row">
                    <div class="col-sm-12">
                        <h2> Remove an alarm</h2>
                        
                        <p>The following form allows you to delete an alarm from the database</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Alarm ID
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:DropDownList ID="ddlAlarm" runat="server" autoPostBack="true" CssClass="form-control aspnet-width-fix" OnSelectedIndexChanged="ddlAlarm_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Alarm Location
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlAlarm" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:TextBox ID="alarmLocation" runat="server" ForeColor="Black" Enabled="false" OnTextChanged="ddlAlarm_SelectedIndexChanged"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Alarm Description
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlAlarm" />
                            </Triggers>
                            <ContentTemplate>
                                 <asp:TextBox ID="alarmDescription" runat="server" ForeColor="Black" Enabled="false" OnTextChanged="ddlAlarm_SelectedIndexChanged"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                       
                    </div>
                </div>
                <br />
                 <asp:Button runat="server" ID="deleteBtn" Text="Remove alarm" CssClass="btn-success btn btn-lg btn-block aspnet-width-fix" OnClick="deleteBtn_Click" />
    <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
    </div>
    </div>
    </div>
</asp:Content>
