jQuery(function ($) {
    jQuery(document).ready(function () {
        var major_status;
        $('button#edit-major').on('click', function () {
            $grandPar = $(this).parents('tr');
            $get_comment = $grandPar.find($('td#major-comment')).text();
            $input = $grandPar.find('input');
            $input.prop('disabled', false);
            $input.addClass('enable-major');
            $par = $(this).parent();
            $(this).remove();
            $('textarea#major-comment-edit').val($get_comment);
            $major_comment = '<textarea name="major-comment" id="major-comment" cols="65" rows="5">' + $get_comment + '</textarea>';
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

            major_status = $grandPar.find('td:nth-child(6)');
            optionSelectMajor(major_status);
        });
        $('button#add-new-major').on('click', function () {

        });

        var check = $('div.message-success').text();
        if (check != '') {
            setTimeout(function () { window.location.reload(); }, 1500);
        }

        window.optionSelectMajor = function (el) {
            $par = el.parents('tr');
            $status = el.attr('id');
            $.ajax({
                url: ajaxurl,
                data: { 'action': 'select_major_status', 'status': $status },
                type: 'post',
                success: function (result) {
                    el.html(result.content);
                    $stats = el.find('select#major-status');
                    $input_major = $par.find('input#major-status-value');
                    $('body').on('click', $stats, function () {
                        $input_major.val($stats.val());
                    });
                },
                errors: function (result) { }

            });
        };

    });
})

