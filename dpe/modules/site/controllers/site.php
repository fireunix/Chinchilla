<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Site extends MX_Controller {

    function show($data = array()) {
       
        if (!$this->config->item('fix_cache'))
            $this->load->view('template', $data);
        else
            $page = $this->out($data);
        
    }

    function out($data = array()) {
        return $this->load->view('template', $data, true);
    }

}
