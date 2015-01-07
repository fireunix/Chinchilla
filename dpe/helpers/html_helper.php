<?php

/*
 * Хелпер таблицы html bootstrap 
 * IN   $titles = array('1','2','3','4');
 *      $body = array(array('1','2','3','4'),array('1','2','3','4'));
 */

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

function table($titles = array(), $body = array()) {
    $str_col = '';
    foreach ($body as $str) {
        $str_col .= '<tr>';
        foreach ($str as $col) {
            $str_col .= '<td>'.$col.'</td>';
        }
        $str_col .= '</tr>';
    }
    $table = '<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                       <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>';
    foreach ($titles as $title) {
        $table .= '<th>'.$title.'</th>';
    }
    $table .='</tr>
                                    </thead>
                                    <tbody>
                                       '.$str_col.'
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
    return $table;
}
