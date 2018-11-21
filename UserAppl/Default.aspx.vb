Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Context.User.Identity.IsAuthenticated Then

        End If
    End Sub
End Class