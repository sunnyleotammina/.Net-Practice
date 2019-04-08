<%@ Page Title="" Language="C#" MasterPageFile="~/Products.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void btnGet_Click(object sender, EventArgs e)
    {
        //Connect to Database
        SqlConnection con = new SqlConnection
            (@"Data Source=(localdb)\mssqllocaldb;Initial Catalog=msdb;Integrated Security=True");
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from products where prodid=@prodid", con);
            cmd.Parameters.AddWithValue("@prodid", txtID.Text);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                txtName.Text = reader["prodname"].ToString();
                txtPrice.Text = reader["price"].ToString();
                txtQOH.Text = reader["qoh"].ToString();
                txtRemarks.Text = reader["remarks"].ToString();
                txtCatCode.Text = reader["catcode"].ToString();
            }

        }
        catch(Exception ex)
        {
            Response.Write("Sorry Error:" + ex.Message);
        }
        finally
        {
            con.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //Connect to Database
        SqlConnection con = new SqlConnection
            (@"Data Source=(localdb)\mssqllocaldb;Initial Catalog=msdb;Integrated Security=True");
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update products set prodname=@name, price=@price, qoh=@qoh,remarks=@remarks,catcode=@catcode where prodid=@prodid", con);
            cmd.Parameters.AddWithValue("@prodid", txtID.Text);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@qoh", txtQOH.Text);
            cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
            cmd.Parameters.AddWithValue("@catcode", txtCatCode.Text);

            int count = cmd.ExecuteNonQuery();
            if (count == 1)
                lblMsg.Text = "Product has been updated Successfully!";
        }
        catch(Exception ex)
        {
            lblMsg.Text = "Sorry Error:" + ex.Message;
        }
        finally
        {
            con.Close();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Update Product Info</h2>
    <p>Product ID:
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnGet" runat="server" Text="Get" OnClick="btnGet_Click" />
    </p>
    <p>&nbsp;</p>
    
    <p>Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </p>
    <p>Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
    </p>
    <p>Quantity on Hand:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtQOH" runat="server"></asp:TextBox>
    </p>
    <p>Remarks:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
    </p>
    <p>Category Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCatCode" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    </p>
    <p>
        <asp:Label ID="lblMsg" runat="server" Text="" EnableViewState="false"></asp:Label>
    </p>
</asp:Content>

