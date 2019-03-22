<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (!FileUpload1.HasFile)
        {
            lblMessage.Text = "Please select a file to upload first!";
            return;
        }
        string filename;
        filename = Request.MapPath("files/" + FileUpload1.FileName); //creating 
        //the FULL FILENAME.
        FileUpload1.SaveAs(filename); //Actually saving the file.
        //Display the info confirming that the File is successfully saved.

        lblMessage.Text = "File has been uploaded successfully! <br>FilePath : " 
            + filename + "<br>Length : " + FileUpload1.PostedFile.ContentLength 
                + "<br>Type :" + FileUpload1.PostedFile.ContentType;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Select File to Upload: 
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <p />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        <p />
        <asp:Label ID="lblMessage" runat="server" EnableViewState="false" Text=""></asp:Label>
    </form>
</body>
</html>
