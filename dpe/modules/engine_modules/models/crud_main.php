<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/*
 * Модуль crud_main
 * Изменения: теперь можно на прямую обращаться к функциям CRUD
 */

class crud_main extends CI_Model {

    function CRUD($table = '', $action = '', $where, $data = array()) {
        if ($table === '' || $action === '')
            return FALSE;
        if (!is_array($data))
            return FALSE;
        $table = $this->config->item($table);
        if (!$table)
            return FALSE;

        switch ($action) {
            case 'create': return $this->create($table, $data);
                break;
            case 'read': return $this->read($table, $where);
                break;
            case 'update': return $this->update($table, $where, $data);
                break;
            case 'delete': return $this->delete($table, $where);
                break;
            default: return false;
                break;
        }
        return FALSE;
    }

    public function create($table, $data) {
        $table = $this->DetectedTable($table);
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    /*  Функция чтения из БД
     *  Параметр table = название таблицы в соответствии с файлов dpe.php
     *  Параметр where = выборка. если параметр отсутсвует приосходит вся выборка. array('id' => $id)
     *  Параметр sort = параметры сортировки, если параметр пуст, сортировка идет по умолчанию.  array('name', 'asc');
     */

    public function read($table, $where = array(), $sort = array(), $limit = 1000) {
        $table = $this->DetectedTable($table);
        if (!empty($sort))
            $this->db->order_by($sort[0], $sort[1]);
        if (empty($where))
            $result = $this->db->get($table, $limit);
        else {
            $result = $this->db->get_where($table, $where);
        }

        return $result->result_array();
    }

    public function update($table, $where, $data) {
        $table = $this->DetectedTable($table);
        $this->db->where($where);
        $this->db->update($table, $data);
        return TRUE;
    }

    public function delete($table, $where) {
        $table = $this->DetectedTable($table);
        $this->db->delete($table, $where);
        return TRUE;
    }

    private function DetectedTable($table = '') {
        if ($this->config->item($table))
            $table = $this->config->item($table);
        return $table;
    }

}
