<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Edit_frame extends MX_Controller {

    function index($id = "") {
        //Проверка на доступ
        $this->acs->check_perms('edit_page_show');
        $this->load->helper('message');
        $data = array();
        $data['title'] = 'Редактор каркаса';
        $data['body'] = $this->show_default_frame();
        $this->load->module('engine_modules/make_page')->default_page($data);
    }

    private function show_default_frame() {
        //Получение post
        $post = $this->input->post(NULL, TRUE);

        //Чтение дефолтного каркаса
        $default_frame = $this->load->model('configs_model')->crud_configs('read', array('name' => 'default_template'));
        $default_frame = json_decode($default_frame[0]['configure'], TRUE);

        //Чтение описания элементов каркаса
        $about_frame = $this->load->model('configs_model')->crud_configs('read', array('name' => 'frame_about'));
        $about_frame = json_decode($about_frame[0]['configure'], TRUE);
        // Формирование вывода
        $content = form_open(path_form_form());

        //Обработка событий POST
        $message = '';
        $this->form_validation->set_rules($this->config->item('validate_create_block'));
        if (!empty($post)) {
            $flag = FALSE;
            //Если есть данные post['add'] вывести форму
            if (isset($post['add'])) {
                $content .= $this->form_blocks();
            }
            if (isset($post['delete'])) {
                $content .= $this->form_del_blocks($default_frame, $about_frame);
            }
            //Если нажата кнопка создать
            if (isset($post['create'])) {
                // Валидация данных
                if ($this->form_validation->run()) {
                    //Если такое название уже есть
                    if (!empty($default_frame[$post['name_block']])) {
                        $message .= show('red', 'Ошибка создания', 'Такой блок уже есть');
                    } else {
                        //Создаем новый блок
                        if ($this->create_new_block($post, $default_frame, $about_frame)) {
                            // Если все в норме выводим сообщение
                            $message .= show('green', 'Успешное оздание', 'Блок успешно создан');
                        } else {
                            // Исключение
                            $message .= show('warning', 'Ошибка', 'Непредвиденная ситуация');
                        }
                    }
                } else {
                    // Выводим сообщение если возникли проблемы с валидацией
                    $errors .= show('red', 'Ошибка создания', validation_errors());
                }
                //Удаление из каркаса блоков
            } elseif (isset($post['delete_block'])) {
                $this->delete_block($post['block'], $default_frame, $about_frame);
                $message .= show('green', 'Успешное оздание', 'Блок успешно удален, удалите переменную '.$post['block'].' с шаблона сайта');
            }
        } else {
            $flag = TRUE;
        }


        $content .= $message;
        if (strlen($message) > 0)
            $content .= $this->form_blocks();
        $content .= $this->buttons_n_forms($flag);
        $content .= $this->create_table_frame($default_frame, $about_frame);
        $content .= form_close();
        return $content;
    }

    private function create_table_frame($default_frame = array(), $about_frame = array()) {
        $table = '';
        foreach ($default_frame as $key => $row) {

            if (!is_array($row)) {
                if (mb_substr($row, 0, 1, "UTF-8") === "*") {
                    $type = "Фиксированный";
                    $row = substr($row, 1) + 0;
                } else {
                    $type = "Копируемый";
                }
                $table .= ' <tr class="odd gradeX">
                            <td>'.$about_frame[$key].'</td>
                            <td>'.$key.'</td>
                            <td>'.$row.'</td>
                            <td>'.$type.'</td>
                            </tr>';
            }
        }

        $content = '
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Блоки вашего сайта
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Описание блока</th>
                                            <th>Название переменной</th>
                                            <th>Идентификатор контента</th>
                                            <th>Тип</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       '.$table.'
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>';
        return $content;
    }

    private function buttons_n_forms($flag = TRUE) {
        $content = '';
        if ($flag) {
            $content = '<p>
                            <button type="submit" class="btn btn-success" name="add">Добавить блок</button>
                            <button type="submit" class="btn btn-warning" name="delete">Удалить блок</button>
                        </p>';
        }
        return $content;
    }

    private function form_blocks() {
        $content = '
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Добавление блока на сайт
                          </div>
                        <div class="panel-body">
                            <div class="row">         
                            <div class="col-lg-12">';

        $content .= '<div class="form-group">
                        <label>Описание блока</label>
                        <input name="about" placeholder="Описание блока" value="'.set_value('about').'" maxlength="32">
                        <p class="help-block">Опишите новый блок</p>
                    </div>';


        $content .= '<div class="form-group">
                        <label>Название блока</label>
                        <input name="name_block" placeholder="Например: my_title"  value="'.set_value('name_block').'" maxlength="8 ">
                        <p class="help-block">Назовите новый блок в одно емкое слово латинскими символами</p>
                    </div>';

        $content .= '<div class="form-group">
                        <label>Режим взаимствования</label>
                        <div class="radio">
                            <label>
                                <input type="radio" name="type" value="fix" checked="">Фиксируемый
                                <p class="help-block">Данный блок будет использоваться на новых страницах как единый</p>
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="type" value="copy">Копируемый
                                <p class="help-block">Данный блок будет копироваться при создании новой страницы</p>
                            </label>
                        </div>
                        <label>Тип блока</label>
                        <div class="radio">
                            <label>
                                <input type="radio" name="mode" value="content" checked="">Контентный
                                <p class="help-block">Без возможности помещения в него модуля</p>
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="mode" value="modules">Модульный
                                <p class="help-block">Есть возможность поместить в него модуль </p>
                            </label>
                        </div>
                    </div>';

        $content .= '<button type="submit" class="btn btn-primary btn-lg btn-block" name="create">Создать блок</button>';
        $content .= '</div></div></div></div>';
        return $content;
    }

    private function form_del_blocks($default_frame = array(), $about_frame = array()) {

        $options = '';
        foreach ($default_frame as $key => $row) {
            if (!is_array($row))
                $options .= '<option value="'.$key.'">Переменная: '.$key.' | '.$about_frame[$key].'</option>';
        }
        $content = '
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          Удаление блока с сайта
                          </div>
                        <div class="panel-body">
                            <div class="row">         
                            <div class="col-lg-12">';

        $content .= '<div class="form-group">
                        <label>Удаление блока с сайта</label>
                        <select name="block">
                        '.$options.'
                        </select>
                        <p class="help-block">Выберите удаляемый блок</p>
                        <p class="help-block">Не забудть удалить c шаблона сайта переменную соответствующую удаляемому блоку</p>
                    </div>
                    </div>';

        $content .= '<button type="submit" class="btn btn-primary btn-lg btn-block" name="delete_block">Удалить блок</button>';
        $content .= '</div></div></div>';
        return $content;
    }

    private function create_new_block($post = array(), $default_frame = array(), $about_frame = array()) {
        if (!is_array($post) || !is_array($default_frame) || !is_array($about_frame))
            return FALSE;
        if (empty($post) || empty($default_frame) || empty($about_frame))
            return FALSE;

        $all_pages = $this->crud_main->CRUD('site_pages', 'read', FALSE);

        //Создание нового-ых контента-ов для блока-ов
        if ($post['mode'] === "content") {
            if ($post['type'] === "fix") {
                $new_id = $this->crud_main->CRUD('site_contents', 'create', FALSE, array('content' => 'new_block', 'level' => '15', 'delete' => '0', 'type' => 'text'));
            } else {
                //Блок, если выбран копируемый блок

                $num_page = count($all_pages);

                $i = 0;
                while ($i < $num_page) {
                    $new_id = $this->crud_main->CRUD('site_contents', 'create', FALSE, array('content' => 'new_block', 'level' => '15', 'delete' => '0', 'type' => 'text'));
                    $i++;
                }
                $begin_id = $new_id - --$i;
            }
        }

        if ($post['mode'] === "content") {
            if ($post['type'] === "fix") {
                $default_frame = array_merge($default_frame, array($post['name_block'] => '*'.$new_id));
            } else {
                $default_frame = array_merge($default_frame, array($post['name_block'] => $begin_id));
            }
        } else {
            $default_frame = array_merge($default_frame, array($post['name_block'] => array('name' => '', 'params' => '')));
        }

        // запись новых данных в БД
        $this->crud_main->CRUD('configs', 'update', array('name' => 'default_template'), array('configure' => json_encode($default_frame, JSON_UNESCAPED_UNICODE)));
        // Формирование описания блока
        $about_frame = array_merge($about_frame, array($post['name_block'] => $post['about']));

        // запись новых данных в БД
        $this->crud_main->CRUD('configs', 'update', array('name' => 'frame_about'), array('configure' => json_encode($about_frame, JSON_UNESCAPED_UNICODE)));


        foreach ($all_pages as $key => $row) {
            $composition = json_decode($row['composition'], TRUE);

            if ($post['mode'] === "content") {
                if ($post['type'] === "fix")
                    $new_composition = array_merge($composition, array($post['name_block'] => $new_id));
                else
                    $new_composition = array_merge($composition, array($post['name_block'] => $begin_id++));
            } else {
                $new_composition = array_merge($composition, array($post['name_block'] => array('name' => '', 'params' => '')));
            }

            $this->crud_main->CRUD('site_pages', 'update', array('id' => $row['id']), array('composition' => json_encode($new_composition, JSON_UNESCAPED_UNICODE)));
        }

        return TRUE;
    }

    private function delete_block($name = "", $default_frame, $about_frame) {
        unset($default_frame[$name]);
        unset($about_frame[$name]);
        $this->crud_main->CRUD('configs', 'update', array('name' => 'default_template'), array('configure' => json_encode($default_frame, JSON_UNESCAPED_UNICODE)));
        $this->crud_main->CRUD('configs', 'update', array('name' => 'frame_about'), array('configure' => json_encode($about_frame, JSON_UNESCAPED_UNICODE)));
        $pages = $this->crud_main->CRUD('site_pages', 'read', FALSE);
        foreach ($pages as $key => $row) {
            $compos = json_decode($row['composition'], TRUE);
            if (!empty($compos[$name]))
                unset($compos[$name]);
            $this->crud_main->CRUD('site_pages', 'update', array('id' => $row['id']), array('composition' => json_encode($compos, JSON_UNESCAPED_UNICODE)));
        }
    }

}
