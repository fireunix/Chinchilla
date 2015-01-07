<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User_Profiler extends MX_Controller {

    function index($input) {

        $data = array();
        $data['title'] = 'Профиль пользователя';
        $data['body'] = $this->profile();
        $this->load->module('engine_modules/make_page')->default_page($data); // Сборка страницы
    }

    function profile() {
        $Group = $this->crud_main->read('engine_groups', array('id' => $this->session->userdata('group_id')));
        $UserData['name'] = $this->session->userdata('login');
        $Result = $this->crud_main->read('engine_users', array('login' => $UserData['name']));
        $UserData['group'] = $Group[0]['about'];
        $UserData['email'] = $Result[0]['email'];
        $UserData['ip'] = $Result[0]['ip'];
        $UserData['email'] = $Body = $this->PanelProfile($UserData);
        return $Body;
    }

    private function PanelProfile($data = array()) {
        $this->load->helper('message');
        $Input = $this->input->post(NULL, TRUE);
        $Message = '';
        if (isset($Input['edit_pass'])) {
            $this->form_validation->set_rules($this->config->item('validation_edit_pass'));
            if (!$this->form_validation->run()) {
                $Message = show('danger', 'Ошибка смены пароля', validation_errors());
            }
            else {
                $Result = $this->crud_main->read('engine_users', array('login'=>$data['name'],'password'=>md5($Input['old_pass'])));
                if(empty($Result)){
                    $Message .= show('danger', 'Ошибка смены пароля', 'Старый пароль не верен');
                } else {
                    $this->crud_main->update('engine_users',array('login'=>$data['name']),array('password'=>md5($Input['new_pass'])));
                    $Message = show('success', 'Выполнено', 'Пароль успешно сменен');
                }
            }
        }

        $Body = $Message;
        $Body .= form_open(path_form_form());
        $Body .= '<div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Панель пользователя
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-pills">
                                <li class="active"><a href="#main-pills" data-toggle="tab">Основные данные</a>
                                </li>
                                <li class=""><a href="#editpass-pills" data-toggle="tab">Безопасность</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="main-pills"><p><br>
                                        Имя Пользователя: '.$data['name'].'<br>
                                        Группа пользователя: '.$data['group'].'<br>
                                        E-mail: '.$data['email'].'<br>
                                        Последний IP: '.$data['ip'].'
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="editpass-pills">
                                    <div class="form-group">
                                    <p class="help-block" align="center">Редактирование пароля</p>
                                            <label>Старый пароль</label>
                                            <input class="form-control" name="old_pass" type="password">
                                            <label>Новый пароль</label>
                                            <input class="form-control" name="new_pass" type="password">
                                            <label>Повторите Новый пароль</label>
                                            <input class="form-control" name="rpt_new_pass" type="password">
                                           

                                        </div>
                                        <input type="submit" class="btn btn-success btn-lg btn-block" value="Изменить Пароль" name="edit_pass">
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>';
        $Body .=form_close();
        return $Body;
    }

    private function PanelStory() {
        $Content = '<div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Notifications Panel
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-money fa-fw"></i> Payment Received
                                    <span class="pull-right text-muted small"><em>Yesterday</em>
                                    </span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                   
                       
                </div>';
        return $Content;
    }

}
