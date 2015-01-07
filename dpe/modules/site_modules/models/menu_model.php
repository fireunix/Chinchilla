<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/*
 *  
 * 
 */

class menu_model extends CI_Model {

    function get_menu($params = '') {
        if ($params == '')
            return 1;
        if ($params !== 'settings') {
            $query = $this->db->get_where($this->config->item('site_menu'), array('position' => $params, 'hidden' => '0'));
        } else {
            $query = $this->db->get($this->config->item('site_menu'));
        }

        $query = $query->result_array();
        return $query;
    }

    /* CRUD ДЛЯ МОДУЛЯ MENU
     * ВХОД: $mode = create | read | update | delete
     */

    function crud_menu($mode = '', $data = array()) {
        switch ($mode) {
            case 'delete_id':
                $this->db->delete($this->config->item('site_menu'), array('id' => $data['id']));
                break;
            case 'delete_page':
                $this->db->delete($this->config->item('site_menu'), array('page' => $data['page']));
                break;
            case 'create':
                if (!is_array($data))
                    return 1;
                $this->db->insert($this->config->item('site_menu'), $data);
                return 0;
                break;
            case 'read':
                $link = $this->db->get_where($this->config->item('site_menu'), array('id' => $data['id']));
                $link = $link->row_array();
                return $link;
                break;
            case 'update':
                $this->db->where('id', $data['id']);
                unset($data['id']);
                $this->db->update($this->config->item('site_menu'), $data);
                break;
            default:
                break;
        }
    }

    function position_link($action = "", $id_link = "") {
        if ($action === "" || $id_link === "")
            return 0;
        switch ($action) {
            case 'up':
                $ids = $this->db->get($this->config->item('site_menu'));
                $ids = $ids->result_array();

                if ($ids[0]['id'] != $id_link) {
                    foreach ($ids as $id) {
                        if ($id['id'] == $id_link) {
                            break;
                        } else {
                            $id_pred = $id['id'];
                        }
                    }
                    if ($id_pred) {
                        $this->db->where('id', $id_link);
                        $this->db->update($this->config->item('site_menu'), array('id' => '999'));
                        $this->db->where('id', $id_pred);
                        $this->db->update($this->config->item('site_menu'), array('id' => $id_link));
                        $this->db->where('id', '999');
                        $this->db->update($this->config->item('site_menu'), array('id' => $id_pred));
                    }
                }
                break;

            case 'down':
                $ids = $this->db->get($this->config->item('site_menu'));
                $ids = $ids->result_array();

                if ($ids[sizeof($ids) - 1]['id'] != $id_link) {
                    foreach ($ids as $id) {
                        if ($id['id'] > $id_link) {
                            $id_posl = $id['id'];
                            break;
                        }
                    }
                    if ($id_posl) {
                        $this->db->where('id', $id_link);
                        $this->db->update($this->config->item('site_menu'), array('id' => '999'));
                        $this->db->where('id', $id_posl);
                        $this->db->update($this->config->item('site_menu'), array('id' => $id_link));
                        $this->db->where('id', '999');
                        $this->db->update($this->config->item('site_menu'), array('id' => $id_posl));
                    }
                    break;
                }
        }
    }

}