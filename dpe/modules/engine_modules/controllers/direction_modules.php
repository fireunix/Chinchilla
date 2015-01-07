<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Direction_Modules extends MX_Controller {

    function index($IN = array()) {
        //Проверка на доступ  - не забыть добавить функцию в БД
        $this->acs->check_perms('direction_modules');
        $this->load->helper('html');
        $data = array();
        $data['title'] = 'Постановка модулей';
        $data['body'] = $this->DefaultDirectionModules();
        if (!empty($IN[0]) && $IN[0] == 'uninstall') {
            if (!empty($IN[2]))
                $answer = $IN[2];
            else
                $answer = null;
            $data['body'] = $this->UninstallModule($IN[1], $answer);
        }
        if (!empty($IN[0]) && $IN[0] == 'install') {
            $data['body'] = $this->InstallModule($IN[1]);
        }
        $this->load->module('engine_modules/make_page')->default_page($data); // Сборка страницы
    }

    private function DefaultDirectionModules() {
        $DefaultFrame = $this->crud_main->CRUD('configs', 'read', array('name' => 'default_template'));
        $DefaultFrame = json_decode($DefaultFrame[0]['configure'], TRUE);

        $AboutFrame = $this->crud_main->CRUD('configs', 'read', array('name' => 'frame_about'));
        $AboutFrame = json_decode($AboutFrame[0]['configure'], TRUE);

        $TableBody = array();
        foreach ($DefaultFrame as $key => $Composition) {
            if (is_array($Composition)) {
                $LinkOnModul = '<a href="'.base_url().'engine/moduls/settings/'.$Composition['name'].'"><button>Перейти к модулю</button></a>'."\n ";
                $UninstallModul = '<a href="'.base_url().'engine/direction_modules/uninstall/'.$Composition['name'].'"><button>Убрать модуль</button></a>'."\n ";
                $InstallModul = '<a href="'.base_url().'engine/direction_modules/install/'.$key.'"><button>Установить модуль</button></a>';

                if (empty($Composition['name'])) {
                    $Modul = "Нет модуля";
                    $ButtonAction = $InstallModul;
                } else {
                    $Modul = $Composition['name'];
                    $ButtonAction = $LinkOnModul.$UninstallModul;
                }
                $TableBody[] = array($AboutFrame[$key], $Modul, $ButtonAction);
            }
        }
        $head = '<p> Размещение модулей на страницах по умолчанию </p>';
        $table = table(array('Имя каркаса', 'Установленный модуль', 'Действия'), $TableBody);
        $buttonSave = '<button type="submit">Сохранить</button>';
        $make = $head.$table.$buttonSave;
        return $make;
    }

    private function UninstallModule($NameModule = "", $Answer) {
        $this->acs->check_perms('direction_modules/uninstall', base_url().'engine/direction_modules');

        if (empty($Answer)) {
            $Message = 'Вы уверены, что хотите удалить модуль со страниц?<br>';
            $Message .= '<a href="'.path_form_form().'/yes"><button>Да</button></a>'."\n".'<a href="'.path_form_form().'/no"><button>Нет</button></a>';
            return $Message;
        } else {
            if ($Answer == 'yes') {
                return $this->UninstallModuleInBD($NameModule);
            } else {
                redirect(base_url().'engine/direction_modules');
            }
        }
    }

    private function UninstallModuleInBD($NameModule = "") {
        if (empty($NameModule) || !is_string($NameModule))
            return 'Ошибка';

        $DefaultFrame = $this->crud_main->CRUD('configs', 'read', array('name' => 'default_template'));
        $DefaultFrame = json_decode($DefaultFrame[0]['configure'], TRUE);
        foreach ($DefaultFrame as $key => $Composition) {
            if (is_array($Composition) && $Composition['name'] == $NameModule) {
                $DefaultFrame[$key]['name'] = "";
                $DefaultFrame[$key]['params'] = "";
            }
        }
        // запись новых данных в БД - конфигурация
        $this->crud_main->CRUD('configs', 'update', array('name' => 'default_template'), array('configure' => json_encode($DefaultFrame, JSON_UNESCAPED_UNICODE)));
        $edit_pages = $this->crud_main->CRUD('site_pages', 'read', false);
        foreach ($edit_pages as $page) {
            $page_composit = json_decode($page['composition'], TRUE);
            foreach ($page_composit as $key => $composition) {
                if (is_array($composition) && $composition['name'] == $NameModule) {
                    $page_composit[$key]['name'] = "";
                    $page_composit[$key]['params'] = "";
                    $this->crud_main->CRUD('site_pages', 'update', array('name' => $page['name']), array('composition' => json_encode($page_composit, JSON_UNESCAPED_UNICODE)));
                }
            }
        }
        redirect(base_url().'engine/direction_modules');
    }

    private function InstallModule($NameFrame = "") {
        if (empty($NameFrame) || !is_string($NameFrame))
            return 'Ошибка';
        $post = $this->input->post(NULL, TRUE);
        if (empty($post)) {
            $Modules = $this->crud_main->CRUD('site_modules', 'read', false);
            $SelectModules = '<div class="form-group"><select name="Module">';
            foreach ($Modules as $Module) {
                $SelectModules .= '<option value="'.$Module['name'].'">'.$Module['name'].' | '.$Module['about'].'</option>';
            }
            $SelectModules .= '</select></div>';
            $InputParams = '<div class="form-group"><input type="text" name="params" placeholder="Добавить параметр при установке" style="width: 300px"></div>';
            $Button = '<div class="form-group"><button type="submit" name="install">Установить Модуль</button></div>';
            return $Form = form_open(path_form_form()).form_hidden('frame', $NameFrame).$SelectModules.$InputParams.$Button.form_close();
        } else {
            return $this->InstallModuleInBD($post);
        }
    }

    private function InstallModuleInBD($IN = array()) {
        if (empty($IN) || !is_array($IN))
            return 'Ошибка';

        $DefaultFrame = $this->crud_main->CRUD('configs', 'read', array('name' => 'default_template'));
        $DefaultFrame = json_decode($DefaultFrame[0]['configure'], TRUE);
        foreach ($DefaultFrame as $key => $Composition) {
            if (is_array($Composition) && $key == $IN['frame']) {
                $DefaultFrame[$key]['name'] = $IN['Module'];
                $DefaultFrame[$key]['params'] = $IN['params'];
            }
        }

        // запись новых данных в БД
        $this->crud_main->CRUD('configs', 'update', array('name' => 'default_template'), array('configure' => json_encode($DefaultFrame, JSON_UNESCAPED_UNICODE)));

        $edit_pages = $this->crud_main->CRUD('site_pages', 'read', false);
        foreach ($edit_pages as $page) {
            $page_composit = json_decode($page['composition'], TRUE);
            foreach ($page_composit as $key => $composition) {
                if (is_array($composition) && $key == $IN['frame']) {
                    $page_composit[$key]['name'] = $IN['Module'];
                    $page_composit[$key]['params'] = $IN['params'];
                    $this->crud_main->CRUD('site_pages', 'update', array('name' => $page['name']), array('composition' => json_encode($page_composit, JSON_UNESCAPED_UNICODE)));
                }
            }
        }
        redirect(base_url().'engine/direction_modules');
    }

}
