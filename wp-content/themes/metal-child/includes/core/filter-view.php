<?php

//search-form for index
function displayFilter()
{
    $renderHTML = '<form action="'.home_url('search-form').'" method="GET" id="search-post">';
    $renderHTML .= '<div class="col-lg-11 col-md-11">';
    $renderHTML .= posterType();
    $renderHTML .= get_semester();
    $renderHTML .= get_major_list();
    $renderHTML .= searchField();
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-1 col-md-1">';
    $renderHTML .= '<button type="submit" id="search-post" class="btn btn-primary">Search</button></div>';
    $renderHTML .= '</form>';

    return $renderHTML;
}

function posterType()
{
    $renderHTML = '<div id="poster-type" class="col-lg-1 col-md-1">
    <select id="type-value" name="type-value">
        <option value="" disabled selected>Post type</option>
        <option value="">ALL</option>
        <option value="1">Student</option>
        <option value="0">Teacher</option>
    </select>
  </div>';

    return $renderHTML;
}

function get_semester()
{
    $renderHTML = '<div id="semesters" class="col-lg-2 col-md-2">';
    $renderHTML .= '<select id="semester-value" name="semester-value"><option value="" disabled selected>Semester</option>';
    $renderHTML .= '<option value="">ALL</option>';
    $renderHTML .= semesterSelect();
    $renderHTML .= '</select></div>';

    return $renderHTML;
}

function get_major_list()
{
    global $wpdb;
    $renderHTML = '<div id="list_major" class="col-lg-3 col-md-3">';
    $renderHTML .= '<select id="major-value" name="major-value"><option value="" disabled selected>Major Skill</option>';
    $majors = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}major
    "
    );
    $renderHTML .= '<option value="">ALL</option>';
    foreach ($majors as $major) {
        $renderHTML .= '<option value="'.$major->name.'">'.$major->name.'</option>';
    }

    $renderHTML .= '</select></div>';

    return $renderHTML;
}

function searchField()
{
    $renderHTML = '<div class="text-field col-lg-5 col-md-5">
    <i class="fa fa-search" aria-hidden="true"></i>
    <input type="text" name="poster" id ="input-search" placeholder="Enter title here" >
    </div>';

    return $renderHTML;
}
// end-searcher
function filterPage($post_type, $semester, $major, $poster)
{
    $renderHTML = '<form action="'.home_url('search-form').'" method="GET" id="search-post">';
    $renderHTML .= '<div class="col-lg-11 col-md-11">';
    $renderHTML .= poster_type_page($post_type);
    $renderHTML .= get_semester_page($semester);
    $renderHTML .= get_major_list_page($post_type, $major);
    $renderHTML .= search_field_page($poster);
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-1 col-md-1">';
    $renderHTML .= '<button type="submit" id="search-post" class="btn btn-primary">Search</button></div>';
    $renderHTML .= '</form>';

    return $renderHTML;
}
function poster_type_page($post_type)
{
    $renderHTML = '<div id="poster-type" class="col-lg-1 col-md-1">';
    $renderHTML .= '<select id="type-value" name="type-value">';
    if ($post_type == '') {
        $renderHTML .= '<option value=""disabled>Post type</option>';
        $renderHTML .= '<option value=""selected>ALL</option>';
        $renderHTML .= '<option value="1">Student</option>';
        $renderHTML .= ' <option value="0">Teacher</option>';
    } elseif ($post_type == '1') {
        $renderHTML .= '<option value=""disabled>Post type</option>';
        $renderHTML .= '<option value="">ALL</option>';
        $renderHTML .= '<option value="1"selected>Student</option>';
        $renderHTML .= ' <option value="0">Teacher</option>';
    } elseif ($post_type == '0') {
        $renderHTML .= '<option value=""disabled>Post type</option>';
        $renderHTML .= '<option value="">ALL</option>';
        $renderHTML .= ' <option value="1">Student</option>';
        $renderHTML .= '<option value="0"selected>Teacher</option>';
    }

    $renderHTML .= '</select></div>';

    return $renderHTML;
}

