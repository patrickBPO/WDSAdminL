﻿<%@ Page Title="Prison Control Interface" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisitorView.aspx.vb" Inherits="UserAppl.VisitorView" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%--<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AppName.aspx.vb" Inherits="WebDeploySite.AppName" %>--%>

    
    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
            <h1>Inmate Visitor Lookup<dx:ASPxGridView ID="VisViewerGV" runat="server" AutoGenerateColumns="False" DataSourceID="InmateVisitorViewDS" EnableTheming="True" KeyFieldName="inmate_sys_id" Theme="BlackGlass">
                <SettingsDetail ShowDetailRow="True" />
                <Templates>
                    <DetailRow>
                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="VisitorsDetailDS" EnableTheming="True" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Theme="Aqua">
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="First Name" FieldName="f_name" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Last Name" FieldName="l_name" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn FieldName="banned" VisibleIndex="5">
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Sex" FieldName="sex" VisibleIndex="3">
                                    <PropertiesComboBox DataSourceID="GenderDS" TextField="par_desc" ValueField="par_num">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Relationship" FieldName="relation_id" VisibleIndex="4">
                                    <PropertiesComboBox DataSourceID="RelationDS" TextField="par_desc" ValueField="par_num">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </DetailRow>
                </Templates>
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="inmate_id" ReadOnly="True" Visible="False" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Inmate ID" FieldName="inmate_sys_id" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="First Name" FieldName="f_name" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Middle Name" FieldName="m_name" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Last Name" FieldName="l_name" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Sex" FieldName="sex" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Location" FieldName="location_parent_id" VisibleIndex="6">
                        <PropertiesComboBox DataSourceID="LocationDS" TextField="tango" ValueField="location_parent_id">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Custody Status" FieldName="custody_status_id" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="CStatusDS" TextField="par_desc" ValueField="par_num">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Country" FieldName="country_id" VisibleIndex="9">
                        <PropertiesComboBox DataSourceID="CountryDS" TextField="c_name" ValueField="country_id">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="Admission Date" FieldName="admiss_dte" VisibleIndex="8">
                        <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                </Columns>
                </dx:ASPxGridView>
            </h1>
        </div>
        <div class="row">

            <asp:SqlDataSource ID="VisitorsDetailDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT f_name, l_name, sex, relation_id, banned FROM vistor WHERE (inmate_sys_id = @PrmID)">
                <SelectParameters>
                    <asp:SessionParameter Name="PrmID" SessionField="inmate_sys_id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="RelationDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT par_num, par_desc FROM param WHERE (par_code = 9) ORDER BY par_code, par_desc"></asp:SqlDataSource>

            <asp:SqlDataSource ID="CountryDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT country_id, c_name, c_abbr FROM country ORDER BY c_name"></asp:SqlDataSource>

            <asp:SqlDataSource ID="InmateVisitorViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT inmate_id, inmate_sys_id, f_name, m_name, l_name, sex, location_parent_id, DATE_FORMAT(admiss_dte, '%d-%b-%y') AS admiss_dte, country_id, custody_status_id FROM inmate WHERE (custody_status_id &lt;&gt; 3) ORDER BY l_name"></asp:SqlDataSource>

            <asp:SqlDataSource ID="EthnicDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT par_num, par_desc FROM param WHERE (par_code = 4) ORDER BY par_desc"></asp:SqlDataSource>
            <asp:SqlDataSource ID="GenderDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT par_num, par_desc FROM param WHERE (par_code = 14) ORDER BY par_desc"></asp:SqlDataSource>
            <asp:SqlDataSource ID="LocationDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT location_parent_id, tango FROM location_parent WHERE (move_type_det_id = 9) ORDER BY tango"></asp:SqlDataSource>
            <asp:SqlDataSource ID="CStatusDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT par_num, par_desc FROM param WHERE (par_code = 6) ORDER BY par_desc"></asp:SqlDataSource>

        </div>
    </asp:Content>

