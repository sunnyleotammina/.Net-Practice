<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        Min:
        <asp:TextBox ID="txtMin" runat="server" required="required"></asp:TextBox>
        Max:
        <asp:TextBox ID="txtMax" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:CompareValidator 
            ControlToValidate="txtMin" 
            ControlToCompare="txtMax"
            Operator="LessThanEqual"
            Type="Integer"
            ID="CompareValidator1" runat="server" 
            ErrorMessage="Minimum must be lower than Maximum"></asp:CompareValidator>
        <p />
        <asp:Button ID="btnProcess" runat="server" Text="Process" />

    </form>
</body>
</html>
