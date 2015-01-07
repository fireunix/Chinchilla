<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Edit_modules_pages extends MX_Controller {

    function index($id = "") {

        $data = array();
        $data['title'] = "Работа с модулями на страницах";
        //$data['body'] = "Работа с модулями на страницах";
        $data['body'] = $this->show_buttons();
        $this->load->module('engine_modules/make_page')->default_page($data);

    }
    
    
    private function show_buttons(){
        $buttons = '';
        
        
        return $buttons;
    }
}
