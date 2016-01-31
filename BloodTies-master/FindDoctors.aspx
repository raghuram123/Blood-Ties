<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FindDoctors.aspx.cs" Inherits="Default2" %>

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
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col_2"></div>
    <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Doctor_Name" HeaderText="Doctors Name" SortExpression="DoctorName"></asp:BoundField>
            <asp:BoundField DataField="Qualifications" HeaderText="Qualifications" SortExpression="Qualifications"></asp:BoundField>
            <asp:BoundField DataField="Specialization" HeaderText="Specialization" SortExpression="Specialization"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:TemplateField HeaderText=" " SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Email") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Profile" runat="server" CommandName="Profile" CommandArgument='<%# Bind("Email") %>'>Connect</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#EFF3FB"></RowStyle>

        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <div class="col_2"></div>
     <div runat="server" id="messageform">
    <div class ="col_8">
  To : <asp:Label ID="lblTo" runat="server" Text=""></asp:Label><br />
  From : <asp:Label ID="lblFrom" runat="server" Text=""></asp:Label><br />
        <textarea name="Message" id="Message" cols="20" rows="2" runat="server">
            
        </textarea>
        <asp:Button ID="Send" runat="server" Text="Send" OnClick="Send_Click" />
        </div>
        
    </div>
    <div runat="server" id="messagesent">
        <asp:Label ID="lblMsgSent" runat="server" Text="Your Message has been Sent"></asp:Label>
    </div>
   </asp:Content> 


