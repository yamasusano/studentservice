jQuery(function ($) {
    jQuery(document).ready(function () {

        $('.menu-items').on('click', function () {
            toggleMenu(this);
        });
        $('div#home-view').bind('click', function () {
            dataLink();
        });
        $('button#edit-profile').bind('click', function () {
            $('div#profile-contents textarea,input').prop('disabled', false);
            changeButton();
        });
        $('div#my-group').bind('click', function () {
            setMenuGroup();
        });
        $('button#update-profile').bind('click', function () {
            updateProfile();
        });

        $('div#notification').bind('click', function () {
            manageRequest();
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
                $('button#finder-form').bind('click', function () {
                    FinderForm();
                });
                $('button#member-list').bind('click', function () {
                    generateMember();
                });

            },
            errors: function (result) { }

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

            },
            errors: function (result) { }
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
            errors: function (result) { }
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
            errors: function (result) { }

        });

    }

    function FinderForm() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'finder_form' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.form);
                $('#group-contents').html(html);
                dropdownSelectMenu($(".dropdown dt a"), $(".dropdown dd ul li a"));
                $('input#skill-other').bind("enterKey", function (e) {
                    $(this).val($(this).val() + ' , ');

                });
                $('input#skill-other').keyup(function (e) {
                    if (e.keyCode == 13) {
                        $(this).trigger("enterKey");
                    }
                });
                $('#post-form').bind('click', function () {
                    var title = $('#title').val();
                    var description = $('#description').val();
                    var members = '';
                    var skill = $('.multiSel span').text();
                    var otherSkill = $('#skill-other').val();
                    var supervisor = '';
                    var close_date = $('#close-date').val();
                    var contact = $('#contact-form').val();
                    postForm(title, description, members, skill, otherSkill, supervisor, close_date, contact);
                });
            },
            errors: function (result) { }

        });
    }
    function manageRequest() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'magage_request' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.notification);
                $('#profile-contents').html(html);
                $('#acxept-user').bind('click', function () {
                    requestHandle($(this));
                });
            },
            errors: function (result) { }

        });
    }
    function requestHandle(button) {
        var parents = button.parents().eq(1);
        var user = parents.find('div.content-request>p>a').text();
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'accept_request', 'request-user': user },
            type: 'post',
            success: function (result) {
                if (result.results == true) {
                    $('div.noti-message').html(result.message);
                    parents.slideUp('slow', function () { parents.remove(); });
                }

            },
            errors: function (result) { }

        });
    }

    function postForm(title, description, members, skill, otherSkill, supervisor, close_date, contact) {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'post_finder_form', 'title': title, 'description': description, 'members': members, 'skill': skill, 'supervisor': supervisor, 'close_date': close_date, 'contact': contact, 'other': otherSkill },
            type: 'post',
            success: function (result) {
                if (result.type == 0) {
                    $('div#group-message').text(result.message);
                } else {
                    window.location.reload();
                }

            },
            errors: function (result) { }

        });


    }

    function generateMember() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'members_list' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.members);
                $('#group-contents').html(html);
            },
            errors: function (result) { }

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

