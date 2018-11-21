<%@ Page Title="Prison Control Interface" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProgsComplete.aspx.vb" Inherits="UserAppl.ProgsComplete" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.1.Web, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
            <h1>Inmate Programs Completion </h1>
        </div>

    <h2>Statistical Charts</h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <table style="width: 99%;">
                    <tr>
                        <td style="width: 788px; height: 76px;">
                            <asp:Label ID="Label1" runat="server" Text="Enter the year (e.g. 2015)"></asp:Label>
                            <dx:BootstrapTextBox ID="BTBYear" runat="server" Width="172px">
                            </dx:BootstrapTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 788px">
                            <dx:WebChartControl ID="WCCProgram" runat="server" CrosshairEnabled="True" DataSourceID="IProgsDS" Height="456px" PaletteName="Mixed" Width="1070px" AppearanceNameSerializable="Light" BackColor="#938953">
                                <BorderOptions Color="99, 36, 35" Visibility="True" />
                                <DiagramSerializable>
                                    <dx:XYDiagram>
                                        <AxisX Title-Visibility="Default" VisibleInPanesSerializable="-1">
                                        </AxisX>
                                        <AxisY VisibleInPanesSerializable="-1">
                                        </AxisY>
                                        <DefaultPane BackColor="147, 137, 83" BorderColor="73, 68, 41">
                                            <FillStyle FillMode="Gradient">
                                                <OptionsSerializable>
                                                    <dx:RectangleGradientFillOptions Color2="196, 189, 151" GradientMode="RightToLeft" />
                                                </OptionsSerializable>
                                            </FillStyle>
                                        </DefaultPane>
                                    </dx:XYDiagram>
                                </DiagramSerializable>
        <Legend Name="Default Legend" font="Tahoma, 6pt" visibility="False"></Legend>
                                <SeriesSerializable>
                                    <dx:Series ArgumentDataMember="program_class" LabelsVisibility="True" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" SeriesPointsSorting="Ascending" SeriesPointsSortingKey="Value_1" SummaryFunction="COUNT()" ToolTipPointPattern="{S}">
                                        <ViewSerializable>
                                            <dx:SideBySideBarSeriesView ColorEach="True">
                                                <FillStyle FillMode="Solid">
                                                </FillStyle>
                                                <Shadow Visible="True" />
                                            </dx:SideBySideBarSeriesView>
                                        </ViewSerializable>
                                        <LabelSerializable>
                                            <dx:SideBySideBarSeriesLabel Position="Top">
                                            </dx:SideBySideBarSeriesLabel>
                                        </LabelSerializable>
                                        <ColorizerSerializable>
                                            <dx:RangeColorizer PaletteName="Mixed" />
                                        </ColorizerSerializable>
                                    </dx:Series>
                                </SeriesSerializable>
                                <SeriesTemplate LabelsVisibility="True">
                                </SeriesTemplate>
                                <Titles>
                                    <dx:ChartTitle Text="Program Completion Totals" Font="Rockwell Condensed, 18pt" />
                                </Titles>
                                <CrosshairOptions ArgumentLineColor="0, 176, 240">
                                </CrosshairOptions>
                            </dx:WebChartControl>
                            <asp:SqlDataSource ID="IProgsDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT i_program_part.inmate_sys_id, i_program_part.f_name, i_program_part.l_name, i_program_part.custody_status, program.program_class, inmate_program.year FROM i_program_part INNER JOIN inmate_program ON i_program_part.i_program_part_id = inmate_program.i_program_part_id INNER JOIN program ON inmate_program.program_id = program.program_id WHERE (inmate_program.cmp_status = 'COMPLETED') AND (inmate_program.year = @PrmYear) ORDER BY i_program_part.inmate_sys_id">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="BTBYear" Name="prmYear" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="IProgsDS2" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT COUNT(inmate_program.program_id) AS Cnt, inmate_program.program_id, program.program_class FROM i_program_part INNER JOIN inmate_program ON i_program_part.i_program_part_id = inmate_program.i_program_part_id INNER JOIN program ON inmate_program.program_id = program.program_id WHERE (inmate_program.cmp_status = 'COMPLETED') AND (inmate_program.year = @PrmYear) GROUP BY inmate_program.program_id ORDER BY Cnt">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="BTBYear" Name="prmYear" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 788px">
                            <asp:Label ID="Label2" runat="server" Text="Enter Begin Year (e.g. 2014)"></asp:Label>
                            <dx:BootstrapTextBox ID="BYr" runat="server" Width="172px">
                            </dx:BootstrapTextBox>
                            <asp:Label ID="Label3" runat="server" Text="Enter End Year (e.g. 2017)"></asp:Label>
                            <dx:BootstrapTextBox ID="EYr" runat="server" Width="172px">
                            </dx:BootstrapTextBox>
                            <dx:ASPxButton ID="BtnYearCmp" runat="server" style="margin-left: 2px" Text="Run Yearly Comparison" Theme="BlackGlass" Width="173px">
                            </dx:ASPxButton>
                            <dx:WebChartControl ID="WCProgramYr" runat="server" CrosshairEnabled="True" DataSourceID="IProgsYrDS" Height="354px" PaletteName="Mixed" style="margin-top: 0px; margin-left: 0px;" Width="1070px" BackColor="#938953">
                                <BorderOptions Visibility="True" Color="73, 68, 41" />
                                <DiagramSerializable>
                                    <dx:XYDiagram>
                                        <AxisX VisibleInPanesSerializable="-1">
                                        </AxisX>
                                        <AxisY VisibleInPanesSerializable="-1">
                                        </AxisY>
                                        <DefaultPane BackColor="147, 137, 83" BorderColor="73, 68, 41">
                                            <FillStyle FillMode="Gradient">
                                                <OptionsSerializable>
                                                    <dx:RectangleGradientFillOptions Color2="196, 189, 151" GradientMode="RightToLeft" />
                                                </OptionsSerializable>
                                            </FillStyle>
                                        </DefaultPane>
                                    </dx:XYDiagram>
                                </DiagramSerializable>
        <Legend Name="Default Legend" AlignmentHorizontal="Center" AlignmentVertical="TopOutside" Direction="LeftToRight" Visibility="True"></Legend>
                                <SeriesSerializable>
                                    <dx:Series ArgumentDataMember="year" LabelsVisibility="True" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" SeriesPointsSorting="Ascending" SummaryFunction="COUNT()">
                                        <ViewSerializable>
                                            <dx:SideBySideBarSeriesView Color="29, 27, 16" ColorEach="True">
                                                <Border Visibility="False" />
                                                <FillStyle FillMode="Gradient">
                                                </FillStyle>
                                                <Shadow Visible="True" />
                                            </dx:SideBySideBarSeriesView>
                                        </ViewSerializable>
                                        <LabelSerializable>
                                            <dx:SideBySideBarSeriesLabel Position="Top">
                                            </dx:SideBySideBarSeriesLabel>
                                        </LabelSerializable>
                                        <ColorizerSerializable>
                                            <dx:RangeColorizer PaletteName="Mixed" />
                                        </ColorizerSerializable>
                                    </dx:Series>
                                </SeriesSerializable>
                                <SeriesTemplate SeriesPointsSorting="Ascending" SummaryFunction="COUNT()">
                                </SeriesTemplate>
                                <Titles>
                                    <dx:ChartTitle Text="# Certified Program Graduates By Year" Font="Rockwell Condensed, 18pt" />
                                </Titles>
                            </dx:WebChartControl>
                            <asp:SqlDataSource ID="IProgsYrDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT i_program_part.inmate_sys_id, i_program_part.f_name, i_program_part.m_name, i_program_part.l_name, inmate_program.year, inmate_program.program_id, program.program_class, inmate_program.cmp_status FROM inmate_program INNER JOIN i_program_part ON inmate_program.i_program_part_id = i_program_part.i_program_part_id INNER JOIN program ON inmate_program.program_id = program.program_id WHERE (inmate_program.cmp_status = 'COMPLETED') AND (inmate_program.year BETWEEN @PrmByr AND @PrmEYr) ORDER BY inmate_program.year">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="BYr" Name="prmByr" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="EYr" Name="prmEYr" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 788px" >
                            <asp:Label ID="Label4" runat="server" Text="Enter Begin Year (e.g. 2014)"></asp:Label>
                            <dx:BootstrapTextBox ID="BYr0" runat="server" Width="172px">
                            </dx:BootstrapTextBox>
                            <table style="width:135%;">
                                <tr>
                                    <td>
                                        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                                            <asp:Label ID="Label6" runat="server" Text="Rehabilitation Enrollment" Font-Bold="true" Font-Size="X-Large"
                                            CssClass="StrongText"></asp:Label>
                                        </div>
                                <tr>
                                    <td>
                                        <table class="dxflInternalEditorTable_BlackGlass">
                                            <tr>
                                                <td style="width: 666px">
                                                    <dx:WebChartControl ID="WCCRehab" runat="server" CrosshairEnabled="True" DataSourceID="IProgsReDS" Height="339px" Width="634px" AppearanceNameSerializable="Light" BackColor="#938953" PaletteName="Mixed">
                                                        <BorderOptions Color="73, 68, 41" Visibility="True" />
                                                        <DiagramSerializable>
                                                            <dx:XYDiagram>
                                                                <AxisX VisibleInPanesSerializable="-1">
                                                                </AxisX>
                                                                <AxisY VisibleInPanesSerializable="-1">
                                                                </AxisY>
                                                                <DefaultPane BackColor="147, 137, 83" BorderColor="73, 68, 41">
                                                                    <FillStyle FillMode="Gradient">
                                                                        <OptionsSerializable>
                                                                            <dx:RectangleGradientFillOptions Color2="196, 189, 151" GradientMode="RightToLeft" />
                                                                        </OptionsSerializable>
                                                                    </FillStyle>
                                                                </DefaultPane>
                                                            </dx:XYDiagram>
                                                        </DiagramSerializable>
                                                        <Legend Name="Default Legend" Visibility="False"></Legend>
                                                        <SeriesSerializable>
                                                            <dx:Series ArgumentDataMember="tango" LegendTextPattern="{A}" Name="Series 1" SeriesPointsSorting="Ascending" SummaryFunction="COUNT()" LabelsVisibility="True">
                                                                <ViewSerializable>
                                                                    <dx:SideBySideBarSeriesView ColorEach="True">
                                                                        <FillStyle FillMode="Gradient">
                                                                        </FillStyle>
                                                                        <Shadow Visible="True" />
                                                                    </dx:SideBySideBarSeriesView>
                                                                </ViewSerializable>
                                                                <LabelSerializable>
                                                                    <dx:SideBySideBarSeriesLabel TextPattern="{A}" Position="Top">
                                                                    </dx:SideBySideBarSeriesLabel>
                                                                </LabelSerializable>
                                                            </dx:Series>
                                                        </SeriesSerializable>
                                                        <Titles>
                                                            <dx:ChartTitle Text="# Inmates Enrolled In " Font="Rockwell Condensed, 18pt" />
                                                        </Titles>
                                                    </dx:WebChartControl>
                                                </td>
                                                <td>
                                                    <dx:WebChartControl ID="WCCRehabPie" runat="server" CrosshairEnabled="True" DataSourceID="IProgsReDS" Height="339px" Width="439px" style="margin-left: 0px" AppearanceNameSerializable="Light" BackColor="#938953" PaletteName="Mixed">
                                                        <DiagramSerializable>
                                                            <dx:SimpleDiagram3D RotationAngleX="-50" RotationType="UseAngles">
                                                            </dx:SimpleDiagram3D>
                                                        </DiagramSerializable>
                                                        <FillStyle FillMode="Gradient">
                                                            <OptionsSerializable>
                                                                <dx:RectangleGradientFillOptions Color2="221, 217, 195" GradientMode="ToCenterVertical" />
                                                            </OptionsSerializable>
                                                        </FillStyle>
                                                        <Legend Name="Default Legend" Visibility="False"></Legend>
                                                        <SeriesSerializable>
                                                            <dx:Series ArgumentDataMember="tango" LabelsVisibility="True" LegendName="Default Legend" LegendTextPattern="{A} ({VP:0%})" Name="Series 1" SeriesPointsSorting="Ascending" SummaryFunction="COUNT()">
                                                                <ViewSerializable>
                                                                    <dx:Pie3DSeriesView Depth="4">
                                                                    </dx:Pie3DSeriesView>
                                                                </ViewSerializable>
                                                                <LabelSerializable>
                                                                    <dx:Pie3DSeriesLabel TextPattern="{A} ({VP:0%})">
                                                                    </dx:Pie3DSeriesLabel>
                                                                </LabelSerializable>
                                                            </dx:Series>
                                                        </SeriesSerializable>
                                                        <SeriesTemplate LegendTextPattern="{A} ({V})" SummaryFunction="COUNT()">
                                                            <ViewSerializable>
                                                                <dx:PieSeriesView>
                                                                </dx:PieSeriesView>
                                                            </ViewSerializable>
                                                        </SeriesTemplate>
                                                        <Titles>
                                                            <dx:ChartTitle Text="% Rehabilitation By Location " Font="Rockwell Condensed, 18pt" />
                                                        </Titles>
                                                        <CrosshairOptions ShowArgumentLabels="True">
                                                        </CrosshairOptions>
                                                    </dx:WebChartControl>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 666px; height: 15px">
                                                    <asp:SqlDataSource ID="IProgsReDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:dbkolbeConn.ProviderName %>" SelectCommand="SELECT i_program_part.inmate_sys_id, i_program_part.f_name, i_program_part.m_name, i_program_part.l_name, inmate_program.year, inmate_program.program_id, program.program_class, inmate_program.cmp_status, location_parent.description, location_parent.tango FROM inmate_program INNER JOIN i_program_part ON inmate_program.i_program_part_id = i_program_part.i_program_part_id INNER JOIN program ON inmate_program.program_id = program.program_id LEFT OUTER JOIN location_parent ON inmate_program.location_parent_id = location_parent.location_parent_id WHERE (inmate_program.cmp_status = 'COMPLETED') AND (inmate_program.year = @PrmByr) ORDER BY inmate_program.year">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="BYr0" Name="PrmByr" PropertyName="Text" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                                <td style="height: 15px"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 788px">
                            &nbsp;</td>
                    </tr>
        </table>
    </ContentTemplate></asp:UpdatePanel>

        
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="Enter the year (e.g. 2015)"></asp:Label>
                            <dx:BootstrapTextBox ID="BTBYear" runat="server" Width="172px">
                            </dx:BootstrapTextBox>
                <dx:WebChartControl ID="WCCProgram" runat="server" CrosshairEnabled="True" DataSourceID="IProgsDS" Height="456px" PaletteName="Mixed" Width="1070px" AppearanceNameSerializable="Light" BackColor="#938953">
                                <BorderOptions Color="99, 36, 35" Visibility="True" />
                                <DiagramSerializable>
                                    <dx:XYDiagram>
                                        <AxisX Title-Visibility="Default" VisibleInPanesSerializable="-1">
                                        </AxisX>
                                        <AxisY VisibleInPanesSerializable="-1">
                                        </AxisY>
                                        <DefaultPane BackColor="147, 137, 83" BorderColor="73, 68, 41">
                                            <FillStyle FillMode="Gradient">
                                                <OptionsSerializable>
                                                    <dx:RectangleGradientFillOptions Color2="196, 189, 151" GradientMode="RightToLeft" />
                                                </OptionsSerializable>
                                            </FillStyle>
                                        </DefaultPane>
                                    </dx:XYDiagram>
                                </DiagramSerializable>
        <Legend Name="Default Legend" font="Tahoma, 6pt" visibility="False"></Legend>
                                <SeriesSerializable>
                                    <dx:Series ArgumentDataMember="program_class" LabelsVisibility="True" LegendName="Default Legend" LegendTextPattern="{A}" Name="Series 1" SeriesPointsSorting="Ascending" SeriesPointsSortingKey="Value_1" SummaryFunction="COUNT()" ToolTipPointPattern="{S}">
                                        <ViewSerializable>
                                            <dx:SideBySideBarSeriesView ColorEach="True">
                                                <FillStyle FillMode="Solid">
                                                </FillStyle>
                                                <Shadow Visible="True" />
                                            </dx:SideBySideBarSeriesView>
                                        </ViewSerializable>
                                        <LabelSerializable>
                                            <dx:SideBySideBarSeriesLabel Position="Top">
                                            </dx:SideBySideBarSeriesLabel>
                                        </LabelSerializable>
                                        <ColorizerSerializable>
                                            <dx:RangeColorizer PaletteName="Mixed" />
                                        </ColorizerSerializable>
                                    </dx:Series>
                                </SeriesSerializable>
                                <SeriesTemplate LabelsVisibility="True">
                                </SeriesTemplate>
                                <Titles>
                                    <dx:ChartTitle Text="Program Completion Totals" Font="Rockwell Condensed, 18pt" />
                                </Titles>
                                <CrosshairOptions ArgumentLineColor="0, 176, 240">
                                </CrosshairOptions>
                            </dx:WebChartControl>
                            <asp:SqlDataSource ID="IProgsDS" runat="server" ConnectionString="<%$ ConnectionStrings:WebDeploySite.My.MySettings.dbkolbeConn %>" ProviderName="<%$ ConnectionStrings:WebDeploySite.My.MySettings.dbkolbeConn.ProviderName %>" SelectCommand="SELECT i_program_part.inmate_sys_id, i_program_part.f_name, i_program_part.l_name, i_program_part.custody_status, program.program_class, inmate_program.year FROM i_program_part INNER JOIN inmate_program ON i_program_part.i_program_part_id = inmate_program.i_program_part_id INNER JOIN program ON inmate_program.program_id = program.program_id WHERE (inmate_program.cmp_status = 'COMPLETED') AND (inmate_program.year = @PrmYear) ORDER BY i_program_part.inmate_sys_id">
                            </asp:SqlDataSource>
            </ContentTemplate>
    </asp:UpdatePanel>--%>

        
        <br />
    </asp:Content>
