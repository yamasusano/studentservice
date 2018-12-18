jQuery(function ($) {
    jQuery(document).ready(function () {
        var major_status;
        $('button#edit-semester').on('click', function () {
            $grandPar = $(this).parents('tr');
            $input = $grandPar.find('input#end-date-view');
            $input.prop('disabled', false);
            $input.addClass('enable-major');
            $par = $(this).parent();
            $(this).remove();
            $par.append('<button type="submit" name="save-semester" class="btn btn-sm edit-major" style="margin-right:10px;">Save</button>');
            $par.append('<button type="button" id="cancel-edit-major" class="btn btn-sm edit-major">Cancel</button>');
            $('button#cancel-edit-major').on('click', function () {
                window.location.reload();
            });
            $('input#end-date-view').change(function () {
                $('input#semester-end-date').val($(this).val());
            });
        });
        var check = $('div.message').text();
        if (check != '') {
            setTimeout(function () { window.location.reload(); }, 1500);
        }
    });
})

