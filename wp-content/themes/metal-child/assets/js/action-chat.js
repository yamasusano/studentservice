jQuery(function ($) {
    jQuery(document).ready(function () {
        setInterval(function () {
            var el = $('#list-member-chat').find('a');
            var box_title = $('.box-chat-title');
            listUserID(box_title);
            listUserID(el);

        }, 5000);

        function listUserID(el) {
            for (let index = 0; index < el.length; index++) {
                var user_id = $(el[index]).find('input.user-id').val();
                var span = $(el[index]).find('span');
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
                    if ($check == result.name) {
                        $('#box-chat-text').focus();
                    } else {
                        $('body').append(result.box_chat);
                        $('body div.box-chat-content').html(result.history_chat);
                        $('#box-chat-text').focus();
                    }
                },
                errors: function (result) { }

            });
        }
        window.generate_content_chat = function (user_id, message) {

            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'generate_content_chat', 'user_id': user_id, 'message': message },
                type: 'post',
                success: function (result) {
                    $('div.box-chat-content').append(result.message);
                },
                errors: function (result) { }

            });
        }
        window.notification_chat = function (el) {
            // var loading = $(el).find('#wait');
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                // beforeSend: function () { $(loading).show(); },
                // complete: function () { $(loading).hide(); },
                data: { 'action': 'notification_chat' },
                type: 'post',
                success: function (result) {
                    $result = $(el).find('div.active-noti');
                    $($result).html(result.message);
                },
                errors: function (result) { }

            });
        }
        //     function refreshToHomePage3(waitime){
        //         var handle = setInterval(function () {  
        //                        alert("called after waitime");
        //                        clearInterval(handle);   
        //                      }, waitime);
        //         return handle;
        //    }   

        //    var handle = refreshToHomePage3(5000);

    });

});
