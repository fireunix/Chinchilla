<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Modules_model extends CI_Model {
    function show () {
        $result = $this->db->get($this->config->item('site_modules'));
        $result = $result->result_array();
        return $result;
    }
    function check_modul ($name = '') {
        $check = $this->db->get_where($this->config->item('site_modules'), array('name'=>$name));
        $check = $check->num_rows();
        if($check === 0) return 0;
        if($check !== 0) return 1;
    }
    function get_info ($id = 0){
        if(!$this->check_modul($id)) return 0;
        $info = $this->db->get_where($this->config->item('site_modules'), array('id'=>$id));
        $info = $info->row_array();
        return $info;
    }
}