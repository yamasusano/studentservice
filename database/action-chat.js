jQuery(function ($) {
    jQuery(document).ready(function () {
        var conn;
        window.uri = 'ws://miconshow.com:8080';
        setInterval(function () {
            var el = $('#list-member-chat').find('a');
            var box_title = $('.box-chat-title');
            listUserID(box_title);
            listUserID(el);

        }, 5000);

        setInterval(function () {
            var count = 0;
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'set_notice_for_user' },
                type: 'post',
                success: function (result) {
                    if (result.check == true) {
                        $('#chat-bar').find('span').show();
                    }
                    count += result.count;
                    if (count > 0) {
                        $('body').find('#notification-bar span.notice-dot').show();
                    } else {
                        $('body').find('#notification-bar span.notice-dot').hide();
                    }
                    $('body').find('#noti-request span').html(result.count);

                },
                errors: function (result) { }
            });

        }, 2000);


        function listUserID(el) {
            for (let index = 0; index < el.length; index++) {
                var user_id = $(el[index]).find('input.user-id').val();
                var span = $(el[index]).find('span#user-status');
                listenUser(span, user_id);
            }
        }
        window.listenUser = function (span, ID) {

            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'actionListenerUserLog', 'user-id': ID },
                type: 'post',
                success: function (result) {
                    if (result.check == true) {
                        $(span).addClass('user-active');
                    } else {
                        $(span).removeClass('user-active');
                    }
                },
                errors: function (result) { }

            });
        }
        window.getChatForm = function (ID) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_chat_form', 'ID': ID },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.chat_form);
                    $('div#group-contents').html(html);
                    content_group_chat(ID);

                },
                errors: function (result) { }

            });
        }
        window.content_group_chat = function (ID) {
            $('.chat-box>#wait').show();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'show_msg_group_chat', 'ID': ID },
                type: 'post',
                success: function (result) {
                    $('.chat-box>#wait').hide();
                    $('.chat-box').html(result.content);
                    $('.chat-box').scrollTop($('.chat-box')[0].scrollHeight);
                },
                errors: function (result) { }

            });
        }
        window.create_chat_box = function (user_id) {

            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'create_chat_box', 'user_id': user_id },
                type: 'post',
                success: function (result) {
                    $check = $('body').find('b.user-chat-name').text();
                    if ($($check).length) {
                        $('#box-chat-text').focus();
                    } else {
                        $('body').append(result.box_chat);
                        $('body div.box-chat-content').html(result.history_chat);
                        $('#box-chat-text').focus();
                    }
                    $(".box-chat-content").scrollTop($(".box-chat-content")[0].scrollHeight);
                },
                errors: function (result) { }

            });
        }
        window.create_chat_box2 = function (sender_id, receiver_id) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'create_chat_box2', 'sender_id': sender_id, 'receiver_id': receiver_id },
                type: 'post',
                success: function (result) {
                    $check = $('body').find('b.user-chat-name').text();
                    if ($($check).length) {
                        $('#box-chat-text').focus();
                    } else {
                        $('body').append(result.box_chat);
                        $('body div.box-chat-content').html(result.history_chat);
                        $('#box-chat-text').focus();
                        $(".box-chat-content").scrollTop($(".box-chat-content")[0].scrollHeight);
                    }
                },
                errors: function (result) { }

            });
        }

        window.generate_content_chat = function (current_user_id, user_id, message) {
            var data = {
                type: 1,
                sender: current_user_id,
                recievier: user_id,
                msg: message,
            };
            var text_message = '<div class="current_user"><div class="content-message"><span>' + message + '</span></div></div>';
            $('div.box-chat-content').append(text_message);
            $(".box-chat-content").scrollTop($(".box-chat-content")[0].scrollHeight);
            conn.send(JSON.stringify(data));

        }
        window.get_port_chat = function (current_user_id, user_id) {
            conn = new WebSocket(uri);
            conn.onopen = function (e) {
                console.log("Connection established!");
            };
            $('body').on('click', 'span#close-box-chat', function () {
                if (conn.readyState === WebSocket.OPEN) {
                    conn.close();
                    console.log('Connection Closed');
                }
                $(this).parents('.box-chat').remove();
            });
            conn.onmessage = function (e) {
                var data = JSON.parse(e.data);
                if ((current_user_id == data.recievier && user_id == data.sender)) {
                    var text_message = '<div class="other_user"><div class="content-message"><span>' + data.msg + '</span></div></div>';
                    $('div.box-chat-content').append(text_message);
                    $('span.notice-dot').show();
                    $(".box-chat-content").scrollTop($(".box-chat-content")[0].scrollHeight);
                }
            };
        }
        window.notification_chat = function (el) {
            $('.list-notice-chat>#wait').show();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'notification_chat' },
                type: 'post',
                success: function (result) {
                    $('.notice-chat>#wait').hide();
                    $result = $(el).find('div.list-notice-chat');
                    $($result).html(result.message);
                },
                errors: function (result) { }

            });
        }
    });

});
