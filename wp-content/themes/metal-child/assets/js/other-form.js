jQuery(function ($) {
    jQuery(document).ready(function () {
        var form_id;
        $('body').on('click', '#btn-view-list-other-group', function () {
            get_teacher_group_list();
            $('div#btn-quick-link').hide();
        });
        $('body').on('click', 'button#leave-group-teacher', function () {
            var ID = $(this).find('input').val();
            var title = $('.form-view').find('h3').text();
            comfirmLeaveGroupTeacher(ID, title);
        });

        $('body').on('click', 'div#student-groups', function () {
            get_list_student_form();
        });
        $('body').on('click', 'button#btn-view-list-student-form', function () {
            get_list_student_form();
        });


    });
})
