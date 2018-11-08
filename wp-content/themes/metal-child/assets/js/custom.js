jQuery(function ($) {
    jQuery(document).ready(function () {
        $('.menu-items').on('click', function () {
            toggleMenu(this);
        });

        $('div#home-view').bind('click', function () {
            dataLink();
        });
        $('button#edit-profile').bind('click', function () {
            $('div#profile-contents textarea,input').prop('disabled', false);
            changeButton();
        });
        $('div#my-group').bind('click', function () {
            setMenuGroup();
        });
        $('div#my-groups').bind('click', function () {
            menuTeacherGroup();
        });
        $('div#notification').bind('click', function () {
            manageRequest();
        });

        var tech = getUrlParameter('form-mode');
        if (tech == 'edit') {
            $(window).load(function () {
                setMenuGroup();
                FinderForm();
                optionSelectFinder();
            });
        } else {
            overViewProfile();
        }
    });
    function overViewProfile() {

        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'over_view_profile' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.overview);
                $('#profile-contents').html(html);
            },
            errors: function (result) { }
        });
    }
    function menuTeacherGroup() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'teacher_menu_group' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.create_menu);
                $('#profile-contents').html(html);
                var parent = $('div.group-menu-item');
                $('button#create-new-group').bind('click', function () {
                    var $check = parent.find('input#title-form');
                    if ($check.length) {
                        $check.focus();
                    } else {
                        parent.append('<div class="add-title"><input type="text" name="title-form" id="title-form" required><button type="submit" name="create-title" id ="create-title" class= "btn btn-sm btn-info">ADD</button><button type="submit" name="cancel-create-title" id ="cancel-create-title" class= "btn btn-sm btn-danger">CANCEL</button></div>');
                    }
                    $('button#cancel-create-title').bind('click', function () {
                        $('input#title-form').remove();
                        $('button#create-title').remove();
                        $(this).remove();
                    });
                    $('button#create-title').bind('click', function () {
                        if ($('input#title-form').empty()) {
                            $('input#title-form').focus();
                        } else {
                            createNewForm();
                        }
                    });
                });
            },
            errors: function (result) { }

        });
    }
    function createNewForm() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'create_new_form' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result);

            },
            errors: function (result) { }

        });
    }
    function setMenuGroup() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'menu_group' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.menu);
                $('#profile-contents').html(html);
                $('button#finder-form').bind('click', function () {
                    FinderForm();

                });
                $('button#member-list').bind('click', function () {
                    generateMember();
                });
                $('button#leave-group').bind('click', function () {
                    studentLeaveGroup();
                });
                $('button#search-users').bind('click', function () {
                    var keyword = $('input#user-names').val();
                    resultSearch(keyword);
                });
            },
            errors: function (result) { }

        });
    }
    function resultSearch(keyword) {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'result_search_user', 'keyword': keyword },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.render);
                $('div#group-contents').html(html);
            },
            errors: function (result) { }

        });
    }
    function studentLeaveGroup() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'student_leave_group' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result);
                if (result.type == 1) {
                    $.confirm({
                        title: result.message,
                        content: '',
                        buttons: {
                            confirm: function () {
                                actionStudentLeaveGroup();
                            },
                            cancel: function () {
                            }
                        },
                        theme: 'my-theme',
                        animation: 'none'
                    });
                } else {
                    $.alert({
                        title: result.message,
                        content: '',
                        theme: 'my-theme',
                        animation: 'none'
                    });
                }

            },
            errors: function (result) { }
        });
    }
    function actionStudentLeaveGroup() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'action_student_leave_group' },
            type: 'post',
            success: function (result) {
                window.location.reload();
            },
            errors: function (result) { }
        });
    }
    function changeButton() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'change_button' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.btnChange);
                $('div#edit-btn').html(html);
                $('div.gender').html(result.gender);
                $('div.major').html(result.major);
                $('button#update-profile').bind('click', function () {
                    var gender = $('select#gender').val();
                    var major = $('select#major').val();
                    var name = $('input#user-name').val();
                    var biograph = $('textarea#user-description').val();
                    var phone = $('input#phone').val();
                    var address = $('textarea#address').val();
                    updateProfile(name, gender, biograph, phone, address, major);
                });
            },
            errors: function (result) { }
        });
    }
    function updateProfile(name, gender, biograph, phone, address, major) {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'update_profile', 'name': name, 'gender': gender, 'bio': biograph, 'phone': phone, 'address': address, 'major': major },
            type: 'post',
            success: function (result) {
                $('div.verify-input').text(result.message);
                window.location.reload();
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
                $('button#edit-profile').bind('click', function () {
                    $('div#profile-contents textarea,input').prop('disabled', false);
                    changeButton();
                });
            },
            errors: function (result) { }

        });

    }

    function FinderForm() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'finder_form' },
            type: 'post',
            success: function (result) {
                var data_description = '';
                var html = $.parseHTML(result.form);
                $('#group-contents').html(html);
                CKEDITOR.replace('description');
                dropdownSelectMenu($(".dropdown dt a"), $(".dropdown dd ul li a"));
                $('input#skill-other').bind("enterKey", function (e) {
                    $(this).val($(this).val() + ' , ');

                });
                $('input#skill-other').keyup(function (e) {
                    if (e.keyCode == 13) {
                        $(this).trigger("enterKey");
                    }
                });
                $('#post-form').bind('click', function () {
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
                $('button#edit-form-finder').bind('click', function () {
                    optionSelectFinder();
                });
                $('button#close-form-finder').bind('click', function () {
                    closeFormFinder();
                });
                $('button#reopen-form-finder').bind('click', function () {
                    reopenFormFinder();
                });
            },
            errors: function (result) { }

        });
    }
    function reopenFormFinder() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'reopen_form_finder' },
            type: 'post',
            success: function (result) {
                $('div#group-message').html(result.message);
                window.location.reload();
            },
            errors: function (result) { }

        });
    }
    function closeFormFinder() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'close_form_finder' },
            type: 'post',
            success: function (result) {
                $('div#group-message').html(result.message);
                window.location.reload();
            },
            errors: function (result) { }

        });
    }

    function optionSelectFinder() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'get_action_form' },
            type: 'post',
            success: function (result) {
                $('div.form-btn').html(result.get_action);
                $('button#save-form-finder').on('click', function () {
                    var title = $('#title').val();
                    var description = CKEDITOR.instances['description'].getData();
                    var skill = $('.multiSel span').text();
                    var otherSkill = $('#skill-other').val();
                    var close_date = $('#close-date').val();
                    var contact = $('#contact-form').val();
                    var semester = $('select#semester').val();
                    updateFinderForm(title, description, otherSkill, contact, close_date, semester);
                });
            },
            errors: function (result) { }

        });
    }
    function updateFinderForm(title, description, otherSkill, contact, close_date, semester) {

        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'update_form_finder', 'title': title, 'description': encodeVars(description), 'otherSkill': otherSkill, 'contact': contact, 'close': close_date, 'semester': semester },
            type: 'post',
            success: function (result) {
                $('div#group-message').html(result.message);
            },
            errors: function (result) { }

        });
    }
    function manageRequest() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'magage_request' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.notification);
                $('#profile-contents').html(html);
                $('#acxept-user').bind('click', function () {
                    requestHandle($(this));
                });
                $('button#deny-user').bind('click', function () {
                    rejectRequest($(this));
                });
            },
            errors: function (result) { }
        });
    }
    function rejectRequest(button) {
        var parents = button.parents().eq(1);
        var user = parents.find('div.content-request>p>a').text();
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'reject_user_request', 'request-user': user },
            type: 'post',
            success: function (result) {
                if (result.results == true) {
                    parents.slideUp('slow', function () { parents.remove(); });
                } else {
                    parents.slideUp('slow', function () { parents.remove(); });
                }

            },
            errors: function (result) { }

        });
    }
    function requestHandle(button) {
        var parents = button.parents().eq(1);
        var user = parents.find('div.content-request>p>a').text();
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'accept_request', 'request-user': user },
            type: 'post',
            success: function (result) {
                if (result.results == true) {
                    $('div.noti-message').html(result.message);
                    parents.slideUp('slow', function () { parents.remove(); });
                } else {
                    $('div.noti-message').html(result.message);
                    parents.slideUp('slow', function () { parents.remove(); });
                }

            },
            errors: function (result) { }

        });
    }

    function postForm(semester, title, description, members, skill, otherSkill, supervisor, close_date, contact) {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'post_finder_form', 'semester': semester, 'title': title, 'description': description, 'members': members, 'skill': skill, 'supervisor': supervisor, 'close_date': close_date, 'contact': contact, 'other': otherSkill },
            type: 'post',
            success: function (result) {
                if (result.type == 0) {
                    $('div#group-message').text(result.message);
                } else {
                    $('div#group-message').text(result.message);
                    window.location.reload();
                }

            },
            errors: function (result) { }

        });


    }

    function generateMember() {
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'members_list' },
            type: 'post',
            success: function (result) {
                var html = $.parseHTML(result.members);
                $('#group-contents').html(html);
                $('button#change-admin').on('click', function () {
                    setNewLeader($(this));

                });
                $('button#kick-out').on('click', function () {
                    kickOutMember($(this));

                });
            },
            errors: function (result) { }

        });
    }
    function kickOutMember(button) {
        var parents = button.parents().eq(1);
        var user_id = parents.find('input#user-id').val();
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'remove_member_in_group', 'user': user_id },
            type: 'post',
            success: function (result) {
                $('div.member-message').html(result.message);
                window.location.reload();
            },
            errors: function (result) { }

        });
    }
    function setNewLeader(button) {
        var parents = button.parents().eq(1);
        var user_id = parents.find('input#user-id').val();
        $.ajax({
            url: zozo_js_vars.zozo_ajax_url,
            data: { 'action': 'set_new_leader_in_group', 'user': user_id },
            type: 'post',
            success: function (result) {
                $('div.member-message').html(result.message);
                window.location.reload();
            },
            errors: function (result) { }

        });

    }
    function dropdownSelectMenu(el1, el2) {
        el1.on('click', function () {
            $(".dropdown dd ul").slideToggle('fast');
        });

        el2.on('click', function () {
            $(".dropdown dd ul").hide();
        });

        function getSelectedValue(id) {
            return $("#" + id).find("dt a span.value").html();
        }

        $(document).bind('click', function (e) {
            var $clicked = $(e.target);
            if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
        });

        $('.mutliSelect input[type="checkbox"]').on('click', function () {

            var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
                title = $(this).val() + ",";

            if ($(this).is(':checked')) {
                var html = '<span title="' + title + '">' + title + '</span>';
                $('.multiSel').append(html);
                $(".hida").hide();
            } else {
                $('span[title="' + title + '"]').remove();
                var ret = $(".hida");
                $('.dropdown dt a').append(ret);

            }
        });
    }

    function toggleMenu(self) {
        $(self).toggleClass('active');
        $(self).find('.sub-menu-items').stop().slideToggle(700);
        $(self).siblings().find('.sub-menu-items').slideUp(700);
        $(self).siblings().removeClass('active');
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


