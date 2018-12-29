<?php

function get_history_form()
{
    $directory = realpath(dirname(__FILE__).'/..').'/data/';
    $dir = opendir($directory);
    $renderHTML .= '<div class="wrap">';
    $renderHTML .= '<h2>HISTORY FORM DETELED</h2>';
    $renderHTML .= '<table id="history_file" class="wp-list-table widefat fixed striped pages">';
    $renderHTML .= '<tr> <th></th> <th>file</th> <th>Export</th></tr>';
    $renderHTML .= read_file($dir);
    $renderHTML .= '</table>';
    $renderHTML .= '</div>';

    echo $renderHTML;
}
function read_file($path)
{
    $count = 1;
    $renderHTML = '';
    while (($file = readdir($path)) !== false) {
        if (!file_exists($file)) {
            $renderHTML .= '<tr>';
            $renderHTML .= '<td>'.$count.'</td>';
            $renderHTML .= '<td>'.$file.'</td>';
            $renderHTML .= '<td>';
            $renderHTML .= '<a href="'.get_permalink().'?file='.$file.'"> <i id="dowload-file" class="fa fa-download" aria-hidden="true"></i></a></form></td>';
            ++$count;
        }
    }
    closedir($path);

    return $renderHTML;
}

function download_file()
{
    if (isset($_GET['file'])) {
        $fileName = basename($_GET['file']);
        $filePath = realpath(dirname(__FILE__).'/..').'/data/'.$fileName;
        if (!empty($fileName) && file_exists($filePath)) {
            header('Cache-Control: public');
            header('Content-Description: File Transfer');
            header("Content-Disposition: attachment; filename=$fileName");
            header('Content-Type: application/zip');
            header('Content-Transfer-Encoding: binary');
            readfile($filePath);
            exit;
        } else {
            echo 'The file does not exist.';
        }
    }
}
add_action('init', 'download_file');
