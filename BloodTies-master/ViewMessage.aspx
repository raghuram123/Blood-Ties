<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMessage.aspx.cs" Inherits="ViewMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Label ID="Sub" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>
        <p>
        <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        </p>
        FROM: <asp:Label ID="From" runat="server" Font-Bold="True"></asp:Label> 
        TO: <asp:Label ID="To" runat="server" Font-Bold="True"></asp:Label>
        <p>
            <asp:Button ID="Reply" runat="server" style="margin-bottom: 21px" Text="Reply" OnClick="Reply_Click" />
        </p>
    </form>
</body>
</html>
