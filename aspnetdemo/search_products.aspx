<%@ Page Title="" Language="C#" MasterPageFile="~/Products.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //Connect to Database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from products where prodname like @name", con);
            cmd.Parameters.AddWithValue("@name", "%" + txtName.Text + "%");

            SqlDataReader reader = cmd.ExecuteReader();
            gvProducts.DataSource = reader;
            gvProducts.DataBind();
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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Search Product</h2>
Name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    <p />
    <asp:GridView ID="gvProducts" runat="server"></asp:GridView>
</asp:Content>

