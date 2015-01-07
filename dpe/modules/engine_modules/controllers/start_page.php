<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Start_page extends MX_Controller {

    function index() {
        $data = array();
        $data['title'] = 'Статистика';
        $data['body'] = $this->show_time_load_pages();
        $this->load->module('engine_modules/make_page')->start_page($data);
    }

    private function show_time_load_pages() {
        $result = $this->crud_main->CRUD('visited', 'read', false);

        $DateGTLP = $this->get_time_pages($result);
        $DataVST = $this->visited($result);
        $DataVSY = $this->visited($result, Date("Y-m-d", strtotime("-1 day")));
        
        $GraphicTimeLoadPage = $this->load->library('flotr2')->basic_graphic($DateGTLP['graphic'], 'time_load_page', array('title_y' => 'мс', 'title_x' => 'Кол-во'));
        $GraphicVisitedSiteToday = $this->load->library('flotr2')->basic_graphic($DataVST['graphic'], 'visited_today', array('title_y' => 'Кол-во', 'title_x' => 'Часы'));
        $GraphicVisitedSiteYesterday = $this->load->library('flotr2')->basic_graphic($DataVSY['graphic'], 'visited_-1day', array('title_y' => 'Кол-во', 'title_x' => 'Часы'));

        $content = '  <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Скорость загрузки страниц: средняя '.$DateGTLP['time_average'].' мс
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart">
                                '.$GraphicTimeLoadPage.'
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Посещение сайта. Вчера. Кол-во: '.$DataVSY['visited'].'
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart">
                               '.$GraphicVisitedSiteYesterday.'
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Посещение сайта. Сегодня. Кол-во: '.$DataVST['visited'].'
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart">
                            '.$GraphicVisitedSiteToday.'
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                
            </div>
            <!-- /.row -->';

        return $content;
    }

    private function get_time_pages($result = array()) {
        $RetrurnData = array();
        $times = array();
        $i = 1;
        $Summ = 0;
        $size = sizeof($result);
        $krt = 1;
        if ($size > 10)
            $krt = 1;
        if ($size > 100)
            $krt = 10;
        if ($size > 1000)
            $krt = 100;
        for (; $i < $size; $i++) {
            if ($i % $krt == 0)
                $times[] = $i.','.$result[$i]['elapsed_time'];
            $Summ += $result[$i]['elapsed_time'];
        }
        if(!empty($Summ) || !empty($size))
        $RetrurnData['time_average'] = round($Summ/$size, 3);
        else 
            $RetrurnData['time_average'] = 0;
        $RetrurnData['graphic'] = $times;
        return $RetrurnData;
    }

    private function visited($result = array(), $date = '') {
        $Visited = array();
        $hour = array();
        $hour = array_fill(0, 24, 0);
        if ($date == '') {
            $this->load->helper('date');
            $datestring = "%Y-%m-%d";
            $today = mdate($datestring);
        } else {
            $today = $date;
        }

        $i = 0;
        if (sizeof($result) > 0) {
            foreach ($result as $row) {

                $hour_v = substr($row['date'], 11, 2);
                if ($today == substr($row['date'], 0, 10)) {
                    if ($hour_v == 00)
                        $hour_v = 0;
                    if ($i == 0)
                        $i = $hour_v;
                    if ($i == $hour_v) {
                        $hour[$i] ++;
                    } else {
                        $i++;
                    }
                }
            }
        } else {
            $hour = array_fill(0, 24, 0);
        }

        $graphic = array();
        $i = 0;
        $AllVisited = 0;
        foreach ($hour as $visit) {
            $graphic[] = $i.','.$visit;
            $AllVisited += $visit;
            $i++;
            
        }
        $Visited['visited'] = $AllVisited;
        $Visited['graphic'] = $graphic;
        return $Visited;
    }

}
