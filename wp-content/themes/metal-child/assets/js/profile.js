jQuery(function ($) {
    jQuery(document).ready(function () {
        window.overViewProfile = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'over_view_profile' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.overview);
                    $('#profile-contents').html(html);
                    $('#btn-quick-link').hide();
                },
                errors: function (result) { }
            });
        }
        window.setMenuGroup = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'menu_group' },
                type: 'post',
                success: function (result) {
                    var html = $.parseHTML(result.menu);
                    $('#profile-contents').html(html);
                    $('#btn-quick-link').hide();
                },
                errors: function (result) { }

            });
        }
        window.resultSearch = function () {
            var keyword = $('input#user-names').val();
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
        window.studentLeaveGroup = function () {
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
        window.actionStudentLeaveGroup = function () {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'action_student_leave_group' },
                type: 'post',
                success: function (result) {
                    $.confirm({
                        title: 'Leave group successful!',
                        buttons: {
                            OK: function () {
                                window.location.reload();
                            }
                        }
                    });
                },
                errors: function (result) { }
            });
        }
        window.comfirmLeaveGroupTeacher = function (ID, title) {
            $.confirm({
                title: 'Do you want leave <b>' + title + '</b> group ?',
                content: '',
                buttons: {
                    confirm: function () {
                        $.ajax({
                            url: zozo_js_vars.zozo_ajax_url,
                            data: { 'action': 'leave_group_teacher', 'ID': ID },
                            type: 'post',
                            success: function (result) {
                                if (result.check == true) {
                                    $.confirm({
                                        title: 'Leave group successful!',
                                        buttons: {
                                            OK: function () {
                                                get_teacher_group_list();
                                            }
                                        }
                                    });
                                } else {
                                    $.alert({
                                        title: 'Leave group fail'
                                    });
                                }

                            },
                            errors: function (result) { }
                        });
                    },
                    cancel: function () {
                    }
                },
                theme: 'my-theme',
                animation: 'none'
            });
        }
        window.updateProfile = function (name, gender, biograph, phone, address, major) {
            $.ajax({
                url: zozo_js_vars.zozo_ajax_url,
                data: { 'action': 'update_profile', 'name': name, 'gender': gender, 'bio': biograph, 'phone': phone, 'address': address, 'major': major },
                type: 'post',
                success: function (result) {
                    $('div.verify-input').html(result.message);
                    window.location.reload();
                },
                errors: function (result) { }
            });
        }

    })
})