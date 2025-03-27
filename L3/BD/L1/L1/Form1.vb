Imports System
Imports System.IO


Public Class Form1
    Private filme(15) As String
    Private actori(15, 5) As String
    Private voturi(15) As Integer
    Private tara(15) As String
    Private data(15) As Date
    Private movieno As Integer = 0
    Private file As String

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub


    Private Sub CloseToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CloseToolStripMenuItem.Click
        Me.Close()

    End Sub

    Private Sub TextBox2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub ListBox2_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox2.SelectedIndexChanged

    End Sub

    Private Sub OpenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OpenToolStripMenuItem.Click
        Dim OpenFile1 As New OpenFileDialog()
        OpenFile1.InitialDirectory = "C:\"

        If (OpenFile1.ShowDialog() = System.Windows.Forms.DialogResult.OK) Then
            Dim cititor As New StreamReader(OpenFile1.FileName)
            Dim fields As String()
            Dim linie As String
            Dim pct As Char = ";"
            Dim virg As Char = ","
            Dim actors As String()

            file = OpenFile1.FileName


            Button4.Visible = False
            TextBox3.Visible = False
            ListBox1.Items.Clear()
            ListBox2.Items.Clear()
            Dim i As Integer = 0
            Do
                linie = cititor.ReadLine()
                If linie Is Nothing Then
                    Exit Do

                End If
                fields = linie.Split(pct)
                ListBox1.Items.Add(fields(0))
                Me.filme(i) = fields(0)
                Me.tara(i) = fields(3)
                Me.data(i) = Date.Parse(fields(2))


                Me.voturi(i) = Integer.Parse(fields(4))
                Dim j As Integer = 0
                actors = fields(1).Split(virg)

                For j = 0 To actors.Length - 1
                    Me.actori(i, j) = actors(j)

                Next
                i = i + 1

            Loop Until linie Is Nothing
            movieno = i
            cititor.Close()
        Else
            MessageBox.Show("Nu ati selectat nici un fisier valid")
            Me.Close()
        End If

    End Sub

    Private Sub ListBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
        Dim index As Integer = ListBox1.SelectedIndex
        If (index < 0) Then
            index = 0
        End If
        TextBox1.Text = filme(index)
        Dim j As Integer = 0
        ListBox2.Items.Clear()
        Button4.Visible = False
        TextBox3.Visible = False

        Do
            ListBox2.Items.Add(actori(index, j))
            j = j + 1
        Loop Until actori(index, j) Is Nothing
        TextBox2.Text = tara(index)
        DateTimePicker1.Value = data(index)
        NumericUpDown1.Value = voturi(index)
    End Sub

    Private Sub ClearToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub SaveToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SaveToolStripMenuItem.Click
        Dim savefile1 As New SaveFileDialog()
        savefile1.ShowDialog()
        Dim wr As System.IO.FileStream
        wr = System.IO.File.Create(savefile1.FileName)
        wr.Close()
        Dim w As New StreamWriter(savefile1.FileName, True)

        Dim j As Integer = 0
        Do
            w.Write(filme(j) & ";")
            Dim i As Integer = 0
            Do
                If (actori(j, i + 1) Is Nothing) Then
                    w.Write(actori(j, i) & ";")
                    i = i + 1
                Else
                    w.Write(actori(j, i) & ",")
                    i = i + 1
                End If

            Loop Until actori(j, i) Is Nothing
            w.Write(data(j) & ";")
            w.Write(tara(j) & ";")
            w.WriteLine(voturi(i))
            j = j + 1
        Loop Until filme(j) Is Nothing
        w.Close()





    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click

        ListBox2.Items.Add(TextBox3.Text)
        TextBox3.Clear()
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        ListBox1.Items.Add(TextBox1.Text)
        filme(movieno) = TextBox1.Text
        Dim j As Integer = 0
        For j = 0 To ListBox2.Items.Count - 1
            actori(movieno, j) = ListBox2.Items.Item(j)
        Next
        Me.data(movieno) = Date.Parse(DateTimePicker1.Value)
        tara(movieno) = TextBox2.Text
        voturi(movieno) = NumericUpDown1.Value
        movieno = movieno + 1
        Button1.Enabled = False

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim index As Integer = ListBox1.SelectedIndex

        movieno = movieno - 1
        Dim j As Integer
        For j = index To filme.Length - 2
            filme(j) = filme(j + 1)
            voturi(j) = voturi(j + 1)
            tara(j) = tara(j + 1)
            data(j) = data(j + 1)
        Next
        ListBox1.Items.RemoveAt(index)
    End Sub

    Private Sub Button1_MouseHover(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.MouseHover

    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged

    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim index As Integer = ListBox1.SelectedIndex
        filme(index) = TextBox1.Text
        tara(index) = TextBox2.Text
        voturi(index) = NumericUpDown1.Value
        data(index) = Date.Parse(DateTimePicker1.Value)
    End Sub

    Private Sub SaveAsToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SaveAsToolStripMenuItem.Click

        If (file Is Nothing) Then
            MessageBox.Show("Nu este nici un fisier incarcat / Utilizati Save As")
        Else

            Dim w As New StreamWriter(file, False)

            Dim j As Integer = 0
            Do
                w.Write(filme(j) & ";")
                Dim i As Integer = 0
                Do
                    If (actori(j, i + 1) Is Nothing) Then
                        w.Write(actori(j, i) & ";")
                        i = i + 1
                    Else
                        w.Write(actori(j, i) & ",")
                        i = i + 1
                    End If

                Loop Until actori(j, i) Is Nothing
                w.Write(data(j) & ";")
                w.Write(tara(j) & ";")
                w.WriteLine(voturi(i))
                j = j + 1
            Loop Until filme(j) Is Nothing
            w.Close()
        End If
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        TextBox1.Text = ""
        TextBox2.Text = ""
        ListBox2.Items.Clear()
        NumericUpDown1.Value = 0
        Button1.Enabled = True
        Button4.Visible = True
        TextBox3.Visible = True
    End Sub
End Class
