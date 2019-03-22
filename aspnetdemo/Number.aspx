<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnCheckPrime_Click(object sender, EventArgs e)
    {
        int num, check;
        num = Int32.Parse(txtInput.Text);
        if (num == 1)
        {
            lblResult.Text = "1 is neither Prime nor Composite number";
            return;
        }
        check = num;
        while (check > 1)
        {
            check = check - 1;
            if (check == 1)
            {
                lblResult.Text = num + " is a Prime number";
            }
            else
                if ( num % check == 0)
            {
                lblResult.Text = num + " is NOT a Prime number";
                break;
            }
        }
    }

    protected void btnFactorials_Click(object sender, EventArgs e)
    {
        int num = Int32.Parse(txtInput.Text);
        int factorial = 1;
        for (int i = 2; i <= num; i++)
        {
            factorial = factorial*i;
        }
        lblResult.Text = "The Factorial of " + num + " is: " + factorial;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Numbers</title>
</head>
<body>
    <form id="form1" runat="server">
        Please input a number:
        <asp:TextBox ID="txtInput" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnCheckPrime" runat="server" Text="Check for Prime" OnClick="btnCheckPrime_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnFactorials" runat="server" Text="Find Factorials" Width="130px" OnClick="btnFactorials_Click" />
        <p />
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
