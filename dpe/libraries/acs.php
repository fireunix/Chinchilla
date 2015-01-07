<?php

class acs {

    function __construct() {

        $this->CI = & get_instance();
    }

    function check_perms($func = '', $redirect = '') {
        if($func === '')
            $func = $this->UriNow();
        $usr_group_id = $this->CI->session->userdata('group_id');
        $geg_id = $this->READ_DB('engine_perms', array('func' => $func));
        if(!empty($geg_id)){
        $geg_id = json_decode($geg_id[0]['geg'], TRUE);
        if (in_array($usr_group_id, $geg_id, FALSE)) {
            return 0;
        } else {
            if (empty($redirect))
                redirect(base_url().'engine/start_page/access_error');
            else
                redirect($redirect);
        }
        }
    }
    public function UriNow () {
        $Uri = substr($this->CI->uri->uri_string(),7,32);
        return $Uri;
    }
    private function READ_DB($table = '', $where) {
        if (empty($where)) {
            $result = $this->CI->db->get($this->CI->config->item($table));
        } else {
            $result = $this->CI->db->get_where($this->CI->config->item($table), $where);
        }
        return $result->result_array();
    }

}
