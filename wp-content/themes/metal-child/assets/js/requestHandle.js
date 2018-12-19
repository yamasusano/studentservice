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
                    $('#btn-quick-link').hide();
                },
                errors: function (result) { }
            });
        }
        window.access_request_via_user = function (button, $form_id) {
            var par = button.parents('tr');
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'accept_request_via_user', 'form-id': $form_id },
                type: 'post',
                success: function (result) {
                    par.remove();
                    $('div.member-message').html(result.message);
                    setTimeout(() => {
                        $('div.member-message').html('');
                    }, 3000);
                },
                errors: function (result) { }

            });
        }
        window.rejectReuestBySelf = function (button, $form_id) {
            var par = button.parents('tr');
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'reject_request_form', 'form-id': $form_id },
                type: 'post',
                success: function (result) {
                    par.remove();
                    $('div.member-message').html(result.message);
                    setTimeout(() => {
                        $('div.member-message').html('');
                    }, 3000);
                },
                errors: function (result) { }

            });
        }
        window.rejectRequest = function (button) {
            var par = button.parents('tr');
            var form_id = button.parent().find('input#form-id').val();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'reject_user_request', 'form-id': form_id },
                type: 'post',
                success: function (result) {
                    par.remove();
                },
                errors: function (result) { }

            });
        }
        window.requestHandle = function (button) {
            var par = button.parents('tr');
            var user_id = button.parent().find('input#user-id').val();
            var form_id = button.parent().find('input#form-id').val();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'accept_request', 'form-id': form_id, 'user-id': user_id },
                type: 'post',
                success: function (result) {
                    par.remove();
                    $('div.member-message').html(result.message);
                    setTimeout(() => {
                        $('div.member-message').html('');
                    }, 3000);
                },
                errors: function (result) { }

            });
        }
        window.get_teacher_group_list = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_teacher_list' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.create_menu);
                    $('#profile-contents').html(html);
                    $('#btn-view-list-other-group').remove();
                },
                errors: function (result) { }

            });
        }
        window.teacher_form_detail = function (form_id, form_title) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_teacher_form_detail', 'ID': form_id },
                type: 'post',
                success: function (result) {
                    $('.group-menu-items h4').append(' > ' + form_title);
                    $('#group-contents').html(result.form_content);
                    $('div.group-button-other').html(result.button);
                    $('div#btn-quick-link').show();
                },
                errors: function (result) { }

            });
        }
    });
});