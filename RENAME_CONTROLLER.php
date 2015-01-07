<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class NAME extends MX_Controller {
    
    function index() {

        $data = array();
        $data['title'] = 'Название страницы';
        $data['body'] = 'Тут тело страницы';
        $this->load->module('engine_modules/make_page')->default_page($data); // Сборка страницы
        
    }
}
