<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Make_Page extends MX_Controller {

    function __construct() {
        parent::__construct();
        $this->load->module('engine_modules/panel');
        $this->MAIN = array('inc_ph' => inc_ph(), 'top_panel' => '', 'left_panel' => '', 'other_top' => '', 'other_bottom' => '');
        $this->MAIN['left_panel'] = $this->panel->left_menu('<p style="opacity: 0.3">Build version: '.VERSION_DPE.'</p>');
        $this->MAIN['top_panel'] = $this->panel->top_panel();
        
    }

    function login_page($data = array()) {
        $this->MAIN = array_merge($this->MAIN, $data);
        $this->load->view('engine_modules/login_page.php', $this->MAIN);
    }

    function default_page($data = array()) {
        $this->MAIN = array_merge($this->MAIN, $data);
        $this->load->view('engine_modules/main_page', $this->MAIN);
    }

    function start_page($data = array()) {
        $this->MAIN = array_merge($this->MAIN, $data);
        $this->MAIN['other_top'] = '<script type="text/javascript" src="'.inc_ph().'js/flot/flotr2.min.js"></script>';
        $this->load->view('engine_modules/main_page', $this->MAIN);
    }

    function edit_page($data = array()) {
        $this->MAIN = array_merge($this->MAIN, $data);
        $this->MAIN['other_top'] = '<!-- DataTables CSS -->'.
                '<link href="'.inc_ph().'css/plugins/dataTables.bootstrap.css" rel="stylesheet">';

        $this->MAIN['other_bottom'] = '<!-- DataTables JavaScript -->'.
                '<script src="'.inc_ph().'js/plugins/dataTables/jquery.dataTables.js"></script>'.
                '<script src="'.inc_ph().'js/plugins/dataTables/dataTables.bootstrap.js"></script>'
                .'        
            <script>
             $(document).ready(function() {
              $(\'#dataTables-example\').dataTable();
              });
             </script>';
        $this->load->view('engine_modules/main_page', $this->MAIN);
    }

}
