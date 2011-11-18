<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Spotlight.ascx.cs" Inherits="UserControls_Spotlight" %>
<div id="spotlight">
    <div id="slides">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ItemID" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="slide">
                    <img src="<%# Link.ToItemImage(Eval("Image").ToString()) %>" alt="<%# Eval("Name") %>" /></div>
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
