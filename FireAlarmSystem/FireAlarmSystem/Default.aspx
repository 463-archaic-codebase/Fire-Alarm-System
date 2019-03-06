<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FireAlarmSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <br />
    </div>

    <div class="row">
        <div class="col-sm-6">
            <div class="panel">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>Summary</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="indicator-container">
                            <div class="indicator-header summary">
                                OK
                            </div>
                            <div class="ok indicator summary">
                                <div class="indicator-content" >
                                    <asp:Label ID="summaryOK" runat="server" CssClass="indicator-label" Text="131"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="indicator-container">
                            <div class="indicator-header summary">
                                Service
                            </div>
                            <div class="service indicator summary">
                                <div class="indicator-content" >
                                    <asp:Label ID="summaryService" runat="server" CssClass="indicator-label" Text="3"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="indicator-container">
                            <div class="indicator-header summary">
                                Triggered
                            </div>
                            <div class="triggered indicator summary">
                                <div class="indicator-content" >
                                    <asp:Label ID="summaryTriggered" runat="server" CssClass="indicator-label" Text="4"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="indicator-container">
                            <div class="indicator-header summary">
                                Alert
                            </div>
                            <div class="alarm indicator summary">
                                <div class="indicator-content" >
                                    <asp:Label ID="summaryAlarm" runat="server" CssClass="indicator-label" Text="7"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 text-center ">
                        <asp:Button ID="btnViewAllAlarms" runat="server" CssClass="btn btn-header-summary btn-primary center-block" Width="100%" Text="View All Alarms"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel">
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
        </div>
    </div>
    
    <div class="row">
        <div class="col-sm-6">
            <div class="panel">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>Alarm Systems Analysis</h2>
                    </div>
                </div>
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
                                    <div class="ok indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="cameraOk" runat="server" CssClass="indicator-label" Text="14"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="service indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="cameraService" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="triggered indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="cameraTriggered" runat="server" CssClass="indicator-label" Text="1"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="alarm indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="cameraAlert" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center ">
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Cameras"/>
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
                                    <div class="ok indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="carbonMonoxideOK" runat="server" CssClass="indicator-label" Text="19"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="service indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="carbonMonoxideService" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="triggered indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="carbonMonoxideTriggered" runat="server" CssClass="indicator-label" Text="1"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="alarm indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="carbonMonoxideAlert" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center ">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Carbon Monoxide"/>
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
                                    <div class="ok indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="fireOK" runat="server" CssClass="indicator-label" Text="22"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="service indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="fireService" runat="server" CssClass="indicator-label" Text="1"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="triggered indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="fireTriggered" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="alarm indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="fireAlert" runat="server" CssClass="indicator-label" Text="2"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center ">
                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Fire Alarms"/>
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
                                    <div class="ok indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="lightedPathwayOK" runat="server" CssClass="indicator-label" Text="7"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="service indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="lightedPathwayService" runat="server" CssClass="indicator-label" Text="2"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="triggered indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="lightedPathwayTriggered" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="alarm indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="lightedPathwayAlert" runat="server" CssClass="indicator-label" Text="1"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center ">
                                <asp:Button ID="Button4" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Lighted Pathways"/>
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
                                    <div class="ok indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="securityDoorOK" runat="server" CssClass="indicator-label" Text="24"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="service indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="securityDoorService" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="triggered indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="securityDoorTriggered" runat="server" CssClass="indicator-label" Text="1"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="alarm indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="securityDoorAlert" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center ">
                                <asp:Button ID="Button5" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Security Doors"/>
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
                                    <div class="ok indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="sprinklerOK" runat="server" CssClass="indicator-label" Text="45"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="service indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="sprinklerService" runat="server" CssClass="indicator-label" Text="0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="triggered indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="sprinklerTriggered" runat="server" CssClass="indicator-label" Text="1"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 squish">
                                <div class="indicator-container">
                                    <div class="alarm indicator specific">
                                        <div class="indicator-content" >
                                            <asp:Label ID="sprinklerAlert" runat="server" CssClass="indicator-label" Text="4"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center ">
                                <asp:Button ID="Button6" runat="server" CssClass="btn btn-header-specific btn-primary center-block" Width="100%" Text="View All Sprinklers"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel">
                <div class="row">
                    <div class="col-sm-10">
                        <h2>Alarm Details</h2>
                    </div>
                    <div class="col-sm-2 text-right">
                        <a href="#settingsConfig" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="settingsConfig">
                            <img id="settingsCog" src="/Images/Icons/settings.png" />
                        </a>
                    </div>
                </div>
                <div class="collapse" id="settingsConfig">
                    <div class="row">
                        <div class="col-sm-3">
                            <h4>Column Name</h4>
                        </div>
                        <div class="col-sm-2 text-center">
                            <h4>Visible</h4>
                        </div>
                        <div class="col-sm-3">
                            <h4>Alignment</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-right">
                            <h4>Alarm Type</h4>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:CheckBox ID="chkAlarmTypeVisible" runat="server" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmTypeAlignLeft" runat="server" GroupName="rdoAlarmTypeAlign" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmTypeAlignCenter" runat="server" GroupName="rdoAlarmTypeAlign" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmTypeAlignRight" runat="server" GroupName="rdoAlarmTypeAlign" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-right">
                            <h4>Last Service</h4>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:CheckBox ID="chkLastServiceVisible" runat="server" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoLastServiceAlignLeft" runat="server" GroupName="rdoLastServiceAlign" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoLastServiceAlignCenter" runat="server" GroupName="rdoLastServiceAlign" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoLastServiceAlignRight" runat="server" GroupName="rdoLastServiceAlign" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-right">
                            <h4>Zone</h4>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:CheckBox ID="chkZoneVisible" runat="server" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoZoneAlignLeft" runat="server" GroupName="rdoZoneAlign" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoZoneAlignCenter" runat="server" GroupName="rdoZoneAlign" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoZoneAlignRight" runat="server" GroupName="rdoZoneAlign" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-right">
                            <h4>Floor</h4>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:CheckBox ID="chkFloorVisible" runat="server" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoFloorAlignLeft" runat="server" GroupName="rdoFloorAlign" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoFloorAlignCenter" runat="server" GroupName="rdoFloorAlign" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoFloorAlignRight" runat="server" GroupName="rdoFloorAlign" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-right">
                            <h4>Room</h4>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:CheckBox ID="chkRoomVisible" runat="server" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoRoomAlignLeft" runat="server" GroupName="rdoRoomAlign" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoRoomAlignCenter" runat="server" GroupName="rdoRoomAlign" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoRoomAlignRight" runat="server" GroupName="rdoRoomAlign" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-right">
                            <h4>Alarm Status</h4>
                        </div>
                        <div class="col-sm-2 text-center" for="chkAlarmStatusVisible">
                            <asp:CheckBox ID="chkAlarmStatusVisible" runat="server" Checked="true" ClientIDMode="Static" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmStatusAlignLeft" runat="server" GroupName="rdoAlarmStatusAlign" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmStatusAlignCenter" runat="server" GroupName="rdoAlarmStatusAlign" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmStatusAlignRight" runat="server" GroupName="rdoAlarmStatusAlign" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-right">
                            <h4>Description</h4>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:CheckBox ID="chkAlarmDescriptionVisible" runat="server" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmDescriptionAlignLeft" runat="server" GroupName="rdoAlarmDescriptionAlign" Checked="true" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmDescriptionAlignCenter" runat="server" GroupName="rdoAlarmDescriptionAlign" />
                        </div>
                        <div class="col-sm-1 text-center">
                            <asp:RadioButton ID="rdoAlarmDescriptionAlignRight" runat="server" GroupName="rdoAlarmDescriptionAlign" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12" >
                        <div id="gridAlarmDetails" class="grid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
            var results = {
                "ColumnHeaderNames": {
    	            "alarmID":"AlarmID",
    	            "alarmType":"Alarm Type",
    	            "lastService":"Last Service",
    	            "zone":"Zone",
    	            "floor":"Floor",
                    "room":"Room",
    	            "alarmStatus":"Alarm Status",
    	            "alarmDescription":"Alarm Description"
                },
                "ColumnVisibilities": {
    	            "alarmID":false,
    	            "alarmType":true,
    	            "lastService":true,
    	            "zone":true,
    	            "floor":true,
                    "room":true,
    	            "alarmStatus":true,
    	            "alarmDescription":false
                },
                "ColumnSizes": {
    	            "alarmID":0,
    	            "alarmType":3,
    	            "lastService":3,
    	            "zone":1,
    	            "floor":1,
                    "room":1,
    	            "alarmStatus":3,
    	            "alarmDescription":0
                },
                "ColumnAlignments": {
    	            "alarmID":"center",
    	            "alarmType":"left",
    	            "lastService":"center",
    	            "zone":"center",
    	            "floor":"center",
                    "room":"center",
    	            "alarmStatus":"center",
    	            "alarmDescription":"center"
                },
                "recordSet": {
    	            0: {
        	            "alarmID":"1",
                        "alarmType":"Camera",
                        "lastService":"12/23/18",
                        "zone":"A",
                        "floor":"1",
                        "room":"100",
                        "alarmStatus":"OK",
                        "alarmDescription":"Ceiling mounted camera"
                    },
                    1: {
        	            "alarmID":"2",
                        "alarmType":"Fire",
                        "lastService":"3/4/16",
                        "zone":"B",
                        "floor":"1",
                        "room":"116",
                        "alarmStatus":"Service",
                        "alarmDescription":"Standard fire alarm mounted on North wall"
                    },
                    2: {
        	            "alarmID":"3",
                        "alarmType":"Carbon Monoxide",
                        "lastService":"1/25/19",
                        "zone":"D",
                        "floor":"2",
                        "room":"211",
                        "alarmStatus":"Triggered",
                        "alarmDescription":"Mounted high on the West wall"
                    },
                    3: {
        	            "alarmID":"4",
                        "alarmType":"Sprinkler",
                        "lastService":"8/17/18",
                        "zone":"E",
                        "floor":"3",
                        "room":"300",
                        "alarmStatus":"Alert",
                        "alarmDescription":"Ceiling mounted, middle of the room"
                    },
                    4: {
        	            "alarmID":"5",
                        "alarmType":"Lighted Pathway",
                        "lastService":"5/1/17",
                        "zone":"E",
                        "floor":"3",
                        "room":"301",
                        "alarmStatus":"Service",
                        "alarmDescription":"Inlayed LED pathway, East wall"
                    },
    	            5: {
        	            "alarmID":"6",
                        "alarmType":"Security Door",
                        "lastService":"10/07/17",
                        "zone":"C",
                        "floor":"2",
                        "room":"204",
                        "alarmStatus":"OK",
                        "alarmDescription":"Door opens inward"
                    },
    	            6: {
        	            "alarmID":"7",
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

            function renderGrid(gridToUse, resultsToRender) {
                var grid = $("#" + gridToUse);
                var gridContent = "";
                var recordSet = resultsToRender.recordSet;
    
                //Build the Column Headers
                for (var row in recordSet) {
                    if (recordSet.hasOwnProperty(row)) {
        	            currentRow = recordSet[row];
                        gridContent += "<div id='"+gridToUse+"-header' class='row display-flex gridHeader'>";
                        for (var column in currentRow) {
            	            if (currentRow.hasOwnProperty(column)) {
                	            if (resultsToRender.ColumnVisibilities[column]) {
                                    gridContent += 
                                    "<div id='"+gridToUse+"-"+column+"' class='col-lg-"+resultsToRender.ColumnSizes[column]+" gridCell "+resultsToRender.ColumnAlignments[column]+"'>" + 
                                        "<div class='gridCellContent'>" +
                                            resultsToRender.ColumnHeaderNames[column] +
                                        "</div>" +
                                    "</div>";
                                }
                            }
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
                	            if (resultsToRender.ColumnVisibilities[column]) {
                                    gridContent += 
                                    "<div id='"+gridToUse+"-"+row+","+columnCount+"' class='col-lg-"+resultsToRender.ColumnSizes[column]+" gridCell "+resultsToRender.ColumnAlignments[column]+"'>" + 
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
            renderGrid("gridAlarmDetails", results);
        });
        

    </script>

</asp:Content>
