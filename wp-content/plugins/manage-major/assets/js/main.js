jQuery(function ($) {
    jQuery(document).ready(function () {
        $('button#edit-major').on('click', function () {
            $grandPar = $(this).parents('tr');
            $get_comment = $grandPar.find($('td#major-comment')).text();
            $input = $grandPar.find('input');
            $input.prop('disabled', false);
            $input.addClass('enable-major');
            $par = $(this).parent();
            $(this).remove();
            $('textarea#major-comment-edit').val($get_comment);
            $major_comment = '<textarea name="major-comment" id="major-comment" cols="80" rows="5">' + $get_comment + '</textarea>';
            $par.append('<input type="file" name="my_image_upload" id="my_image_upload" accept="image/*" multiple="false" style="margin-bottom:10px;"/>');
            $par.append('<button type="submit" name="save-major" class="btn btn-sm edit-major" style="margin-right:10px;">Save</button>');
            $par.append('<button type="button" id="cancel-edit-major" class="btn btn-sm edit-major">Cancel</button>');
            $comment = $grandPar.find('td:nth-child(4)');
            $comment.html($major_comment);
            $('button#cancel-edit-major').on('click', function () {
                window.location.reload();
            });
            $('input#code-view').change(function () {
                $('input#major-code').val($('input#code-view').val());
            });
            $('input#name-view').change(function () {
                $('input#major-name').val($('input#name-view').val());
            });
            $('textarea#major-comment').change(function () {
                $('textarea#major-comment-edit').val($('textarea#major-comment').val());
            });

        });
        var check = $('div.message-success').text();
        if (check != '') {
            setTimeout(function () { window.location.reload(); }, 1500);
        }
    });
})

