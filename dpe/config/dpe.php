<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');



// Имена таблиц БД
$config['site_sections'] = 'dpe_site_sections';
$config['site_menu'] = 'dpe_site_menu';
$config['site_pages'] = 'dpe_site_pages';
$config['site_contents'] = 'dpe_site_contents';
$config['engine_users'] = 'dpe_engine_users';
$config['configs'] = 'dpe_configs';
$config['site_modules'] = 'dpe_site_modules';
$config['engine_groups'] = 'dpe_engine_groups';
$config['engine_perms'] = 'dpe_engine_perms';
$config['visited'] = 'dpe_visited';

//Полный путь к инклудам
$config['inc_ph'] = 'dpe/include_engine/';
$config['inc_ph_site'] = 'dpe/include_site/';

// Начальные страницы
//$config['index_section'] = 'test';
$config['index_page'] = 'start';

//Путь к странице, если доступ закрыт в пермах
$config['PageNotPerm'] = 'engine/start_page/access_error';

// Фиксированное кеширование
$config['fix_cache'] = FALSE;

//Правила валидации
//Валидация логина и пароля
$config['validate_login'] = array(
    array(
        'field' => 'login',
        'label' => 'Логин',
        'rules' => 'trim|required|min_length[1]|max_length[16]|xss_clean'
    ),
    array(
        'field' => 'password',
        'label' => 'Пароль',
        'rules' => 'trim|required|min_length[6]|max_length[16]|md5'
    )
);
//Валидация форм создания страницы
$config['validate_create_page'] = array(
    array(
        'field' => 'name',
        'label' => 'Имя страницы',
        'rules' => 'trim|required|min_length[3]|max_length[16]'
    ),
    array(
        'field' => 'title',
        'label' => 'Заголовок',
        'rules' => 'trim|required|min_length[3]|max_length[16]'
    )
);
//Валидация форм создания блока в каркасе
$config['validate_create_block'] = array(
    array(
        'field' => 'about',
        'label' => 'Описание блока',
        'rules' => 'trim|required|min_length[3]|max_length[32]'
    ),
    array(
        'field' => 'name_block',
        'label' => 'Имя блока',
        'rules' => 'trim|required|min_length[3]|max_length[8]'
    )
);
//Валидация форм смены пароля
$config['validation_edit_pass'] = array(
    array(
        'field' => 'old_pass',
        'label' => 'Старый пароль',
        'rules' => 'trim|required|min_length[6]|max_length[16]|md5'
    ),
    array(
        'field' => 'new_pass',
        'label' => 'Новый пароль',
        'rules' => 'trim|required|min_length[6]|max_length[16]|md5'
    ),
    array(
        'field' => 'rpt_new_pass',
        'label' => 'Повторный новый пароль',
        'rules' => 'trim|required|min_length[6]|max_length[16]|md5'
    )
);

//Валидация форм добавления юзера
$config['validation_add_user'] = array(
    array(
        'field' => 'login',
        'label' => 'Логин',
        'rules' => 'trim|required|min_length[5]|max_length[16]'
    ),
    array(
        'field' => 'password1',
        'label' => 'Пароль',
        'rules' => 'trim|required|min_length[6]|max_length[16]|matches[password2]'
    ),
    array(
        'field' => 'password2',
        'label' => 'Повторный  пароль',
        'rules' => 'trim|required|min_length[6]|max_length[16]'
    ),
    array(
        'field' => 'email',
        'label' => 'E-mail',
        'rules' => 'trim|required|min_length[6]|max_length[32]|valid_email'
    )
);
