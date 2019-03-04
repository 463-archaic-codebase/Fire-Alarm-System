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
                    <div class="col-sm-12">
                        <h2>Alarm Details</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12" >

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
