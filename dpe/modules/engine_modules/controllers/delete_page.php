<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Delete_page extends MX_Controller {

    function index($id = 0) {
        //Проверка на доступ
        $this->acs->check_perms('delete_page');

        $id = $id + 0;
        if ($id === 0 || !is_numeric($id))
            return 0;

        $query = $this->load->model('engine_modules/configs_model')->crud_configs('read', array('name' => 'del_page_del_menu'));
        if ($query[0]['configure'] == 1) {
            $url = $this->load->model('engine_modules/pages_model')->get_info(array('id' => $id));
            $url = $url['name'];
            $this->load->model('site_modules/menu_model')->crud_menu('delete_page', array('url' => $url));
        }
        $this->load->model('engine_modules/pages_model')->delete_page($id);
        redirect(base_url().'engine/edit_page');
    }

}
