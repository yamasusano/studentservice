jQuery(function($) {
    jQuery(document).ready(function() {
        // countdown and limit word typing to textarea
        $('#charNum').html(0 + '/' + $('#description-member').attr("maxlength"));
        $('#skillNumb').html(0 + '/' + $('#skill-require').attr("maxlength"));
        $('#projectNumb').html(0 + '/' + $('#project-description').attr("maxlength"));
        $('#description-member').keyup(function() {
            litmitTextArea($('#description-member'), $('#charNum'));
        })
        $('#skill-require').keyup(function() {
            litmitTextArea($('#skill-require'), $('#skillNumb'));
        })
        $('project-description').keyup(function() {
            litmitTextArea($('#project-description'), $('#projectNumb'));
        })

        $('#btnFindMember').on('click', function(e) {
            if ($('#user-id').val() != 0) {
                formFindMember(e);
            } else {
                verifyLogged(e);
            }
        });

        function verifyLogged(e) {
            $('body').prepend('<div class="login_overlay"></div>');
            $('form#login').fadeIn(500);
            $('div.login_overlay, form#login a.close').on('click', function() {
                $('div.login_overlay').remove();
                $('form#login').hide();
            });
            $('#closeForm').on('click', function() {
                $('div.login_overlay').remove();
                $('form#login').hide();
            });
            e.preventDefault();
        }

        function formFindMember(e) {
            $('body').prepend('<div class="login_overlay"></div>');
            $('form#findMember').fadeIn(500);
            $('div.login_overlay, form#findMember a.close').on('click', function() {
                $('div.login_overlay').remove();
                $('form#findMember').hide();
            });
            $('#closeFormFind').on('click', function() {
                $('div.login_overlay').remove();
                $('form#findMember').hide();
            });
            e.preventDefault();
        }

        function litmitTextArea(elementID, outputID) {
            var text_max = elementID.attr("maxlength");
            var text_length = elementID.val().length;
            outputID.html(text_length + '/' + text_max);
        }
        // Perform AJAX login on form submit
        $('form#login').on('submit', function(e) {
            $('form#login p.status').show().text(ajax_login_object.loadingmessage);
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: zozo_js_vars.zozo_ajax_url,
                data: {
                    'action': 'ajaxlogin',
                    'username': $('form#login #username').val(),
                    'password': $('form#login #password').val(),
                    'security': $('form#login #security').val()
                },
                success: function(data) {
                    $('form#login p.status').text(data.message);
                    if (data.loggedin == true) {
                        document.location.href = ajax_login_object.redirecturl;

                    }
                }
            });
            e.preventDefault();
        });
    });
})