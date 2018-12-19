<?php

include 'includes/core/profile/gpf-profile.php';
include 'includes/core/group/finder-form-action.php';
require_once 'entity/form.php';
require_once 'entity/major.php';
function get_list_form()
{
    global $wpdb;
    $currPage = get_query_var('page', 1);
    if ($currPage === 0) {
        $paged = 1;
    } else {
        $paged = $currPage;
    }
    $start = ($paged - 1) * 10;
    $count = $start + 1;

    $list_view = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}finder_form 
    ORDER BY status DESC
    LIMIT $start, 10 ");
    $suppervisor = '';
    $renderHTML = '';
    $renderHTML .= '<table>
    <tr>
        <th class="col-lg-1">Poster</th>
        <th class="col-lg-4">Title</th>
        <th class="col-lg-1">Members avaialbe</th>
        <th class="col-lg-2">Skill</th>
        <th class="col-lg-2">Contact</th>
        <th class="col-lg-1">Closing at</th>
        <th class="col-lg-1">Status</th>
    </tr>';
    $renderHTML .= '</table>';
    foreach ($list_view as $view) {
        $renderHTML .= '<form action="#" method="POST"><table>';
        $renderHTML .= '<input type="hidden" id="form-id" name="form-id" value="'.$view->ID.'" />';
        $renderHTML .= '<input type="hidden" id="user-id" name="user-id" value="'.$view->user_id.'" />';
        $renderHTML .= '<tr>';
        $renderHTML .= '<td class="col-lg-1"><p><a href="'.home_url('user').'?user-id='.$view->user_id.'"> '.get_userdata($view->user_id)->user_login.'</a></p></td>';
        $renderHTML .= '<td class="col-lg-4"><a href="'.home_url('form-detail').'?form-id='.$view->ID.'" >'.$view->title.'</a><div class="col-lg-12">'.$view->description.'</div></td>';
        $renderHTML .= '<td class="col-lg-1"><p>'.get_members($view->ID).'</p></td>';
        $renderHTML .= '<td class="col-lg-2">'.get_list_skill($view->ID, $view->other_skill).'</td>';
        $renderHTML .= '<td class="col-lg-2"><p>'.$view->contact.'</p></td>';
        $renderHTML .= '<td class="col-lg-1"><p></p></td>';
        $renderHTML .= '<td class="col-lg-1">'.statusForm($view->ID, $view->status).'</td>';
        $renderHTML .= '</tr></table></form>';
    }

    return $renderHTML;
}

