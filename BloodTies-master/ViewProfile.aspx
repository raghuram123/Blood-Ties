<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="Default2" %>

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
     <style type="text/css">
         .auto-style2 {
             width: 232px;
         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="lblUID" runat="server" Text=""></asp:Label>
    <br /> <br />
    <table border="0">
  <tr>
    <td class="auto-style2"> First Name </td>
    <td><asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label></td>
  </tr>
  <tr>
    <td class="auto-style2"> Last Name </td>
    <td><asp:Label ID="lblLastName" runat="server" Text=""></asp:Label></td>
  </tr>
 <tr>
    <td class="auto-style2"> Email ID</td>
    <td><asp:Label ID="lblEmailID" runat="server" Text=""></asp:Label></td>
  </tr>
 <tr>
    <td class="auto-style2"> Address </td>
    <td><asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></td>
  </tr>
 <tr>
    <td class="auto-style2"> City </td>
    <td><asp:Label ID="lblCity" runat="server" Text=""></asp:Label></td>
  </tr>
 <tr>
    <td class="auto-style2"> Phone Number </td>
    <td><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></td>
  </tr>
<%--         <tr>
    <td class="auto-style2"> Leadership Trait </td>
    <td><asp:Label ID="lblLeadership" runat="server" Text=""></asp:Label></td>
  </tr>
         <tr>
    <td class="auto-style2"> Thinking Trait </td>
    <td><asp:Label ID="lblThinking" runat="server" Text=""></asp:Label></td>
  </tr>
        
            <tr>
    <td class="auto-style2"> Active Trait </td>
    <td><asp:Label ID="lblActive" runat="server" Text=""></asp:Label></td>
  </tr>
        
            <tr>
    <td class="auto-style2"> Extrovert Trait </td>
    <td><asp:Label ID="lblExtrovert" runat="server" Text=""></asp:Label></td>
  </tr>--%>
          <tr>
    <td class="auto-style2"> Additional Information </td>
    <td><asp:Label ID="lblInfo" runat="server" Text=""></asp:Label></td>
  </tr>
            <tr>
    <td class="auto-style2"> Family History </td>
    <td><asp:Label ID="lblFamilyHistory" runat="server" Text=""></asp:Label></td>
  </tr>
     
</asp:Content>

