<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Spotlight.ascx.cs" Inherits="UserControls_Spotlight" %>
<div id="spotlight">
    <div id="slides">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ItemID" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <%--<div class="slide">
                    <img src="<%# Link.ToItemImage(Eval("Image").ToString()) %>" alt="<%# Eval("Name") %>" /></div>--%>
                <div id="gallery">
                    <div id="slides">
                        <div class="slide">
                            <img src="Images/Spotlight/macbook.jpg" width="780" height="400" /></div>
                        <div class="slide">
                            <img src="Images/Spotlight/iphone.jpg" width="780" height="400" /></div>
                        <div class="slide">
                            <img src="Images/Spotlight/imac.jpg" width="780" height="400" /></div>
                    </div>
                    <div id="menu">
                        <ul>
                            <li class="fbar">&nbsp;</li><li class="menuItem"><a href="">
                                <img src="Images/Spotlight/thumb_macbook.png" /></a></li>
                            <li class="menuItem"><a href="">
                                <img src="Images/Spotlight/thumb_iphone.png" /></a></li>
                            <li class="menuItem"><a href="">
                                <img src="Images/Spotlight/thumb_imac.png" /></a></li>
                        </ul>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM [JDwebstore-Item] WHERE ([OnSlides] = @OnSlides)">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="OnSlides" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>
