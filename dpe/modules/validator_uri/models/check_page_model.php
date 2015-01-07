<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Check_page_model extends CI_Model {

    function check_page($uri = array()) {
        $error = FALSE;
        if (isset($uri['page'])) {
            $query = $this->db->where(array('name' => $uri['page']))
                    ->where(array('status' => '0'))
                    ->get($this->config->item('site_pages'));
            if (!$query->num_rows())
                $error = TRUE;
        }
        if ($error)
            return 1;
        else
            return 0;
    }

}
