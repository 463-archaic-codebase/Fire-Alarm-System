<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addAlarm.aspx.cs" Inherits="FireAlarmSystem.addAlarm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <br />
    </div>

    <div class="row ">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="panel">
                <div class="row">
                    <div class="col-sm-12">
                        <h2> Add a New Alarm to the system</h2>
                        
                        <p>The following form allows you to enter a new alarm to the database</p>
                    </div>
                    
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Alarm Type
                        </div>
                    </div>
                    <div class="col-lg-7" id="alarmType">
                         <%-- AutoCompleteType from dB --%>
                            <asp:DropDownList ID="ddlAlarmType" runat="server" CssClass="form-control aspnet-width-fix" OnSelectedIndexChanged="ddlAlarmType_SelectedIndexChanged">
                           
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Alarm Location
                        </div>
                    </div>
                    <div class="col-lg-7" id="alarmLocation">
                      <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control aspnet-width-fix" OnSelectedIndexChanged="ddlAlarmLocation_SelectedIndexChanged">
                          <%--filled by db--%>
                      </asp:DropDownList>   
                    </div>
                </div>
                <br />
                 <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Alarm Description
                        </div>
                    </div>
                    <div class="col-lg-7" id="alarmDescriptionField">
                      <asp:TextBox id="alarmDescription" runat="server" MaxLength="50" rows="5" Columns="50" Enabled="true" ForeColor="Black" TextMode="MultiLine"></asp:TextBox>   
                    </div>
                </div>
                <br />
                
                <div class="row">
                    <div class="col-lg-4">
                        <asp:Button runat="server" ID="insertBtn" Text="Add alarm" CssClass="btn-success btn btn-lg btn-block aspnet-width-fix" OnClick="insertBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
</asp:Content>
