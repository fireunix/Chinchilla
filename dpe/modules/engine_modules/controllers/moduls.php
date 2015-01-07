<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Moduls extends MX_Controller {

    function index($id = "") {
        //Проверка на доступ
        $this->acs->check_perms('moduls');

        $data = array();
        $data['title'] = "Модули системы";

        $modul = $this->input->post(NULL, TRUE);

        if (empty($id))
            $data['body'] = $this->show_modules();
        elseif ($id === "install") {
            $data['body'] = $this->install_modules($modul['NameModul']);
        } elseif ($id == "settings") {
            $data['body'] = $this->settings_module($this->uri->segment(4));
        }
        $this->load->module('engine_modules/make_page')->default_page($data);
    }

    private function show_modules() {

        $result = $this->load->model('engine_modules/modules_model')->show();
        $table = '';
        foreach ($result as $modul) {
            $table .= '<tr class="odd gradeX">
                        <td>'.$modul['id'].'</td>
                        <td>'.$modul['name'].'</td>
                        <td>'.$modul['enable'].'</td>
                        <td>'.$modul['version'].'</td>
                        <td>'.$modul['author'].'</td>
                        <td>'.$modul['about'].'</td>
                   
                        <td><a href="'.base_url().'engine/moduls/settings/'.$modul['name'].'">Настройки</a>                
                        </td>
                    </tr>';
        }

        $content = '<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Модули в системе <a href="'.base_url().'engine/moduls/install">Установить модуль</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Название</th>
                                            <th>Статус</th>
                                            <th>Версия</th>
                                            <th>Автор</th>
                                            <th>О Модуле</th>
                                            <th>Действие</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       '.$table.'
                                       
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>';
        return $content;
    }

    private function settings_module($name = '') {
        //Проверка на доступ
        $this->acs->check_perms('moduls/settings');

        if (strlen($name) < 1)
            return 'Ошибка аргумента';
        if (!$this->load->model('engine_modules/modules_model')->check_modul($name))
            return 'Нет такого модуля';
        return $this->load->module('site_modules/'.$name)->settings();
    }

    function install_modules($name = '') {
        $this->acs->check_perms('moduls/install');
        if ($name != '') {
            if (strlen($name) < 1)
                return 'Ошибка аргумента';
            $install = $this->load->module('site_modules/'.$name)->install();
            if ($install == TRUE)
                return 'Успешно';
            else
                return $install;
        } else {

            $ModulesInDB = $this->crud_main->CRUD('site_modules', 'read', NULL);
            $ModuleInDBName = array();
            foreach ($ModulesInDB as $ModuleName) {
                $ModuleInDBName[] = $ModuleName['name'];
            }
            $ModulesInDir = get_filenames('dpe/modules/site_modules/controllers/');
            foreach ($ModulesInDir as $key => $ModuleName) {
                $ModuleName = str_replace(".php", "", $ModuleName);
                $ModulesInDir[$key] = $ModuleName;
            }
            $FinalModules = array();
            foreach ($ModulesInDir as $ModuleName) {
                if (!in_array($ModuleName, $ModuleInDBName))
                    $FinalModules[] = $ModuleName;
            }
            if (!empty($FinalModules)) {
                $content = form_open(path_form_form());
                $content .= 'Выберите имя модуля для установки <select name="NameModul">';
                foreach ($FinalModules as $NameModule) 
                    $content .='<option value="'.$NameModule.'">'.$NameModule.'</option>';
                $content .= '</select>';
                $content .= '<input type="submit" value="Установить">';
                $content .= form_close();
            } else {
                $content = 'Нет новых модулей';
            }

            return $content;
        }
    }

}
