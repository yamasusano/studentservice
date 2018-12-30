jQuery(function ($) {
    jQuery(document).ready(function () {
        var user_id;
        window.current_user_id;
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'set_notice_for_user' },
            type: 'post',
            success: function (result) {
                current_user_id = result.current_id;
            },
            errors: function (result) { }
        });
        $('body').on('click', '.notice-request-show', function () {
            $link = $(this).find('input#redirect-link').val();
            window.location.replace($link);
        });
        $('body').on('click', '#noti-request', function () {
            $('.list-notification').find('#wait').show();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'show_notification_request' },
                type: 'post',
                success: function (result) {
                    $('.list-notification').find('#wait').hide();
                    $('.notification-message').html(result.content);
                },
                errors: function (result) { }
            });
        });


        $('body').on('click', '.get-chat', function () {
            $sender_id = $(this).find('input#user-send-id').val();
            $receiver_id = $(this).find('input#user-receive-id').val();
            $sender_name = $(this).find('input#user-name').val();
            if (current_user_id == $sender_id) {
                user_id = $receiver_id;
            } else {
                user_id = $sender_id;
            }
            var box_chat = $('#box-chat-text');
            if (box_chat.length > 0) {
                $('#box-chat-text').focus();
            } else {
                create_chat_box2($sender_id, $receiver_id);
                get_port_chat(current_user_id, user_id);
            }
            var other = $('body #notice-chat').find('.dropdown-content');
            $(other).removeClass('active-noti');
        });
        $('body').on('click', 'button#chat-with-user', function () {
            $user_id = $(this).parent().find('input#user-id').val();
            user_id = $user_id;
            var box_chat = $('#box-chat-text');
            if (box_chat.length > 0) {
                $('#box-chat-text').focus();
            } else {
                create_chat_box(user_id);
                get_port_chat(current_user_id, user_id);
            }
        });

        $('body').on('blur', '#box-chat-text', function () {
            var $element = $(this);
            if ($element.length && !$element.text().trim().length) {
                $element.empty();
            }
        });
        $('body').on('keydown', 'div#box-chat-text', function (event) {
            if (event.keyCode === 13 && !event.shiftKey) {
                var message = $(this).text();
                if ($.trim(message) != '') {
                    generate_content_chat(current_user_id, user_id, message);
                    $('span.notice-dot').hide();
                }
                $(this).empty();
                document.execCommand('insertHTML', false, '');
                return false;
            }
        });
        $('body').on('click', '.box-chat-title', function () {
            $('.group-box-chat').toggleClass('hidden');
        });
        $('body').on('click', '.notice-notification', function () {
            switchTabNotification($(this));
        });
        function switchTabNotification(self) {
            $(self).addClass('notice-selected');
            $(self).siblings().removeClass('notice-selected');
        }
        $('body').on('click', '#chat-bar', function () {
            var notice = $(this).parent('.dropdown-notification');
            notification_chat(notice);
            var notice = $(this).parent('.dropdown-notification');
            $(notice).find('.dropdown-content').toggleClass('active-noti');
            var other = $('body #notice-bar').find('.dropdown-content');
            $(other).removeClass('active-noti');
        });
        $('body').on('click', '#notification-bar', function () {
            var notice = $(this).parent('.dropdown-notification');
            $(notice).find('.dropdown-content').toggleClass('active-noti');
            var other = $('body #notice-chat').find('.dropdown-content');
            $(other).removeClass('active-noti');
        });

        $(document).mouseup(function (e) {
            var container = $('.group-menu-right');
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                var other = $('body ').find('.dropdown-content');
                $(other).removeClass('active-noti');
            }
        });

    });
});
