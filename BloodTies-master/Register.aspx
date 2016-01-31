<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

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
    <div id="Registration" runat="server">
        
        <asp:Label ID="lblNotify" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblCheck" runat="server" Text=""></asp:Label>
        <br />

        <table border="0">
            <tr>
    <th colspan="2"><center>USER REGISTRATION</center></th>

  </tr>
  <tr>
    <td><asp:Label ID="lblEmail" runat="server" Text="Email ID"></asp:Label></td>
    <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter Email"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validateEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
      </td>
  </tr>
  <tr>
    <td><asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></td>
    <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>
      </td>
  </tr>
              <tr>
    <td><asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label></td>
    <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>
                  </td>
  </tr>
                    <tr>
    <td><asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label></td>
    <td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                        </td>
  </tr>
                   <tr>
    <td><asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label></td>
    <td><asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Please Enter Confirmation Password"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Password and Confirm Password doesn't match"></asp:CompareValidator>
                       </td>
  </tr>
                   <tr>
    <td><asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label></td>
    <td><asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Please Enter Address"></asp:RequiredFieldValidator>
                       </td>
  </tr>
               <tr>
    <td><asp:Label ID="lblCity" runat="server" Text="City"></asp:Label></td>
    <td><asp:TextBox ID="txtCity" runat="server" OnTextChanged="txtCity_TextChanged"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Please Enter City"></asp:RequiredFieldValidator>
                   </td>
  </tr>
               <tr>
    <td><asp:Label ID="lblPhone" runat="server" Text="PhoneNumber"></asp:Label></td>
    <td><asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Please Enter Phone Number"></asp:RequiredFieldValidator>
                   </td>
  </tr>
                 <tr>
    <td><center><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="large blue" OnClick="btnSubmit_Click"></asp:Button></center></td>
   
  </tr>
                  <tr>
   <td><asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label></td>
                       </tr>
              
</table>
       </div>
   <div id="MessageSuccess" runat="server">
       <asp:Label ID="Success" runat="server" Text=""></asp:Label>
       <a href="Default.aspx">Click here to Login</a>
   </div>
</asp:Content>