function get_list_skill($form_id, $other_skill)
{
    global $wpdb;
    $renderHTML = '';
    $define = array(',', '.', ';');
    $skills = $wpdb->get_results("
    SELECT name FROM {$wpdb->prefix}skill_major as s 
    INNER JOIN {$wpdb->prefix}form_skill as f 
    ON s.ID = f.skill_id 
    WHERE f.form_id = '".$form_id."'
    
    ");

    foreach ($skills as $skill) {
        $renderHTML .= $skill->name.'<br>';
    }
    $check = false;
    foreach ($define as $char) {
        if (strpos($other_skill, $char)) {
            $skills = explode($char, $other_skill);
            foreach ($skills as $skill) {
                if (isset($skill)) {
                    $renderHTML .= $skill.'<br>';
                }
            }
        } else {
            $check = false;
        }
    }
    if ($check) {
        $renderHTML .= $other_skill;
    }

    return $renderHTML;
}
function get_members($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $members_id = $wpdb->get_results("
    SELECT member_id 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."'
    AND member_role = 1 
    ");
    foreach ($members_id as $members) {
        $renderHTML .= '<a href="'.home_url('user').'?user-id='.$members->member_id.'" >'.get_userdata($members->member_id)->user_login.'</a><br>';
    }

    return $renderHTML;
}

function statusForm($form_id, $status)
{
    $renderHTML = '';
    switch ($status) {
        case 0:
            $renderHTML .= 'Closed';
        break;
        case 1:
        $renderHTML .= currentUserPost($form_id);
        break;
        default:
            $renderHTML = '';
        break;
    }

    return $renderHTML;
}
function currentUserPost($form_id)
{
    global $wpdb;
    $rennderHTML = '';
    if (is_user_logged_in()) {
        $current_user = get_current_user_id();
        $is_student = info('role');
        $has_form = check_student_form();
        $is_request = $wpdb->get_var("
        SELECT COUNT(*) 
        FROM {$wpdb->prefix}request 
        WHERE form_id = '".$form_id."' 
        AND member_id = '".$current_user."'
        AND user_request = 1
        ");

        if ($is_student == 'Student') {
            if (isset($has_form)) {
                $renderHTML .= '<a href="'.home_url('form-detail').'?form-id='.$form_id.'" class="btn btn-info">View</a>';
            } else {
                if ($is_request >= 1) {
                    $renderHTML .= '<button type="submit" id="reject-action-join" name="reject-action-join" class="btn btn-danger" >Cancel request</button>';
                } else {
                    $renderHTML .= '<button type="submit" id="btn-join" name="btn-join" class="btn btn-info" >Join</button>';
                }
            }
        } else {
            $renderHTML .= '<a href="'.home_url('form-detail').'?form-id='.$form_id.'" class="btn btn-info">View</a>';
        }
    } else {
        $renderHTML .= '<button type="submit" id="btn-join" name="btn-join" class="btn btn-info" >Join</button>';
    }

    return $renderHTML;
}

function major_list()
{
    global $wpdb;
    $set_major = array();
    $get_majors = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}major
    ");
    foreach ($get_majors as $major) {
        $majors = new major();
        array_push($set_major, $majors->majorInfo($major->ID, $major->code, $major->name));
    }

    return $set_major;
}
function form_by_major()
{
    $renderHTML = '';
    $major_list = major_list();
    $renderHTML .= '<section id="major-form-view"><h3>Finder Form In Major</h3>
    <div class="major-form-view-content">
    <div class="container-inner">';
    foreach ($major_list as $major) {
        $renderHTML .= '<div class="form-major-item">';
        $renderHTML .= '<a href="'.home_url('search-form').'?major-value='.$major->name.'" target="_blank">'.major_analyst($major->ID).'</a>';
        $renderHTML .= '<div class="item-content"><a href="'.home_url('search-form').'?major-value='.$major->name.'" target="_blank">'.$major->name.' ('.count_form_by_major($major->name).')</a>';
        $renderHTML .= '</div></div>';
    }
    $renderHTML .= '</div></div></section>';

    return $renderHTML;
}
function count_form_by_major($majorName)
{
    global $wpdb;

    $count = $wpdb->get_var("
    SELECT COUNT(*) 
    FROM {$wpdb->prefix}finder_form as f 
    INNER JOIN {$wpdb->prefix}usermetaData as u 
    ON u.user_id = f.user_id 
    WHERE u.meta_key = 'major' 
    AND u.meta_value = '".$majorName."'
    AND special = 0
    ");

    return $count;
}
function major_analyst($majorID)
{
    global $wpdb;
    $backgroundImg = '';
    $get_url_img = $wpdb->get_var("
    SELECT url_image 
    FROM {$wpdb->prefix}major
    WHERE ID = '".$majorID."'
    ");
    $backgroundImg = '<img src="'.$get_url_img.'" alt="">';

    return $backgroundImg;
}
function current_semster_form()
{
    $renderHTML = '';
    $count = 0;
    $forms = get_form_current_semester();
    $total_page = 0;
    if ((count($forms)) % 5 === 0) {
        $total_page = (count($forms)) / 5;
    } else {
        $total_page = floor((count($forms)) / 5) + 1;
    }
    $renderHTML .= '<section id="current-semster-view"><h3>CALL FOR APPLICATIONS FOR '.get_current_semester().'</h3>';
    $renderHTML .= '<div class="tabs-container"> <div id="myCarousel" class="carousel slide">';
    $renderHTML .= '<ol class="carousel-indicators">';
    for ($x = 0; $x < $total_page; ++$x) {
        if ($x == 0) {
            $renderHTML .= '<li data-target="#myCarousel" data-slide-to="'.$x.'" class="active"></li>';
        } else {
            $renderHTML .= '<li data-target="#myCarousel" data-slide-to="'.$x.'"></li>';
        }
    }
    $renderHTML .= '</ol>';
    $renderHTML .= '<div class="carousel-inner">';
    for ($x = 0; $x <= $total_page; ++$x) {
        if ($x === 0) {
            $renderHTML .= '<div class="item active">';
            foreach (array_slice($forms, 0, 5) as $form) {
                $renderHTML .= list_form_semester($form);
            }
            $renderHTML .= '</div>';
        } else {
            $renderHTML .= '<div class="item">';
            $start = ($x * 5) + 1;
            foreach (array_slice($forms, $start, 5)  as $form) {
                $renderHTML .= list_form_semester($form);
            }
            $renderHTML .= '</div>';
        }
    }
    $renderHTML .= '</div>';
    $renderHTML .= '<a class="previous-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span></a><a class="next-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span></a>
    </div></div></section>';

    return $renderHTML;
}
function list_form_semester($form)
{
    $major = user_metadata('major', $form->user_id);
    $type = checkFormType($form->ID);
    $renderHTML .= '<div class="col-lg-12"><div class="form-item"> ';
    $renderHTML .= '<div class="col-lg-2" style="width:10%">';
    $renderHTML .= get_avatar(get_the_author_meta($form->user_id), 70).'<br>';
    $renderHTML .= '<a href="'.home_url('search-form').'?major-value='.$major.'" target="_blank">'.$major.'</a>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-10 form-item-content">';
    $renderHTML .= '<div class="form-content-title"><h5><a href="'.home_url('form-detail').'?form-id='.$form->ID.'" class="title-form" target="_blank">'.wp_trim_words($form->title, 20, '..').'</a></h5></div>';
    $renderHTML .= '<div class="form-content-author">';
    $renderHTML .= '<p>By <a href="'.home_url('user').'?user-id='.$form->user_id.'"> '.get_userdata($form->user_id)->user_login.'</a></p>&nbsp;&nbsp;&nbsp;';
    $renderHTML .= '<p> created at '.$form->created_date.'</p>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="form-content-members">Members: '.($type == 'Student' ? member_in_form_counting($form->ID).' / 6' : member_in_form_counting($form->ID)).' </div>';
    $renderHTML .= '<p class="form-content-description">'.wp_trim_words($form->description, 30, '..').'</p>';
    if ($form->status == 1) {
        $renderHTML .= '<button class="btn btn-warning btn-show-message">Openning</button>';
    } else {
        $renderHTML .= '<button class="btn btn-closed btn-show-message">Closed</button>';
    }

    $renderHTML .= '</div>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}

function get_form_current_semester()
{
    global $wpdb;
    $get_forms = $wpdb->get_results("
    SELECT *
    FROM {$wpdb->prefix}finder_form 
    WHERE semester = '".get_current_semester()."' 
    AND special = 0
    ORDER BY created_date DESC  
    LIMIT 40 
    ");

    return $get_forms;
}
function get_current_semester()
{
    global $wpdb;
    $get_current_semester = $wpdb->get_var("
        SELECT name from {$wpdb->prefix}semester 
        where status = 1
        ");

    return $get_current_semester;
}

function member_in_form_counting($form_id)
{
    global $wpdb;
    $count = $wpdb->get_var("
    SELECT COUNT(*)
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_role != 2
    
    ");

    return $count;
}
