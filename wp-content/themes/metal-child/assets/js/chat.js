jQuery(function ($) {
    jQuery(document).ready(function () {
        var user_id;
        var current_user_id;
        $('body').on('click', '.dropdown-notification', function () {
            var el_id = $(this).attr('id');
            if (el_id == 'chat-bar') {
                notification_chat(this);
            }
            accordionToggle(this);
        });
        $('body').on('click', '.get-chat', function () {
            $sender_id = $(this).find('input#user-send-id').val();
            $receiver_id = $(this).find('input#user-receive-id').val();
            $sender_name = $(this).find('input#user-name').val();
            current_user_id = $receiver_id;
            user_id = $sender_id;
            create_chat_box2($sender_id, $receiver_id);
            get_port_chat($receiver_id, $sender_id);
        });

        $('body').on('click', 'button#group-chat', function () {
            $form_id = $(this).parent().find('input#form-id').val();
            getChatForm($form_id);
        });
        $('body').on('click', 'button#chat-with-user', function () {
            $user_id = $(this).parent().find('input#user-id').val();
            $current_user_id = $(this).parent().find('input#current-user-id').val();
            current_user_id = $current_user_id;
            user_id = $user_id;
            create_chat_box(user_id);
            get_port_chat(current_user_id, user_id);
        });
        $('body').on('click', 'span#close-box-chat', function () {
            $(this).parents('.box-chat').remove();
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
                if (message != '') {
                    generate_content_chat(current_user_id, user_id, message);
                }
                $(this).empty();
                document.execCommand('insertHTML', false, '');
                return false;
            }

        });

        $('body').on('click', '.box-chat-title', function () {
            $('.group-box-chat').toggleClass('hidden');
        });
        $(window).scroll(function () {
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                // ajax call get data from server and append to the div
            }
        });
    });
    function accordionToggle(self) {
        $(self).find('.dropdown-content').toggleClass('active-noti');
        $(self).siblings().find('.dropdown-content').removeClass('active-noti');

    }
});
