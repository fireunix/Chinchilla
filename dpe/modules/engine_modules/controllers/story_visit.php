<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Story_Visit extends MX_Controller {

    function index() {

        $data = array();
        $data['title'] = 'История посещений сайта';
        $data['body'] = $this->FormRate().$this->show_story();
        $this->load->module('engine_modules/make_page')->default_page($data); // Сборка страницы
    }

    private function FormRate() {
        $form = form_open(path_form_form());
        $form .= '<input type="text" max="4" name="amount" placeholder="Колличество: ">';
        $form .= form_close();
        return $form;
    }

    private function show_story($amount = 'all') {
        $amount = (int) $this->input->post("amount", TRUE);
        if (empty($amount))
            $amount = 50;
        $statistics = $this->crud_main->read('visited', array(), array('date', 'desc'), $amount);
        $body = '
                <h4>	</h4><div class="table-responsive">
                <table class="table table-striped">
                        <tr>
                                <th>Время и дата</th>
                             <!--    <th>Данные браузера</th> -->
                                <th>IP</th>
                                <th>Посещенный URL</th>
                                <th>Время на загрузку</th>
                        </tr>';
        foreach ($statistics as $row => $key) {
            $body .= '<tr>
                    <td>'.$key['date'].'</td>
                   <!-- <td>'.$key['browser'].'</td> -->
                    <td>'.$key['ip'].'</td>
                    <td><a href="'.$key['url'].'" target="_blank">'.$key['url'].'</a></td>
                    <td>'.(($key['elapsed_time'])).'</td>
            </tr>';
        }
        $body .='</table></div>';
        return $body;
    }

}
