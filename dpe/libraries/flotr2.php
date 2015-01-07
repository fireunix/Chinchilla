<?php

class Flotr2 {

    function __construct() {
        $this->CI = & get_instance();
        $this->CI->load->helper('string');
    }

    /* Формат координат должен посылаться через запятую в каждом элементе массива */
    /* $graphic = array('0,3','4,8','8,5') */
    /* id класса должно совпадать с id класса в шаблоне */

    function basic_graphic($graphic = array(), $id_div = '', $params = array('title_y' => '', 'title_x' => '')) {
        $line = '[';
        $name_var = random_string('alpha', 4);
        if (empty($id_div))
            $id_div = random_string('alpha', 4);
        $i = 1;

        foreach ($graphic as $point) {
            $line .= '['.$point.']';
            if ($i < count($graphic))
                $line .= ',';

            $i++;
        }
        $line .= ']';
        $body = '';
        $body .= '<div class="flot-chart" id="'.$id_div.'" style="position: absolute; left: 0px; top: 0px; width: 95%;"></div>
                <script type="text/javascript">
                (function basic(container) {
                    var
                      '.$name_var.' = '.$line.', // First data series
                       graph;

                    // Draw Graph
                    graph = Flotr.draw(container, ['.$name_var.'], {
                        yaxis : {

                        title : \''.$params['title_y'].'\',
                              min : 0
                            },
                      xaxis: {
                       title : \''.$params['title_x'].'\',
                        minorTickFreq: 4
                      }, 
                      grid: {
                        minorVerticalLines: true
                      }
                    });
                  })(document.getElementById("'.$id_div.'"));
                </script>';
        return $body;
    }

    /*
     *  Стандартный бар
     *  
     * 
     */

    function basic_bars($graphics = array(array("2,4"), array("5,4")), $id_div = '') {
        $div = '<div class="flot-chart" id="'.$id_div.'" style="position: absolute; left: 0px; top: 0px; width: 95%;"></div>';
        $graphics = array(array("5,4"));
        $var = ''; //Переменные
        $val = ''; //Значение переменных
        $var_draw = ''; // Представление для рисования
        foreach ($graphics as $graphic) {
            $name_var = random_string('alpha', 4);
            $val = '[';
            foreach ($graphic as $col) {
                $val .= $col;
            }
            $val .= ']';

            $var .= $val.', ';
            $var_draw .= $name_var.'';
        }
     



        $js = '<script type="text/javascript"> 
               (function basic_bars(container, horizontal) {

  var
    horizontal = (horizontal ? true : false), // Show horizontal bars
   '.$var_draw.' = [],
    point,                                    // Data point variable declaration
    i;
    
     '.$var_draw.'.push('.$val.');

              
  // Draw the graph
  Flotr.draw(
    container,
    ['.$var_draw.'],
    {
      bars : {
        show : true,
        horizontal : horizontal,
        shadowSize : 0,
        barWidth : 0.01
      },
      mouse : {
        track : true,
        relative : true
      },
      yaxis : {
        min : 0,
        autoscaleMargin : 1
      }
    }
  );
})(document.getElementById("'.$id_div.'"));
        </script>';
        return $div.$js;
    }

}
