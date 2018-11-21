<%@ Page Language="vb" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="IProgEnt.aspx.vb" Inherits="UserAppl.IProgEnt" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Inmate Program Maintenance</h1>
    </div>

    <div class="row">
        
        <div class="col-md-4">
            
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="IPDS" AutoGenerateColumns="False" KeyFieldName="i_program_part_id" EnableTheming="True" Theme="BlackGlass">
                <SettingsDetail ShowDetailRow="True" />
                <Templates>
                    <DetailRow>
                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="IPDetailDS" KeyFieldName="inmate_program_id" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect1" EnableTheming="True" Theme="PlasticBlue" Width="610px" OnRowValidating="ASPxGridView2_RowValidating">
                            <Settings AutoFilterCondition="Equals" ShowFooter="True" ShowGroupedColumns="True" ShowGroupFooter="VisibleIfExpanded" ShowGroupPanel="True" />
                            <EditFormLayoutProperties ColCount="2">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColumnName="program_id">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="cmp_status">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="year">
                                        <CaptionSettings VerticalAlign="Top" />
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="location_parent_id">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                    </dx:EditModeCommandLayoutItem>
                                </Items>
                            </EditFormLayoutProperties>
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="inmate_program_id" ReadOnly="True" VisibleIndex="1" Visible="False">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="i_program_part_id" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="inmate_sys_id" VisibleIndex="3" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="f_name" VisibleIndex="4" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="m_name" VisibleIndex="5" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="l_name" VisibleIndex="6" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="custody_status" VisibleIndex="11" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Program Location" FieldName="location_parent_id" VisibleIndex="10" Name="location_parent_id">
                                    <PropertiesComboBox DataSourceID="LocationDS" TextField="tango" ValueField="location_parent_id">
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Program Status" FieldName="cmp_status" VisibleIndex="8">
                                    <PropertiesComboBox DataSourceID="ProgStatusDS" TextField="par_desc" ValueField="par_desc">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Year" FieldName="year" VisibleIndex="9">
                                    <PropertiesComboBox DataSourceID="YearDS" TextField="description" ValueField="year_id" Width="50px">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Program Name" FieldName="program_id" VisibleIndex="7">
                                    <PropertiesComboBox DataSourceID="ProgramDS" TextField="program_class" ValueField="program_id" Width="250px">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="Total : {00}" FieldName="year" ShowInColumn="Year" ShowInGroupFooterColumn="Year" SummaryType="Count" Tag="year" />
                                <dx:ASPxSummaryItem DisplayFormat="Total : {00}" FieldName="program_id" ShowInColumn="Program Name" ShowInGroupFooterColumn="Program Name" SummaryType="Count" Tag="program_id" />
                                <dx:ASPxSummaryItem DisplayFormat="Total : {000}" FieldName="location_parent_id" ShowInColumn="location_parent_id" ShowInGroupFooterColumn="location_parent_id" SummaryType="Count" Tag="location_parent_id" />
                            </GroupSummary>
                            <Styles>
                                <SelectedRow BackColor="#00CCFF">
                                </SelectedRow>
                                <BatchEditModifiedCell BackColor="#9966FF">
                                </BatchEditModifiedCell>
                            </Styles>
                        </dx:ASPxGridView>
                    </DetailRow>
                </Templates>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="i_program_part_id" ReadOnly="True" VisibleIndex="1" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="inmate_sys_id" VisibleIndex="2" Caption="Inmate ID" Name="inmate_sys_id">
                        <PropertiesTextEdit>
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="f_name" VisibleIndex="3" Caption="First Name">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="m_name" VisibleIndex="4" Caption="Middle Name">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="l_name" VisibleIndex="5" Caption="Last Name">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="location_parent_id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="LocationDS" TextField="tango" ValueField="location_parent_id">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Custody Status" FieldName="custody_status" VisibleIndex="6">
                        <PropertiesComboBox DataSourceID="CustodyStatDS" TextField="par_desc" ValueField="par_num">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="IPDS" runat="server" ConnectionString="server=web;user id=root;password=r00t@xs431u;persistsecurityinfo=True;allowzerodatetime=True;convertzerodatetime=True;port=3308;database=dbkolbe" DeleteCommand="DELETE FROM `i_program_part` WHERE `i_program_part_id` = ?" InsertCommand="INSERT INTO `i_program_part` (`inmate_sys_id`, `f_name`, `m_name`, `l_name`, `custody_status`, `i_timestamp`, `location_parent_id`) VALUES ( ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?)" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT * FROM `i_program_part`" UpdateCommand="UPDATE `i_program_part` SET `inmate_sys_id` = ?, `f_name` = ?, `m_name` = ?, `l_name` = ?, `custody_status` = ?,  `location_parent_id` = ? WHERE `i_program_part_id` = ?">
                <DeleteParameters>
                    <asp:Parameter Name="i_program_part_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="inmate_sys_id" SessionField="inmate_sys_id" Type="Int32" />
                    <asp:SessionParameter Name="f_name" SessionField="f_name" Type="String" />
                    <asp:SessionParameter Name="m_name" SessionField="m_name" Type="String" />
                    <asp:SessionParameter Name="l_name" SessionField="l_name" Type="String" />
                    <asp:SessionParameter Name="custody_status" SessionField="custody_status" Type="String" />
                    <asp:SessionParameter Name="i_timestamp" SessionField="i_timestamp" Type="DateTime" />
                    <asp:SessionParameter Name="location_parent_id" SessionField="location_parent_id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="inmate_sys_id" Type="Int32" />
                    <asp:Parameter Name="f_name" Type="String" />
                    <asp:Parameter Name="m_name" Type="String" />
                    <asp:Parameter Name="l_name" Type="String" />
                    <asp:Parameter Name="custody_status" Type="String" />
                    <asp:Parameter Name="location_parent_id" Type="Int32" />
                    <asp:Parameter Name="i_program_part_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
        <div class="col-md-4">
            <asp:SqlDataSource ID="IPDetailDS" runat="server" ConnectionString="server=web;user id=root;password=r00t@xs431u;persistsecurityinfo=True;allowzerodatetime=True;convertzerodatetime=True;port=3308;database=dbkolbe" DeleteCommand="DELETE FROM `inmate_program` WHERE `inmate_program_id` = ?" InsertCommand="INSERT INTO `inmate_program` (`inmate_program_id`, `inmate_sys_id`, `f_name`, `m_name`, `l_name`, `program_id`, `year`, `custody_status`, `cmp_status`, `i_program_part_id`, `location_parent_id`, `i_timestamp`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT inmate_program_id, i_program_part_id, inmate_sys_id, f_name, m_name, l_name, program_id, year, custody_status, cmp_status, location_parent_id FROM inmate_program WHERE (i_program_part_id = @PrmID)" UpdateCommand="UPDATE `inmate_program` SET  `i_program_part_id` = ?,  `inmate_sys_id` = ?, `f_name` = ?, `m_name` = ?, `l_name` = ?, `program_id` = ?, `year` = ?, `custody_status` = ?, `cmp_status` = ?, `location_parent_id` = ? WHERE `inmate_program_id` = ?">
                <DeleteParameters>
                    <asp:Parameter Name="inmate_program_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="inmate_program_id" SessionField="inmate_program_id" Type="Int32" />
                    <asp:SessionParameter Name="inmate_sys_id" SessionField="inmate_sys_id" Type="Int32" />
                    <asp:SessionParameter Name="f_name" SessionField="f_name" Type="String" />
                    <asp:SessionParameter Name="m_name" SessionField="m_name" Type="String" />
                    <asp:SessionParameter Name="l_name" SessionField="l_name" Type="String" />
                    <asp:SessionParameter Name="program_id" SessionField="program_id" Type="Int32" />
                    <asp:SessionParameter Name="year" SessionField="year" Type="String" />
                    <asp:SessionParameter Name="custody_status" SessionField="custody_status" Type="String" />
                    <asp:SessionParameter Name="cmp_status" SessionField="cmp_status" Type="String" />
                    <asp:SessionParameter Name="i_program_part_id" SessionField="i_program_part_id" Type="Int32" />
                    <asp:SessionParameter Name="location_parent_id" SessionField="location_parent_id" Type="Int32" />
                    <asp:SessionParameter Name="i_timestamp" SessionField="i_timestamp" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="prmID" SessionField="i_program_part_id" Size="11" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="i_program_part_id" Type="Int32" />
                    <asp:Parameter Name="inmate_sys_id" Type="Int32" />
                    <asp:Parameter Name="f_name" Type="String" />
                    <asp:Parameter Name="m_name" Type="String" />
                    <asp:Parameter Name="l_name" Type="String" />
                    <asp:Parameter Name="program_id" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="custody_status" Type="String" />
                    <asp:Parameter Name="cmp_status" Type="String" />
                    <asp:Parameter Name="location_parent_id" Type="Int32" />
                    <asp:Parameter Name="inmate_program_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="LocationDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT location_parent_id, tango, description, program_stat FROM location_parent WHERE (move_type_det_id = 9) ORDER BY tango"></asp:SqlDataSource>
            <asp:SqlDataSource ID="CustodyStatDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT param_id, par_code, par_num, par_desc FROM param WHERE (par_code = 6) ORDER BY par_desc"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ProgStatusDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT param_id, par_code, par_num, par_desc FROM param WHERE (par_code = 13) ORDER BY par_desc"></asp:SqlDataSource>
            <asp:SqlDataSource ID="YearDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT year_id, description FROM year"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ProgramDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT program_id, program_class FROM program ORDER BY program_class"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
