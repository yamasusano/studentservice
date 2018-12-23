jQuery(function ($) {
    $(document).ready(function () {
        var checkAll = $('table#post-view').find($('input#select-all'));
        var setcheck = $('table#post-view').find($('tr input[name=check-item]'));
        var post_id = [];
        checkAll.click(function () {
            var check = $(checkAll).prop('checked');
            if (check) {
                $(setcheck).prop('checked', true);
                checkListItem(setcheck);

            } else {
                $(setcheck).prop('checked', false);
                checkListItem(setcheck);
            }
            $('#str').val(JSON.stringify(post_id));

        });
        setcheck.click(function () {
            checkItem($(this));
            $('#str').val(JSON.stringify(post_id));
        });
        function checkItem(clicked) {
            var check = $(clicked).prop('checked');
            var par = $(clicked).parents('tr');
            var id = $(par).find('input[name=post-id]').val();
            if (check) {
                post_id.push(id);
            } else {
                post_id.splice($.inArray(id, post_id), 1);
            }
        }
        function checkListItem(callCheck) {
            $(callCheck).each(function () {
                var check = $(this).prop('checked');
                var par = $(this).parents('tr');
                var id = $(par).find('input[name=post-id]').val();
                if (check) {
                    post_id.push(id);
                } else {
                    post_id.splice($.inArray(id, post_id), 1);
                }
            })
        }
    });
})

