jQuery(function ($) {
    jQuery(document).ready(function () {
        var major_status;
        $('button#edit-batch').on('click', function () {
            $grandPar = $(this).parents('tr');
            $input = $grandPar.find('input#level-view');
            $input.prop('disabled', false);
            $input.addClass('enable-batch');
            $par = $(this).parent();
            $(this).remove();
            $par.append('<button type="submit" name="save-batch" class="btn btn-sm edit-major" style="margin-right:10px;">Save</button>');
            $par.append('<button type="button" id="cancel-edit-batch" class="btn btn-sm edit-major">Cancel</button>');
            $('button#cancel-edit-batch').on('click', function () {
                window.location.reload();
            });
            $('input#level-view').change(function () {
                $('input#batch-name').val($(this).val());
            });
        });
        var check = $('div.message').text();
        if (check != '') {
            setTimeout(function () { window.location.reload(); }, 1500);
        }
        $('button#add-new-batch').on('click', function (){
            $('form#form-add-new-batch').toggleClass('active');
        })
        $('button#cancel-add-new-batch').on('click', function (){
            $('form#form-add-new-batch').removeClass('active');
        })
    });
})

