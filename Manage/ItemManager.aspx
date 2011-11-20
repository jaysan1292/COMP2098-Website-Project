<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="ItemManager.aspx.cs" Inherits="Manage_ItemManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.scrollTo-1.4.2.js" type="text/javascript"></script>
    <script src="../Scripts/menuanimation.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Item Management</h1>
    Select an item to modify its information.<br />
    Or, <a href="Add.aspx">add a new item.</a>
    <hr />
    <div class="itemList">
        <asp:DataList ID="lstItems" runat="server" DataSourceID="ItemDataSource">
            <AlternatingItemStyle BackColor="#F5F5F5" />
            <ItemTemplate>
                <div class="manageList">
                    <div style="width: 764px;" onmousedown="toggleSlide('<%# Eval("ItemID") %>');">
                        <span style="font-weight: normal;" id='name<%# Eval("ItemID") %>'>
                            <%# Eval("Name") %></span>
                    </div>
                    <div id="<%# Eval("ItemID") %>" class="iteminfo" style="display: none; overflow: hidden;
                        height: 285px; background: #FFF; border: 1px #F5F5F5;">
                        <hr style="width: 75%;" />
                        <%-- ITEM INFORMATION GOES HERE --%>
                        <table class="itemform" cellspacing="1" style="border-collapse: collapse;">
                            <tr>
                                <td style="width: 150px;">
                                    Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' ClientIDMode="Static"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Description:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" Height="75px" Text='<%# Eval("Description") %>'
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Keywords:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Keywords") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Price:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPrice" runat="server" Width="150px" Text='<%# Eval("Price", "{0:c}") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    On Frontpage:
                                </td>
                                <td style="text-align: left;">
                                    <asp:CheckBox ID="chkOnFront" runat="server" CssClass="checkbox" Checked='<%# Eval("OnFront") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    On Slideshow:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="chkOnSlides" runat="server" CssClass="checkbox" Checked='<%# Eval("OnSlides") %>' />
                                </td>
                            </tr>
                        </table>
                        <div style="float: right; position: relative; bottom: 67px; right: 13px;">
                            Image:
                            <img src='../Images/ItemImages/<%# Eval("Thumbnail") %>' alt="" style="width: 100px;
                                height: 100px; float: right; position: relative; top: -21px; left: 6px; border: 1px;" />
                        </div>
                        <div>
                            <span style="position: relative; left: 310px;">
                                <asp:HyperLink ID="btnSubmit" runat="server">Submit</asp:HyperLink>
                                <asp:HyperLink ID="btnCancel" runat="server">Cancel</asp:HyperLink>
                                <asp:HyperLink ID="btnDelete" runat="server">DELETE</asp:HyperLink>
                            </span>
                        </div>
                    </div>
                    </li>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="ItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [JDwebstore-Item] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [JDwebstore-Item] ([Name], [Price], [Description], [Thumbnail], [Image], [OnFront], [OnSlides], [Keywords]) VALUES (@Name, @Price, @Description, @Thumbnail, @Image, @OnFront, @OnSlides, @Keywords)"
        SelectCommand="SELECT * FROM [JDwebstore-Item] ORDER BY [Name]" UpdateCommand="UPDATE [JDwebstore-Item] SET [Name] = @Name, [Price] = @Price, [Description] = @Description, [Thumbnail] = @Thumbnail, [Image] = @Image, [OnFront] = @OnFront, [OnSlides] = @OnSlides, [Keywords] = @Keywords WHERE [ItemID] = @ItemID">
        <DeleteParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Thumbnail" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="OnFront" Type="Boolean" />
            <asp:Parameter Name="OnSlides" Type="Boolean" />
            <asp:Parameter Name="Keywords" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Thumbnail" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="OnFront" Type="Boolean" />
            <asp:Parameter Name="OnSlides" Type="Boolean" />
            <asp:Parameter Name="Keywords" Type="String" />
            <asp:Parameter Name="ItemID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
