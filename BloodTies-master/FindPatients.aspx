<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FindPatients.aspx.cs" Inherits="Default2" %>

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
  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>

            <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo"></asp:BoundField>
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


