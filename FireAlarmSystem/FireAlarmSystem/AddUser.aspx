<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="FireAlarmSystem.AddUser" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <br />
    </div>

    <div class="row ">
        <div class="panel col-lg-6 col-lg-offset-3">
            <div class="row panel-heading ">
                <div class="col-sm-12">
                    <h2>Add User</h2>                      
                </div>
            </div>
            <div class="panel-body>">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            First Name
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:TextBox ID="firstName" runat="server" CssClass="form-control aspnet-width-fix" required="true"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Middle Initial
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:TextBox ID="middleInitial" runat="server" CssClass="form-control aspnet-width-fix" required="true"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Last Name
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:TextBox ID="lastName" runat="server" CssClass="form-control aspnet-width-fix" required="true"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Password
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:TextBox ID="password" runat="server" CssClass="form-control aspnet-width-fix" required="true" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="col-form-label align-right">
                            Role
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control aspnet-width-fix">
                            <asp:ListItem Value="1">Supervisor</asp:ListItem>
                            <asp:ListItem Selected="True" Value="2">Operator</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <asp:Button  ID="insertBtn" runat="server" Text="Insert User" CssClass="btn-success btn btn-lg btn-block aspnet-width-fix" OnClick="insertBtn_Click"/>
                <br />
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
