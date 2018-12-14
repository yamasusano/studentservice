<?php 
function semester_info($semester_id)
{
}

function createNewSemester()
{   
    global $wpdb;
    $semester_name = $_POST['semester-name'];
    $semester_start_date = $_POST['semester-start-date'];
    $semester_end_date = $_POST['semester-end-date'];
    if (empty($semester_end_date)) {
        $check_end_date = 0;
    } else {
        $check_end_date = check_semester_end_date($semester_name, $semester_end_date);
    }
    if ($check_end_date > 0){
        $insert = $wpdb->insert(
            "{$wpdb->prefix}semester",
            [
                'name' => $semester_name,
                'start' => date('Y-m-d', strtotime($semester_start_date)),
                'end' => $semester_end_date,
                'status' => 1,
            ]
        );
    }
    if ($insert) {
        return '<div class="message-success">Insert major success</div>';
    } else {
        return '<div class="message-error">Insert major fail</div>';
    }
}

function form_semester_add()
{
    $semester = get_new_semester_name();
    $HTML = '';
    $HTML = '<div class="wrap"> ';
    $HTML .= '<h1 class="wp-heading-inline">Add New Semester</h1>';
    $HTML .= '<div class="message">';
    $HTML .= submit_add_new_form();
    $HTML .= '</div>';
    $HTML .= '<div class="add-new-major">';
    $HTML .= '<form id="form-add-semester" method="POST" enctype="multipart/form-data">';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Name</div>';
    $HTML .= '<div class="col-md-8"><input id="semester-name" name="semester-name" value="'.$semester['semester-name'].'" type="text" readonly="readonly" /></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Start</div>';
    $HTML .= '<div class="col-md-8"><input id="semester-start-date" name="semester-start-date" value="'.$semester['semester-start-date'].'" type="text" readonly="readonly" /></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">End</div>';
    $HTML .= '<div class="col-md-8"><input id="semester-end-date" name="semester-end-date" type="date" required/></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group-button">';
    $HTML .= '<button type="submit" name="add-new">Publish</button>';
    $HTML .= '</div>';
    $HTML .= '</form>';
    $HTML .= '</div>';
    $HTML .= '</div>';
    echo $HTML;
}

function get_new_semester_name(){
    global $wpdb;
    $semester_name = $wpdb->get_var("
    SELECT name
    FROM {$wpdb->prefix}semester
    ORDER BY id DESC
    LIMIT 1
    ");
    $season = substr($semester_name,0,2);
    $year = substr($semester_name, -4);
    $new_semester_name;
    $semester_start_date;
    switch ($season) {
        case 'SP':
            $new_semester_name = "SUMMER ".$year;
            $semester_start_date = "01/05/".$year;
        break;

        case 'SU':
            $new_semester_name = "FALL ".$year;
            $semester_start_date = "01/09/".$year;
        break;

        case 'FA':
            $year += 1;
            $new_semester_name = "SPRING ".$year;
            $semester_start_date = "01/01/".$year;
        break;
    }
    return array('semester-name' => $new_semester_name, 'semester-start-date' => $semester_start_date);
}    

function submit_add_new_form()
{
    if (isset($_POST['add-new'])) {
        echo createNewSemester();
    }
}
