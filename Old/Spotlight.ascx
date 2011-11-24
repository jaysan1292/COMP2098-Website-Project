<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Spotlight.ascx.cs" Inherits="UserControls_Spotlight" %>
<div id="slides">
    <asp:Repeater ID="lstSpotImages" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="slide">
                <img src='Images/ItemImages/<%# Eval("Image") %>' width="500px" height="500px" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<div id="spotmenu">
    <ul>
        <li class="fbar">&nbsp;</li>
        <asp:Repeater ID="lstSpotButtons" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <li class="menuItem">
                    <a href="">
                        <img src='Images/ItemImages/<%# Eval("Thumbnail") %>' width="24px" height="24px" />
                    </a>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [JDwebstore-Item] WHERE ([OnSlides] = @OnSlides)">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="OnSlides" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>
