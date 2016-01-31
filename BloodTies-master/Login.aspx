<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default3" %>

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
        <center>
      <div class="col_12 visible">

          <center>
        <h6>
            Login
        </h6> <hr class="alt1" />
        <br />
<asp:Label ID="UserName" runat="server" Text="Username"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox>
        <br /><br />
<asp:Label ID="Password" runat="server"  Text="Password"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="TxtPassword" TextMode="Password" runat="server"></asp:TextBox>
    
     <br /><br />
           <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="large blue" OnClick="LoginButton_Click"></asp:Button>
                    <asp:Label ID="LabelChk" runat="server" Text=""></asp:Label>
            <br /><br />
    
 <a href="Register.aspx">New User? Click here to Sign Up</a><br />
        <hr class="alt1" />
     <br /><br />

              </center>
          </div>
          </center>
    
</asp:Content>

