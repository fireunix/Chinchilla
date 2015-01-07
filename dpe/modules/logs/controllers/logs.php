<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Logs extends MX_Controller {
    function add_visited($url = "") {
        $ip = $this->input->ip_address();
        if ($url === "")
            $url = base_url().$this->uri->uri_string(TRUE);;  // определяем страницу сайта
        $bot = $this->input->user_agent();
        $time = $this->benchmark->elapsed_time('total_execution_time_start', 'total_execution_time_end');
        $sql = 'INSERT INTO `'.$this->config->item('visited').'` (date, browser, ip, url, elapsed_time) VALUES (NOW(), \''.$bot.'\', \''.$ip.'\', \''.$url.'\', \''.$time.'\');';
        $this->db->query($sql);
    }

}
