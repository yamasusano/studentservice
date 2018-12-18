jQuery(function ($) {
    jQuery(document).ready(function () {
        var keyword = $('b#keyword-search').text().trim();
        if (keyword) {
            $('div.finder-post-title h5').unmark().mark(keyword);
        }
        $('button#btn-alert-join').on('click', function () {
            verifyUserLogin();
        });
        var maxLength = 200;
        $('textarea#request-message').keyup(function () {
            var length = $(this).val().length;
            var length = maxLength - length;
            $('#chars').text(length + ' ');
        });
        $('.menu-items').on('click', function () {
            toggleMenu(this);
        });
        $('.sub-menu-items').on('click', function () {
            $(this).addClass('active');
            $(this).siblings().removeClass('active');
        });
        function toggleMenu(self) {
            $(self).addClass('active');
            $(self).find('.sub-menu-items').slideDown(700);
            $(self).siblings().find('.sub-menu-items').slideUp(700);
            $(self).siblings().removeClass('active');
            $(self).siblings().find('.sub-menu-items').removeClass('active');
        }
        // window.onscroll = function (e) {
        //     // called when the window is scrolled.  
        //     $('div.dropdown-content').css({ 'top': '61px' });
        // }
        var scrollPos = 0;
        window.addEventListener('scroll', function () {
            // detects new state and compares it with the new one
            if ((document.body.getBoundingClientRect()).top > scrollPos)
                $('div.dropdown-content').css({ 'top': '71px' });
            else
                $('div.dropdown-content').css({ 'top': '61px' });
            // saves the new position for iteration.
            scrollPos = (document.body.getBoundingClientRect()).top;
        });
    });
})
