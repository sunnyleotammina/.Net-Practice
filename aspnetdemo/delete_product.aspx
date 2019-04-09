<%@ Page Title="" Language="C#" MasterPageFile="~/Products.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //Get id of the product from the query string
        string prodid = Request.QueryString["id"];
        //Connect to Database
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from products where prodid=@prodid", con);
            cmd.Parameters.AddWithValue("@prodid", prodid);

            int count = cmd.ExecuteNonQuery();
            if (count == 1)
                lblMsg.Text = "Product has been deleted Successfully!";
            else
                lblMsg.Text = "Sorry, could not delete the Product with id:" + prodid;
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
    <h2>Delete Product</h2>
    <asp:Label ID="lblMsg" runat="server" Text="" EnableViewState="false"></asp:Label>
</asp:Content>

