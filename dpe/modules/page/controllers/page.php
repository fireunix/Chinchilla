<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Page extends MX_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('page_model');
        $this->site_contents = $this->config->item('site_contents');
    }

    /**
     * 
     * @param type $uri = данные загружаемой страницы
     * @param type $mode = режим вывода контента
     * @return массив идентификаторов контента
     */
    function get($uri = array(), $mode = 'show') {

        if (sizeof($uri) === 0)
            return 1;
        $data = $this->get_frame_page();
        $page = $this->page_model->get_content($uri['page']);
        $data['meta'] = $this->make_meta($page['meta']);
        $data['title'] = $page['title'];
        $data = array_merge($data, json_decode($page['composition'], TRUE));
        $data = $this->get_content($data, $mode);
        return $data;
    }

    /*
     * Функция получения контента.
     * Вход: $data = массив скелета сайта с идентификаторами контентов, если вместо ИДа массив, значит это модуль
     *       $mode = режим вывода. show - обычная обработка для выдачи на сайт. inline - не выдает контент модулей. а отдает массив модуля
     * 
     */

    private function get_content($data = array(), $mode = 'show') {

        $out = array();
        if (sizeof($data) === 0)
            return 1;
        $ids = array();
        $keys = array();
        foreach ($data as $key => $row) {
            /* Ветка распознавания и обработки модуля */
            if (is_array($row)) {
                /* Если выбран режим обычного показа страницы 'show' просто обращаемся к модулю с таким именем */
                if ($mode === 'show') {
                    if (!empty($row['name'])) {
                        $out[$key] = $this->load->module('site_modules/'.$row['name'])->run($row['params']);
                    } else {
                        $out[$key] = '';
                    }
                } else {
                    $out[$key] = $row;
                }
            }
            /* Ветка обработки контента */ else {
                if (is_numeric($row)) {

                    $ids[] = $row + 0;
                    $keys[] = $key;
                }
            }
        }

        $result = $this->db->where_in('id', $ids)->get($this->site_contents)->result_array();
        $int = 0;
        foreach ($result as $row) {
            $out[$keys[$int]] = $row['content'];
            $int++;
        }

        $out['meta'] = $data['meta'];
        $out['title'] = $data['title'];
        return $out;
    }

    private function get_frame_page() {
        $frame = json_decode($this->page_model->load_frame_page(), true);
        return $frame;
    }

    private function make_meta($meta = '') {
        $meta_str = '';
        if (empty($meta)) {
            $meta = $this->crud_main->CRUD('configs', 'read', array('name' => 'meta_site'));
            $meta = json_decode($meta[0]['configure'], TRUE);
        } else {
            $meta = json_decode($meta, TRUE);
        }

        foreach ($meta as $row) {
            $meta_str .='<meta';
            foreach ($row as $title => $variable) {
                $meta_str .= ' '.$title.'="'.$variable.'"';
            }
            $meta_str .= ">\n";
        }
        return $meta_str;
    }

}
