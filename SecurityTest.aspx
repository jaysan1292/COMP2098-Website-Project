<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SecurityTest.aspx.cs" Inherits="SecurityTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Enter password:<br />
        <asp:TextBox ID="txtPwd1" runat="server" EnableViewState="True"></asp:TextBox>
        <br />
        Enter password again:<br />
        <asp:TextBox ID="txtPwd2" runat="server" EnableViewState="True"></asp:TextBox>
        <br />
        <asp:Button ID="btnProcess" runat="server" Text="Process" OnClick="btnProcess_Click" />
        <br />
        <asp:Label ID="lblResult" runat="server" />
    </div>
    </form>
</body>
</html>
