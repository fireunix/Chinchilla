<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Login extends MX_Controller {

    function __construct() {
        parent::__construct();
        $this->rules = $this->config->item('validate_login');
    }

    function start() {
        $data['info'] = '';
        $this->load->library('form_validation');
        $post = $this->input->post(NULL, TRUE);
        if (isset($post['enter'])) {
            $this->form_validation->set_rules($this->rules);
            $check = $this->form_validation->run();
            if ($check == TRUE) {
                $this->load->model('login_model');
                $enter = $this->login_model->login_user($post);
                if ($enter == 1) {
                    redirect(base_url().'engine');
                } elseif ($enter == 2) {
                    $data['info'] = 'Учетная запись заблокирована';
                } else {
                    $data['info'] = 'Ошибка логина или пароля';
                }
            }
        }

        $this->load->module('engine_modules/make_page')->login_page($data);
    }

}
