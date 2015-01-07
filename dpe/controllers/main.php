<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Main extends MX_Controller {

    function index() {
        $uri = array();
        $page_data = array();
        $uri = $this->load->module('validator_uri')->validate($this->uri->segment_array());
        $page_data = $this->load->module('page')->get($uri);
        $this->load->module('site')->show($page_data);
        $this->load->module('logs')->add_visited();
        IF(ENVIRONMENT != "production")
            $this->output->enable_profiler(TRUE);
    }

}
