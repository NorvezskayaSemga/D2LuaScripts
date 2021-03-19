Public Class Form1

End Class


Public Class Doppelganger

    Public Shared Sub SpeedTest()

        For p As Integer = 0 To 1 Step 1
            Dim t1 As Integer = Environment.TickCount
            Dim n As Integer = 0
            For baseLevel As Integer = 1 To 5 Step 1
                For currentLevel As Integer = baseLevel To 80 Step 1
                    For dynLevel As Integer = baseLevel + 5 To baseLevel + 7 Step 1
                        For baseExp As Integer = 100 To 1000 Step 10
                            For expNext1 As Integer = 0 To 250 Step 5
                                For expNext2 As Integer = 0 To 250 Step 5
                                    If p = 0 Then
                                        Call LevelToExpFast(baseLevel, currentLevel, dynLevel, baseExp, expNext1, expNext2)
                                    Else
                                        Call LevelToExpSlow(baseLevel, currentLevel, dynLevel, baseExp, expNext1, expNext2)
                                    End If
                                    n += 1
                                Next
                            Next
                        Next
                    Next
                Next
            Next
            Dim t2 As Integer = Environment.TickCount
            Console.WriteLine(n & " " & t2 - t1)
        Next p
    End Sub

    Public Shared Function ExpToLevelSlow(ByRef expToConvertion As Integer, ByRef baseLevel As Integer, ByRef dynLevel As Integer, _
                                          ByRef baseExp As Integer, ByRef expNext1 As Integer, ByRef expNext2 As Integer) As Integer
        Dim e As Integer = expToConvertion
        Dim bar As Integer = baseExp
        Dim level As Integer = baseLevel
        Do While e >= bar
            e -= bar
            level += 1
            If level <= dynLevel Then
                bar += expNext1
            Else
                bar += expNext2
            End If
        Loop
        Return level
    End Function
    Public Shared Function LevelToExpFast(ByRef baseLevel As Integer, ByRef currentLevel As Integer, ByRef dynLevel As Integer, _
                                          ByRef baseExp As Integer, ByRef expNext1 As Integer, ByRef expNext2 As Integer) As Integer
        Dim e1, e2 As Integer
        Dim overlevel1, overlevel2 As Integer

        If currentLevel > dynLevel Then
            overlevel1 = dynLevel - baseLevel
            overlevel2 = currentLevel - dynLevel
        ElseIf currentLevel > baseLevel Then
            overlevel1 = currentLevel - baseLevel
            overlevel2 = 0
        Else
            overlevel1 = 0
            overlevel2 = 0
        End If

        If overlevel1 > 0 Then
            e1 = baseExp * overlevel1 + (overlevel1 - 1) * overlevel1 * expNext1 * 0.5
        Else
            e1 = 0
        End If
        If overlevel2 > 0 Then
            Dim dynExp As Integer = baseExp + overlevel1 * expNext1
            e2 = dynExp * overlevel2 + (overlevel2 - 1) * overlevel2 * expNext2 * 0.5
        Else
            e2 = 0
        End If
        Return e1 + e2
    End Function
    Public Shared Function LevelToExpSlow(ByRef baseLevel As Integer, ByRef currentLevel As Integer, ByRef dynLevel As Integer, _
                                          ByRef baseExp As Integer, ByRef expNext1 As Integer, ByRef expNext2 As Integer) As Integer

        'Dim e As Integer = 0
        'Dim bar As Integer = baseExp
        'For i As Integer = baseLevel To currentLevel - 1 Step 1
        '    e += bar
        '    If i < dynLevel Then
        '        bar += expNext1
        '    Else
        '        bar += expNext2
        '    End If
        'Next i
        'Return e

        Dim e As Integer = 0
        Dim bar As Integer = baseExp
        If currentLevel <= dynLevel Then
            For i As Integer = baseLevel To currentLevel - 1 Step 1
                e += bar
                bar += expNext1
            Next i
        Else
            For i As Integer = baseLevel To dynLevel - 1 Step 1
                e += bar
                bar += expNext1
            Next i
        End If
        If currentLevel > dynLevel Then
            For i As Integer = dynLevel To currentLevel - 1 Step 1
                e += bar
                bar += expNext2
            Next i
        End If
        Return e
    End Function

End Class
