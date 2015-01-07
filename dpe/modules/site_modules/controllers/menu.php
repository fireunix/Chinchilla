<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

Class Menu extends MX_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('html');
        $this->load->model('menu_model');
    }

    function run($params = '') {

        if (empty($params))
            return 1;

        $menu = $this->crud_main->CRUD('site_menu', 'read', NULL);
        $lists = array();
        $list = array();
        foreach ($menu as $row) {
            if ($row['type'] == 'inside') {
                $list['link'] = base_url().$row['url'];
                $list['name'] = $row['title'];
            } elseif ($row['type'] == 'outlink') {
                $list['link'] = $row['url'];
                $list['name'] = $row['title'];
            } elseif ($row['type'] == 'anchor') {
                $list['link'] = '#'.$row['url'];
                $list['name'] = $row['title'];
            }
            if ($params == $row['position'] && $row['hidden'] == 0)
                $lists[] = $list;
        }
        $View = $this->ShowMenu($lists);
        RETURN $View;
    }

    private function ShowMenu($Lists = array()) {
        $Menu = '';
        foreach ($Lists as $row)
            $Menu .=' <li><a href="'.$row['link'].'">'.$row['name'].'</a></li>';
        return $Menu;
    }

    function settings() {

        $post = $this->input->post(NULL, TRUE);
        $form_add = $this->buttons();
        if (isset($post)) {
            if (isset($post['delete'])) {
                if (is_numeric($post['delete']))
                    $this->menu_model->crud_menu('delete_id', array('id' => $post['delete']));
            }

            if (isset($post['create'])) {
                $this->save($post);
            }
            if (isset($post['update'])) {
                $this->update($post);
            }
            if (isset($post['add'])) {
                $form_add = $this->form_links_menu();
            }
            if (isset($post['edit'])) {
                $form_add = $this->form_links_menu($post['edit']);
            }
            if (isset($post['UP'])) {
                $this->menu_model->position_link('up', $post['UP']);
            }
            if (isset($post['DOWN'])) {
                $this->menu_model->position_link('down', $post['DOWN']);
            }
        }
        $content = form_open(path_form_form());
        $content .= $form_add;
        $content .= $this->show_data();
        $content .= form_close();
        return $content;
    }

    private function show_data($params = 'settings') {

        $result = $this->menu_model->get_menu($params);
        $BodyTable = array();
        foreach ($result as $info) {
            $BodyRow = array();
            $BodyRow[] = $info['title'];
            $BodyRow[] = $info['url'];
            switch ($info['type']) {
                case 'inside': $BodyRow[] = 'Внутренний';
                    break;
                case 'outlink': $BodyRow[] = 'Внешний';
                    break;
                case 'anchor': $BodyRow[] = 'Якорь';
                    break;
            }
            if ($info['hidden'] != 0)
                $BodyRow[] = 'Да';
            else
                $BodyRow[] = 'Нет';

            $BodyRow[] = $info['position'];
            $BodyRow[] = '<button type = "submit" value = "'.$info['id'].'" name = "delete"> Удалить </button>
            <button type = "submit" value = "'.$info['id'].'" name = "edit"> Редактировать </button>
            <button type = "submit" value = "'.$info['id'].'" name = "UP"> Выше </button>
            <button type = "submit" value = "'.$info['id'].'" name = "DOWN"> Ниже </button>';
            $BodyTable[] = $BodyRow;
        }
        $content = table(array('Название', 'Страница', 'Тип', 'Скрыто?', 'Позиция', 'Действие'), $BodyTable);
        return $content;
    }

    private function buttons() {
        $buttons = '<p><button type = "submit" name = "add" class = "btn btn-default">Добавить</button>';
        return $buttons;
    }

    private function form_links_menu($id = "") {
        $content = '<script>
                        function change(id)
                        {
                        var sel = document.getElementById("type");
                        var type = sel.options[sel.selectedIndex].value; 
                            if(type == 1){
                                document.getElementById("pages").disabled = false;
                                document.getElementById("link").disabled = true;
                                document.getElementById("anchor").disabled = true;
                            }
                            if(type == 2){
                                document.getElementById("pages").disabled = true;
                                document.getElementById("link").disabled = false;
                                document.getElementById("anchor").disabled = true;
                            }
                            if(type == 3){
                                document.getElementById("pages").disabled = true;
                                document.getElementById("link").disabled = true;
                                document.getElementById("anchor").disabled = false;
                            }
                        }
                    </script>';
        $link = array('url' => '', 'type' => '', 'title' => '', 'hidden' => '', 'position' => '');
        if ($id !== "") {
            $link = $this->menu_model->crud_menu('read', array('id' => $id));
            $content = form_hidden(array('id' => $id));
            $button = '<button type = "submit" class = "btn btn-primary btn-lg btn-block" name = "update">Внести изменения</button>';
        } else {
            $button = '<button type = "submit" class = "btn btn-primary btn-lg btn-block" name = "create">Добавить пункт в меню</button>';
        }

        $content .= '
            <div class = "panel panel-default">
            <div class = "panel-heading">
            Создание пункта меню
            </div>
            <div class = "panel-body">
            <div class = "row">
            <div class = "col-lg-12">';

        $content .= '<div class = "form-group">
            <label>Тип ссылки</label>
            <select class = "form-control" name = "type" style = "width:30%;" id="type" onchange="change(this)">
            <option value="1">На внутреннюю страницу</option>
            <option value="2">Внешняя ссылка</option>
            <option value="3">Якорь</option>
            </select>
            </div>';

        /* Форма для пунктов меню */
        $content .= '<div class = "form-group">
            <label>Ссылаемся на страницу</label>
            <select class = "form-control" name = "url" style = "width:30%;" id="pages">
            '.$this->show_pages($link['url']).'
            </select>
            <p class = "help-block">Выберите страницу, на которую будет вести ссылка</p>
            </div>';

        $content .= '<div class = "form-group">
            <label>Ссылка на внешний ресурс</label>
            <input type="text" name="link" id="link" placeholder="http://my_syte.ru" disabled>
            <p class = "help-block">Выберите страницу, на которую будет вести ссылка</p>
            </div>';

        $content .= '<div class = "form-group">
            <label>Якорь страницы</label>
            <input type="text" name="anchor" id="anchor" placeholder="top" disabled>
            <p class = "help-block">Введите метку якоря</p>
            </div>';

        $content .= '<div class = "form-group">
            <label>Название ссылки</label>
            <input name = "title" placeholder = "Например: my_title" value = "'.$link['title'].'">
            <p class = "help-block">Если оставить пустым, название ссылки будет взято из имени указанной страницы</p>
            </div>';

        if ($link['hidden'])
            $checked = 'checked';
        else
            $checked = '';
        $content .= '<div class = "form-group">
            <label>Дополнительные функции</label>
            <label class = "checkbox-inline">
            <input type = "checkbox" name = "hidden" value = "1" '.$checked.'>Скрытый пункт
            </label>

            </div>';
        $content .= '<div class = "form-group">
            <label>Параметр размещения</label>
            <input name = "position" placeholder = "Например: top" value = "'.$link['position'].'">
            <p class = "help-block">Если оставить пустым, если не знаете что с этим делать</p>
            </div>';
        $content .= $button;
        $content .= '</div></div></div></div>';
        return $content;
    }

    private function show_pages($link = "") {
        $result = $this->load->model('engine_modules/pages_model')->show();
        $content = '';
        $flag_search = FALSE;
        foreach ($result as $pages) {
            if ($link != "" && $link == $pages['name']) {
                $selected = 'selected';
                $flag_search = TRUE;
            } else {
                $selected = '';
            }

            $content .= '<option value = "'.$pages['name'].'" '.$selected.'>'.$pages['title'].'</option>';
        }
        if ($link != "" && $flag_search === FALSE)
            $content .= '<option value = "'.$link.'" selected>'.$link.'</options>';
        return $content;
    }

    private function delete($number = 0) {
        if (!is_numeric($number) || $number === 0)
            return 0;
        $Links = $this->crud_main->CRUD('site_modules', 'read', array('name' => 'menu'));
        $Links = json_decode($Links[0]['settings'], TRUE);
        foreach ($Links as $key => $row) {
            if ($row['number'] == $number)
                unset($Links[$key]);
        }
        $this->crud_main->CRUD('site_modules', 'update', array('name' => 'menu'), array('settings' => json_encode($Links, JSON_UNESCAPED_UNICODE)));
    }

    private function save($data = array()) {
        if (!is_array($data) || empty($data))
            return 1;

        $NewLink = array(); // Массив данных с новым пунктом меню
        if (isset($data['hidden']))
            $hidden = 1;
        else
            $hidden = 0;
        
        if(empty($data['title']))
            $data['title'] = $data['url'];
        switch ($data['type']) {
            case '1':
                $NewLink['title'] = $data['title'];
                $NewLink['type'] = 'inside';
                $NewLink['url'] = $data['url'];
                $NewLink['hidden'] = $hidden;
                $NewLink['position'] = $data['position'];
                break;
            case '2':
                $NewLink['title'] = $data['title'];
                $NewLink['type'] = 'outlink';
                $NewLink['url'] = $data['link'];
                $NewLink['hidden'] = $hidden;
                $NewLink['position'] = $data['position'];
                break;
            case '3':
                $NewLink['title'] = $data['title'];
                $NewLink['type'] = 'anchor';
                $NewLink['url'] = $data['anchor'];
                $NewLink['hidden'] = $hidden;
                $NewLink['position'] = $data['position'];
                break;
        }
        return $this->crud_main->CRUD('site_menu', 'create', array(), $NewLink);
    }

    private function update($data = array()) {
        if (!is_array($data))
            return 1;
        if ($data['title'] === "") {
            $result = $this->load->model('engine_modules/pages_model')->show();
            foreach ($result as $pages) {
                if ($pages['name'] === $data['url'])
                    $data['title'] = $pages['title'];
            }
        }
        if (!isset($data['hidden']))
            $data['hidden'] = '0';
        
        switch ($data['type']) {
            case '1': $data['type'] = 'inside';
                break;
            case '2': $data['type'] = 'outlink';
                break;
            case '3': $data['type'] = 'anchor';
                break;
        }
        unset($data['update']);
        return $this->menu_model->crud_menu('update', $data);
    }

    public function install() {
        if (!$this->db->table_exists('dpe_site_menu')) {
            $this->load->dbforge();


            $fields = array(
                'id' => array(
                    'type' => 'INT',
                    'constraint' => 5,
                    'unsigned' => TRUE,
                    'auto_increment' => TRUE
                ),
                'type' => array(
                    'type' => 'VARCHAR',
                    'constraint' => '32',
                ),
                'url' => array(
                    'type' => 'VARCHAR',
                    'constraint' => '32',
                ),
                'title' => array(
                    'type' => 'VARCHAR',
                    'constraint' => '64',
                ),
                'hidden' => array(
                    'type' => 'INT',
                    'constraint' => '1',
                ),
                'position' => array(
                    'type' => 'VARCHAR',
                    'constraint' => '32',
                ),
            );
            $this->dbforge->add_key('id', TRUE);
            $this->dbforge->add_field($fields);
            $this->dbforge->create_table('dpe_site_menu');

            $data = array(
                'name' => 'menu',
                'enable' => '1',
                'version' => '2',
                'settings' => '[]',
                'group' => '[]',
                'author' => 'Хемуль',
                'about' => 'Модуль для отображения меню на сайте',
            );
            $this->db->insert($this->config->item('site_modules'), $data);
        }
        return TRUE;
    }

}
