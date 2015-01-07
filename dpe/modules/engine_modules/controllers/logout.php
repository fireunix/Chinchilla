<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Logout extends MX_Controller {
    function start () {
        $this->session->sess_destroy();
        redirect(base_url().'engine');
    }
    
}
