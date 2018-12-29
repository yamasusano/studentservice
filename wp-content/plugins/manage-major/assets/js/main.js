jQuery(function ($) {
    jQuery(document).ready(function () {
        window.$_GET = new URLSearchParams(location.search);
        var major_id = $_GET.get('major-id');
        var check = document.getElementById('my_image_upload');
        if (check != null) {
            loadImg();
        }
        $('#add-new-batch').click(function () {
            $('#form-add-new-batch').toggleClass('active-show');
        });
        $('button#add-new-skill').click(function () {
            $render = '<tr><td><input type="text" class="skill-code" value="" required/></td>' +
                '<td><input type="text" class="skill-name" value=""/></td>' +
                '<td><button name="add" class="add-skill-major btn"><i class="fa fa-floppy-o" aria-hidden="true"></i></button></td></tr>';
            $code = $('#skill-list tr:last').prev().find('input.skill-code');
            $name = $('#skill-list tr:last').prev().find('input.skill-name');

            if ($code.val() == '') {
                $code.focus();
            } else if ($name.val() == '') {
                $name.focus();
            } else {
                $(this).closest('table').find('tr:last').prev().after($render);
            }
        });
        $('button.save-skill').on('click', function () {
            update_skill($(this));
            var r = '<div class="message-success"> Update responsibility success</div>';
            $('div#message').html(r);
            setTimeout(function () {
                $('div#message').html('');
                window.location.reload();
            }, 3000);
        })
        $('body').on('click', '.add-skill-major', function () {
            $code = $(this).parents('tr').find('input.skill-code');
            $name = $(this).parents('tr').find('input.skill-name');
            if ($code.val() == '') {
                $code.focus();
            } else if ($name.val() == '') {
                $name.focus();
            } else {
                add_new_skill($code.val(), $name.val());
                window.location.reload(true);
            }
        })
        $('button.remove-skill').click(function () {
            var cf = confirm("DO you want delete this responsibility ?");
            $(document).keydown(function (e) {
                if (e.keyCode == 27) {
                    cf = false;
                }
            });
            if (cf == true) {
                remove_skill($(this));
                $par = $(this).parents('tr');
                $par.remove();
            }
        });
        window.update_skill = function (button) {
            $type = $(button).attr('name');
            $par = $(button).parents('tr');
            $id = $par.find('input.skill-id').val();
            $code = $par.find('input.skill-code').val();
            $name = $par.find('input.skill-name').val();
            set_action_skill($type, $id, $code, $name);
        };

        window.remove_skill = function (button) {
            $type = $(button).attr('name');
            $par = $(button).parents('tr');
            $id = $par.find('input.skill-id').val();
            $code = $par.find('input.skill-code').val();
            $name = $par.find('input.skill-name').val();
            set_action_skill($type, $id, $code, $name);
        }
        window.set_action_skill = function (type, id, code, name) {
            $.ajax({
                url: ajaxurl,
                data: { 'action': 'get_action_skill', 'type': type, 'id': id, 'code': code, 'name': name },
                type: 'post',
                success: function (result) {
                    $('div#message').html(result.message);
                    console.log('ok');
                },
                errors: function (result) {
                    console.log('ok');
                }

            });
        }
        window.add_new_skill = function (code, name) {
            $.ajax({
                url: ajaxurl,
                data: { 'action': 'add_new_skill_major', 'major-id': major_id, 'code': code, 'name': name },
                type: 'post',
                success: function (result) {

                },
                errors: function (result) {
                    console.log('ok');
                }

            });
        }
        function loadImg() {
            document.getElementById('my_image_upload').onchange = function (evt) {
                var tgt = evt.target || window.event.srcElement,
                    files = tgt.files;
                if (FileReader && files && files.length) {
                    var fr = new FileReader();
                    fr.onload = function () {
                        document.getElementById('img-view').src = fr.result;
                    }
                    fr.readAsDataURL(files[0]);
                }
            }
        }
    });


});

