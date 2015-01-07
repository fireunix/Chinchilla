<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
function inc_ph() {
    $CI = & get_instance();
    $path = base_url();
    $path .= $CI->config->item('inc_ph');
    return $path;
}

function inc_ph_site() {

    $CI = & get_instance();
    $path = base_url();
    $path .= $CI->config->item('inc_ph_site');
    return $path;
}

function path_form_form() {
     $CI = & get_instance(); 
   return base_url().$CI->uri->ruri_string(TRUE);
}
