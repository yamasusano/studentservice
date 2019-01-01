<?php

function get_guide_line()
{
    $render = '';
    $render .= '<div id="service-main" class="col-sm-12 col-md-12 col-lg-12" style="margin-bottom:50px;">';
    $render .= '<div id="service-top-title">';
    $render .= '<h1>4 STEPS FINDING GROUP</h1>';
    $render .= '<div class="text-center" style="text-align: center;">';
    $render .= '<hr class="hr-center" style="width: 75px;height: 5px;background-color: #989898;border-radius: 2px;margin-bottom:20px;">';
    $render .= '</div>';
    $render .= '</div>';
    $render .= '<div id="cover" class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
    $render .= '<div id="post-1">';
    $render .= '<div id="circle">';
    $render .= '<h4>1</h4>';
    $render .= '</div>';
    $render .= '<div id="title-guide" class="col-md-12">';
    $render .= '<h5>LOGIN</h5>';
    $render .= '</div>';
    $render .= '<div class="col-md-12">';
    $render .= '<p class="content">Login by account @fpt.edu.vn</p>';
    $render .= '<img class="alignnone size-full wp-image-366 img-customize" src="'.get_image_url(182).'" alt="" />';
    $render .= '</div></div></div>';
    $render .= '<div id="cover" class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
    $render .= '<div id="post-2">';
    $render .= '<div id="circle">';
    $render .= '<h4>2</h4>';
    $render .= '</div>';
    $render .= '<div id="title-guide" class="col-md-12">';
    $render .= '<h5>CREATE FINDER FORM</h5>';
    $render .= '</div>';
    $render .= '<div class="col-md-12">';
    $render .= '<p class="content">Publish your ideas to find partner </p>';
    $render .= '<img class="alignnone size-full wp-image-366 img-customize" src="'.get_image_url(180).'"   />';
    $render .= '</div></div></div>';
    $render .= '<div id="cover" class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
    $render .= '<div id="post-3">';
    $render .= '<div id="circle">';
    $render .= '<h4>3</h4>';
    $render .= '</div>';
    $render .= '<div id="title-guide" class="col-md-12">';
    $render .= '<h5>INVITE PARTNER</h5>';
    $render .= '</div>';
    $render .= '<div class="col-md-12">';
    $render .= '<p class="content">Invite your partner to join in group</p>';
    $render .= '<img class="alignnone size-full wp-image-366 img-customize" src="'.get_image_url(181).'" alt="" />';
    $render .= '</div></div></div>';
    $render .= '<div id="cover" class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
    $render .= '<div id="post-4">';
    $render .= '<div id="circle">';
    $render .= '<h4>4</h4>';
    $render .= '</div>';
    $render .= '<div id="title-guide" class="col-md-12">';
    $render .= '<h5>TEAMWORK</h5>';
    $render .= '</div>';
    $render .= '<div class="col-md-12">';
    $render .= '<p class="content">Start working in group</p>';
    $render .= '<img class="alignnone size-full wp-image-368 img-customize" src="'.get_image_url(179).'" alt=""  />';
    $render .= '</div></div></div></div>';

    return $render;
}
function get_image_url($id)
{
    $backgroundImg = wp_get_attachment_image_src($id, 'full');

    return $backgroundImg[0];
}
