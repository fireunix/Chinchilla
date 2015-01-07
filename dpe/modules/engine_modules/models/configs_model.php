<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Configs_model extends CI_Model {
    /*
     * Входные данные:
     * create | read | update | delete
     * $data = WHERE!!
     * 
     */

    function crud_configs($action = "", $data = array()) {

        switch ($action) {
            case 'read':
                if (!empty($data))
                    $query = $this->db->get_where($this->config->item('configs'), $data);
                else
                    $query = $this->db->get($this->config->item('configs'));
                $query = $query->result_array();
                return $query;
                break;

            default:
                break;
        }
    }

}
