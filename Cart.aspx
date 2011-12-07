<%@ Page Title="Your Shopping Cart" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Cart.css" rel="stylesheet" type="text/css" />
    <!--TEMP-->
    <script src="Scripts/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script src="Scripts/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="Scripts/jdwebstore-ui.js" type="text/javascript"></script>
    <!--END TEMP-->
    <script type="text/javascript">
        function showMessage() {
            if ($('#statusmsg').html() == '\n            <span id="ContentPlaceHolder1_lblStatus">Shopping cart successfully updated.</span>') {
                // Dialog: Shopping cart successfully updated.
                $('#statusmsg').css('width', '234px');
                $('#statusmsg').css('margin-left', '-117px');
            } else if ($('#statusmsg').html() == '\n            <span id="ContentPlaceHolder1_lblStatus">Item removed successfully!</span>') {
                // Dialog: Item removed successfully!
                $('#statusmsg').css('width', '180px');
                $('#statusmsg').css('margin-left', '-90px');
            } else if ($('#statusmsg').html() == '\n            <span id="ContentPlaceHolder1_lblStatus">There was an error removing the item from your cart.</span>') {
                // Dialog: There was an error removing the item from your cart.
                $('#statusmsg').css('width', '344px');
                $('#statusmsg').css('margin-left', '-172px');
            }
            $.blockUI.defaults.css = {};
            $.blockUI({
                message: $('#statusmsg')
            });
            setTimeout(function () { $('#statusmsg').slideUp(400, 'easeInOutExpo', $.unblockUI) }, 1000);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cart">
        <h1>
            Your Shopping Cart</h1>
        <asp:Label ID="lblMessage" runat="server" /><br />
        <div id="statusmsg" class="dialog">
            <asp:Label ID="lblStatus" runat="server" /></div>
        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" BorderWidth="0px" DataKeyNames="ItemID" Width="100%" OnRowDeleting="grid_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Product Name" ReadOnly="True" />
                <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" ReadOnly="True" />
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="GridEditingRow" Width="24px" MaxLength="2" Text='<%#Eval("Quantity")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" ReadOnly="True" DataFormatString="{0:c}" />
                <asp:ButtonField CommandName="Delete" Text="Delete">
                    <ItemStyle CssClass="btnDelete button" />
                </asp:ButtonField>
            </Columns>
        </asp:GridView>
        <p align="right">
            <span>Total amount: </span>
            <asp:Label ID="lblTotalAmount" runat="server" Text="Label" />
        </p>
        <p align="right" id="btnUpdateQty">
            <asp:LinkButton ID="btnUpdate" runat="server" Text="Update Quantities" OnClick="btnUpdate_Click" CssClass="button" />
        </p>
    </div>
</asp:Content>
