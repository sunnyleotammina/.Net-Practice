﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        try
        {
            double amount = Double.Parse(txtAmount.Text);
            double rate = Double.Parse(txtRate.Text);
            double interest = amount * rate / 100;
            if (chkRound.Checked)
            {
                lblInterest.Text = "Interest: " + Math.Round(interest);
            }
            else
            {
                lblInterest.Text = "Interest: "+ interest;
            }
        }
        catch (FormatException ex)
        {
            lblInterest.Text = "Invalid input entered, please correct the input and try again. Only numbers allowed.";
        }

    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>interest Calculation</title>
</head>
<body>
    <h2>Interest Calculation</h2>
    <form id="form1" runat="server">
        Deposit Amount
        <br />
        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
        <p />
        Interest Rate
        <br />
        <asp:TextBox ID="txtRate" runat="server"></asp:TextBox>
        <p />
            <asp:CheckBox ID="chkRound" runat="server" Text="Round" />
        <p />
        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
        <p />
        <asp:Label ID="lblInterest" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
