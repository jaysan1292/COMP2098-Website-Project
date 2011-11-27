<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Spotlight.ascx.cs" Inherits="UserControls_Spotlight" %>
<script src="../Scripts/jquery-1.7.min.js" type="text/javascript"></script>
<script src="http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('#spotlight').slides({
            generatePagination: true,
            pagination: true,
            slideEasing: 'easeInOutExpo',
            slideSpeed: 500,
            randomize: true,
            preload: true,
            preloadImage: 'Images/Spotlight/loading.gif',
            play: 5000,
            pause: 2500,
            hoverPause: true,
            animationStart: function (current) {
                $('.caption').animate({
                    top: -60
                }, 200);
                if (window.console && console.log) {
                    // example return of current slide number
                    console.log('animationStart on slide: ', current);
                };
            },
            animationComplete: function (current) {
                $('.caption').animate({
                    top: 0
                }, 200);
                if (window.console && console.log) {
                    // example return of current slide number
                    console.log('animationComplete on slide: ', current);
                };
            },
            slidesLoaded: function () {
                $('.caption').animate({
                    top: 0
                }, 200);
            }
        });
    });

    $(document).ready(function () {
        $('#spot-ribbon').slideDown(250, 'easeInOutCubic');
    });
</script>
<div id="spotlight">
    <div id="spot-ribbon" style="display:none;"></div>
    <div class="slides_container">
        <asp:Repeater ID="lstSpotImages" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="slide">
                    <a href='<%# Link.ToItem(Eval("ItemID").ToString()) %>'>
                        <img src='Images/ItemImages/<%# Eval("Image") %>' width="500px" height="500px" alt='<%# Eval("Name") %>' />
                    </a>
                    <div class="caption" style="bottom: 0">
                        <p>
                            <a href='<%# Link.ToItem(Eval("ItemID").ToString()) %>'>
                                <%# Eval("Name") %>
                            </a>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [JDwebstore-Item] WHERE ([OnSlides] = @OnSlides)">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="OnSlides" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>
