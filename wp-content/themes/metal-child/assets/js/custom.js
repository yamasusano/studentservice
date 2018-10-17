jQuery(function ($) {
    jQuery(document).ready(function () {

        $('.menu-items').on('click', function () {
            toggleMenu(this);
        });
        $('div#home-view').on('click', function () {
            dataLink();
        });
        $('button#edit-profile').on('click', function () {
            $('div#profile-contents textarea,input').prop('disabled', false);
            changeButton();
        });
        $('div#my-group').on('click', function () {
            setMenuGroup();
        });
    });
    function setMenuGroup() {

        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'menu_group' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.menu);
                $('#profile-contents').html(html);
                $('button#finder-form').on('click', function () {
                    FinderForm();
                });
            },
            errors: function (reulst) { }

        });
    }

    function changeButton() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'change_button' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.btnChange);
                $('div#edit-btn').html(html);
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
                $('#profile-contents').html(html);
                $('button#edit-profile').on('click', function () {
                    $('div#profile-contents textarea,input').prop('disabled', false);
                    changeButton();
                });
            },
            errors: function (reulst) { }

        });

    }

    function FinderForm() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'finder_form' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.form);
                var title = $('div.title-form input[name=title]').val();
                var description = $('div.description-form textarea#description').val();
                // var members = $('div.title-form input').val();
                var members = '';
                var skill = $('div.skill-form dropdown a').val();
                // var supervisor = $('div.supervisor-form input').val();
                var supervisor = '';
                var close_date = $('div.supervisor-form form-group input').val();
                $('#group-contents').html(html);
                dropdownSelectMenu($(".dropdown dt a"), $(".dropdown dd ul li a"));
                $('#post-form').on('click', function () {

                    postForm(title, description, members, skill, supervisor, close_date);
                });
            },
            errors: function (reulst) { }

        });
    }

    function postForm(title, description, members, skill, supervisor, close_date) {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'post_finder_form', 'title': title, 'description': description, 'members': members, 'skill': skill, 'supervisor': supervisor, 'close_date': close_date },
            type: 'post',
            success: function (result) {
                $('div#group-message').text(result.message);
            },
            errors: function (reulst) { }

        });


    }

    function dropdownSelectMenu(el1, el2) {
        el1.on('click', function () {
            $(".dropdown dd ul").slideToggle('fast');
        });

        el2.on('click', function () {
            $(".dropdown dd ul").hide();
        });

        function getSelectedValue(id) {
            return $("#" + id).find("dt a span.value").html();
        }

        $(document).bind('click', function (e) {
            var $clicked = $(e.target);
            if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
        });

        $('.mutliSelect input[type="checkbox"]').on('click', function () {

            var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
                title = $(this).val() + ",";

            if ($(this).is(':checked')) {
                var html = '<span title="' + title + '">' + title + '</span>';
                $('.multiSel').append(html);
                $(".hida").hide();
            } else {
                $('span[title="' + title + '"]').remove();
                var ret = $(".hida");
                $('.dropdown dt a').append(ret);

            }
        });
    }

    function toggleMenu(self) {
        $(self).toggleClass('active');
        $(self).find('.sub-menu-items').stop().slideToggle(700);
        $(self).siblings().find('.sub-menu-items').slideUp(700);
        $(self).siblings().removeClass('active');
    }

})

