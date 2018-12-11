jQuery(function ($) {
    jQuery(document).ready(function () {
        window.createTitleGroup = function () {
            var parent = $('div.group-menu-item');
            var $check = parent.find('input#title-form');
            if ($check.length) {
                $check.focus();
            } else {
                parent.append('<div class="add-title"><input type="text" name="title-form" id="title-form" required>' +
                    '<button type="submit" name="create-title" id ="create-title" class= "btn btn-sm btn-info">ADD</button>' +
                    '<button type="submit" name="cancel-create-title" id ="cancel-create-title" class= "btn btn-sm btn-danger">CANCEL</button></div>');
                $('input#title-form').focus();
            }
            $('button#cancel-create-title').on('click', function () {
                $('input#title-form').remove();
                $('button#create-title').remove();
                $(this).remove();
            });
            $('button#create-title').on('click', function () {
                $title = $('input#title-form').val();
                if ($title == '') {
                    $('input#title-form').focus();
                } else {
                    $('input#title-form').val('');
                    createNewForm($title);
                }
            });
        }

        window.menuTeacherGroup = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'teacher_menu_group' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.create_menu);
                    $('#profile-contents').html(html);
                    $('#btn-view-list-group').remove();
                },
                errors: function (result) { }

            });
        }
        window.createNewForm = function ($title) {
            $table = $('table#teacher-list-group tr:first');
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'create_new_form', 'title': $title },
                type: 'post',
                success: function (result) {
                    if (result.check == true) {
                        var html = $.parseHTML(result.new_form);
                        $table.after(result.new_form);
                    } else {
                        setTimeout(function () {
                            $('div.message-show').html(result.message);
                        }, 500);
                        setTimeout(function () {
                            $('div.message-show').slideUp('slow', function () {
                                $('div.message-show').html('');
                            });
                        }, 3000);
                    }
                },
                errors: function (result) { }

            });
        }
        window.deleteTeacherForm = function (row, $form_id, $title) {

            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'delete_teach_form', 'ID': $form_id, 'title': $title },
                type: 'post',
                success: function (result) {
                    $('div.message-show').html(result.message);
                    setTimeout(function () {
                        $('div.message-show').slideUp('slow', function () {
                            $('div.message-show').html('');
                        });
                    }, 3000);
                    row.slideUp('slow', function () {
                        row.remove();
                    });
                },
                errors: function (result) { }

            });
        }
        window.getTeacherForm = function (form_id) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_teacher_form', 'ID': form_id },
                type: 'post',
                success: function (result) {
                    $('.group-menu-item').html(result.groups);
                    $('#group-contents').html(result.form);
                    get_btn_back();
                    form_invite_student();
                },
                errors: function (result) { }

            });

        }
        window.get_btn_back = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_btn_back', },
                type: 'post',
                success: function (result) {
                    $('#btn-quick-link').html(result.btn);
                },
                errors: function (result) { }

            });
        }
        window.btn_back_other_form = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'btn_back_other_form', },
                type: 'post',
                success: function (result) {
                    $('#btn-quick-link').html(result.btn);
                },
                errors: function (result) { }

            });
        }
        window.teacherFormAction = function (form_id) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_teacher_form_action', 'ID': form_id, },
                type: 'post',
                success: function (result) {
                    $('div#group-contents').html(result.form_content);
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
        window.update_form_finder_teacher = function (ID) {
            var title = $('#title').val();
            var description = CKEDITOR.instances['description'].getData();
            var skill = $('.multiSel span').text();
            var otherSkill = $('#skill-other').val();
            var contact = $('#contact-form').val();
            var semester = $('select#semester').val();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'update_form_finder_teacher', 'ID': ID, 'title': title, 'description': description, 'otherSkill': otherSkill, 'contact': contact, 'semester': semester, 'skill': skill },
                type: 'post',
                success: function (result) {
                    if (result.check == true) {
                        $('div#group-message').html(result.message);
                        getTeacherForm(ID);
                    } else {
                        $('div#group-message').html(result.message);
                    }
                },
                errors: function (result) { }

            });
        }
        window.close_form_finder_teacher = function (ID) {

            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'close_form_finderTeacher', 'ID': ID },
                type: 'post',
                success: function (result) {
                    $('div#group-message').html(result.message);
                    getTeacherForm(ID);
                },
                errors: function (result) { }

            });
        }
        window.re_open_form_finder_teacher = function (ID) {

            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 're_open_form_teach', 'ID': ID },
                type: 'post',
                success: function (result) {
                    $('div#group-message').html(result.message);
                    getTeacherForm(ID);
                },
                errors: function (result) { }

            });
        }
        window.members_list = function (ID) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'members_list_via_teacher', 'ID': ID },
                type: 'post',
                success: function (result) {
                    $('div#group-contents').html(result.members);
                },
                errors: function (result) { }
            });
        }
        window.kick_out_member = function (ID, button) {
            var parents = button.parents().eq(1);
            var user_id = parents.find('input#user-id').val();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'kick_out_member', 'ID': ID, 'user': user_id },
                type: 'post',
                success: function (result) {
                    $('div.member-message').html(result.message);
                    members_list(ID);
                },
                errors: function (result) { }

            });
        }
        window.manage_teacher_request = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'magage_teache_request' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.notification);
                    $('#profile-contents').html(html);
                },

                errors: function (result) { }
            });
        }

        window.handle_action_request = function (button) {

            var parents = button.parent();
            var par = button.parents('tr');
            var form_id = parents.find('input#form-id').val();
            var user_id = parents.find('input#user-id').val();
            var type = button.attr("id");
            if (type == 'acxept-user-via-leader') {
                type = 1;
            } else if (type == 'deny-user-via-leader') {
                type = 0;
            }
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'approve_request_via_teacher', 'form-id': form_id, 'user-id': user_id, 'type': type },
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
        window.find_student = function (ID) {
            var keyword = $('input#student-name').val();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'find_student_partner', 'keyword': keyword, 'ID': ID },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.render);
                    $('div#group-contents').html(html);
                },
                errors: function (result) { }

            });
        }
        window.form_invite_student = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_form_invite' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.render);
                    $('div.invite-members').html(html);
                },
                errors: function (result) { }

            });
        }
        window.invite_student_via_teacher = function (ID, button) {
            var user_id = button.parent().find($('input#user-id')).val();
            $current_action = button.parents('tr').index();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'invite_student_via_teacher', 'ID': ID, 'user-id': user_id },
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
        window.re_action_intive_user_via_teacher = function (ID, button) {
            $user_id = button.parent().find($('input#user-id')).val();
            $current_action = button.parents('tr').index();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 're_invite_user_join_via_teacher', 'ID': ID, 'user-id': $user_id },
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
        window.get_list_student_form = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'list_student_form_via_teacher' },
                type: 'post',
                success: function (result) {
                    $('div#profile-contents').html(result.form_content);
                },
                errors: function (result) { }

            });
        };
        window.get_student_form_detail = function (ID) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'student_form_detail_via_teacher', 'ID': ID },
                type: 'post',
                success: function (result) {
                    $('div#group-contents').html(result.form_detail);
                    $('div.group-button-other').html(result.group_button);
                    $('div#btn-quick-link').html(result.button);
                },
                errors: function (result) { }

            });
        }
    });
});