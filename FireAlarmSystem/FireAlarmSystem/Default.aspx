<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FireAlarmSystem._Default" %>
<%@ MasterType TypeName="FireAlarmSystem.SiteMaster" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <br />
    </div>
    
    
    <asp:UpdatePanel ID="upnlAlarmDetails" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnOrderResults" />
            <%--<asp:AsyncPostBackTrigger ControlID="btnViewAllAlarms" />
            <asp:AsyncPostBackTrigger ControlID="btnViewAllCameras" />
            <asp:AsyncPostBackTrigger ControlID="btnViewAllCarbonMonoxide" />
            <asp:AsyncPostBackTrigger ControlID="btnViewAllFireAlarms" />
            <asp:AsyncPostBackTrigger ControlID="btnViewAllLightedPathways" />
            <asp:AsyncPostBackTrigger ControlID="btnViewAllSecurityDoors" />
            <asp:AsyncPostBackTrigger ControlID="btnViewAllSprinklers" />--%>
        </Triggers>
        <ContentTemplate>
            <asp:Button ID="btnOrderResults" runat="server" CssClass="hideControl" ClientIDMode="Static" OnClick="btnOrderResults_Click"/>
            <asp:HiddenField ID="hfSortAlarmType" runat="server" ClientIDMode="Static"/>
            <asp:HiddenField ID="hfSortLastService" runat="server" ClientIDMode="Static"/>
            <asp:HiddenField ID="hfSortZone" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hfSortFloor" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hfSortRoom" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hfSortAlarmStatus" runat="server" ClientIDMode="Static" Value="AlarmType"/>
            <asp:HiddenField ID="hfSortColumnChosen" runat="server" ClientIDMode="Static" Value="ASC"/>
            <asp:HiddenField ID="hfFilterAlarmTypeChosen" runat="server" ClientIDMode="Static" Value="%"/>
            <asp:HiddenField ID="hfFilterAlarmStatusChosen" runat="server" ClientIDMode="Static" Value="%"/>
            <div class="row">
                <div class="col-sm-6">
                    <div class="panel">
                        <div class="panelHeader">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h2>Summary</h2>
                                </div>
                            </div>
                        </div>
                        <div class="panelContent">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="indicator-container">
                                        <div class="indicator-header summary">
                                            OK
                                        </div>
                                        <div class="ok indicator summary" onclick="filterDataResults('%', 'OK');">
                                            <div class="indicator-content" >
                                                <asp:Label ID="summaryOK" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="indicator-container">
                                        <div class="indicator-header summary">
                                            Service
                                        </div>
                                        <div class="service indicator summary" onclick="filterDataResults('%', 'Service');">
                                            <div class="indicator-content" >
                                                <asp:Label ID="summaryService" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="indicator-container">
                                        <div class="indicator-header summary">
                                            Triggered
                                        </div>
                                        <div class="triggered indicator summary" onclick="filterDataResults('%', 'Triggered');">
                                            <div class="indicator-content" >
                                                <asp:Label ID="summaryTriggered" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="indicator-container">
                                        <div class="indicator-header summary">
                                            Alert
                                        </div>
                                        <div class="alarm indicator summary" onclick="filterDataResults('%', 'Alert');">
                                            <div class="indicator-content" >
                                                <asp:Label ID="summaryAlarm" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center ">
                                    <asp:Button ID="btnViewAllAlarms" runat="server" CssClass="btn btn-header-summary btn-primary center-block" Width="100%" Text="View All Alarms" OnClientClick="filterDataResults('%', '%');" OnClick="btnOrderResults_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel">
                        <div class="panelHeader">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Message Center</h2>
                                </div>
                                <div class="col-sm-4 text-right">
                                    <h3><%=DateTime.Now.ToShortDateString() %></h3>
                                </div>
                                <div class="col-sm-2 text-right">
                                    <h3><%=DateTime.Now.ToString("HH:mm") %></h3>
                                </div>
                            </div>
                        </div>
                        <div class="panelContent">
                        </div>
                    </div>
                </div>
            </div>
    
            <div class="row">
                <div class="col-sm-6">
                    <div class="panel">
                        <div class="panelHeader">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h2>Alarm Systems Analysis</h2>
                                </div>
                            </div>
                        </div>
                        <div class="panelContent">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="indicator-header specific">
                                                Cameras
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="ok indicator specific" onclick="filterDataResults('Camera', 'OK');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="cameraOK" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="service indicator specific" onclick="filterDataResults('Camera', 'Service');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="cameraService" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="triggered indicator specific" onclick="filterDataResults('Camera', 'Triggered');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="cameraTriggered" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="alarm indicator specific" onclick="filterDataResults('Camera', 'Alert');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="cameraAlert" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-center ">
                                            <asp:Button ID="btnViewAllCameras" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Cameras" OnClientClick="filterDataResults('Camera', '%');" OnClick="btnOrderResults_Click"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="indicator-header specific">
                                                Carbon Monoxide
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="ok indicator specific" onclick="filterDataResults('Carbon Monoxide', 'OK');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="carbonMonoxideOK" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="service indicator specific" onclick="filterDataResults('Carbon Monoxide', 'Service');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="carbonMonoxideService" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="triggered indicator specific" onclick="filterDataResults('Carbon Monoxide', 'Triggered');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="carbonMonoxideTriggered" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="alarm indicator specific" onclick="filterDataResults('Carbon Monoxide', 'Alert');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="carbonMonoxideAlert" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-center ">
                                            <asp:Button ID="btnViewAllCarbonMonoxide" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Carbon Monoxide" OnClientClick="filterDataResults('Carbon Monoxide', '%');" OnClick="btnOrderResults_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="indicator-header specific">
                                                Fire Alarms
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="ok indicator specific" onclick="filterDataResults('Fire', 'OK');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="fireOK" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="service indicator specific" onclick="filterDataResults('Fire', 'Service');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="fireService" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="triggered indicator specific" onclick="filterDataResults('Fire', 'Triggered');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="fireTriggered" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="alarm indicator specific" onclick="filterDataResults('Fire', 'Alert');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="fireAlert" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-center ">
                                            <asp:Button ID="btnViewAllFireAlarms" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Fire Alarms" OnClientClick="filterDataResults('Fire', '%');" OnClick="btnOrderResults_Click"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="indicator-header specific">
                                                Lighted Pathways
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="ok indicator specific" onclick="filterDataResults('Lighted Pathway', 'OK');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="lightedPathwayOK" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="service indicator specific" onclick="filterDataResults('Lighted Pathway', 'Service');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="lightedPathwayService" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="triggered indicator specific" onclick="filterDataResults('Lighted Pathway', 'Triggered');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="lightedPathwayTriggered" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="alarm indicator specific" onclick="filterDataResults('Lighted Pathway', 'Alert');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="lightedPathwayAlert" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-center ">
                                            <asp:Button ID="btnViewAllLightedPathways" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Lighted Pathways" OnClientClick="filterDataResults('Lighted Pathway', '%');" OnClick="btnOrderResults_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="indicator-header specific">
                                                Security Doors
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="ok indicator specific" onclick="filterDataResults('Security Door', 'OK');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="securityDoorOK" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="service indicator specific" onclick="filterDataResults('Security Door', 'Service');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="securityDoorService" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="triggered indicator specific" onclick="filterDataResults('Security Door', 'Triggered');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="securityDoorTriggered" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="alarm indicator specific" onclick="filterDataResults('Security Door', 'Alert');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="securityDoorAlert" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-center ">
                                            <asp:Button ID="btnViewAllSecurityDoors" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Security Doors" OnClientClick="filterDataResults('Security Door', '%');" OnClick="btnOrderResults_Click"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="indicator-header specific">
                                                Sprinklers
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="ok indicator specific" onclick="filterDataResults('Sprinkler', 'OK');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="sprinklerOK" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="service indicator specific" onclick="filterDataResults('Sprinkler', 'Service');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="sprinklerService" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="triggered indicator specific" onclick="filterDataResults('Sprinkler', 'Triggered');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="sprinklerTriggered" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 squish">
                                            <div class="indicator-container">
                                                <div class="alarm indicator specific" onclick="filterDataResults('Sprinkler', 'Alert');">
                                                    <div class="indicator-content" >
                                                        <asp:Label ID="sprinklerAlert" runat="server" CssClass="indicator-label" ClientIDMode="Static"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-center ">
                                            <asp:Button ID="btnViewAllSprinklers" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Sprinklers" OnClientClick="filterDataResults('Sprinkler', '%');" OnClick="btnOrderResults_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel">
                        <div class="panelHeader">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h2>Alarm Details</h2>
                                </div>
                            </div>
                        </div>
                        <div class="panelContent noOverflowY">
                            <asp:HiddenField ID="hfUserSettingsJSON" runat="server" Visible="false" />
                            <%--<div class="row">
                                <div class="col-md-12">
                                    <div id="settingsConfigContainer">
                                        <asp:HiddenField ID="hfGridUserSettingsExpanded" runat="server" ClientIDMode="Static" />
                                        <div id="gridUserSettings" class="collapse">
                                            <asp:UpdatePanel ID="upnlSettings" runat="server" Visible="true">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnSubmitConfiguration" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:Button ID="btnSubmitConfiguration" runat="server" CssClass="hideControl" ClientIDMode="Static" OnClick="btnSubmitConfiguration_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="row">
                                <div class="col-sm-12" >
                                    <div id="alarmDetailsContainer">
                                        <asp:HiddenField ID="hfAlarmDetailsJSON" runat="server" Visible="false" />
                                        <div id="gridAlarmDetails" class="grid">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                //console.log('<%= hfUserSettingsJSON.Value %>');
                var settings = JSON.parse('<%= hfUserSettingsJSON.Value %>');
                //console.log('<%= hfAlarmDetailsJSON.Value %>');
                var results = JSON.parse('<%= hfAlarmDetailsJSON.Value %>');

                <%--var results = {
                    "recordSet": {
    	                0: {
                            "alarmType":"Camera",
                            "lastService":"12/23/18",
                            "zone":"A",
                            "floor":"1",
                            "room":"100",
                            "alarmStatus":"OK",
                            "alarmDescription":"Ceiling mounted camera"
                        },
                        1: {
                            "alarmType":"Fire",
                            "lastService":"3/4/16",
                            "zone":"B",
                            "floor":"1",
                            "room":"116",
                            "alarmStatus":"Service",
                            "alarmDescription":"Standard fire alarm mounted on North wall"
                        },
                        2: {
                            "alarmType":"Carbon Monoxide",
                            "lastService":"1/25/19",
                            "zone":"D",
                            "floor":"2",
                            "room":"211",
                            "alarmStatus":"Triggered",
                            "alarmDescription":"Mounted high on the West wall"
                        },
                        3: {
                            "alarmType":"Sprinkler",
                            "lastService":"8/17/18",
                            "zone":"E",
                            "floor":"3",
                            "room":"300",
                            "alarmStatus":"Alert",
                            "alarmDescription":"Ceiling mounted, middle of the room"
                        },
                        4: {
                            "alarmType":"Lighted Pathway",
                            "lastService":"5/1/17",
                            "zone":"E",
                            "floor":"3",
                            "room":"301",
                            "alarmStatus":"Service",
                            "alarmDescription":"Inlayed LED pathway, East wall"
                        },
    	                5: {
                            "alarmType":"Security Door",
                            "lastService":"10/07/17",
                            "zone":"C",
                            "floor":"2",
                            "room":"204",
                            "alarmStatus":"OK",
                            "alarmDescription":"Door opens inward"
                        },
    	                6: {
                            "alarmType":"Camera",
                            "lastService":"10/31/17",
                            "zone":"G",
                            "floor":"4",
                            "room":"400",
                            "alarmStatus":"OK",
                            "alarmDescription":"Mounted on South wall"
                        },
    	                7: {
                            "alarmType":"Camera",
                            "lastService":"12/23/18",
                            "zone":"A",
                            "floor":"1",
                            "room":"100",
                            "alarmStatus":"OK",
                            "alarmDescription":"Ceiling mounted camera"
                        },
                        8: {
                            "alarmType":"Fire",
                            "lastService":"3/4/16",
                            "zone":"B",
                            "floor":"1",
                            "room":"116",
                            "alarmStatus":"Service",
                            "alarmDescription":"Standard fire alarm mounted on North wall"
                        },
                        9: {
                            "alarmType":"Carbon Monoxide",
                            "lastService":"1/25/19",
                            "zone":"D",
                            "floor":"2",
                            "room":"211",
                            "alarmStatus":"Triggered",
                            "alarmDescription":"Mounted high on the West wall"
                        },
                        10: {
                            "alarmType":"Sprinkler",
                            "lastService":"8/17/18",
                            "zone":"E",
                            "floor":"3",
                            "room":"300",
                            "alarmStatus":"Alert",
                            "alarmDescription":"Ceiling mounted, middle of the room"
                        },
                        11: {
                            "alarmType":"Lighted Pathway",
                            "lastService":"5/1/17",
                            "zone":"E",
                            "floor":"3",
                            "room":"301",
                            "alarmStatus":"Service",
                            "alarmDescription":"Inlayed LED pathway, East wall"
                        },
    	                12: {
                            "alarmType":"Security Door",
                            "lastService":"10/07/17",
                            "zone":"C",
                            "floor":"2",
                            "room":"204",
                            "alarmStatus":"OK",
                            "alarmDescription":"Door opens inward"
                        },
    	                13: {
                            "alarmType":"Camera",
                            "lastService":"10/31/17",
                            "zone":"G",
                            "floor":"4",
                            "room":"400",
                            "alarmStatus":"OK",
                            "alarmDescription":"Mounted on South wall"
                        },
    	                14: {
                            "alarmType":"Camera",
                            "lastService":"12/23/18",
                            "zone":"A",
                            "floor":"1",
                            "room":"100",
                            "alarmStatus":"OK",
                            "alarmDescription":"Ceiling mounted camera"
                        },
                        15: {
                            "alarmType":"Fire",
                            "lastService":"3/4/16",
                            "zone":"B",
                            "floor":"1",
                            "room":"116",
                            "alarmStatus":"Service",
                            "alarmDescription":"Standard fire alarm mounted on North wall"
                        },
                        16: {
                            "alarmType":"Carbon Monoxide",
                            "lastService":"1/25/19",
                            "zone":"D",
                            "floor":"2",
                            "room":"211",
                            "alarmStatus":"Triggered",
                            "alarmDescription":"Mounted high on the West wall"
                        },
                        17: {
                            "alarmType":"Sprinkler",
                            "lastService":"8/17/18",
                            "zone":"E",
                            "floor":"3",
                            "room":"300",
                            "alarmStatus":"Alert",
                            "alarmDescription":"Ceiling mounted, middle of the room"
                        },
                        18: {
                            "alarmType":"Lighted Pathway",
                            "lastService":"5/1/17",
                            "zone":"E",
                            "floor":"3",
                            "room":"301",
                            "alarmStatus":"Service",
                            "alarmDescription":"Inlayed LED pathway, East wall"
                        },
    	                19: {
                            "alarmType":"Security Door",
                            "lastService":"10/07/17",
                            "zone":"C",
                            "floor":"2",
                            "room":"204",
                            "alarmStatus":"OK",
                            "alarmDescription":"Door opens inward"
                        },
    	                20: {
                            "alarmType":"Camera",
                            "lastService":"10/31/17",
                            "zone":"G",
                            "floor":"4",
                            "room":"400",
                            "alarmStatus":"OK",
                            "alarmDescription":"Mounted on South wall"
                        }
                    }
                };
                var results = JSON.parse('<%= hfAlarmDetailsJSON.Value %>');--%>

                function renderSettingsGrid(gridToUse, gridSettings) {
                    var grid = $("#" + gridToUse);
                    var gridContent = "";
                    var columnSettings = gridSettings.columnSettings;
                    var gridConfiguration = gridSettings.gridConfiguration;
            
                    if ($("#hfGridUserSettingsExpanded").val() == "true") {
                        $("gridUserSettings").addClass("in");
                    }

                    //Build the Column Headers
                    gridContent += "<div class='row display-flex settingsGridRow'>";
                    for (var cell in columnSettings) {
                        if (columnSettings.hasOwnProperty(cell)) {
                            var headerCell = columnSettings[cell];
                            gridContent += 
                                "<div class='col-md-"+headerCell.width+" settingsGridHeader'>" + 
                	                headerCell.headerText +
                                "</div>";
                        }
                    }
                    gridContent += "</div>";
    
                    //Build the rest of the settings grid
                    for (var gridColumn in gridConfiguration) {
                        if (gridConfiguration.hasOwnProperty(gridColumn)) {
                            var currentColumn = gridConfiguration[gridColumn];

                            gridContent += "<div class='row display-flex settingsGridRow'>";
            
                            for (var setting in currentColumn) {
                                if (currentColumn.hasOwnProperty(setting)) {
                	                if (setting == "headerText") {
                                        gridContent +=
                                            "<div class='col-md-3 settingsColumnName'>" +
                                                currentColumn.headerText +
                                            "</div>";
                                    }
                                    if (setting == "visible") {
                    	                var checked = "";
                                        var checkedValue = "N";
                                        if (currentColumn.visible){
                        	                checked = "checked";
                                            checkedValue = "Y";
                                        }
                                        gridContent +=
                                            "<div id='chk"+gridColumn+"Visible' class='col-md-2 settingsGridCell "+checked+"' onclick=\"toggleCheckedGroup(this.id);__doPostBack('btnSubmitConfiguration','');\">" +
                                                checkedValue +
                                            "</div>";
                                    }
                                    if (setting == "alignment") {
                                        var checked = "";
                                        var checkedValue = "";
                                        if (currentColumn.alignment == "left"){
                                            checkedValue = "L";
                                        } else if (currentColumn.alignment == "center") {
                                            checkedValue = "C";
                                        } else if (currentColumn.alignment == "right") {
                                            checkedValue = "R";
                                        }
                    	                //3 times for Left, Right, and Center
                    	                for (var i = 0; i < 3; i++) {
                        	                if (i == 0) {
                            	                if (checkedValue == "L") {
                                	                checked = "checked";
                                                } else {
                                	                checked = "";
                                                }
                                                gridContent +=
                                                    "<div id='rdo"+gridColumn+"Align-L' class='col-md-1 settingsGridCell "+checked+"' onclick=\"toggleCheckedGroup(this.id);__doPostBack('btnSubmitConfiguration','');\">" +
                                                        "L" +
                                                    "</div>";
                                            } else if (i == 1) {
                            	                if (checkedValue == "C") {
                                	                checked = "checked";
                                                } else {
                                	                checked = "";
                                                }
                                                gridContent +=
                                                    "<div id='rdo"+gridColumn+"Align-C' class='col-md-1 settingsGridCell "+checked+"' onclick=\"toggleCheckedGroup(this.id);__doPostBack('btnSubmitConfiguration','');\">" +
                                                        "C" +
                                                    "</div>";
                                            } else if (i == 2) {
                            	                if (checkedValue == "R") {
                                	                checked = "checked";
                                                } else {
                                	                checked = "";
                                                }
                                                gridContent +=
                                                    "<div id='rdo"+gridColumn+"Align-R' class='col-md-1 settingsGridCell "+checked+"' onclick=\"toggleCheckedGroup(this.id);__doPostBack('btnSubmitConfiguration','');\">" +
                                                        "R" +
                                                    "</div>";
                                            }
                                        }
                                    }
                                    if (setting == "width") {
                                        var checked = "";
                                        var checkedValue = "";
                    	                //4 times for widths 1, 2, 3, and 4
                    	                for (var i = 1; i < 5; i++) {
                        	                if (currentColumn.width == i) {
                            	                checked = "checked";
                                            } else {
                            	                checked = "";
                                            }
                                            gridContent +=
                                                "<div id='rdo"+gridColumn+"Size-"+i+"' class='col-md-1 settingsGridCell "+checked+"' onclick=\"toggleCheckedGroup(this.id);__doPostBack('btnSubmitConfiguration','');\">" +
                                	                i +
                                                "</div>";
                                        }
                                    }
                                }
                            }
                        }
    	                gridContent +=  "</div>";
                    }
                    //Done building, simply append HTML to grid container
                    grid.append(gridContent);
                }

                function renderDataGrid(gridToUse, resultsToRender, gridSettings) {
                    var grid = $("#" + gridToUse);
                    var gridContent = "";
                    var recordSet = resultsToRender.recordSet;
                    var gridConfiguration = gridSettings.gridConfiguration;
    
                    //Build the Column Headers
                    for (var row in recordSet) {
                        if (recordSet.hasOwnProperty(row)) {
        	                currentRow = recordSet[row];
                            gridContent += "<div id='"+gridToUse+"-header' class='row display-flex gridHeader'>";
                            var columnCount = 0;
                            for (var column in currentRow) {
            	                if (currentRow.hasOwnProperty(column)) {
                                    if (gridConfiguration[column].visible) {
                                        var headerID = gridToUse + "-" + column + "," + columnCount;
                                        gridContent += 
                                        "<div id='"+headerID+"' class='col-lg-"+gridConfiguration[column].width+" gridCell "+gridConfiguration[column].alignment+"' onclick=\"toggleOrderBy(this.id);\">" + 
                                            "<div class='gridCellContent'>" +
                                                gridConfiguration[column].headerText + "<span id='"+headerID+"-sortCaret' class='sort-caret "+$('#hfSort' + column.charAt(0).toUpperCase() + column.slice(1)).val()+"'></span>" +
                                            "</div>" +
                                        "</div>";
                                    }
                                }
                                columnCount++;
                            }
                        }
                        gridContent +=  "</div>";
                        break;
                    }
    
                    //Build the rest of the dataset
                    for (var row in recordSet) {
                        if (recordSet.hasOwnProperty(row)) {
                            currentRow = recordSet[row];

                            var rowClass = currentRow.alarmStatus.toLowerCase();
                            if (rowClass == "alert") {
            	                rowClass = "alarm";
                            }

                            gridContent += "<div id='"+gridToUse+"-"+row+"' class='row display-flex gridRow "+rowClass+"'>";
                            var columnCount = 0;

                            for (var column in currentRow) {
            	                if (currentRow.hasOwnProperty(column)) {
                	                if (gridConfiguration[column].visible) {
                                        gridContent += 
                                        "<div id='"+gridToUse+"-"+row+","+columnCount+"' class='col-lg-"+gridConfiguration[column].width+" gridCell "+gridConfiguration[column].alignment+"'>" + 
                                            "<div class='gridCellContent'>" +
                                                currentRow[column] +
                                            "</div>" +
                                        "</div>";
                                        columnCount++;
                                    }
                                }
                            }
                        }
                        gridContent +=  "</div>";
                    }
  	                //Done building, simply append HTML to grid container
                    grid.append(gridContent);
                }

                $(document).ready(function () {
                    //renderSettingsGrid("gridUserSettings", settings)
                    renderDataGrid("gridAlarmDetails", results, settings);
                });
        
                function toggleCheckedGroup(ctrlID) {
                    var groupAndCheckedItem = ctrlID.split("-");
                    var group = "";
                    var checkedItem = "";

                    if (groupAndCheckedItem.length > 1) {
                        group = groupAndCheckedItem[0];
                        checkedItem = groupAndCheckedItem[1];
                        $("*[id*="+group+"]").each(function() {
			                $(this).removeClass("checked");
                        });
                        $("#"+group+"-"+checkedItem).addClass("checked");
                    } else {
                        checkedItem = "#" + groupAndCheckedItem[0];
                        if ($(checkedItem).hasClass("checked")) {
        	                $(checkedItem).removeClass("checked");
        	                $(checkedItem).text("N");
                        } else {
        	                $(checkedItem).addClass("checked");
        	                $(checkedItem).text("Y");
                        }
                    }
                }

                function resizeColumn(column) {
                    var columnID = column.id;
                    var gridComponents = columnID.split("-");
                    var gridName = gridComponents[0];
                    var columnNumber = gridComponents[1].split(",")[1];
                    $("[id^="+gridName+"][id$=\\,"+columnNumber+"]")
                        .each(function () {
                        $(this).css("width", $(column).css("width"));
                    });
                }

                function toggleOrderBy(columnID) {
                    var gridComponents = columnID.split("-");
                    var columnName = gridComponents[1].split(",")[0];
                    columnName = columnName.charAt(0).toUpperCase() + columnName.slice(1);

                    $("[id^=hfSort]").not("[id$="+columnName+"]")
                        .each(function () {
                            $(this).val("")
                    });

                    var sort = $('#hfSort' + columnName).val();
                    if (sort == "") {
                        $('#hfSort' + columnName).val("ASC");
                    } else if (sort == "ASC") {
                        $('#hfSort' + columnName).val("DESC");
                    } else if (sort == "DESC") {
                        $('#hfSort' + columnName).val("");
                    }
                    $('#hfSortColumnChosen').val(columnName);

                    document.getElementById('btnOrderResults').click();
                }

                function filterDataResults(alarmType, alarmStatus) {
                    //console.log(alarmType + ", " + alarmStatus);
                    
                    $('#hfFilterAlarmTypeChosen').val(alarmType);
                    $('#hfFilterAlarmStatusChosen').val(alarmStatus);


                    document.getElementById('btnOrderResults').click();
                }
                
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
