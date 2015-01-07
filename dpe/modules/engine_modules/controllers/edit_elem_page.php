<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class edit_elem_page extends MX_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('html');
        
    }

    function index($name = '') {
        //Проверка на доступ
        $this->acs->check_perms('edit_frame');

        $post = $this->input->post(NULL, TRUE);
        if (!empty($post)) {
            $this->save($post);
            redirect(base_url().'engine/edit_page');
        }
        $data = array();
        $data['title'] = 'Редактирование обертки страницы';
        $data['body'] = $this->show_info($name);
        $this->load->module('engine_modules/make_page')->default_page($data);
    }

    private function show_info($name) {
        $info = $this->crud_main->CRUD('site_pages', 'read', array('name' => $name));
        $data = array();
        $out = form_open(path_form_form());
        $out .= form_hidden('old_name', $name);
        $name = '<input name="name" value="'.$info[0]['name'].'">';
        $data[] = array('URL', $name);
        $title = '<input name="title" value="'.$info[0]['title'].'">';
        $data[] = array('Имя', $title);
        $meta = '<input name="meta" value="'.$info[0]['meta'].'">';
        $data[] = array('Meta', $meta);
        $out .= table(array('Поле', 'Значение'), $data);
        $out .= '<button type="submit" name="save" class="btn btn-success">Сохранить</button>';
        $out .= form_close();
        return $out;
    }

    private function save($data = array()) {
        if (!isset($data) && empty($data))
            return 0;
        $old_name = $data['old_name'];
        unset($data['old_name']);
        unset($data['save']);
        $this->crud_main->CRUD('site_pages', 'update', array('name' => $old_name), $data);
    }

}
