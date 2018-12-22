<?php

function semester_info($semester_id)
{
}

function get_semester_close_date($semester_end_date)
{
    $semester_end_date = str_replace('/', '-', $semester_end_date);
    $semester_close_date = strtotime($semester_end_date) - 28 * 60 * 60 * 24;

    return date('Y-m-d', $semester_close_date);
}

function get_date_format_mysql($date)
{
    $date = str_replace('/', '-', $date);

    return date('Y-m-d', strtotime($date));
}

function createNewSemester()
{
    global $wpdb;
    $semester_name = $_POST['semester-name'];
    $semester_start_date = $_POST['semester-start-date'];
    $semester_end_date = $_POST['semester-end-date'];
    $insert = $wpdb->insert(
        "{$wpdb->prefix}semester",
        [
            'name' => $semester_name,
            'start' => get_date_format_mysql($semester_start_date),
            'end' => get_date_format_mysql($semester_end_date),
            'close_form' => get_semester_close_date($semester_end_date),
            'status' => 2,
        ]
    );
    if ($insert) {
        $delete = $wpdb->delete(
            "{$wpdb->prefix}semester",
            [
                'status' => 0,
            ]
        );
        $updated = $wpdb->update(
            "{$wpdb->prefix}semester",
            [
                'status' => 0,
            ],
            [
                'status' => 1,
            ]
        );
        $updated = $wpdb->update(
            "{$wpdb->prefix}semester",
            [
                'status' => 1,
            ],
            [
                'ID' => get_next_semester_ID(),
            ]
        );

        return '<div class="message-success">Insert semester success</div>';
    } else {
        return '<div class="message-error">Insert semester fail</div>';
    }
}

function get_next_semester_ID()
{
    global $wpdb;
    $next_semester_id = $wpdb->get_var("
    SELECT ID
    FROM {$wpdb->prefix}semester
    WHERE status = 2
    ORDER BY status LIMIT 1
    ");

    return $next_semester_id;
}

function get_end_date_current_semester()
{
    global $wpdb;
    $end_date = $wpdb->get_var("
    SELECT DATE_FORMAT(DATE_SUB(end, INTERVAL 28 DAY), '%d-%m-%Y')
    FROM {$wpdb->prefix}semester
    WHERE status = 1
    ");

    return $end_date;
}

function is_over_end_date_current_semester()
{
    $today = date('Y-m-d');
    // $today = '2019-04-03';
    $today = DateTime::createFromFormat('Y-m-d', $today);
    $end_date = get_end_date_current_semester();
    $end_date = new DateTime($end_date);
    $diff = date_diff($end_date, $today);
    $check = (int) $diff->format('%r%a');

    return $check > -28;
}

function form_semester_add()
{
    $HTML = '<div class="wrap"> ';
    $HTML .= '<h1 class="wp-heading-inline">Add New Semester</h1>';
    $HTML .= '<div class="message">';
    $HTML .= submit_add_new_form();
    $HTML .= '</div>';
    if (is_over_end_date_current_semester()) {
        $semester = get_new_semester_name();
        $HTML .= '<div class="add-new-semester">';
        $HTML .= '<form id="form-add-semester" method="POST" enctype="multipart/form-data">';
        $HTML .= '<div class="form-group">';
        $HTML .= '<div class="col-md-4 title">Semester name</div>';
        $HTML .= '<div class="col-md-8"><input id="semester-name" name="semester-name" value="'.$semester['semester-name'].'" type="text" readonly="readonly" /></div>';
        $HTML .= '</div>';
        $HTML .= '<div class="form-group">';
        $HTML .= '<div class="col-md-4 title">Start date</div>';
        $HTML .= '<div class="col-md-8"><input id="semester-start-date" name="semester-start-date" value="'.$semester['semester-start-date'].'" type="text" readonly="readonly" /></div>';
        $HTML .= '</div>';
        $HTML .= '<div class="form-group">';
        $HTML .= '<div class="col-md-4 title">End date</div>';
        $HTML .= '<div class="col-md-8"><input id="semester-end-date" name="semester-end-date" value="'.$semester['semester-end-date'].'" type="text" readonly="readonly" /></div>';
        $HTML .= '</div>';
        $HTML .= '<div class="form-group-button">';
        $HTML .= '<button type="submit" name="add-new">Add new</button>';
        $HTML .= '</div>';
        $HTML .= '</form>';
    } else {
        $HTML .= '<div class ="message-error">';
        $HTML .= 'Semester <b>'.get_current_semester_name().'</b> is not finished. You only create new semester after <b>'.get_end_date_current_semester().'</b>';
        $HTML .= '</div>';
        $HTML .= '</div>';
        $HTML .= '</div>';
    }
    echo $HTML;
}
function get_current_semester_name()
{
    global $wpdb;
    $semester_name = $wpdb->get_var("
    SELECT name
    FROM {$wpdb->prefix}semester
    where status = 1
    ");

    return $semester_name;
}

function get_new_semester_name()
{
    global $wpdb;
    $semester_name = $wpdb->get_var("
    SELECT name
    FROM {$wpdb->prefix}semester
    ORDER BY id DESC
    LIMIT 1
    ");
    $season = substr($semester_name, 0, 2);
    $year = substr($semester_name, -4);
    $new_semester_name;
    $semester_start_date;
    $semester_end_date;
    switch ($season) {
        case 'SP':
            $new_semester_name = 'SUMMER '.$year;
            $semester_start_date = '01/05/'.$year;
            $semester_end_date = '30/08/'.$year;
        break;

        case 'SU':
            $new_semester_name = 'FALL '.$year;
            $semester_start_date = '01/09/'.$year;
            $semester_end_date = '30/12/'.$year;
        break;

        case 'FA':
            ++$year;
            $new_semester_name = 'SPRING '.$year;
            $semester_start_date = '01/01/'.$year;
            $semester_end_date = '30/04/'.$year;
        break;
    }

    return array(
        'semester-name' => $new_semester_name,
        'semester-start-date' => $semester_start_date,
        'semester-end-date' => $semester_end_date,
    );
}

function submit_add_new_form()
{
    if (isset($_POST['add-new'])) {
        echo createNewSemester();
    }
}
