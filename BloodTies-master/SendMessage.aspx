<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs" Inherits="SendMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Message {
            width: 842px;
            height: 219px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="col_2" id="MsgSent">
        <asp:Label ID="lblMsgSent" runat="server" Text="<a href='ViewMessage.aspx '>Your Message has been Sent, Click to View Sent Message</a>"></asp:Label>>
        
        </div>
    <div runat="server" id="messageform">
    <div class ="col_8">
  To : <asp:Label ID="lblTo" runat="server" Text=""></asp:Label><br />
  From : <asp:Label ID="lblFrom" runat="server" Text=""></asp:Label>
        <br />
  Subject : <asp:Label ID="Sub" runat="server" Text=""></asp:Label>
        &nbsp;<asp:TextBox ID="SubText" runat="server" Height="58px" Width="733px"></asp:TextBox>
        <textarea name="Message" id="Message" runat="server">
            
        </textarea></div>
        
    </div>
    <div runat="server" id="messagesent">
        <asp:Button ID="Send" runat="server" Text="Send" OnClick="Send_Click" />
    </div>
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
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
