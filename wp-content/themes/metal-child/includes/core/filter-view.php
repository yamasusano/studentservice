<?php

function displayFilter()
{
    $renderHTML = '<form action="#" method="GET" id="search-post">';
    $renderHTML .= '<div class="col-lg-11 col-md-11">';
    $renderHTML .= posterType();
    $renderHTML .= get_semester();
    $renderHTML .= get_major_list();
    $renderHTML .= searchField();
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-1 col-md-1">';
    $renderHTML .= '<button type="submit" name="search-post" id="search-post" class="btn btn-primary">Search</button></div>';
    $renderHTML .= '</form>';

    return $renderHTML;
}

function posterType()
{
    $renderHTML = '<div id="poster-type" class="col-lg-1 col-md-1">
    <select id="type-value">
        <option value="" disabled selected>Post type</option>
        <option value="">ALL</option>
        <option value="student">Student</option>
        <option value="teacher">Teacher</option>
    </select>
  </div>';

    return $renderHTML;
}

function get_semester()
{
    $renderHTML = '<div id="semesters" class="col-lg-2 col-md-2"><select id="semester-value"><option value="" disabled selected>Semester</option>';
    $renderHTML .= '<option value="">ALL</option>';
    $renderHTML .= semesterSelect();
    $renderHTML .= '</select></div>';

    return $renderHTML;
}

function get_major_list()
{
    global $wpdb;
    $renderHTML = '<div id="list_major" class="col-lg-3 col-md-3"><select id="major-value"><option value="" disabled selected>Majoir Skill</option>';
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
    <input type="text" name="input-search" id ="input-search" placeholder="Enter Poster" >
    </div>';

    return $renderHTML;
}

function backgroundImage()
{
    $backgroundImg = wp_get_attachment_image_src(54, 'full');

    return $backgroundImg[0];
}
?>


