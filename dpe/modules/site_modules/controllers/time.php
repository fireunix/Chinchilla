<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

Class Time extends MX_Controller {

    function run() {
        $DateTime = date("Сегодня d.m.y H:i");
        return '<div class="well" style="margin: 2px">'.$DateTime.'</div>';
    }

    function settings() {
        return 'пока нет настроек';
    }

}
