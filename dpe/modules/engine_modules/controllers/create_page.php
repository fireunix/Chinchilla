<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Create_page extends MX_Controller {

    function index() {
        //Проверка на доступ
        $this->acs->check_perms('create_page');

        $data = array();
        $data['title'] = "Создание страницы";
        $data['body'] = '';
        $post = $this->input->post(NULL, TRUE);
        if (is_array($post)) {
            $this->form_validation->set_rules($this->config->item('validate_create_page'));

            $errors = '';
            if ($this->form_validation->run()) {
                $check = $this->make_page($post);
                if (!$check)
                    $errors = '<br>Страница с таким именем уже есть';
            } else {
                $check = FALSE;
                $errors .= validation_errors();
            }

            if ($check) {
                $data['body'] .= '<div class="panel panel-green">
                        <div class="panel-heading">
                           Успешно
                        </div>
                        <div class="panel-body">
                            <p> Страница успено создана </p>
                            <p> <a target="_blank" href="'.base_url().$post['name'].'">Просмотреть </a></p>
                            <p> <a target="_blank" href="'.base_url().'engine/edit_page_inline/'.$post['name'].'">Редактировать </a></p>
                            <p> <a href="'.path_form_form().'">Создать еще </a></p>
                        </div>
                  
                    </div>';
            } else {

                $data['body'] .= '<div class="panel panel-red">
                        <div class="panel-heading">
                            Ошибка создания
                        </div>
                        <div class="panel-body">
                            <p>'.$errors.'</p>
                        </div>
                    </div>';
            }
        }

        $data['body'] .= $this->form_create_page();
        $this->load->module('engine_modules/make_page')->default_page($data);
    }

    function form_create_page() {

        $content = form_open(path_form_form());
        $content .= '
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Форма для новой страницы
                          </div>
                        <div class="panel-body">
                            <div class="row">         
                            <div class="col-lg-12">';

        /* Форма для страницы */
        $content .= '<div class="form-group">
                        <label>Название страницы</label>
                        <input name="name" placeholder="Например: my_page" value="'.set_value('name').'">
                        <p class="help-block">Название страницы пишется латинскими буквами, и будет использовано в URL</p>
                    </div>';


        $content .= '<div class="form-group">
                        <label>Заголовок</label>
                        <input name="title" placeholder="Например: my_title"  value="'.set_value('title').'">
                        <p class="help-block">Название заголовка отображается во вкладке браузера а так же используется в меню</p>
                    </div>';
        $content .= '<div class="form-group">
                                            <label>Дополнительные функции</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="send_in_menu" value="1">Добавить в меню
                                            </label>
                                    
                                        </div>';
        $content .= '<button type="submit" class="btn btn-primary btn-lg btn-block">Создать страницу</button>';
        $content .= '</div></div></div>';
        $content .= form_close();
        return $content;
    }

    private function make_page($post = array()) {
        if (!is_array($post))
            return FALSE;
        $result = $this->load->model('engine_modules/pages_model')->make_page($post);
        return $result;
    }

}
