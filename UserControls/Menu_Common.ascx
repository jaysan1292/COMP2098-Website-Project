<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu_Common.ascx.cs" Inherits="UserControls_WebUserControl" %>
<script type="text/javascript">
    function searchFocus(searchbox) {
        if (searchbox.value == "What are you looking for?") {
            searchbox.style.color = "#000000";
            searchbox.value = "";
        }
    }

    function searchBlur(searchbox) {
        if (searchbox.value == "") {
            searchbox.style.color = "#7F7F7F";
            searchbox.value = "What are you looking for?";
        }
    }

    function checkSearch(sbox) {
        if (sbox.value == "What are you looking for?" || sbox.value == "") {
            alert("Please enter search keyword(s) and try again.");
            sbox.focus();
            return false;
        } else {
            return true;
        }

    }
</script>

<ul id="menu">
    <li id="nav-home"><asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink></li>
    <li id="nav-category"><asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl="~/Category.aspx">Categories</asp:HyperLink></li>
    <li id="nav-account"><asp:HyperLink ID="lnkAccount" runat="server" NavigateUrl="~/Account.aspx">Account</asp:HyperLink></li>
    <li id="nav-search">
        <form action="../Search.aspx" onsubmit="return checkSearch()">
            <span>
                <asp:ImageButton ID="btnSearch" runat="server" CssClass="search-L" 
                ImageUrl="~/Images/Menu/search_01.png" onclick="btnSearch_Click" 
                onclientclick="checkSearch()" PostBackUrl="~/Search.aspx"/>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="searchbox">What are you looking for?</asp:TextBox>
                <asp:DropDownList ID="lstCategories" runat="server" CssClass="searchbox-dd" 
                DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
                    <asp:ListItem>--Select a Category--</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name] FROM [JDwebstore-Category]">
            </asp:SqlDataSource>
                <asp:Image ID="Image1" runat="server" CssClass="search-R" ImageUrl="~/Images/Menu/search_02.png"/>
            </span>
        </form>
    </li>
</ul>