function get_semester_page($semester)
{
    global $wpdb;
    $semesters[0] = '';
    $semesters = array_merge($semesters, $wpdb->get_results("
    SELECT name
    FROM {$wpdb->prefix}semester
    ORDER BY start ASC
    "));
    $renderHTML = '<div id="semesters" class="col-lg-2 col-md-2">';
    $renderHTML .= '<select id="semester-value" name="semester-value">';
    $renderHTML .= '<option value="" disabled>Semester</option> ';
    foreach ($semesters as $s) {
        if ($s->name == $semester) {
            if ($semester == '') {
                $renderHTML .= '<option value="'.$s->name.'" selected>ALL</option> ';
            } else {
                $renderHTML .= '<option value="'.$s->name.'" selected>'.$s->name.'</option> ';
            }
        } else {
            if ($s == '') {
                $renderHTML .= '<option value="'.$s->name.'" >ALL</option> ';
            } else {
                $renderHTML .= '<option value="'.$s->name.'">'.$s->name.'</option> ';
            }
        }
    }
    $renderHTML .= '</select></div>';

    return $renderHTML;
}

function get_major_list_page($post_type, $major)
{
    global $wpdb;
    $majors[0] = '';
    $majors = array_merge($majors, $wpdb->get_results("
    SELECT *
    FROM {$wpdb->prefix}major
    "
    ));
    $renderHTML = '<div id="list_major" class="col-lg-3 col-md-3">';
    $renderHTML .= '<select id="major-value" name="major-value">';
    $renderHTML .= '<option value="" disabled>Major Skill</option> ';
    if ($post_type == 'teacher') {
        foreach ($majors as $s) {
            if ($s == '') {
                $renderHTML .= '<option value="'.$s->name.'">ALL</option> ';
            } else {
                $renderHTML .= '<option value="'.$s->name.'">'.$s->name.'</option> ';
            }
        }
    } else {
        foreach ($majors as $s) {
            if ($s->name == $major) {
                if ($major == '') {
                    $renderHTML .= '<option value="'.$s->name.'" selected>ALL</option> ';
                } else {
                    $renderHTML .= '<option value="'.$s->name.'" selected>'.$s->name.'</option> ';
                }
            } else {
                if ($s == '') {
                    $renderHTML .= '<option value="'.$s->name.'" >ALL</option> ';
                } else {
                    $renderHTML .= '<option value="'.$s->name.'">'.$s->name.'</option> ';
                }
            }
        }
    }
    $renderHTML .= '</select></div>';

    return $renderHTML;
}

function search_field_page($poster)
{
    $renderHTML = '<div class="text-field col-lg-5 col-md-5">
    <i class="fa fa-search" aria-hidden="true"></i>
    <input type="text" name="poster" id ="input-search" placeholder="Enter title here" >
    </div>';

    return $renderHTML;
}
function backgroundImage()
{
    $backgroundImg = wp_get_attachment_image_src(54, 'full');

    return $backgroundImg[0];
}
function result_search($post_type, $semester, $major, $poster)
{
    global $wpdb;
    $get_results = $wpdb->get_results("
        SELECT f.* FROM {$wpdb->prefix}finder_form as f
        JOIN {$wpdb->prefix}users as u
        ON f.user_id = u.ID
        JOIN 
        (SELECT user_id FROM {$wpdb->prefix}usermetaData 
        WHERE meta_key = 'major' 
        AND meta_value LIKE '%".$major."%')as um
        ON um.user_id = f.user_id
        JOIN
        (SELECT user_id FROM {$wpdb->prefix}usermetaData 
        WHERE meta_key = 'role' 
        AND meta_value LIKE '%".$post_type."%')as umd
        ON umd.user_id = f.user_id
        WHERE f.semester LIKE '%".$semester."%' 
        AND f.title LIKE '%".$poster."%' 
        AND f.special = 0 
        ORDER BY f.created_date DESC

        ");

    return $get_results;
}
function result_form_content($post_type, $semester, $major, $poster)
{
    $renderHTML = '<div class="finder-form-list-item">';
    $list_form_detail = result_search_check($post_type, $semester, $major, $poster);
    foreach ($list_form_detail as $form) {
        $major = user_metadata('major', $form->user_id);
        $renderHTML .= '<div class="finder-form-items">';
        $renderHTML .= '<div class="col-lg-2"><div class="finder-poster-box">';
        $renderHTML .= get_avatar(get_the_author_meta($form->user_id), 110).'<br>';
        $renderHTML .= '<a href="'.home_url('search-form').'?major-value='.$major.'" target="_blank">'.$major.'</a>';
        $renderHTML .= '</div></div>';
        $renderHTML .= '<div class="col-lg-8"><div class="finder-post">';
        $renderHTML .= '<div class="finder-post-title">';
        $renderHTML .= '<h5>'.wp_trim_words($form->title, 10, '..').'</h5></div> ';
        $renderHTML .= '<div class="form-content-author">';
        $renderHTML .= '<p>By <a href="'.home_url('user').'?user-id='.$form->user_id.'"> '.get_userdata($form->user_id)->user_login.'</a></p>&nbsp;&nbsp;&nbsp;';
        $renderHTML .= '<p><b>created at :</b> '.$form->created_date.'</p> </div>';
        $renderHTML .= '<div class="form-content-members">Members: '.count_member_in_form($form->ID).' / 6 </div>';
        $renderHTML .= '<div class="finder-post-content"><p>'.wp_trim_words($form->description, 20, '..').'</p></div> ';
        $renderHTML .= '</div>';
        $renderHTML .= '</div>';
        $renderHTML .= '<div class="col-lg-2 center">';
        $renderHTML .= '<a  href="'.home_url('form-detail').'?form-id='.$form->ID.'" class="btn-view-detail btn btn-large" target="_blank">View Detail</a>';

        $renderHTML .= '</div></div>';
    }
    $renderHTML .= '</div>';

    return $renderHTML;
}
function count_member_in_form($form_id)
{
    global $wpdb;
    $count = $wpdb->get_var("
    SELECT COUNT(*) 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."' 
    AND member_role = 0 
    OR member_role = 1 
    ");

    return $count;
}

function result_search_message($count, $post_type, $semester, $major, $poster)
{
    if (empty($post_type) && empty($semester) && empty($major) && empty($poster)) {
        $renderHTML = '<p>Founded <b>'.$count.'</b> Finder Form ';
    } else {
        $renderHTML = '<p>Founded <b>'.$count.'</b> Finder Form follow by ';
    }
    if (!empty($post_type)) {
        switch ($post_type) {
            case 0:
            $post_type = 'Teacher';
            break;
            case 1:
            $post_type = 'Student';
            break;
        }
        $renderHTML .= ' | Type - <b>'.$post_type.'</b>';
    }
    if (!empty($semester)) {
        $renderHTML .= ' | Semester - <b>'.$semester.'</b>';
    }
    if (!empty($major)) {
        $renderHTML .= ' | Major - <b>'.$major.'</b>';
    }
    if (!empty($poster)) {
        $renderHTML .= ' | Title - <b id="keyword-search">'.$poster.'</b>';
    }
    $renderHTML .= '</p>';

    return $renderHTML;
}

function pagination_result_search($count, $post_type, $semester, $major, $poster)
{
    $currPage = get_query_var('page', 1);
    if ($currPage === 0) {
        $paged = 1;
    } else {
        $paged = $currPage;
    }
    $total_page = ceil($count / 10);
    $start = $paged - 3;
    $end = $paged + 3;
    if ($start < 1) {
        $start = 1;
    }

    if ($end > $total_page) {
        $end = $total_page;
    }
    for ($i = $start; $i <= $end; ++$i) {
        if ($i === $paged) {
            echo '<a class="active">'.$i.'</a>';
        } else {
            echo '<a href='.home_url('search-form').'?page='.$i.'&type-value='.urlencode($post_type).'&semester-value='.urlencode($semester).'&major-value='.urlencode($major).'&poster='.urlencode($poster).' >'.$i.'</a>';
        }
    }
}
function result_search_check($post_type, $semester, $major, $poster)
{
    global $wpdb;
    $result = '';
    $currPage = get_query_var('page', 1);
    if ($currPage === 0) {
        $paged = 1;
    } else {
        $paged = $currPage;
    }
    $start = ($paged - 1) * 10;
    $get_results = $wpdb->get_results("
        SELECT f.* FROM {$wpdb->prefix}finder_form as f
        
        JOIN {$wpdb->prefix}users as u
        ON f.user_id = u.ID
        JOIN 
        (SELECT user_id FROM {$wpdb->prefix}usermetaData 
        WHERE meta_key = 'major' 
        AND meta_value LIKE '%".$major."%')as um
        ON um.user_id = f.user_id
        JOIN
        (SELECT user_id FROM {$wpdb->prefix}usermetaData 
        WHERE meta_key = 'role' 
        AND meta_value LIKE '%".$post_type."%')as umd
        ON umd.user_id = f.user_id
        WHERE f.semester LIKE '%".$semester."%' 
        AND f.title LIKE '%".$poster."%' 
        AND f.special = 0
        ORDER BY f.created_date DESC
        LIMIT $start , 10");

    return $get_results;
}

function support_ideas()
{
    global $wpdb;
    if (!is_user_logged_in()) {
    } else {
        $is_student = info('role');
        $has_form = has_form_id();
        if ($is_student == 'Student' && !isset($has_form)) {
            $list_forms = $wpdb->get_results("
            SELECT f.* FROM {$wpdb->prefix}finder_form as f
            JOIN {$wpdb->prefix}usermetaData as u 
            ON u.user_id = f.user_id 
            WHERE u.meta_key = 'role'
            AND u.meta_value = 1
            order by f.created_date DESC
            limit 1,5");

            return $list_forms;
        }
    }
}

function get_ideas_form()
{
    $forms = support_ideas();
    $renderHTML = '';
    foreach ($forms as $form) {
        $renderHTML .= '<div class="new-feed-contents">';
        $renderHTML .= '<div class="content-title">'.$form->title.'</div> ';
        $renderHTML .= '<div class="content-author">By '.get_userdata($form->user_id)->user_login.'</div> ';
        $renderHTML .= '<div class="content-updated"><b>created at</b> '.$form->created_date.'</div> ';
        $renderHTML .= '<div class="content-description">'.$form->description.'</div> ';
        $renderHTML .= '</div>';
    }

    return $renderHTML;
}
