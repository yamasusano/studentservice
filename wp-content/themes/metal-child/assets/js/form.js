jQuery(function ($) {
    jQuery(document).ready(function () {
        window.FinderForm = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'finder_form' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.form);
                    $('#group-contents').html(html);
                    CKEDITOR.replace('description');
                    dropdownSelectMenu($(".dropdown dt a"), $(".dropdown dd ul li a"));
                    $('input#skill-other').on("enterKey", function (e) {
                        $(this).val($(this).val() + ' , ');
                    });
                    $('input#skill-other').keyup(function (e) {
                        if (e.keyCode == 13) {
                            $(this).trigger("enterKey");
                        }
                    });

                },
                errors: function (result) { }

            });
        }
        window.reopenFormFinder = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'reopen_form_finder' },
                type: 'post',
                success: function (result) {
                    $('div#group-message').html(result.message);
                    window.location.reload();
                },
                errors: function (result) { }

            });
        }
        window.closeFormFinder = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'close_form_finder' },
                type: 'post',
                success: function (result) {
                    $('div#group-message').html(result.message);
                    window.location.reload();
                },
                errors: function (result) { }

            });
        }
        window.updateFinderForm = function (title, description, otherSkill, contact, semester, skill) {

            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'update_form_finder', 'title': title, 'description': description, 'otherSkill': otherSkill, 'contact': contact, 'semester': semester, 'skill': skill },
                type: 'post',
                success: function (result) {
                    if (result.check == true) {
                        $('div#group-message').html(result.message);
                        window.location.replace(result.url_profile);
                    } else {
                        $('div#group-message').html(result.message);
                    }
                },
                errors: function (result) { }

            });
        }
        window.verifyUserLogin = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'verify_user_login' },
                type: 'post',
                success: function (result) {
                    if (result.redirect_url != '') {
                        window.location.replace(result.redirect_url);
                    } else {
                        $('div.submit-request').show();
                    }

                },
                errors: function (result) { }

            });
        }

        window.postForm = function (semester, title, description, members, skill, otherSkill, supervisor, close_date, contact) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'post_finder_form', 'semester': semester, 'title': title, 'description': description, 'members': members, 'skill': skill, 'supervisor': supervisor, 'close_date': close_date, 'contact': contact, 'other': otherSkill },
                type: 'post',
                success: function (result) {
                    if (result.type == 0) {
                        $('div#group-message').html(result.message);
                    } else {
                        $('div#group-message').html(result.message);
                        setMenuGroup();
                    }

                },
                errors: function (result) { }

            });


        }
        window.generateMember = function () {
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
        window.kickOutMember = function (button) {
            var parents = button.parents().eq(1);
            var user_id = parents.find('input#user-id').val();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'remove_member_in_group', 'user': user_id },
                type: 'post',
                success: function (result) {
                    $('div.member-message').html(result.message);
                    generateMember();
                },
                errors: function (result) { }

            });
        }
        window.setNewLeader = function (button) {
            var user_id = button.parent().find('input#user-id').val();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'set_new_leader_in_group', 'user': user_id },
                type: 'post',
                success: function (result) {
                    $('div.member-message').html(result.message);
                    generateMember();
                    window.location.reload();
                },
                errors: function (result) { }

            });

        }
        window.dropdownSelectMenu = function (el1, el2) {
            el1.on('click', function () {
                $(".dropdown dd ul").slideToggle('fast');
            });

            el2.on('click', function () {
                $(".dropdown dd ul").hide();
            });

            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).on('click', function (e) {
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
    });
});