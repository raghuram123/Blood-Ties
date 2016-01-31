<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Doctor.aspx.cs" Inherits="Default3" %>

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
    <div id="c1" runat="server">
    <p>
        <span class="auto-style6"><strong>General </strong></span><strong><span class="auto-style2">Information</span></strong><br class="auto-style5" />
    </p>
    <p>
        <span class="auto-style3">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="auto-style7">&nbsp;
        </span>
        <asp:TextBox ID="lblDocName1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p>
        <span class="auto-style3">Qualifications&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:TextBox ID="lblQualifications1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p>
        <span class="auto-style3">Specialization&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:TextBox ID="lblSpecialization1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p>
        <span class="auto-style3">Contact Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:TextBox ID="lblnumer1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p>
        <span class="auto-style3">Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:TextBox ID="lbladdress1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p>
        <span class="auto-style3">Professional fees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:TextBox ID="lblfees1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p>
        <span class="auto-style3">Hospital/Clinic name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><asp:TextBox ID="lblclinicname1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p>
        <span class="auto-style3">Hospital/Clininc timings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:TextBox ID="lblclinicatiming1" runat="server" CssClass="auto-style3" Width="280px"></asp:TextBox>
    </p>
    <p style="margin-left: 400px">
        <asp:Button ID="Button1" runat="server" CssClass="auto-style5" style="text-align: center" Text="Save" OnClick="Save_Click" />
    </p>
    <p style="margin-left: 400px">
        &nbsp;</p>
</div>  
<div id="c2" runat="server">

     <table border="0">
  <tr>
    <td class="auto-style2"> Name </td>
    <td><asp:Label runat="server" Text="" id="lblDoctorName"></asp:Label></td>
  </tr>
  <tr>
    <td class="auto-style2"> Qualification </td>
    <td><asp:Label runat="server" Text="" id="lblQualifications"></asp:Label></td>
  </tr>
         <tr>
    <td class="auto-style2"> Specialization </td>
    <td><asp:Label runat="server" Text="" id="lblSpecialization"></asp:Label></td>
  </tr>
           <tr>
    <td class="auto-style2"> Professional Fees </td>
    <td><asp:Label runat="server" Text="" id="lblProfessionalFees"></asp:Label></td>
  </tr>
           <tr>
    <td class="auto-style2"> Clinic Name </td>
    <td><asp:Label runat="server" Text="" id="lblClinicName"></asp:Label></td>
  </tr>
           <tr>
    <td class="auto-style2"> Timings </td>
    <td><asp:Label runat="server" Text="" id="lblTimings"></asp:Label></td>
  </tr>

</div>
</div>
</asp:Content>

