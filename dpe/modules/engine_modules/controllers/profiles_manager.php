<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Profiles_Manager extends MX_Controller {

    function index($URI = array()) {
        if (empty($URI))
            $URI[0] = NULL;
        $data = array();
        $data['title'] = 'Управление профилями';
        $data['body'] = '';
        switch ($URI[0]) {
            case 'add': $data['body'] = form_open(path_form_form()).$this->AddUserForm().form_close();
                break;
            case 'delete':$data['body'] = form_open(path_form_form()).$this->DeleteUserForm().form_close();
                break;
            default : $data['body'] = $this->ListAccounts();
                break;
        }


        $this->load->module('engine_modules/make_page')->default_page($data); // Сборка страницы
    }

    function ListAccounts() {
        $buttons = '<div style="margin: 1%">
                    <a href="profiles_manager/add"><button type="button" name="active" value="add" class="btn btn-primary">Добавить</button></a>
                    <a href="profiles_manager/delete"><button type="button" name="active" value="delete" class="btn btn-primary">Удалить</button></a>
                    </div>';

        $body = $buttons.$this->show_all_users();

        return $body;
    }

    private function show_all_users($check = array()) {

        $users = array();
        $users = $this->crud_main->read('engine_users');


        $body = '<div class="panel panel-default" style="margin: 1% ">
					  <div class="panel-heading">Пользователи</div>
					  <table class="table">
						<thead>
						  <tr>
							<th> 
                                                        </th>
							<th>id</th>
							<th>Логин</th>
							<th>ip</th>
							<th>E-mail</th>
							<th>Группа</th>
							<th>Блокировка</th>
						  </tr>
						</thead>
						<tbody>';
        foreach ($users as $row => $user) {

            $body .=' <tr>
                    <td class="small-col">
                    <td>'.$user['id'].'</td>
                    <td>'.$user['login'].'</td>
                    <td>'.$user['ip'].'</td>
                    <td>'.$user['email'].'</td>
                    <td></td>
                    ';
            $body .='</tr>';
        }
        $body .='</tbody></table></div>';
        return $body;
    }

    function AddUserForm() {
        $this->load->helper('message');
        $content = '';
        $post = $this->input->post(NULL, TRUE);
        if (!empty($post)) {
            $this->form_validation->set_rules($this->config->item('validation_add_user'));
            $message = '';
            if ($this->form_validation->run()) {
                $check = $this->check_login($post['login']);
                if ($check) {
                    $message .= '<br>Пользователь с таким именем уже есть';
                } else {
                    $AddUser = array('login' => $post['login'], 'password' => md5($post['password1']), 'group_id' => $post['group'], 'email' => $post['email']);
                    if ($this->crud_main->create('engine_users', $AddUser)) {
                        $content .= show('success', 'Готово', 'Пользователь успешно добавлен');
                    } else {
                        $message .= 'Возникла непредвиденная ошибка';
                    }
                }
            } else {
                $check = FALSE;
                $message .= validation_errors();
            }
            if (!empty($message))
                $content = show('danger', 'Ошибка', $message);
        }

        $Groups = $this->crud_main->read('engine_groups');
        $GroupsSelect = '<select name="group">';
        foreach ($Groups as $Group) {
            $GroupsSelect .= '<option value="'.$Group['id'].'">'.$Group['about'].'</option>';
        }
        $GroupsSelect .='</select>';

        $Form = '<section style="margin: 3%;">
                    <p>Добавление нового пользователя</p>
                     <p><input type="text" name="login" class="form-control" style="width: 30%" placeholder="Логин" value="'.set_value('login').'"></p>
                     <p> <input type="password" name="password1" class="form-control" style="width: 30%" placeholder="Пароль" value="'.set_value('password1').'"></p>
                     <p> <input type="password" name="password2" class="form-control" style="width: 30%" placeholder="Повторите пароль" value="'.set_value('password2').'"></p>
                     <p> <input type="text" name="email" class="form-control" style="width: 30%" placeholder="E-mail" value="'.set_value('email').'"></p>
                     <p><label>Группа для пользователя</label><br>'.$GroupsSelect.'
                         </p>
                     <p><button type="submit" name="active" value="add_user" class="btn btn-success">Добавить</button></p>
                     </section>
                     ';
        $content .= $Form;
        return $content;
    }

    private function check_login($Login) {
        $Check = $this->crud_main->read('engine_users', array('login' => $Login), array(), 1);
        if (empty($Check))
            return 0;
        else
            return 1;
    }

    private function DeleteUserForm() {
        $this->load->helper('message');
        $IdUserDelete = $this->input->post('user', TRUE);
        $content = '';
        if (!empty($IdUserDelete)) {
            $this->crud_main->delete('engine_users', array('id'=>$IdUserDelete));
            $content .= show('success', 'Успешно', 'Пользователь успешно удален');
        }
        $Users = $this->crud_main->read('engine_users');
        $UsersSelect = '<select name="user">';
        foreach ($Users as $User) {
            $UsersSelect .= '<option value="'.$User['id'].'">'.$User['login'].'</option>';
        }
        $UsersSelect .='</select>';
        $Form = '<label> Выберите Пользователя для удаления</label><p>'.$UsersSelect.'</p>';
        $Form .= '<input type="submit" class="btn btn-success" value="Удалить" name="delete">';
        $content .= $Form;
        return $content;
    }

}
