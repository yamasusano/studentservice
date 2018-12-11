jQuery(function ($) {
    jQuery(document).ready(function () {
        var form_id;
        var form_title;
        $('body').on('click', 'p.title-form-other', function () {
            $par = $(this).parents('tr');
            $form_id = $par.find('input#teacher-form-id').val();
            form_id = $form_id;
            form_title = $(this).text();
            teacher_form_detail($form_id, form_title);
        });
        $('body').on('click', '#btn-view-list-other-group', function () {
            get_teacher_group_list();
        });
        $('body').on('click', 'button#members-lists', function () {
            members_list(form_id);
        });
        $('body').on('click', 'div#student-groups', function () {
            $('div#btn-quick-link').html('');
            get_list_student_form();
        });
        $('body').on('click', 'button#btn-view-list-student-form', function () {
            get_list_student_form();
            $('div#btn-quick-link').html('');
        });
        $('body').on('click', 'p#student-form-title', function () {
            form_id = $(this).parent().find('input#student-form-id').val();
            form_title = $(this).text();
            $('.group-menu-items h4').append(' > ' + form_title);
            get_student_form_detail(form_id);
        });

    });
})
