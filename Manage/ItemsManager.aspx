<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="ItemsManager.aspx.cs" Inherits="Manage_ItemsManager" %>

<%@ Register Src="../UserControls/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<%-- TO DO: ADD SUPPORT FOR PRODUCT CATEGORIES --%>

    <uc1:Pager ID="PagerTop" runat="server" Visible="False" />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="ItemManagerSource">
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
    <asp:SqlDataSource ID="ItemManagerSource" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [JDwebstore-Item] WHERE [ItemID] = @original_ItemID AND [Name] = @original_Name AND [Price] = @original_Price AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Thumbnail] = @original_Thumbnail) OR ([Thumbnail] IS NULL AND @original_Thumbnail IS NULL)) AND (([Image] = @original_Image) OR ([Image] IS NULL AND @original_Image IS NULL)) AND (([OnFront] = @original_OnFront) OR ([OnFront] IS NULL AND @original_OnFront IS NULL))"
        InsertCommand="INSERT INTO [JDwebstore-Item] ([Name], [Price], [Description], [Thumbnail], [Image], [OnFront]) VALUES (@Name, @Price, @Description, @Thumbnail, @Image, @OnFront)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [JDwebstore-Item]"
        UpdateCommand="UPDATE [JDwebstore-Item] SET [Name] = @Name, [Price] = @Price, [Description] = @Description, [Thumbnail] = @Thumbnail, [Image] = @Image, [OnFront] = @OnFront WHERE [ItemID] = @original_ItemID AND [Name] = @original_Name AND [Price] = @original_Price AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Thumbnail] = @original_Thumbnail) OR ([Thumbnail] IS NULL AND @original_Thumbnail IS NULL)) AND (([Image] = @original_Image) OR ([Image] IS NULL AND @original_Image IS NULL)) AND (([OnFront] = @original_OnFront) OR ([OnFront] IS NULL AND @original_OnFront IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ItemID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Thumbnail" Type="String" />
            <asp:Parameter Name="original_Image" Type="String" />
            <asp:Parameter Name="original_OnFront" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Thumbnail" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="OnFront" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Thumbnail" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="OnFront" Type="Boolean" />
            <asp:Parameter Name="original_ItemID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Thumbnail" Type="String" />
            <asp:Parameter Name="original_Image" Type="String" />
            <asp:Parameter Name="original_OnFront" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
