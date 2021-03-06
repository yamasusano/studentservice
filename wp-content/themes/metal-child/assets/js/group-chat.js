jQuery(function ($) {
    jQuery(document).ready(function () {
        var form_id = 0;
        var form_title = '';
        var connect;
        $('body').on('click', 'p#student-form-title', function () {
            form_id = $(this).parent().find('input#student-form-id').val();
            form_title = $(this).text();
            get_student_form_content(form_id, form_title);
        });
        $('body').on('click', 'p.title-form-other', function () {
            $par = $(this).parents('tr');
            $form_id = $par.find('input#teacher-form-id').val();
            form_id = $form_id;
            form_title = $(this).text();
            teacher_form_detail($form_id, form_title);
        });
        $('body').on('click', 'button#action-invite-via-teacher', function () {
            invite_student_via_teacher(form_id, $(this));
            $(this).remove();
        });
        $('body').on('click', 'button#cancel-invite-user-via-teacher', function () {
            re_action_intive_user_via_teacher($form_id, $(this));
            $(this).remove();
        });
        $('body').on('click', 'button#finder-form-teacher', function () {
            teacherFormAction(form_id);
        });
        $('body').on('click', 'button#members-list', function () {
            members_list(form_id);
        });
        $('body').on('click', 'button#search-students', function () {
            find_student(form_id);
        });
        $('body').on('click', 'button#edit-form-teach', function () {
            teacherFormAction(form_id);
        });
        $('body').on('click', 'button#save-form-finder-teach', function () {
            update_form_finder_teacher(form_id);
        });
        $('body').on('click', 'button#close-form-finder-teach', function () {
            close_form_finder_teacher(form_id);
        });
        $('body').on('click', 'button#reopen-form-finder-teach', function () {
            re_open_form_finder_teacher(form_id);
        });
        $('body').on('click', 'button#kick-out-member', function () {
            kick_out_member(form_id, $(this));
        });
        $('body').on('click', 'p#title-form-teacher', function () {
            $par = $(this).parents('tr');
            $form_id = $par.find('input#teacher-form-id').val();
            form_id = $form_id;
            console.log(form_id);
            getTeacherForm($form_id);
            $('div#btn-quick-link').html('<button id="btn-view-list-group" class="btn btn-primary">Back</button>');
        });
        $('body').on('click', 'button#delete-form-teacher', function () {
            $row = $(this).parents('tr');
            $form_id = $(this).parent().find('input').val();
            $title = $row.find('p#title-form-teacher').text();
            deleteTeacherForm($row, $form_id, $title);
        });
        $('body').on('click', 'button#group-chat', function () {
            var check = $('.group-chat-form');
            if (form_title == '') {
                form_id = $(this).parent().find('input#form-id').val();
            }
            if (check.length > 0) {
                $('#input-message-group').focus();

            } else {
                getChatForm(form_id);
                open_port_chat(form_id, current_user_id);
            }
            event_close_connect();
        });
        $('body').on('click', 'button#members-lists', function () {
            members_list(form_id);
        });
        $('body').on('click', 'button#student-group-chat', function () {
            form_id = $(this).parent().find('input#form-id').val();
            var check = $('.group-chat-form');
            if (check.length > 0) {
                $('#input-message-group').focus();
            } else {
                getChatForm(form_id);
                open_port_chat(form_id, current_user_id);
            }
            event_close_connect();
        });
        $('body').on('click', '.content-message', function () {
            var message = $(this).find('span').text();
            save_recommended(form_id, message);
        });
        $('body').on('click', 'button#manage-recommand', function () {
            $('.recommend-list').toggleClass('active-noti');
            get_recommend_list(form_id);
        });
        $('body').on('click', 'span.remove-recommend', function () {
            var par = $(this).parent();
            var item = par.find('input[name=recommend-index]').val();
            remove_recommended(item, par);
        });

        $(document).mouseup(function (e) {
            var container = $('.recommend-list');
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                $(container).removeClass('active-noti');
            }
        });
        $('body').on('keydown', 'div#input-message-group', function (event) {
            if (event.keyCode === 13 && !event.shiftKey) {
                var message = $(this).text();
                if ($.trim(message) != '') {
                    push_content_message(form_id, current_user_id, message);
                    $('span.notice-dot').hide();
                }
                $(this).empty();
                document.execCommand('insertHTML', false, '');
                return false;
            }
        });
        window.push_content_message = function (form_id, sender_id, message) {
            var data = {
                type: 0,
                ID: form_id,
                sender: sender_id,
                msg: message,
            };
            var text_message = '<div class="current_user"><div class="content-message"><span>' + message + '</span></div></div>';
            var box_chat = $('div.chat-form-content .chat-box');
            $(box_chat).append(text_message);
            $(box_chat).scrollTop($(box_chat)[0].scrollHeight);

            connect.send(JSON.stringify(data));
        }
        window.open_port_chat = function (form_id, $current) {
            connect = new WebSocket(uri);
            connect.onopen = function (e) {
                console.log("Connection established!");
            };
            connect.onmessage = function (e) {
                var data = JSON.parse(e.data);
                if (form_id == data['ID'] && $current != data['sender']) {
                    var text_message = '<div class="other_user">' +
                        '<div class="other_user_name"><span style="font-size: 13px;">' + data.user_sender + '</span></div>' +
                        '<div class="content-message" style="margin-left: 20px;">' +
                        '<span>' + data.msg + '</span>' + '</div></div>';
                    var box_chat = $('div.chat-form-content .chat-box');
                    $(box_chat).append(text_message);
                    $(box_chat).scrollTop($(box_chat)[0].scrollHeight);
                }
            };
        }
        function closeConnection() {
            if (connect.readyState === WebSocket.OPEN) {
                connect.close();
                console.log('Connection Closed');
            }
        }
        function event_close_connect() {
            $('#home-view').click(function () {
                closeConnection();
            });
            $('#my-group').click(function () {
                closeConnection();
            });
            $('#teacher-group').click(function () {
                closeConnection();
            });
            $('#manage-request').click(function () {
                closeConnection();
            });
            $('#finder-form').click(function () {
                closeConnection();
            });
            $('#pivacy').click(function () {
                closeConnection();
            });
            $('#search-users').click(function () {
                closeConnection();
            });
            $('#member-list').click(function () {
                closeConnection();
            });
            $('#my-groups').click(function () {
                closeConnection();
            });
            $('#student-groups').click(function () {
                closeConnection();
            });
            $('#manage-teacher-request').click(function () {
                closeConnection();
            });
            $('#btn-view-list-group').click(function () {
                closeConnection();
            });
            $('#edit-form-teach').click(function () {
                closeConnection();
            });
            $('#search-students').click(function () {
                closeConnection();
            });
            $('#finder-form-teacher').click(function () {
                closeConnection();
            });
            $('#members-list').click(function () {
                closeConnection();
            });
            $('#privacy').click(function () {
                closeConnection();
            });
            $('#members-lists').click(function () {
                closeConnection();
            });

        }
    });
});