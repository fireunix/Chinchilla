<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Validator_uri extends MX_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('check_page_model');
    }

    function validate($uri = array()) {
        if (empty($uri)) {
            $uri['page'] = $this->config->item('index_page');
        } else {
            $uri = $this->check_uri($uri);
            $error = $this->check_page($uri);

            if ($error === 1)
                $uri['page'] = '404';
        }
        return $uri;
    }

    // Формирование URI
    private function check_uri($uri = array()) {
        $uri_return = array();

        if (isset($uri['1']))
            $uri_return['page'] = $uri['1'];
        else
            $uri_return['page'] = '';

        if (isset($uri['2']))
            $uri_return['params'] = $this->uri->segment(2);

        return $uri_return;
    }

    //Проверка на существование такого раздела и страницы
    private function check_page($uri = array()) {
        return $this->check_page_model->check_page($uri);
    }

}
