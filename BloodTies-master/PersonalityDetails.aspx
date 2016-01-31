<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PersonalityDetails.aspx.cs" Inherits="Default2" %>

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
    <%--<style type="text/css">
        .auto-style2 {
            text-align: center;
            background-color: #003399;
            border-color: #808080;
            border-width: 3px;
        }
        .MsoNormal {
            color: #000099;
            font-weight: 700;
            font-family: an;
            margin-left: 0px;
            background-color: #CCCCCC;
        }
        .auto-style5 {
            font-size: medium;
            font-family: an;
            background-color: #CCCCCC;
        }
        .auto-style6 {
            font-family: an;
            color: #FFFFFF;
            font-size: x-large;
            background-color: #003399;
        }
        .auto-style9 {
            font-family: Andalus;
            font-size: small;
        }
        .auto-style10 {
            font-family: an;
            font-weight: bold;
        }
        .auto-style11 {
            font-family: an;
        }
        .auto-style15 {
            font-family: Andalus;
        }
        .auto-style16 {
            font-weight: bold;
            background-color: #CCCCCC;
        }
        .auto-style17 {
            font-family: Andalus;
            font-weight: bold;
            color: #000099;
        }
        .auto-style18 {
            font-family: Andalus;
            color: #000000;
        }
        .auto-style19 {
            color: #FFFFFF;
            font-weight: 700;
            font-family: an;
            background-color: #CCCCCC;
        }
        .auto-style20 {
            background-color: #CCCCCC;
        }
        .auto-style21 {
            font-family: Andalus;
            font-weight: bold;
            background-color: #CCCCCC;
        }
        .auto-style22 {
            font-family: Andalus;
            background-color: #CCCCCC;
        }
        .auto-style23 {
            font-family: an;
            background-color: #CCCCCC;
        }--%>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style2">
        <strong><span class="auto-style6">Personality Question Answer</span><br class="auto-style6" />
        </strong>
    </p>
   
