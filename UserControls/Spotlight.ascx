<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Spotlight.ascx.cs" Inherits="UserControls_Spotlight" %>
<script type="text/javascript">
    $(function () {
        $('#spotlight').slides({
            pagination: true,
            play: 5000,
            pause: 2500,
            hoverPause: true,
            animationStart: function (current) {
                $('.caption').animate({
                    top: -35
                }, 100);
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
</script>
<div id="spotlight">
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
