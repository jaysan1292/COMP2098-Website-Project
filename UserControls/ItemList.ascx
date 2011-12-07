<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ItemList.ascx.cs" Inherits="UserControls_ItemList" %>
<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<style>
    .ItemName {
        font-size: 12pt;
    }
    .ItemListContainer {
        text-align: center;
        box-shadow: 0px 0px 10px #AAA;
        border-top-left-radius: 7px;
        border-top-right-radius: 7px;
        border-bottom-left-radius: 7px;
        border-bottom-right-radius: 7px;
        width: 216px;
        height: 250px;
        padding: 25px;
        margin-top: 5px;
        margin-bottom: 5px;
        margin-left: 0px;
        margin-right: 10px;
        font-size: 9pt;
    }
    .pager {
        font-size: 11pt;
        color: #444;
        display: block;
        padding: 10px;
        box-shadow: 0px 0px 10px #AAA;
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#E5E5E5), color-stop(100%,#A3A3A3));
        border-top-left-radius: 7px;
        border-top-right-radius: 7px;
        border-bottom-left-radius: 7px;
        border-bottom-right-radius: 7px;
        margin-top: 15px;
        margin-bottom: 5px;
    }
</style>
<uc1:Pager ID="PagerTop" runat="server" Visible="False" />
<asp:DataList ID="lstItems" runat="server" RepeatColumns="2">
    <ItemTemplate>
        <div class="ItemListContainer">
            <h3 class="ItemName">
                <a href="<%# Link.ToItem(Eval("ItemID").ToString()) %>">
                    <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
                </a>
            </h3>
            <a href="<%# Link.ToItem(Eval("ItemID").ToString()) %>">
                <img width="100" style="border: 0px;" src="<%# Link.ToItemImage(Eval("Thumbnail").ToString()) %>" alt='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
            </a>
            <p>
                Price:
                <%# Eval("Price", "{0:c}") %>
            </p>
        </div>
    </ItemTemplate>
</asp:DataList>
<uc1:Pager ID="PagerBottom" runat="server" Visible="False" />
