<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Engine extends MX_Controller {

    function __construct() {
        parent::__construct();

        $this->logged_in = FALSE;
        $session_srv = $this->crud_main->CRUD('engine_users', 'read', array('login' => $this->session->userdata('login')));
        $session_srv = $session_srv[0]['session'];
        $session_usr = $this->session->userdata('session_id');

        if ($session_srv === $session_usr) {
            $this->logged_in = TRUE;
        } else {
            $this->logged_in = FALSE;
        }
        if (ENVIRONMENT !== "production")
            $this->output->enable_profiler(TRUE);

        $this->acs->check_perms();
    }

    private function DetectedURIArray() {
        $URI = $this->uri->segment_array();
        array_splice($URI, 0, 2);
        return $URI;
    }

    function index() {
        if ($this->logged_in)
            redirect(base_url().'engine/start_page');
        else
            redirect(base_url().'engine/login');
    }

    function start_page() {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/start_page')->index();
    }

    function edit_page($id = 0) {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/edit_page')->index($id);
    }

    function edit_frame($id = 0) {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/edit_frame')->index($id);
    }

    function edit_page_inline($id = "") {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/edit_page')->edit_page_inline($id);
    }

    function edit_page_inline_save($name_page = "") {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/edit_page')->edit_page_inline_save($name_page, $_REQUEST);
    }

    function create_page() {

        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/create_page')->index();
    }

    function delete_page($id = 0) {

        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/delete_page')->index($id);
    }

    function moduls($id = "") {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/moduls')->index($id);
    }

    function edit_modules_pages($id = "") {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/edit_modules_pages')->index($id);
    }
    
    function visited($id = "") {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/story_visit')->index($id);
    }
    function user_profiler($id = "") {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/user_profiler')->index($id);
    }

    function edit_elem_page($id = "") {
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/edit_elem_page')->index($id);
    }

    function direction_modules($id = "") {
        $id = $this->DetectedURIArray();
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/direction_modules')->index($id);
    }
    function profiles_manager($id = "") {
        $id = $this->DetectedURIArray();
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/profiles_manager')->index($id);
    }
    function groups_manager($id = "") {
        $id = $this->DetectedURIArray();
        if (!$this->logged_in)
            redirect(base_url().'engine/login');
        else
            $this->load->module('engine_modules/groups_manager')->index($id);
    }

    function logout() {
        $this->load->module('engine_modules/logout')->start();
    }

    function login() {
        $this->load->module('engine_modules/login')->start();
    }

}
