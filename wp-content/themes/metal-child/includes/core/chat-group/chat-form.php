<?php

function get_form_chat()
{
    $renderHTML = '';
    $renderHTML = '<div class="group-chat-form"> ';
    $renderHTML .= '<div class="chat-form-title"></div>';
    $renderHTML .= '<div class="chat-form-member"></div>';
    $renderHTML .= '<div class="chat-form-content"><div class="chat-box">';
    $renderHTML .= '</div></div>';
    $renderHTML .= '<div class="chat-form-input">';
    $renderHTML .= '<textarea name="message-chat" id="message-chat" cols="130" rows="2"></textarea>';
    $renderHTML .= '<button type="submbit" id="send-message" class="btn btn-primary btn-message">Send</button>';
    $renderHTML .= '</div>';

    $renderHTML .= '</div>';

    return $renderHTML;
}?>




