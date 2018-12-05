jQuery(function ($) {
    jQuery(document).ready(function () {
        $('body').on('click', 'div#my-groups', function () {
            menuTeacherGroup();
        });
        $('body').on('click', 'button#create-new-group', function () {
            createTitleGroup();
        });
        window.createTitleGroup = function () {
            var parent = $('div.group-menu-item');
            var $check = parent.find('input#title-form');
            if ($check.length) {
                $check.focus();
            } else {
                parent.append('<div class="add-title"><input type="text" name="title-form" id="title-form" required><button type="submit" name="create-title" id ="create-title" class= "btn btn-sm btn-info">ADD</button><button type="submit" name="cancel-create-title" id ="cancel-create-title" class= "btn btn-sm btn-danger">CANCEL</button></div>');
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
                    // var menu_list = $.parseHTML(result.create_list);
                    $('#profile-contents').html(html);
                    // $('#group-contents').html(menu_list);

                },
                errors: function (result) { }

            });
        }
        window.createNewForm = function ($title) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'create_new_form', 'title': $title },
                type: 'post',
                success: function (result) {
                    // var html = $.parseHTML(result);
                    console.log(result.message);
                },
                errors: function (result) { }

            });
        }
    });
});