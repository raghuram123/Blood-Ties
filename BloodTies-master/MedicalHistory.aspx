<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MedicalHistory.aspx.cs" Inherits="Default2" %>

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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:Label ID="LabelMHheader" runat="server" Font-Size="XX-Large" Font-Underline="True" Text="Medical History"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Panel ID="Panel1" runat="server" BackColor="LightGray" BorderColor="Black" BorderStyle="Solid" Height="100px" ScrollBars="Vertical">
        <asp:Label ID="Label10" runat="server" Font-Size="X-Large" Text="Section 1: Patient Information"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:ListBox ID="ListBoxPI" runat="server" Height="102px" Width="656px"></asp:ListBox>
        <br />
        <br />
        <br />
        <br />
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
        </p>
    <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" Height="471px" ScrollBars="Vertical">
        <asp:Label ID="Label7" runat="server" Font-Size="X-Large" Text="Section 2 : Personal Health History"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1a" runat="server" Text="2.a  Have you EVER had, or do have any of the following illnessess/symptoms:"></asp:Label>
        <br />
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Illnes_Name" DataValueField="Illnes_Name">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BloodTiesDbConnectionString %>" SelectCommand="SELECT [Illnes_Name] FROM [Illness_LookUp_Tbl]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Label ID="Label1b" runat="server" Text="2.b    If your condition is not listed, please enter it ."></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBoxNewIllness" runat="server" Font-Size="Medium" Height="37px" Width="447px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="2.c Provide any additional explanations for the checked boxes."></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBoxIllnessinfo" runat="server" Font-Size="Medium" Height="33px" style="margin-bottom: 0px" Width="448px"></asp:TextBox>
        <br />
        <br />
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="ButtonSec2" runat="server" Height="106px" OnClick="ButtonSec2_Click" Text="Update Section 2" Width="365px" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        </p>
    <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" Height="471px" ScrollBars="Vertical">
        <asp:Label ID="Label15" runat="server" Font-Size="X-Large" Text="Section 3 : Family History"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label16" runat="server" Text=" Please check the appropiate box  for the following questions (one per question):"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label17" runat="server" Text="3.a   Heart Disease?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBoxHD" runat="server" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;<br />
        <asp:Label ID="Label18" runat="server" Text="3.b Cancer?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:CheckBox ID="CheckBoxCancer" runat="server" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label19" runat="server" Text="3.c High Blood Presure?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBoxHBP" runat="server" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label20" runat="server" Text="3.d Depression?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:CheckBox ID="CheckBoxDep" runat="server" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        &nbsp;&nbsp;<br />
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="ButtonSec3" runat="server" Height="106px" Text="Update Section 3" Width="365px" OnClick="ButtonSec3_Click" />
    </p>
    <p>
        </p>
    <p>
        </p>
    <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" Height="471px" ScrollBars="Vertical">
        <asp:Label ID="Label8" runat="server" Font-Size="X-Large" Text="Section 4 : Additional Information"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=" Please check the appropiate box  for the following questions (one per question):"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="3.a   Are you a smoker?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBoxS" runat="server" />
        <br />
&nbsp;<br />
        <asp:Label ID="Label3" runat="server" Text="3.b Women: Are you pregnant?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBoxP" runat="server" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="3.c Women: Are you taking birth control pills?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:CheckBox ID="CheckBoxC" runat="server" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="3.d Are you currently on any medications?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBoxM" runat="server" />
        <br />
        <br />
        <asp:Label ID="Label9" runat="server" Text="3.e Do you have any allergies?"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBoxA" runat="server" />
        <br />
        <br />
        <asp:Label ID="Label21" runat="server" Text="3.f If you have allergies, list them"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxAllergies" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="ButtonSec4" runat="server" Height="106px" Text="Update Section 4" Width="365px" OnClick="ButtonSec4_Click" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <asp:Panel ID="Panel5" runat="server" BorderStyle="Solid" BorderWidth="4px" Font-Bold="False" Height="471px" ScrollBars="Vertical">
        <asp:Label ID="Label22" runat="server" Font-Size="X-Large" Text="Section 5 : Upload Document"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label23" runat="server" Text=""></asp:Label>
        <br />
  

    <div>  

   <table>

    <tr>

    <td> 

        

        </td>

        <td>

        <asp:FileUpload ID="selectUploadFile" runat="server" ToolTip="Select Only Excel File" Width="537px" />

        </td>

        <td> 

        <asp:Button ID="Button1" runat="server" Text="Upload" onclick="Button1_Click" />

        </td>

        <td>
 

            <asp:Button ID="Button2" runat="server" Text="View Files" 

                onclick="Button2_Click" />

               </td>

        </tr>
 

</table>

<table><tr><td><p>&nbsp;</p></td></tr></table>

 

<asp:GridView ID="GridView1" runat="server" Caption="Excel Files " 

        CaptionAlign="Top" HorizontalAlign="Justify" 

         DataKeyNames="UploadedDocID" onselectedindexchanged="GridView1_SelectedIndexChanged" 

        ToolTip="Excel FIle DownLoad Tool" CellPadding="4" ForeColor="#333333" 

        GridLines="None">

        <RowStyle BackColor="#E3EAEB" />

        <Columns>

            <asp:CommandField ShowSelectButton="True" SelectText="Download" ControlStyle-ForeColor="Blue"/>

        </Columns>

        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />

        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />

        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

        <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />

        <EditRowStyle BackColor="#7C6F57" />

        <AlternatingRowStyle BackColor="White" />

    </asp:GridView> 

    </div>

    </asp:Panel>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
