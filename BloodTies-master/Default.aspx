<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
       
        <div class="col_12" runat="server" id="DetailsOfProject">
    <p align="justify">Blood Ties is a project intended to connect people with similar illnesses together. In today’s world there are abundant social media platforms available for use, while this works well for most of us to share and connect when it comes to people with serious health issues these platforms lack the privacy required. Hence we have an application “Blood Ties”.</p>
       <br /><br /><br /><br />
             </div>
      

          
          <div runat="server" id="PatientLogin" class="col_6">
              Patient
              <br /><br />
             
              <asp:Button ID="PatientLoginButton" runat="server" Text="Login" CssClass="large blue" OnClick="PatientLoginButton_Click"></asp:Button>
             <br />   <br />
     <asp:Button ID="PatientRegisterButton" runat="server" Text="Register" CssClass="large green" OnClick="PatientRegisterButton_Click"></asp:Button>
           
 
               <br /><br />
        </div>
           <div runat="server" id="DoctorLogin" class="col_6">
              Doctor
               <br /><br />
                <asp:Button ID="DoctorLoginButton" runat="server" Text="Login" CssClass="large blue" OnClick="DoctorLoginButton_Click"></asp:Button>
             <br /><br />
                 <asp:Button ID="DoctorRegisterButton" runat="server" Text="Register" CssClass="large green"  OnClick="DoctorRegisterButton_Click"></asp:Button>
        
<div id="LoginModule" runat="server">
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
        </div>

         </center>
    <br /> <br />
        </div>


      
  
       </center>

</asp:Content>

