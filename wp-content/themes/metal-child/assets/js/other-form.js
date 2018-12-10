jQuery(function ($) {
    jQuery(document).ready(function () {
        var form_id;
        $('body').on('click', 'p.title-form-other', function () {
            $par = $(this).parents('tr');
            $form_id = $par.find('input#teacher-form-id').val();
            form_id = $form_id;
            teacher_form_detail($form_id);
        });

    });
})
