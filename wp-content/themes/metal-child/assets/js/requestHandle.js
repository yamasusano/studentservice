jQuery(function ($) {
    jQuery(document).ready(function () {
        window.get_action_invite_user = function ($user_id, $current_action) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'invite_user_join', 'user-id': $user_id },
                type: 'post',
                success: function (result) {
                    if (result.check) {
                        $parent = 'table#result_list_users tr:eq(' + $current_action + ') ';
                        $($parent + 'div.btn-group-invite').append(result.button);
                        $('div.member-message').html(result.message);

                    } else {
                        $('div.member-message').html(result.message);
                    }
                },
                errors: function (result) { }

            });
        }

        window.re_action_intive_user = function ($user_id, $current_action) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 're_invite_user_join', 'user-id': $user_id },
                type: 'post',
                success: function (result) {
                    if (result.check) {
                        $parent = 'table#result_list_users tr:eq(' + $current_action + ') ';
                        $($parent + 'div.btn-group-invite').append(result.button);
                        $('div.member-message').html(result.message);

                    } else {
                        $('div.member-message').html(result.message);
                    }
                },
                errors: function (result) { }

            });
        }

        window.manageRequest = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'magage_request' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.notification);
                    $('#profile-contents').html(html);

                },

                errors: function (result) { }
            });
        }
        window.access_request_via_user = function (button, $form_id) {
            var parents = button.parents().eq(1);
            var par = button.parents('tr');
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'accept_request_via_user', 'form-id': $form_id },
                type: 'post',
                success: function (result) {
                    if (result.check) {
                        par.slideUp('slow', function () { par.remove(); });
                        $('div.member-message').html(result.message);
                    } else {
                        par.slideUp('slow', function () { par.remove(); });
                        $('div.member-message').html(result.message);
                    }
                },
                errors: function (result) { }

            });
        }
        window.rejectReuestBySelf = function (button, $form_id) {
            var parents = button.parents().eq(1);
            var par = button.parents('tr');
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'reject_request_form', 'form-id': $form_id },
                type: 'post',
                success: function (result) {
                    if (result.check) {
                        par.slideUp('slow', function () { par.remove(); });
                        $('div.member-message').html(result.message);
                    } else {
                        par.slideUp('slow', function () { par.remove(); });
                        $('div.member-message').html(result.message);
                    }
                },
                errors: function (result) { }

            });
        }

        window.rejectInviteRequest = function (button, $user_id) {
            // var parents = button.parents().eq(1);
            var par = button.parents('tr');
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 're_invite_user_join', 'user-id': $user_id },
                type: 'post',
                success: function (result) {
                    if (result.check) {
                        par.slideUp('slow', function () { par.remove(); });
                    } else {
                        par.slideUp('slow', function () { par.remove(); });
                    }
                },
                errors: function (result) { }

            });
        }
        window.rejectRequest = function (button) {
            var parents = button.parents().eq(1);
            var par = button.parents('tr');
            var user = parents.find('div.content-request>p>a').text();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'reject_user_request', 'request-user': user },
                type: 'post',
                success: function (result) {
                    if (result.results == true) {
                        par.slideUp('slow', function () { par.remove(); });
                    } else {
                        par.slideUp('slow', function () { par.remove(); });
                    }

                },
                errors: function (result) { }

            });
        }
        window.requestHandle = function (button) {
            var parents = button.parents().eq(1);
            var par = button.parents('tr');
            var user = parents.find('div.content-request>p>a').text();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'accept_request', 'request-user': user },
                type: 'post',
                success: function (result) {
                    if (result.results == true) {
                        $('div.noti-message').html(result.message);
                        par.slideUp('slow', function () { par.remove(); });
                    } else {
                        $('div.noti-message').html(result.message);
                        par.slideUp('slow', function () { par.remove(); });

                    }

                },
                errors: function (result) { }

            });
        }
    });
});