<p >
        <b>1.According to you, the greatest skill in leadership is:&nbsp;&nbsp;&nbsp;&nbsp;
        </b>
    </p>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
        <asp:ListItem Value="Followers">Knowing when to step back and let others lead</asp:ListItem>
        <asp:ListItem Value="Followers">Knowing how to make it look as if you are consulting others</asp:ListItem>
        <asp:ListItem Value="Leaders">Knowing when to consult others</asp:ListItem>
        <asp:ListItem Value="Leaders">Knowing when to get more of it</asp:ListItem>
    </asp:RadioButtonList>
    <p>
        <b > 2. Your firm announces they&#39;re organizing a softball team for an inter-office tournament. Do you:  </span></b></p>
    <p >
        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
            <asp:ListItem Value="Followers">Go and hide in the bathroom until the team has been picked</asp:ListItem>
            <asp:ListItem Value="Followers">Say you&#39;ll be happy to play if needed</asp:ListItem>
            <asp:ListItem Value="Leaders">Announce that you&#39;ll be captain, pitcher and first bat</asp:ListItem>
            <asp:ListItem Value="Leaders">Say you&#39;ll be glad to drive the gear to the ground</asp:ListItem>
        </asp:RadioButtonList>
          
    </p>
    <p>
         <b >3. A man/woman you know has just bought a pair of jeans you really like, but they aren&#39;t very popular. If you buy the jeans and back up your friend, you could risk getting rejected too. If you don&#39;t, you would save yourself from humiliation</span></b> </p>
    <asp:RadioButtonList ID="RadioButtonList3" runat="server" >
        <asp:ListItem Value="Followers">You only buy them if you see a more popular person wearing them so you don&#39;t get rejected for your fashion statement</asp:ListItem>
        <asp:ListItem Value="Leaders">Buy the jeans anyway. You really like them and you don&#39;t want to leave your friend hanging</asp:ListItem>
    </asp:RadioButtonList>
    <p >
         <b > 4. When you were a kid and your friends dared you to do something crazy (ring the doorbell of that mean old man and run away), did you usually take on the dare?</span></b> </p>
    <p >
        <asp:RadioButtonList ID="RadioButtonList4" runat="server" >
            <asp:ListItem Value="Followers">Nope. Those who run away live to run another day</asp:ListItem>
            <asp:ListItem Value="Leaders">Yes, and I even went a step further just to freak them out.</asp:ListItem>
        </asp:RadioButtonList>
          
    </p>
    <p >
        <b >5. Prefer to:</b></p>
    <p>
        <asp:RadioButtonList ID="RadioButtonList5" runat="server">
            <asp:ListItem Value="Followers">Let things take their course</asp:ListItem>
            <asp:ListItem Value="Followers">Observe what is going on
            </asp:ListItem>
            <asp:ListItem Value="Leaders">Do things
            </asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p >
        <b > 6. You are best described as…  </b></p>
    <asp:RadioButtonList ID="RadioButtonList6" runat="server" >
        <asp:ListItem Value="Idealistic">Creative</asp:ListItem>
        <asp:ListItem Value="Idealistic">Outgoing</asp:ListItem>
        <asp:ListItem Value="Idealistic">Funny</asp:ListItem>
        <asp:ListItem Value="Rationalistic">Organized</asp:ListItem>
        <asp:ListItem Value="Rationalistic">Responsible</asp:ListItem>
    </asp:RadioButtonList>
    <p >
        <b >7. Qualities I value most:  </b></p>
    <p>
        <asp:RadioButtonList ID="RadioButtonList7" runat="server">
            <asp:ListItem Value="Idealistic">Tolerance and love of people
            </asp:ListItem>
            <asp:ListItem Value="Idealistic">Love of power and relationships
            </asp:ListItem>
            <asp:ListItem Value="Rationalistic">Highly developed self awareness</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p>
     <b>  8. Check one that applies most to you:</b></p>
    <asp:RadioButtonList ID="RadioButtonList8" runat="server" >
        <asp:ListItem Value="Idealistic">I have a dream, a hope to achieve….
        </asp:ListItem>
        <asp:ListItem Value="Rationalistic">I have achieved everything I planned to….
        </asp:ListItem>
    </asp:RadioButtonList>
    <p>
   <b>   9. Does the following statements apply to you:</b> </p>
    <ul type="disc">
        <li >I prefer to be in the center of things; I have lots of friends and love company</li>
        <li >I like to organize my leisure time actively and together with others</li>
    </ul>
    <p>
        <asp:RadioButtonList ID="RadioButtonList9" runat="server" >
            <asp:ListItem Value="Extrovert">Yes</asp:ListItem>
            <asp:ListItem Value="Introvert">No</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p >
        <b >10. When in a group I like to..  </b></p>
    <asp:RadioButtonList ID="RadioButtonList10" runat="server" >
        <asp:ListItem Value="Introvert">Takeoff</asp:ListItem>
        <asp:ListItem Value="Introvert">I am lost</asp:ListItem>
        <asp:ListItem Value="Extrovert">Mingle</asp:ListItem>
        <asp:ListItem Value="Extrovert">Take charge</asp:ListItem>
    </asp:RadioButtonList>
    <p >
       <b>  11. I quickly feel drained when in a large crowd of people. </b></p>
    <p>
        <asp:RadioButtonList ID="RadioButtonList11" runat="server" >
            <asp:ListItem Value="Introvert">Characteristic</asp:ListItem>
            <asp:ListItem Value="Introvert">Very characteristic or true, strongly agree</asp:ListItem>
            <asp:ListItem Value="Extrovert">Uncharacteristic
            </asp:ListItem>
            <asp:ListItem Value="Extrovert">Very uncharacteristic or untrue, strongly disagree
            </asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p >
        <b >12. Things I like most..  </b></p>
    <p>
        <asp:RadioButtonList ID="RadioButtonList12" runat="server" >
            <asp:ListItem Value="Inactive">Eating</asp:ListItem>
            <asp:ListItem Value="Inactive">Sleeping</asp:ListItem>
            <asp:ListItem Value="Active">Exercising</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p>
     <b> 13. I like adventures and sports: &nbsp;&nbsp; </b>
    </p>
    <p>
        <asp:RadioButtonList ID="RadioButtonList13" runat="server" >
            <asp:ListItem Value="Inactive">False</asp:ListItem>
            <asp:ListItem Value="Active">True</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <p>
        <span class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:Button ID="Button1" text ="Save" runat="server" CssClass="large blue" OnClick="Button1_Click" />
        <span class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp; </span>
         </p>
    <p class="auto-style20">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
    </p>
</asp:Content>

