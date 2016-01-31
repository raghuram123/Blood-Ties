<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DoctorProfile.aspx.cs" Inherits="Default2" %>

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
    <asp:Button ID="Text" runat="server" Text="Contact" CssClass="large blue" OnClick="Text_Click" />
    <br /> <br />
    <table border="0">
  <tr>
    <td class="auto-style2"> Doctor Name </td>
    <td><asp:Label ID="lblDoctorName" runat="server" Text=""></asp:Label></td>
  </tr>
  <tr>
    <td class="auto-style2"> Qualifications</td>
    <td><asp:Label ID="lblQualifications" runat="server" Text=""></asp:Label></td>
  </tr>
 <tr>
    <td class="auto-style2"> Specialization </td>
    <td><asp:Label ID="lblSpecialization" runat="server" Text=""></asp:Label></td>
  </tr>
         <tr>
    <td class="auto-style2"> Email </td>
    <td><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
  </tr>
        <tr>
    <td class="auto-style2"> Contact Number </td>
    <td><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></td>
  </tr>
 
   <tr>
    <td class="auto-style2"> Address </td>
    <td><asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></td>
  </tr>
            <tr>
    <td class="auto-style2"> Professional Fees</td>
    <td><asp:Label ID="lblProfessionalFees" runat="server" Text=""></asp:Label></td>
  </tr>
          <tr>
    <td class="auto-style2"> Clinic Name </td>
    <td><asp:Label ID="lblClinicName" runat="server" Text=""></asp:Label></td>
  </tr>
            <tr>
    <td class="auto-style2"> Timings </td>
    <td><asp:Label ID="lblTimings" runat="server" Text=""></asp:Label></td>
  </tr>
     
</asp:Content>

