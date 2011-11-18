<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ItemList.ascx.cs" Inherits="UserControls_ItemList" %>
<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<uc1:Pager ID="PagerTop" runat="server" Visible="False" />
<asp:DataList ID="lstItems" runat="server" RepeatColumns="2">
    <ItemTemplate>
        <h3 class="ItemName">
            <a href="<%# Link.ToItem(Eval("ItemID").ToString()) %>">
                <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
            </a>
        </h3>
        <a href="<%# Link.ToItem(Eval("ItemID").ToString()) %>">
            <img width="100" style="border: 0px;" src="<%# Link.ToItemImage(Eval("Thumbnail").ToString()) %>"
                alt='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
        </a>
        <p>
            Price:
            <%# Eval("Price", "{0:c}") %>
        </p>
    </ItemTemplate>
</asp:DataList>
<uc1:Pager ID="PagerBottom" runat="server" Visible="False" />
