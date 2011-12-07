<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ItemManager.aspx.cs" Inherits="Manage_ItemManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script src="Scripts/menuanimation.js" type="text/javascript"></script>
    <script src="Scripts/itemmanager.js" type="text/javascript"></script>
    <link href="Styles/ItemManager.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            init();
            $('.searchbox').attr('disabled', true);
            $('.searchbox').attr('style', 'background:white;');
        });
    </script>
    <style>
        .btnUpdate {
            background-color: #224272;
            border: 1px solid #224272;
        }
        .btnCancel {
            background-color: #224272;
            border: 1px solid #224272;
        }
        .btnDelete {
            background-color: #F30;
            border: 1px solid #F30;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Item Management</h1>
    Select an item to modify its information.<br />
    Or, <a href="javascript:;" onclick="hideAll(); showLightbox();">add a new item.</a>
    <div style="display: inline; position: absolute; right: 8px; top: 107px;">
        Filter items:
        <input id="filter" type="text" />
    </div>
    <hr />
    <div class="itemList-header" style="width: 780px; font-weight: bold; background: #D8D8D8;">
        <div style="width: 50px; display: inline-block;">
            ItemID
        </div>
        Name
    </div>
    <div class="itemList">
        <asp:DataList ID="lstItems" runat="server" DataSourceID="ItemDataSource" OnItemCreated="lstItems_ItemCreated">
            <AlternatingItemStyle BackColor="#EDEDED" />
            <ItemTemplate>
                <div class="manageList">
                    <div class="itemheader" style="width: 764px;" onmousedown="toggleSlide('<%# Eval("ItemID") %>');">
                        <span style="font-weight: normal;" id='name<%# Eval("ItemID") %>'>
                            <div style="width: 50px; display: inline-block;">
                                <%# Eval("ItemID") %>
                            </div>
                            <%# Eval("Name") %>
                        </span>
                    </div>
                    <div id="<%# Eval("ItemID") %>" class="iteminfo" style="display: none; overflow: hidden; height: 285px; background: #FFF; border: 1px #F5F5F5;">
                        <hr style="width: 75%;" />
                        <%-- ITEM INFORMATION GOES HERE --%>
                        <form action="">
                        <table class="itemform" cellspacing="1" style="border-collapse: collapse;">
                            <tr>
                                <td style="width: 150px;">
                                    Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass='<%#"txtName" + Eval("ItemID")%>' Text='<%# Eval("Name") %>' ClientIDMode="Predictable" ValidationGroup='VG<%# Eval("ItemID") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Description:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass='<%#"txtDescription" + Eval("ItemID")%>' Height="75px" Text='<%# Eval("Description") %>' TextMode="MultiLine" ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Keywords:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtKeywords" runat="server" CssClass='<%#"txtKeywords" + Eval("ItemID")%>' Text='<%# Eval("Keywords") %>' ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Price:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass='<%#"txtPrice" + Eval("ItemID")%>' Width="150px" Text='<%# Eval("Price") %>' ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 150px;">
                                    Category:
                                </td>
                                <td>
                                    <asp:DropDownList ID="lstCategories" runat="server" CssClass='<%#"lstCategories" + Eval("ItemID")%>' DataSourceID="CategoryDataSource" DataTextField="Name" DataValueField="CategoryID" ClientIDMode="Predictable">
                                    </asp:DropDownList>
                                    <script type="text/javascript">
                                        // After populating the dropdown list, select the applicable item.
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
                                    <asp:CheckBox ID="chkOnFront" runat="server" CssClass='<%#"chkOnFront" + Eval("ItemID") + " checkbox"%>' Checked='<%# Eval("OnFront") %>' ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    On Slideshow:
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="chkOnSlides" runat="server" CssClass='<%#"chkOnSlides" + Eval("ItemID") + " checkbox"%>' Checked='<%# Eval("OnSlides") %>' ValidationGroup='VG<%# Eval("ItemID") %>' ClientIDMode="Predictable" />
                                </td>
                            </tr>
                        </table>
                        </form>
                        <div style="float: right; position: relative; bottom: 93px; right: 30px;">
                            Image:
                            <img src='Images/ItemImages/<%# Eval("Thumbnail") %>' alt="" style="width: 100px; height: 100px; float: right; position: relative; top: -21px; left: 6px; border: 1px;" />
                        </div>
                        <div>
                            <span style="position: relative; left: 50%; margin-left: -79px;">
                                <%--<asp:LinkButton ID="btnSubmit" runat="server" Text="Update" CssClass="btnSubmit button" OnClick="btnSubmit_Click" />--%>
                                <%--<asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancel button" OnClick="btnCancel_Click" />--%>
                                <%--<asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CssClass="btnDelete button" OnClick="btnDelete_Click" OnClientClick='deleteItem(<%# Eval("ItemID") %>)' />--%>
                                <a href="javascript:;" id="btnUpdate" class="btnUpdate button" onclick='updateItem(<%# Eval("ItemID") %>)'>Update</a> <a href="javascript:;" id="btnDelete" class="btnDelete button" onclick='deleteItem(<%# Eval("ItemID") %>, "<%# Eval("Name") %>")'>Delete</a> </span>
                        </div>
                    </div>
                    </li>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <script type="text/javascript">
            function deleteItem(itemId, name) {
                if (confirm("Are you sure you want to delete \"" + name + "\"?\nIt will be lost forever! (kind of a long time)")) {
                    PageMethods.deleteItem(itemId, editSuccess);
                }
            }

            function updateItem(itemId) {
                var item = new Array();
                item[0] = $('.txtName' + itemId).val(); //name
                item[1] = $('.txtDescription' + itemId).val(); //description
                item[2] = $('.txtPrice' + itemId).val(); //price
                item[3] = $('.txtKeywords' + itemId).val(); //keywords
                item[4] = null; //image
                item[5] = null; //thumbnail
                item[6] = $('.lstCategories' + itemId).val(); //categories
                item[7] = $('.chkOnFront' + itemId).is(':checked').toString(); //onfront
                item[8] = $('.chkOnSlides' + itemId).is(':checked').toString();  //onslides
                item[9] = itemId;

                PageMethods.updateItem(item, editSuccess);
            }

            function editSuccess(response) {
                alert(response);
                window.location.reload();
            }
        </script>
    </div>
    <div id="addItem" class="dialog">
        <span style="font-weight: bold; font-size: 14pt;">Add a new item to the database</span><br />
        <i class="validation">Fields in bold are required.<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="addItem" />
        </i>
        <div style="font-style: italic; color: #555; text-align: right; font-size: x-small; display: inline; position: absolute; right: 10px;">
            PROTIP: Press &lt;TAB&gt; to switch between fields as you go.
        </div>
        <div id="addItemForm" class="dialog-inner-panel">
            <form name="addForm" onsubmit="submitItem(); return false;">
            <table>
                <tr>
                    <td style="width: 180px;">
                        <b>Name:</b><span class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ValidationGroup="addItem">&nbsp;</asp:RequiredFieldValidator>
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
                        <b>Price</b>: <span class="validation">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price is required." ValidationGroup="addItem">&nbsp;</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price must be a decimal number." ValidationExpression="^\d+(\.\d{1,2})?$" ValidationGroup="addItem">&nbsp;</asp:RegularExpressionValidator>
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
                        <b>Category</b>:<span class="validation"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lstCategories" ErrorMessage="Item must have a Category." InitialValue="0" ValidationGroup="addItem">&nbsp;</asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="lstCategories" runat="server" DataSourceID="CategoryDataSource" DataTextField="Name" DataValueField="CategoryID" AppendDataBoundItems="True" ClientIDMode="Static" ValidationGroup="addItem">
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
            <script type="text/javascript">
                function submitItem() {
                    if (Page_ClientValidate('addItem')) {
                        var item = new Array();
                        item[0] = $('#<%=txtName.ClientID %>').val();
                        item[1] = $('#<%=txtDescription.ClientID %>').val();
                        item[2] = $('#<%=txtPrice.ClientID %>').val();
                        item[3] = $('#<%=txtKeywords.ClientID %>').val();
                        item[4] = $('#<%=txtImage.ClientID %>').val();
                        item[5] = generateThumbName(item[4]);
                        item[6] = $('#lstCategories').val();
                        item[7] = $('#<%=chkOnFront.ClientID %>').is(':checked').toString();
                        item[8] = $('#<%=chkOnSlides.ClientID %>').is(':checked').toString();

                        PageMethods.createItem(item, onSuccess);
                    }

                }

                function onSuccess(response) {
                    alert(response);
                    window.location.reload();
                }

                function generateThumbName(str) {
                    var thumb;
                    if (str == null) thumb = "";
                    else if (str.indexOf(".jpg") == -1) thumb = str.replace(".png", "-th.png");
                    else if (str.indexOf(".png") == -1) thumb = str.replace(".jpg", "-th.jpg");
                    else thumb = str;
                    return thumb;
                }
            </script>
            <style>
                .submit.button {
                    background-color: #777;
                    border: 1px solid #777;
                }
            </style>
        </div>
        <span id="dialogButtons"><a href="javascript:;" id="btnSubmit" class="submit button" onclick="submitItem()">Submit</a>
            <%--<asp:LinkButton ID="btnSubmit" runat="server" Text="Submit" CssClass="submit button" ValidationGroup="addItem" UseSubmitBehavior="False" OnClientClick="submitItem()" />--%>
            <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CssClass="submit button" CausesValidation="false" />
        </span>
    </div>
    <div id="fade" onclick="hideLightbox();">
    </div>
    <asp:SqlDataSource ID="ItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="JDwebstore-CatalogDeleteItem" InsertCommand="JDwebstore-CatalogAddItem" SelectCommand="JDwebstore-GetItemCategories" UpdateCommand="JDwebstore-CatalogUpdateItem" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
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
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Thumbnail" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="OnFront" Type="Boolean" />
            <asp:Parameter Name="OnSlides" Type="Boolean" />
            <asp:Parameter Name="Keywords" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryID], [Name] FROM [JDwebstore-Category] WHERE ([CategoryID] &lt;&gt; @CategoryID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="CategoryID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>
</asp:Content>
