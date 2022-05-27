<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <div class="footer-inner">
        <div class="copyright">
            <div class="policy">
                <a href="#none">Copyright (c) All rights reserved by</a>
                <a href="#none">ghchae</a>
            </div>
            <div class="info">
                <p>
                    e-mail: test.gmail.com
                </p>
                <p>
                    tel: 010-xxxx-xxxx
                </p>
            </div>
        </div>
        <div class="site-dropdown-frame">
            <div class="site-dropdown">
                <div class="title">사이트맵</div>
                <ul class="sub-nav">
                    <li>
                        <a href="#site1">site1</a>
                    </li>
                    <li>
                        <a href="#site2">site2</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<script>
    $('.gnb li:last-child').click(function() {
        $('.trigger').toggleClass('active');
        $('.gnb li:last-child').toggleClass('active');
        $('.site-map').fadeToggle();
    });
    $('.detail .like').click(function() {
        $(this).toggleClass('active');
    });
    $('footer .title').click(function() {
        $(this).toggleClass('active');
        $('.sub-nav').slideToggle();
    });
    $('footer .sub-nav li').click(function() {
        var txt = $(this).text().toUpperCase();
        $('footer .title').text(txt);
        $('.site-dropdown .sub-nav').slideToggle();
    });
</script>