<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu_Common.ascx.cs" Inherits="UserControls_WebUserControl" %>
<script src="../Scripts/jquery-1.7.min.js" type="text/javascript"></script>
<script src="../Scripts/jquery.easing.1.3.js" type="text/javascript"></script>
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

    $(document).ready(function () {
        $("#nav-category").hover(
            function () {
                $('#submenu-category', this).slideDown(250, 'easeInOutCubic');
                $('a', this).addClass('active');
            },
            function () {
                $('#submenu-category', this).slideUp(150, 'easeInOutCubic');
                $('a', this).removeClass('active');
            }
        );
    });
</script>
<ul id="menu">
    <li id="nav-home">
        <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink></li>
    <li id="nav-category">
        <asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl="javascript:;">Categories</asp:HyperLink>
        <ul id="submenu-category">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <li class="submenu-item">
                        <asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl='<%# Link.ToCategory(Eval("CategoryID").ToString()) %>'><%# Eval("Name") %></asp:HyperLink>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
    <li id="nav-account">
        <asp:HyperLink ID="lnkAccount" runat="server" NavigateUrl="~/Account.aspx">Account</asp:HyperLink></li>
    <li id="nav-search">
        <form action="../Search.aspx" onsubmit="return checkSearch()">
        <span>
            <asp:ImageButton ID="btnSearch" runat="server" CssClass="search-L" ImageUrl="~/Images/Menu/search_01.png" OnClick="btnSearch_Click" OnClientClick="checkSearch()" PostBackUrl="~/Search.aspx" />
            <asp:TextBox ID="txtSearch" runat="server" CssClass="searchbox">What are you looking for?</asp:TextBox>
            <asp:DropDownList ID="lstCategories" runat="server" CssClass="searchbox-dd" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="True">
                <asp:ListItem>All Categories</asp:ListItem>
            </asp:DropDownList>
            <asp:Image ID="Image1" runat="server" CssClass="search-R" ImageUrl="~/Images/Menu/search_02.png" />
        </span>
        </form>
    </li>
</ul>
<!--<div id="submenu-category">
    <asp:Repeater ID="lstCategory" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="submenu-item">
                <asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl='<%# Link.ToCategory(Eval("CategoryID").ToString()) %>'><%# Eval("Name") %></asp:HyperLink>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>-->
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CategoryID, Name FROM [JDwebstore-Category] WHERE (CategoryID &lt;&gt; 0)"></asp:SqlDataSource>
