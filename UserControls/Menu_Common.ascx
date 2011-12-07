<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu_Common.ascx.cs" Inherits="UserControls_WebUserControl" %>
<script src="../Scripts/jquery-1.7.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).bind('ready', function () {
        $('.search-L').removeAttr('onclick');
        $('.search-L').on('click', function () {
            if (!checkSearch()) {
                alert("Please enter search keyword(s) and try again.");
                return false;
            } else {
                //navigate to Search.aspx?q=<query>
                var param = { q: $('.searchbox').val() };
                var queryString = $.param(param);

                //$('#header-main').append('<a href="<% =Request.ApplicationPath %>/Search.aspx?' + queryString + '" id="searchLink" style="display:none;"></a>');
                //$('#searchLink').click();
                window.location = '<%=Request.ApplicationPath%>/Search.aspx?' + queryString;
                return false;
            }

        });
        $('.searchbox').bind('keydown', function (e) {
            if (e.which == 13) {
                if (checkSearch()) $('.search-L').trigger('click');
            }
        });
    });


    function searchFocus(searchbox) {
        if ($(searchbox).val() == "What are you looking for?") {
            $(searchbox).css('color', '#000000');
            $(searchbox).val("");
        }
    }

    function searchBlur(searchbox) {
        if ($(searchbox).val() == "") {
            $(searchbox).css('color', '#7F7F7F');
            $(searchbox).val("What are you looking for?");
        }
    }

    function checkSearch() {
        var sbox = document.getElementById('<% =txtSearch.ClientID %>');
        if (sbox.value == "What are you looking for?" || sbox.value == "") {
            sbox.focus();
            return false;
        } else {
            return true;
        }
    }
</script>
<ul id="menu">
    <li id="nav-home">
        <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink></li>
    <li id="nav-category" class="top-menu">
        <asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl="javascript:;">Categories</asp:HyperLink>
        <ul id="submenu-category" class="submenu">
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
        <asp:HyperLink ID="lnkAccount" runat="server" NavigateUrl="~/Account.aspx">Account</asp:HyperLink>
    </li>
    <li id="nav-search"><span>
        <asp:ImageButton ID="btnSearch" runat="server" CssClass="search-L" ImageUrl="~/Images/Menu/search_01.png" PostBackUrl="~/Search.aspx" ValidationGroup="Search" />
        <asp:TextBox ID="txtSearch" runat="server" CssClass="searchbox" ValidationGroup="Search">What are you looking for?</asp:TextBox>
        <asp:Image ID="Image1" runat="server" CssClass="search-R" ImageUrl="~/Images/Menu/search_02.png" />
    </span></li>
</ul>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CategoryID, Name FROM [JDwebstore-Category] WHERE (CategoryID &lt;&gt; 0)"></asp:SqlDataSource>
