Imports System.Data.OleDb
Imports DevExpress.Web
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.Data
Imports MySql.Data.MySqlClient
Public Class IProgEnt
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'IPDetailDS.SelectParameters("i_timestamp").DefaultValue = DateTime.Now
            ASPxGridView1.DataBind()
            ASPxGridView1.DetailRows.ExpandRow(0)
        End If
    End Sub

    'Protected Sub ASPxGridView2_BeforePerformDataSelect(sender As Object, e As EventArgs)
    '    'Dim checkr As VariantType
    '    'checkr = sender.GetMasterRowKeyValue()
    '    'checkr = ASPxGridView1.GetRowValues(ASPxGridView1.EditingRowVisibleIndex, ASPxGridView1.KeyFieldName)
    '    'Session("i_program_part_id") = sender.GetMasterRowKeyValue()

    '    Session("i_program_part_id") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()

    '    'Session("i_program_part_id") = ASPxGridView1.GetRowValues(ASPxGridView1.EditingRowVisibleIndex, ASPxGridView1.KeyFieldName)
    'End Sub

    'Protected Sub IPDetailDS_Init(sender As Object, e As EventArgs) Handles IPDetailDS.Init
    '    Dim gvDetails As ASPxGridView = DirectCast(sender, ASPxGridView)
    '    Dim connection As New MySqlConnection("server=web;user id=root;password=r00t@xs431u;persistsecurityinfo=True;allowzerodatetime=True;convertzerodatetime=True;port=3308;database=dbkolbe")
    '    Dim selectCommand As New MySqlCommand("SELECT * FROM inmate_program WHERE i_program_part_id = " & gvDetails.GetMasterRowKeyValue())
    '    Dim da As New MySqlDataAdapter(selectCommand)
    '    Dim ds As New DataSet()

    '    selectCommand.Connection = connection
    '    da.Fill(ds, "i_program_part")

    '   End Sub

    'Private Sub ASPxGridView1_Init(sender As Object, e As EventArgs) Handles ASPxGridView1.Init

    '    Dim gvDetails As ASPxGridView = DirectCast(sender, ASPxGridView)
    '    Dim connection As New MySqlConnection("server=web;user id=root;password=r00t@xs431u;persistsecurityinfo=True;allowzerodatetime=True;convertzerodatetime=True;port=3308;database=dbkolbe")
    '    Dim selectCommand As New MySqlCommand("SELECT * FROM inmate_program WHERE i_program_part_id = " & gvDetails.GetMasterRowKeyValue())
    '    Dim da As New MySqlDataAdapter(selectCommand)
    '    Dim ds As New DataSet()

    '    selectCommand.Connection = connection
    '    da.Fill(ds, "i_program_part")
    'End Sub

    'Private Sub IProgEnt_Init(sender As Object, e As EventArgs) Handles Me.Init
    '    If Not IsPostBack Then
    '        ASPxGridView1.DataBind()
    '        ASPxGridView1.DetailRows.ExpandRow(0)
    '    End If
    'End Sub

    Protected Sub ASPxGridView2_BeforePerformDataSelect1(sender As Object, e As EventArgs)
        Session("i_program_part_id") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()

    End Sub

    Private Sub ASPxGridView1_RowValidating(sender As Object, e As ASPxDataValidationEventArgs) Handles ASPxGridView1.RowValidating
        For Each column As GridViewColumn In ASPxGridView1.Columns
            Dim dataColumn As GridViewDataColumn = TryCast(column, GridViewDataColumn)
            If dataColumn Is Nothing Then
                Continue For
            End If
            'If e.NewValues(dataColumn.FieldName) Is Nothing Then
            '    e.Errors(dataColumn) = "Value can't be null."
            'End If
        Next column
        If e.Errors.Count > 0 Then
            e.RowError = "Please, fill all fields."
        End If
        If e.NewValues("inmate_sys_id") Is Nothing Or e.NewValues("inmate_sys_id").ToString.Equals("0") Then
            AddError(e.Errors, ASPxGridView1.Columns("inmate_sys_id"), "You must enter a valid Inmate ID Number format")
            e.RowError = "You must enter a valid Inmate ID Number format"
        End If
        'If e.NewValues("LastName") IsNot Nothing AndAlso e.NewValues("LastName").ToString().Length < 2 Then
        '    AddError(e.Errors, ASPxGridView1.Columns("LastName"), "Last Name must be at least two characters long.")
        'End If
        'If e.NewValues("Email") IsNot Nothing AndAlso (Not e.NewValues("Email").ToString().Contains("@")) Then
        '    AddError(e.Errors, ASPxGridView1.Columns("Email"), "Invalid e-mail.")
        'End If

        'Dim age As Integer = If(e.NewValues("Age") IsNot Nothing, CInt(Fix(e.NewValues("Age"))), 0)
        'If age < 18 Then
        '    AddError(e.Errors, ASPxGridView1.Columns("Age"), "Age must be greater than or equal 18.")
        'End If
        'Dim arrival As DateTime = DateTime.MinValue
        'DateTime.TryParse(If(e.NewValues("ArrivalDate") Is Nothing, String.Empty, e.NewValues("ArrivalDate").ToString()), arrival)
        'If DateTime.Today.Year <> arrival.Year OrElse DateTime.Today.Month <> arrival.Month Then
        '    AddError(e.Errors, ASPxGridView1.Columns("ArrivalDate"), "Arrival date is required and must belong to the current month.")
        'End If

        'If String.IsNullOrEmpty(e.RowError) AndAlso e.Errors.Count > 0 Then
        '    e.RowError = "Please, correct all errors."
        'End If
    End Sub

    Private Sub AddError(ByVal errors As Dictionary(Of GridViewColumn, String), ByVal column As GridViewColumn, ByVal errorText As String)
        If errors.ContainsKey(column) Then
            Return
        End If
        errors(column) = errorText
    End Sub
    Protected Sub grid_HtmlRowPrepared(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
        If (Not Object.Equals(e.RowType, GridViewRowType.Data)) Then
            Return
        End If

        Dim hasError As Boolean = String.IsNullOrEmpty(e.GetValue("inmate_sys_id").ToString())
        'hasError = hasError OrElse String.IsNullOrEmpty(e.GetValue("LastName").ToString())
        'hasError = hasError OrElse Not e.GetValue("Email").ToString().Contains("@")
        'hasError = hasError OrElse CInt(Fix(e.GetValue("Age"))) < 18
        'Dim arrival As DateTime = CDate(e.GetValue("ArrivalDate"))
        'hasError = hasError OrElse DateTime.Today.Year <> arrival.Year OrElse DateTime.Today.Month <> arrival.Month
        If hasError Then
            e.Row.ForeColor = System.Drawing.Color.IndianRed
        End If
    End Sub

    Protected Sub ASPxGridView2_RowValidating(sender As Object, e As ASPxDataValidationEventArgs)
        For Each column As GridViewColumn In ASPxGridView1.Columns
            Dim dataColumn As GridViewDataColumn = TryCast(column, GridViewDataColumn)
            If dataColumn Is Nothing Then
                Continue For
            End If
            'If e.NewValues(dataColumn.FieldName) Is Nothing Then
            '    e.Errors(dataColumn) = "Value can't be null."
            'End If
        Next column
        If e.Errors.Count > 0 Then
            e.RowError = "Please, fill all fields."
        End If
        If e.NewValues("location_parent_id") IsNot Nothing AndAlso e.NewValues("location_parent_id").ToString = "0" Then
            AddError(e.Errors, ASPxGridView1.Columns("location_parent_id"), "You must enter the Program Location")
            e.RowError = "You must enter the Program Location"
        End If

        'If String.IsNullOrEmpty(e.RowError) AndAlso e.Errors.Count > 0 Then
        '    e.RowError = "Please, correct all errors."
        'End If
    End Sub

    Protected Sub ASPxGridView1_ParseValue(sender As Object, e As ASPxParseValueEventArgs) Handles ASPxGridView1.ParseValue
        If e.Value <> Nothing Then
            e.Value = e.Value.ToString.ToUpper
        End If
    End Sub



    'Protected Sub ASPxGridView2_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)
    '    'Dim lst As List(Of MyObject) = IPDetailDS

    '    'Dim selectedValues As List(Of Object) = grid.GetSelectedFieldValues(grid.KeyFieldName)

    '    'For Each value As Object In selectedValues

    '    '    Dim obj As MyObject = lst.Find(Function(s) s.ID = Convert.ToInt32(value))

    '    '    lst.Remove(obj)

    '    'Next value

    '    'grid.DataBind()
    'End Sub

    'Protected Sub BootstrapGridView2_BeforePerformDataSelect(sender As Object, e As EventArgs)
    '    Session("i_program_part_id") = sender.GetMasterRowKeyValue()
    'End Sub
End Class