<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Page_model extends CI_Model {

    function get_content($page = '') {
        if ($page == '')
            return 1;
        $query = $this->db->get_where($this->config->item('site_pages'), array('name' => $page));
        $query = $query->row_array();
        return $query;
    }
    
    function load_frame_page () {
        $query = $this->db->get_where($this->config->item('configs'), array('name'=>'default_template'));
        $query = $query->row_array();
        $query = $query['configure'];
        return $query;
    }

}
