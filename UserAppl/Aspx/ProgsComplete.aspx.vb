'Imports System.Web.UI.DataVisualization.Charting


Public Class ProgsComplete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'IProgsDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year.ToString
        'WCCProgram.Titles.Item(0).Text = "Program Completion Totals " & DateTime.Now.Year.ToString

        'IProgsYrDS.SelectParameters.Item(0).DefaultValue = "2017"
        'IProgsYrDS.SelectParameters.Item(1).DefaultValue = DateTime.Now.Year.ToString
        'IProgsReDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year.ToString
        'WCProgramYr.Titles.Item(0).Text = "Certified Program Graduates By Year (" & IProgsYrDS.SelectParameters.Item(0).DefaultValue & " - " & IProgsYrDS.SelectParameters.Item(1).DefaultValue & ")"
        'WCCRehab.Titles.Item(0).Text = "Inmates Enrolled In Rehabilitation Programs (" & IProgsReDS.SelectParameters.Item(0).DefaultValue & ")"

        'Chart1.DataManipulator.Group("Count", 1, IntervalType.Number, "ProgClsById")
    End Sub

    Private Sub BTBYear_TextChanged(sender As Object, e As EventArgs) Handles BTBYear.TextChanged
        WCCProgram.Titles.Item(0).Text = "Program Completion Totals " & BTBYear.Text
    End Sub


    'Protected Sub BootstrapButton1_Click(sender As Object, e As EventArgs) Handles BootstrapButton1.Click
    '    IProgsYrDS.SelectParameters.Item(0).DefaultValue = BYr.Text
    '    IProgsYrDS.SelectParameters.Item(1).DefaultValue = EYr.Text

    '    WCProgramYr.Titles.Item(0).Text = "Certified Program Graduates By Year (" & BYr.Text & " - " & EYr.Text & ")"
    'End Sub

    'Private Sub BYr0_TextChanged(sender As Object, e As EventArgs) Handles BYr0.TextChanged
    '    IProgsReDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year.ToString
    '    WCCRehab.Titles.Item(0).Text = "# Inmates Enrolled In (" & BYr0.Text & ")"
    '    WCCRehabPie.Titles.Item(0).Text = "% Rehabilitation By Location (" & BYr0.Text & ")"
    'End Sub

    'Private Sub ProgsComplete_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
    '    'IProgsDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year.ToString
    '    'WCCProgram.Titles.Item(0).Text = "Program Completion Totals " & DateTime.Now.Year.ToString

    '    'IProgsYrDS.SelectParameters.Item(0).DefaultValue = "2006"
    '    'IProgsYrDS.SelectParameters.Item(1).DefaultValue = DateTime.Now.Year.ToString
    '    'IProgsReDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year.ToString
    '    'WCProgramYr.Titles.Item(0).Text = "Certified Program Graduates By Year (" & IProgsYrDS.SelectParameters.Item(0).DefaultValue & " - " & IProgsYrDS.SelectParameters.Item(1).DefaultValue & ")"
    '    'WCCRehab.Titles.Item(0).Text = "Inmates Enrolled In Rehabilitation Programs (" & IProgsReDS.SelectParameters.Item(0).DefaultValue & ")"

    'End Sub

    'Private Sub EYr_TextChanged(sender As Object, e As EventArgs) Handles EYr.TextChanged
    '    IProgsYrDS.SelectParameters.Item(0).DefaultValue = BYr.Text
    '    IProgsYrDS.SelectParameters.Item(1).DefaultValue = EYr.Text
    '    WCProgramYr.Titles.Item(0).Text = "Certified Program Graduates By Year (" & BYr.Text & " - " & EYr.Text & ")"

    'End Sub

    'Private Sub BYr_TextChanged(sender As Object, e As EventArgs) Handles BYr.TextChanged
    '    IProgsYrDS.SelectParameters.Item(0).DefaultValue = BYr.Text
    '    IProgsYrDS.SelectParameters.Item(1).DefaultValue = EYr.Text
    '    WCProgramYr.Titles.Item(0).Text = "Certified Program Graduates By Year (" & BYr.Text & " - " & EYr.Text & ")"
    'End Sub

    Private Sub ProgsComplete_InitComplete(sender As Object, e As EventArgs) Handles Me.InitComplete
        IProgsDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year.ToString
        WCCProgram.Titles.Item(0).Text = "Program Completion Totals " & DateTime.Now.Year.ToString

        IProgsYrDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year - 1
        IProgsYrDS.SelectParameters.Item(1).DefaultValue = DateTime.Now.Year.ToString
        BYr.Text = DateTime.Now.Year - 1
        EYr.Text = DateTime.Now.Year.ToString

        IProgsReDS.SelectParameters.Item(0).DefaultValue = DateTime.Now.Year.ToString
        WCProgramYr.Titles.Item(0).Text = "Certified Program Graduates By Year (" & IProgsYrDS.SelectParameters.Item(0).DefaultValue & " - " & IProgsYrDS.SelectParameters.Item(1).DefaultValue & ")"
        WCCRehab.Titles.Item(0).Text = "# Inmates Enrolled In (" & IProgsReDS.SelectParameters.Item(0).DefaultValue & ")"

        'Chart1.DataManipulator.Group("Count", 1, IntervalType.Number, "ProgClsById", "ClassById")
    End Sub

    Protected Sub BtnYearCmp_Click(sender As Object, e As EventArgs) Handles BtnYearCmp.Click
        IProgsYrDS.SelectParameters.Item(0).DefaultValue = BYr.Text
        IProgsYrDS.SelectParameters.Item(1).DefaultValue = EYr.Text

        WCProgramYr.Titles.Item(0).Text = "Certified Program Graduates By Year (" & BYr.Text & " - " & EYr.Text & ")"
    End Sub
End Class