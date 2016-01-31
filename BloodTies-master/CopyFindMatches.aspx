<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CopyFindMatches.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/jquery.fancybox-1.3.4.css" rel="stylesheet" />
        <link href="css/kickstart-buttons.css" rel="stylesheet" />
        <link href="css/kickstart-forms.css" rel="stylesheet" />
        <link href="css/kickstart-grid.css" rel="stylesheet" />
        <link href="css/kickstart-menus.css" rel="stylesheet" />
        <link href="css/kickstart-slideshow.css" rel="stylesheet" />
        <link href="css/kickstart.css" rel="stylesheet" />
        <link href="css/prettify.css" rel="stylesheet" />
        <link href="css/tiptip.css" rel="stylesheet" />
        <script src="js/kickstart.js"></script>
    <link href="css/perfect.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="BloodTiesDb" OnRowCommand ="GridView1_RowCommand">
        <Columns>


        
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
            
            <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo"></asp:BoundField>
            <asp:TemplateField HeaderText="Contact" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Email") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="ViewMatches" runat="server" CommandName="contact" CommandArgument='<%# Bind("Email") %>'>Contact</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="BloodTiesDb" ConnectionString='<%$ ConnectionStrings:BloodTiesDbConnectionString %>' SelectCommand="SELECT [LastName], [FirstName], [Email], [Address], [City], [PhoneNo] FROM [UserInfo_Tbl]"></asp:SqlDataSource>
    <div class="col_2"></div>
    <div runat="server" id="messageform">
    <div class ="col_8">
  To : <asp:Label ID="lblTo" runat="server" Text=""></asp:Label><br />
  From : <asp:Label ID="lblFrom" runat="server" Text=""></asp:Label><br />
    Message : <textarea id="TextArea1" ></textarea>
   </div>
    </div>
</asp:Content> 


