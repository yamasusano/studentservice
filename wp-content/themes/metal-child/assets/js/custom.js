jQuery(function ($) {
    jQuery(document).ready(function () {
        $('div#home-view').on('click', function () {
            dataLink();
        });
        $('div#my-group').on('click', function () {
            setMenuGroup();
        });
        $('div#teacher-group').on('click', function () {
            get_teacher_group_list();
        })
        $('div#manage-request').on('click', function () {
            manageRequest();
        })
        $('body').on('click', 'button#edit-profile', function () {
            changeButton();
        });
        $('body').on('click', 'button#finder-form', function () {
            FinderForm();
        });
        $('body').on('click', 'button#member-list', function () {
            generateMember();
        });
        $('body').on('click', 'button#leave-group', function () {
            studentLeaveGroup();
        });
        $('body').on('click', 'button#search-users', function () {
            resultSearch();
        });
        $('body').on('click', 'button#group-chat', function () {
            getChatForm();
        });
        $('body').on('click', 'button#action-invite-student', function () {
            $user_id = $(this).parent().find($('input#user-id')).val();
            $current_action = $(this).parents('tr').index();
            get_action_invite_user($user_id, $current_action);
            $(this).remove();
        });
        $('body').on('click', 'button#cancel-invite-user', function () {
            $user_id = $(this).parent().find($('input#user-id')).val();
            $current_action = $(this).parents('tr').index();
            re_action_intive_user($user_id, $current_action);
            $(this).remove();
        });
        $('body').on('click', 'button#acxept-user', function () {
            requestHandle($(this));
        });
        $('body').on('click', 'button#deny-user', function () {
            rejectRequest($(this));
        });
        $('body').on('click', 'button#reject-invite-request', function () {
            rejectRequest($(this));
        });
        $('body').on('click', 'button#cancel-request-join-form', function () {
            rejectRequest($(this));
        });
        $('body').on('click', 'button#join-in-form', function () {
            $form_id = $(this).parent().find($('input#form-id')).val();
            access_request_via_user($(this), $form_id);
        });
        $('body').on('click', 'button#deny-join-in', function () {
            $form_id = $(this).parent().find($('input#form-id')).val();
            rejectReuestBySelf($(this), $form_id);
        });
        $('body').on('click', 'button#update-profile', function () {
            var gender = $('select#gender').val();
            var major = $('select#major').val();
            var name = $('input#user-name').val();
            var biograph = $('textarea#user-description').val();
            var phone = $('select#user-level').val();
            var address = $('textarea#address').val();
            updateProfile(name, gender, biograph, phone, address, major);
        });
        $('body').on('click', '#post-form', function () {
            var semester = $('select#semester').val();
            var title = $('#title').val();
            var description = CKEDITOR.instances['description'].getData();
            var members = '';
            var skill = $('.multiSel span').text();
            var otherSkill = $('#skill-other').val();
            var supervisor = '';
            var close_date = $('#close-date').val();
            var contact = $('#contact-form').val();
            postForm(semester, title, description, members, skill, otherSkill, supervisor, close_date, contact);
        });
        $('body').on('click', 'button#close-form-finder', function () {
            closeFormFinder();
        });
        $('body').on('click', 'button#reopen-form-finder', function () {
            reopenFormFinder();
        });
        $('body').on('click', 'button#save-form-finder', function () {
            var title = $('#title').val();
            var description = CKEDITOR.instances['description'].getData();
            var skill = $('.multiSel span').text();
            var otherSkill = $('#skill-other').val();
            var contact = $('#contact-form').val();
            var semester = $('select#semester').val();
            updateFinderForm(title, description, otherSkill, contact, semester, skill);
        });
        $('body').on('click', 'button#change-admin', function () {
            setNewLeader($(this));

        });
        $('body').on('click', 'button#kick-out', function () {
            kickOutMember($(this));
        });

        // action check edit / view profile
        var tech = getUrlParameter('mode');
        if (tech == 'edit') {
            $(window).load(function () {
                setMenuGroup();
                FinderForm();
                var group = $('#group-view');
                group.addClass('active');
                group.find('.sub-menu-items').slideDown();
                group.siblings().removeClass('active');
                $('#my-group').addClass('active');


            });
        } else if (tech == 'view') {
            $(window).load(function () {
                setMenuGroup();
                var group = $('#group-view');
                group.addClass('active');
                group.find('.sub-menu-items').slideDown();
                group.siblings().removeClass('active');
                $('#my-group').addClass('active');
            });
        } else {
            $(window).load(function () {
                overViewProfile();
            });
        }
    });

    function getChatForm() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'get_chat_form' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.chat_form);
                $('div#group-contents').html(html);
            },
            errors: function (result) { }

        });
    }

    function changeButton() {
        $('div#profile-contents textarea,input').prop('disabled', false);
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'change_button' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.btnChange);
                $('div#edit-btn').html(html);
                $('div.gender').html(result.gender);
                $('div.major').html(result.major);
                $('div.semester-level').html(result.semester_level);
            },
            errors: function (result) { }
        });
    }


    function dataLink() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'data_over_view' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.view);
                $('#profile-contents').html(html);
                $('#btn-quick-link').html('');
                $('button#edit-profile').on('click', function () {
                    $('div#profile-contents textarea,input').prop('disabled', false);
                    changeButton();
                });
            },
            errors: function (result) { }

        });

    }
})
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};


