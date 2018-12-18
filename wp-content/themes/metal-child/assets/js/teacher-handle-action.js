jQuery(function ($) {
    jQuery(document).ready(function () {
        var form_id;
        $('body').on('click', 'div#my-groups', function () {
            menuTeacherGroup();
            $('div#btn-quick-link').html('');
        });
        $('body').on('click', '#btn-view-list-group', function () {
            menuTeacherGroup();
        });
        $('body').on('click', 'button#create-new-group', function () {
            createTitleGroup();
        });
        $('body').on('click', 'button#delete-form-teacher', function () {
            $row = $(this).parents('tr');
            $form_id = $(this).parent().find('input').val();
            $title = $row.find('td :first').text();
            deleteTeacherForm($row, $form_id, $title);
        });

        $('body').on('click', 'p.title-group-teacher', function () {
            $par = $(this).parents('tr');
            $form_id = $par.find('input#teacher-form-id').val();
            form_id = $form_id;
            getTeacherForm($form_id);

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
        $('body').on('click', 'div#manage-teacher-request', function () {
            manage_teacher_request();
        });
        $('body').on('click', 'button#acxept-user-via-leader', function () {
            handle_action_request($(this));
        });
        $('body').on('click', 'button#deny-user-via-leader', function () {
            handle_action_request($(this));
        });
        $('body').on('click', 'button#action-invite-via-teacher', function () {
            invite_student_via_teacher(form_id, $(this));
            $(this).remove();
        });
        $('body').on('click', 'button#cancel-invite-user-via-teacher', function () {
            re_action_intive_user_via_teacher($form_id, $(this));
            $(this).remove();
        });
        $('body').on('click', 'p#student-form-title', function () {
            form_id = $(this).parent().find('input#student-form-id').val();
            form_title = $(this).text();
            get_student_form_content(form_id, form_title);
        });

    });
});