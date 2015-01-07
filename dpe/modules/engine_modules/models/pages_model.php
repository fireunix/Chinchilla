<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Pages_model extends CI_Model {

    function show() {
        $query = $this->db->where(array('status'=>'0'))->get($this->config->item('site_pages'));
        $pages = $query->result_array();
        return $pages;
    }

    function get_info($data = array()) {
        $info = $this->db->where($data)->
                           where(array('status'=>'0'))->
                           get($this->config->item('site_pages'));
        $info = $info->row_array();
        return $info;
    }

    function check_page($id = 0) {
        if (!is_numeric($id))
            return 0;

        $query = $this->db->where(array('status'=>'0'))->
                            where(array('id' => $id))->
                            get($this->config->item('site_pages'));
        $amount = $query->num_rows();

        if ($amount === 0)
            return 0;
        else
            return 1;
    }

    function show_content_page($id = 0) {
        if (!is_numeric($id))
            return 0;
        $content = array();
        $contents = array();
        $query = $this->db->get_where($this->config->item('site_pages'), array('id' => $id));
        $query = $query->result_array();
        $query = json_decode($query[0]['composition'], TRUE);
        foreach ($query as $key => $row) {
            if (!is_array($row)) {
                $content['name'] = $key;

                $body = $this->db->get_where($this->config->item('site_contents'), array('id' => $row));
                $body = $body->row();

                if (strlen($row) > 0) {
                    $content['content'] = $body->content;
                    $content['id'] = $row;
                } else {
                    $content['content'] = '';
                    $content['id'] = '';
                }
                $contents[] = $content;
            }
        }
        return $contents;
    }

    function update_content($contents = array()) {
        if (!is_array($contents))
            return 0;
        foreach ($contents as $key => $content)
            $this->db->update($this->config->item('site_contents'), array('content' => $content), array('id' => $key));
    }

    function make_page($data = array()) {
        if (!is_array($data))
            return FALSE;
        //Проверка на существование страницы
        $check = $this->db->get_where($this->config->item('site_pages'), array('name' => $data['name']));
        $check = $check->num_rows();
        if ($check > 0)
            return FALSE;
        //Читаем дефолтный шаблон с идами контента
        $query = $this->db->get_where($this->config->item('configs'), array('name' => 'default_template'));
        $query = $query->row_array();
        //Декодируем все это в масств
        $cp_compos = json_decode($query['configure'], TRUE);
        $new_compos = array();

        foreach ($cp_compos as $key => $row) {
            if (!is_array($row)) {
                if (mb_substr($row, 0, 1, "UTF-8") !== "*") {
                    $old_comp = $this->db->get_where($this->config->item('site_contents'), array('id' => $row));
                    $old_comp = $old_comp->row_array();
                    unset($old_comp['id']);
                    $this->db->insert($this->config->item('site_contents'), $old_comp);
                    $new_compos[$key] = $this->db->insert_id();
                } else {
                    $new_compos[$key] = substr($row, 1) + 0;
                }
            } else {
                $new_compos[$key] = $row;
            }
        }

        //Формируем данные страницы включая организованный контент
        $page = array(
            'name' => $data['name'],
            'title' => $data['title'],
            'meta' => '',
            'composition' => json_encode($new_compos)
        );
        //Пишем новую страницу с БД
        $this->db->insert($this->config->item('site_pages'), $page);
        //Добавляем в меню если требовалось
        if (isset($data['send_in_menu'])) {
            $this->db->insert($this->config->item('site_menu'), array('page' => $data['name'], 'title' => $data['title'], 'hidden' => '0', 'position' => 'top'));
        }
        return TRUE;
    }

    function delete_page($id = 0) {
        $name = $this->db->get_where($this->config->item('site_pages'), array('id' => $id));
        $name = $name->row_array();
        $this->db->update($this->config->item('site_pages'), array('status' => '1'), array('id' => $id));
       // $this->db->delete($this->config->item('site_pages'), array('id' => $id));
       // $this->db->delete($this->config->item('site_menu'), array('page' => $name['name']));
    }

    function edit_page_save($name_page = "", $data = array()) {

        $result = $this->db->get_where($this->config->item('site_pages'), array('name' => $name_page));
        $result = $result->row_array();
        $composition = $result['composition'];
        $contents = json_decode($composition, TRUE);
        foreach ($contents as $key => $id_content) {
            if ($key == $data['editorID']) {
                if (strpos($data['editabledata'],'{module:')) {
                    $pos_start = strpos($data['editabledata'],'{module:');
                    $pos_end = strpos($data['editabledata'],'}');
                    $pos_end = $pos_end - 11;
                    $module = substr($data['editabledata'], $pos_start+8,$pos_end);
                    $contents[$key] = array('name'=>$module, 'params'=>'');
                    $this->db->update($this->config->item('site_pages'), array('composition' => json_encode($contents)), array('name' => $name_page));
                } else {
                    $this->db->update($this->config->item('site_contents'), array('content' => $data['editabledata']), array('id' => $id_content));
                }
            }
        }
    }

}
