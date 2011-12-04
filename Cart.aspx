<%@ Page Title="Your Shopping Cart" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cart">
        <h1>
            Your Shopping Cart</h1>
        <asp:Label ID="lblMessage" runat="server" /><br />
        <asp:Label ID="lblStatus" runat="server" />
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
                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
            </Columns>
        </asp:GridView>
        <p align="right">
            <span>Total amount: </span>
            <asp:Label ID="lblTotalAmount" runat="server" Text="Label" />
        </p>
        <p align="right">
            <asp:LinkButton ID="btnUpdate" runat="server" Text="Update Quantities" OnClick="btnUpdate_Click" />
        </p>
    </div>
</asp:Content>