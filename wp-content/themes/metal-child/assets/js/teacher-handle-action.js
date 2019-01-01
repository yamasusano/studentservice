jQuery(function ($) {
    jQuery(document).ready(function () {
        $('body').on('click', 'div#my-groups', function () {
            menuTeacherGroup();
            $('div#btn-quick-link').hide();
        });
        $('body').on('click', '#btn-view-list-group', function () {
            menuTeacherGroup();
        });
        $('body').on('click', 'button#create-new-group', function () {
            createTitleGroup();
        });

        $('body').on('click', 'div#manage-teacher-request', function () {
            manage_teacher_request();
            $('#btn-quick-link').hide();
        });
        $('body').on('click', 'button#acxept-user-via-leader', function () {
            handle_action_request($(this));
        });
        $('body').on('click', 'button#deny-user-via-leader', function () {
            handle_action_request($(this));
        });

    });
});