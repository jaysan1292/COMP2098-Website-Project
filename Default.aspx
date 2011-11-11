<%@ Page Title="JDwebstore - Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="UserControls/Menu_Common.ascx" tagname="Menu_Common" tagprefix="uc1" %>

<%@ Register src="UserControls/CategoryList.ascx" tagname="CategoryList" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="spotlight">
        <asp:Panel ID="Panel1" runat="server" Height="350px" Width="800px">
        </asp:Panel>
    </div>
    <div id="content-left">
        <uc2:CategoryList ID="CategoryList1" runat="server" />
    </div>
    <div id="content-right"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam interdum eleifend quam, vel egestas nibh consectetur nec. Aenean sed nibh neque, vel auctor dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dictum scelerisque quam eu dictum. Integer ac nulla tellus, ac auctor lacus. Vestibulum eget risus lorem, at fringilla dui. Duis vel augue non mauris tristique lobortis. Mauris pharetra semper massa ut varius. Suspendisse consequat ipsum sed sapien blandit hendrerit. Nunc sed ligula vitae enim tempor sodales quis vitae quam. Nullam sed porta tellus. Pellentesque volutpat est sodales odio tristique ut dictum leo egestas. Donec turpis libero, feugiat sed congue elementum, ultrices ut dolor. Vestibulum magna risus, sollicitudin sed mollis id, facilisis et magna.</p>
    <p>Praesent gravida congue orci in lobortis. Cras imperdiet cursus quam, eu sollicitudin ligula facilisis in. Proin elit metus, feugiat nec venenatis eget, rutrum ac nisl. Pellentesque velit ante, mattis id malesuada sit amet, placerat id felis. Donec quis elit sed tortor eleifend fermentum. Nullam eu odio sapien, eget aliquam nulla. Nam feugiat dapibus purus et convallis. Donec aliquam scelerisque dolor sed porttitor. In eu scelerisque lorem. Praesent dui purus, condimentum et aliquet eu, mollis et tellus. Suspendisse sed ullamcorper odio. Maecenas eget sem sed ligula egestas hendrerit non quis nisi.</p>
    <p>Sed eget elit eget quam consequat molestie. Vestibulum aliquam, ante quis ornare euismod, enim lectus commodo urna, non commodo nulla lorem non neque. Maecenas blandit nibh ut nibh ultrices eget rutrum elit faucibus. Integer sapien nisl, fringilla eget fermentum sed, malesuada a est. Nullam eget velit orci. Aliquam massa dolor, auctor ornare condimentum vitae, hendrerit vitae odio. Maecenas nibh neque, varius rutrum porttitor vel, luctus at arcu. Morbi varius mi non urna eleifend tempus. Proin id lorem risus.</p>
    <p>Nulla facilisi. Phasellus lacinia, odio nec aliquam sagittis, ipsum erat fermentum tellus, ac interdum mi velit a mauris. Maecenas lacus nisl, adipiscing eget posuere vitae, vulputate sit amet mauris. Vestibulum mollis odio eu metus tempor porttitor. Donec quis purus odio, eu placerat felis. Aenean at tortor tortor. Morbi quam arcu, facilisis at euismod vel, convallis sed dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut suscipit ornare dignissim.</p>
    <p>Nulla varius, nibh nec luctus faucibus, nulla arcu aliquet mauris, eu placerat libero neque ut purus. Maecenas eu ante ac dolor bibendum fringilla. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla nisi libero, porta at dignissim nec, laoreet at dolor. Donec varius nibh eget lacus ullamcorper et convallis quam pulvinar. Nulla vel odio nisi, in ullamcorper arcu. Curabitur fringilla viverra rhoncus. Mauris quis mauris lacinia lectus vestibulum dapibus. Vestibulum aliquam lorem ac erat commodo tempor.</p>
    <p>Curabitur feugiat turpis id eros aliquet tincidunt. Praesent nec erat et sem vestibulum egestas in eget velit. Nulla nec lectus sem, sit amet dictum mauris. Etiam velit tortor, convallis at fringilla sit amet, congue nec odio. Donec non odio at sem sollicitudin volutpat. Quisque venenatis eros at purus tincidunt dictum. Fusce nec volutpat turpis.</p>
    <p>Integer sed ipsum id orci suscipit blandit a vel purus. Nunc hendrerit ornare magna sit amet iaculis. Phasellus mollis dolor sit amet libero adipiscing semper vel a ante. Sed sit amet lorem risus. Quisque at erat sed mauris lacinia iaculis vitae eget leo. Sed a est vitae dui mollis iaculis vel vel neque. Vivamus ut velit orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dignissim risus adipiscing nibh tincidunt eu facilisis felis pellentesque. Duis ultrices, mauris vel hendrerit aliquet, ante risus blandit arcu, in rutrum turpis ante eget nunc.</p></div>
</asp:Content>

