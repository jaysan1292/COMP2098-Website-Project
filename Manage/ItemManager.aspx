<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="ItemManager.aspx.cs" Inherits="Manage_ItemManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/menuanimation.js" type="text/javascript"></script>
    <script src="../Scripts/itemmanager.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Item Management</h1>
    Select an item to modify its information.<br />
    Or, <a href="javascript:;" onclick="hideAll(); showLightbox();">add a new item.</a>
    <hr />
    <div class="itemList-header" style="width: 780px; font-weight: bold; background: #ECECEC;">
        <div style="width: 50px; display: inline-block;">
            ItemID
        </div>
        Name
    </div>
    <div class="itemList">
        <asp:DataList ID="lstItems" runat="server" DataSourceID="ItemDataSource" 
            onitemcreated="lstItems_ItemCreated">
            <AlternatingItemStyle BackColor="#F3F3F3" />
            <ItemTemplate>
                <!-- Original Values -->
                <asp:HiddenField ID="hidItemID" runat="server" Value='<%# Eval("ItemID") %>' ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidName" runat="server" Value='<%# Eval("Name") %>' ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidDescription" runat="server" Value='<%# Eval("Description") %>'
                    ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidPrice" runat="server" Value='<%# Eval("Price","{0:c}") %>'
                    ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidKeywords" runat="server" Value='<%# Eval("Keywords") %>'
                    ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidImage" runat="server" Value='<%# Eval("Image") %>' ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidCategory" runat="server" Value='<%# Eval("CategoryID") %>'
                    ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidOnFront" runat="server" Value='<%# Eval("OnFront") %>' ClientIDMode="Predictable" />
                <asp:HiddenField ID="hidOnSlides" runat="server" Value='<%# Eval("OnSlides") %>'
                    ClientIDMode="Predictable" />
                <!-- End Original Values -->
                <div class="manageList">
                    <div class="itemheader" style="width: 764px;" onmousedown="toggleSlide('<%# Eval("ItemID") %>');">
                        <span style="font-weight: normal;" id='name<%# Eval("ItemID") %>'>
                            <div style="width: 50px; display: inline-block;">
                                <%# Eval("ItemID") %>
                            </div>
                            <%# Eval("Name") %>
                        </span>
                    </div>
                    <div id="<%# Eval("ItemID") %>" class="iteminfo" style="display: none; overflow: hidden;
                        height: 285px; background: #FFF; border: 1px #F5F5F5;">
                        <hr style="width: 75%;" />
                        <%-- ITEM INFORMATION GOES HERE --%>
                        <form action="">
                        <table class="itemform" cellspacing="1" style="border-collapse: collapse;">
                            <tr>
                                <td style="width: 150px;">
                                    Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' ClientIDMode="Predictable"
                                        ValidationGroup='VG<%# Eval("ItemID") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Description:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" Height="75px" Text='<%# Eval("Description") %>'
                                        TextMode="MultiLine" ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Keywords:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Keywords") %>' ValidationGroup='VG<%# Eval("ItemID") %>'
                                        ClientIDMode="Predictable"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Price:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPrice" runat="server" Width="150px" Text='<%# Eval("Price", "{0:c}") %>'
                                        ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Category:
                                </td>
                                <td>
                                    <asp:DropDownList ID="lstCategories" runat="server" DataSourceID="CategoryDataSource"
                                        DataTextField="Name" DataValueField="CategoryID" ClientIDMode="Predictable">
                                    </asp:DropDownList>
                                    <script type="text/javascript">
                                        var iid = <%# Eval("ItemID") %> - 1;
                                        var cid = <%# Eval("CategoryID") %> - 1;
                                        var ddl = document.getElementById('ContentPlaceHolder1_lstItems_lstCategories_' + String(iid));
                                        ddl.selectedIndex = cid;
                                        delete iid; delete cid; delete ddl;
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    On Frontpage:
                                </td>
                                <td style="text-align: left;">
                                    <asp:CheckBox ID="chkOnFront" runat="server" CssClass="checkbox" Checked='<%# Eval("OnFront") %>'
                                        ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    On Slideshow:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="chkOnSlides" runat="server" CssClass="checkbox" Checked='<%# Eval("OnSlides") %>'
                                        ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable" />
                                </td>
                            </tr>
                        </table>
                        </form>
                        <div style="float: right; position: relative; bottom: 93px; right: 30px;">
                            Image:
                            <img src='../Images/ItemImages/<%# Eval("Thumbnail") %>' alt="" style="width: 100px;
                                height: 100px; float: right; position: relative; top: -21px; left: 6px; border: 1px;" />
                        </div>
                        <div>
                            <span style="<%--position: relative; left: 310px; --%>">
                                <asp:Button ID="btnSubmit" runat="server" Text="Update" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                <asp:Button ID="btnDelete" runat="server" Text="DELETE" />
                            </span>
                        </div>
                    </div>
                    </li>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div id="addItem">
        <span style="font-weight: bold; font-size: 14pt;">Add a new item to the database</span><br />
        <i class="validation">Fields in bold are required.<asp:ValidationSummary ID="ValidationSummary1"
            runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="addItem" />
        </i>&nbsp;
        <div id="addItemForm">
            <form name="addForm" action="">
            <table>
                <tr>
                    <td style="width: 180px;">
                        <b>Name:</b><span class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ValidationGroup="addItem">&nbsp;</asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" ValidationGroup="addItem"></asp:TextBox>
                        <div class="tooltip" id="name">
                            Enter the name of the item here.</div>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Description:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" ValidationGroup="addItem"></asp:TextBox>
                        <div class="tooltip" id="description">
                            Enter a description about the item here.</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Price</b>:<span class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="txtPrice" ErrorMessage="Price is required."
                            ValidationGroup="addItem">&nbsp;</asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" ValidationGroup="addItem"></asp:TextBox>
                        <div class="tooltip" id="price">
                            Enter the item's cost here. (Leave out the dollar sign, like: <i>11.99</i>)</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        Keywords:
                    </td>
                    <td>
                        <asp:TextBox ID="txtKeywords" runat="server" ValidationGroup="addItem"></asp:TextBox>
                        <div class="tooltip" id="keywords">
                            Enter keywords (to aid with search) here.</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        Image:
                    </td>
                    <td>
                        <asp:TextBox ID="txtImage" runat="server" ValidationGroup="addItem"></asp:TextBox>
                        <div class="tooltip" id="image">
                            Enter the filename of a picture of the item. (<i>filename</i>.jpg)</div>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <b>Category</b>:<span class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="lstCategories" ErrorMessage="Item must have a Category."
                            InitialValue="0" ValidationGroup="addItem">&nbsp;</asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="lstCategories" runat="server" DataSourceID="CategoryDataSource"
                            DataTextField="Name" DataValueField="CategoryID" AppendDataBoundItems="True"
                            ClientIDMode="Static" ValidationGroup="addItem">
                            <asp:ListItem Value="0">Select a Category</asp:ListItem>
                        </asp:DropDownList>
                        <div class="tooltip" id="category">
                            Select an appropriate category for the item.</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        On Frontpage:
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOnFront" runat="server" CssClass="checkbox" ValidationGroup="addItem" />
                        <div class="tooltip" id="frontpage">
                            If checked, item will appear on the store home page.</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        On Slideshow:
                    </td>
                    <td>
                        <asp:CheckBox ID="chkOnSlides" runat="server" CssClass="checkbox" ValidationGroup="addItem" />
                        <div class="tooltip" id="slideshow">
                            If checked, item will appear on frontpage slideshow.</div>
                    </td>
                </tr>
            </table>
            </form>
        </div>
        <span id="dialogButtons">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="submit" ValidationGroup="addItem" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="submit" CausesValidation="false" />
        </span>
    </div>
    <div id="fade" onclick="hideLightbox();">
    </div>
    <asp:SqlDataSource ID="ItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [JDwebstore-Item] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [JDwebstore-Item] ([Name], [Price], [Description], [Thumbnail], [Image], [OnFront], [OnSlides], [Keywords]) VALUES (@Name, @Price, @Description, @Thumbnail, @Image, @OnFront, @OnSlides, @Keywords)"
        SelectCommand="JDwebstore-GetItemCategories" UpdateCommand="UPDATE [JDwebstore-Item] SET [Name] = @Name, [Price] = @Price, [Description] = @Description, [Thumbnail] = @Thumbnail, [Image] = @Image, [OnFront] = @OnFront, [OnSlides] = @OnSlides, [Keywords] = @Keywords WHERE [ItemID] = @ItemID"
        SelectCommandType="StoredProcedure">
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
    <asp:SqlDataSource ID="CategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [CategoryID], [Name] FROM [JDwebstore-Category] WHERE ([CategoryID] &lt;&gt; @CategoryID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="CategoryID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
