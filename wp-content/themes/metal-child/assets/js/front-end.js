jQuery(function ($) {
    jQuery(document).ready(function () {

        var check = $('#respond');
        if ($(check).length == 1) {
            $('#footer').css({ 'position': 'static' });
        }
        var keyword = $('b#keyword-search').text().trim();
        var check = document.getElementById('wpua-file-existing');
        if (check != null) {
            $(check).change(function () {
                readURL(this);
            });
        }
        var updated = $('div.updated');
        if (updated) {
            setTimeout(() => {
                $('div.updated').remove();
            }, 5000);
        }
        if (keyword) {
            $('div.finder-post-title h5').unmark().mark(keyword);
        }
        $('button#btn-alert-join').on('click', function () {
            verifyUserLogin();
        });
        $('.profile-userpic img').click(function () {
            $('#avatar-box').toggleClass('show');
        });

        var maxLength = 200;
        $('textarea#request-message').keyup(function () {
            var length = $(this).val().length;
            var length = maxLength - length;
            $('#chars').text(length + ' ');
        });
        $('.menu-items').on('click', function () {
            toggleMenu(this);
        });
        $('.sub-menu-items').on('click', function () {
            $(this).addClass('active');
            $(this).siblings().removeClass('active');
        });
        function toggleMenu(self) {
            $(self).addClass('active');
            $(self).find('.sub-menu-items').slideDown(700);
            $(self).siblings().find('.sub-menu-items').slideUp(700);
            $(self).siblings().removeClass('active');
            $(self).siblings().find('.sub-menu-items').removeClass('active');
        }

        window.onscroll = function (e) {
            $check = $('#main-menu').height();
            if ($check == 70) {
                $('div.dropdown-content').css({ 'top': '70px' });

            } else {
                $('div.dropdown-content').css({ 'top': '60px' });

            }
        }
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('div#show-avatar img.avatar').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        window.save_recommended = function (form_id, message) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'recommended_message_chat', 'ID': form_id, 'message': message },
                type: 'post',
                success: function (result) {
                    $('.save-popup').html(result.message);
                    $('.save-popup').show();
                    setTimeout(function () {
                        $('.save-popup').hide();
                    }, 700);
                },
                errors: function (result) { }
            });
        }
        window.get_recommend_list = function (form_id) {
            $('#waiting').show();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'get_list_recommend', 'ID': form_id },
                type: 'post',
                success: function (result) {
                    $('#waiting').hide();
                    if (result.count > 0) {
                        $('.recommend-list').html(result.content);
                    } else {
                        $('.recommend-list').html('No recommended');
                    }

                },
                errors: function (result) { }
            });
        }
        window.remove_recommended = function (ID, recommend) {
            $('#waiting').show();
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'remove_recommended', 'ID': ID },
                type: 'post',
                success: function (result) {
                    if (result.check) {
                        $(recommend).remove();
                    }
                },
                errors: function (result) { }

            });
        }
    });
})
