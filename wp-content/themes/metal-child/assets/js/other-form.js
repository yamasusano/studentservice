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
        $('body').on('click', 'p#student-form-title', function () {
            form_id = $(this).parent().find('input#student-form-id').val();
            form_title = $(this).text();
            get_student_form_content(form_id, form_title);
        });
        $('body').on('click', '#btn-view-list-other-group', function () {
            get_teacher_group_list();
            $('div#btn-quick-link').hide();
        });
        $('body').on('click', 'button#leave-group-teacher', function () {
            comfirmLeaveGroupTeacher(form_id, form_title);
        });
        $('body').on('click', 'button#members-lists', function () {
            members_list(form_id);
        });
        $('body').on('click', 'div#student-groups', function () {
            get_list_student_form();
        });
        $('body').on('click', 'button#btn-view-list-student-form', function () {
            get_list_student_form();
        });


    });
})
