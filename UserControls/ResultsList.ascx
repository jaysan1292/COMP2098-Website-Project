<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResultsList.ascx.cs" Inherits="UserControls_ResultsList" %>
<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<uc1:Pager ID="PagerTop" runat="server" Visible="False" />
<asp:DataList ID="lstResults" runat="server">
    <ItemTemplate>
        <li class="match">
            <div class="product-image">
                <img width="100" style="border: 0px;" src="<%# Link.ToItemImage(Eval("Thumbnail").ToString()) %>"
                    alt='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
            </div>
            <div class="product-info">
                <h4>
                    <a href="<%# Link.ToItem(Eval("ItemID").ToString()) %>">
                        <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
                    </a>
                </h4>
                <p class="product-description">
                    <%# Eval("Description") %>
                    <a href="<%# Link.ToItem(Eval("ItemID").ToString()) %>">Details &gt;&gt;</a></p>
            </div>
            <div class="product-price">
                <h4>
                    <span class="price">
                        <%# Eval("Price", "{0:c}") %></span></h4>
            </div>
        </li>
    </ItemTemplate>
</asp:DataList>
<uc1:Pager ID="PagerBottom" runat="server" Visible="False" />
