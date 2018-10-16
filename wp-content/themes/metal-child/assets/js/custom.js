jQuery(function ($) {
    jQuery(document).ready(function () {
        $('.menu-items').on('click', function () {
            toggleMenu(this);
        });
        $('div#home-view').on('click', function () {
            $('#profile-contents').text('');
            dataLink();

        });
        $('button#edit-profile').on('click', function () {
            $('div#edit-btn').text('');
            $('div#profile-contents textarea,input').prop('disabled', false);
            changeButton();
        });
    });

    function changeButton() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'change_button' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.btnChange);
                $('div#edit-btn').append(html);
                $('button#update-profile').on('click', function () {
                    updateProfile();
                });
            },
            errors: function (reulst) { }
        });
    }
    function updateProfile() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'update_profile' },
            type: 'post',
            success: function (result) {
                $('div.verify-input').text(result.message);
                window.location.reload();
            },
            errors: function (reulst) { }
        });
    }

    function dataLink() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'data_over_view' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.view);
                $('#profile-contents').append(html);
                $('button#edit-profile').on('click', function () {
                    $('div#edit-btn').text('');
                    $('div#profile-contents textarea,input').prop('disabled', false);
                    changeButton();
                });
            },
            errors: function (reulst) { }


        });
    }









    function toggleMenu(self) {
        $(self).toggleClass('active');
        $(self).find('.sub-menu-items').stop().slideToggle(700);
        $(self).siblings().find('.sub-menu-items').slideUp(700);
        $(self).siblings().removeClass('active');
    }
})

