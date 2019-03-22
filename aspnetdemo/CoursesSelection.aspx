<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnGetFee_Click(object sender, EventArgs e)
    {
        int fee = Int32.Parse(ddlCourse.SelectedValue);
        if (rbMorning.Checked)
            fee = fee - fee * 10 / 100;
        if (cbMaterial.Checked)
            fee += 500;
        lblMessage.Text = string.Format("Fee is {0}", fee);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Fee Finder</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Course Fee Finder</h2>
        Select Course <asp:DropDownList ID="ddlCourse" runat="server">
            <asp:ListItem Value="4000">Python Programming</asp:ListItem>
            <asp:ListItem Value="5000">Data Science</asp:ListItem>
            <asp:ListItem Value="3500">JavaScript</asp:ListItem>
            <asp:ListItem Value="5500">.Net Programming</asp:ListItem>
        </asp:DropDownList>

        <p />
        Timings&nbsp;&nbsp;&nbsp;<br />
        <asp:RadioButton ID="rbMorning" runat="server" Text="Morning" GroupName="Time"/>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbEvening" runat="server" GroupName="Time" Checked="true"/>Evening
        <p />
        <asp:CheckBox ID="cbMaterial" runat="server" Text="Get Printed Material" />
&nbsp;&nbsp;&nbsp;
        <p />
        <br />
        <asp:Button ID="btnGetFee" runat="server" Text="Get Fee" OnClick="btnGetFee_Click" />
        <br />
        <p />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    </form>
</body>
</html>
