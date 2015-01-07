<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/*
 *  Хелпер сообщений
 *  Входные аргументы:
 *  $style = default | primary | success | info | warning | danger | green | yellow | red
 *  $title = текст
 *  $message = текст
 */
function show ($style = 'default', $title = 'title', $message = 'message') {
    $body_message = '<div class="row"><div class="col-lg-12">
                    <div class="panel panel-'.$style.'">
                        <div class="panel-heading">
                            '.$title.'
                        </div>
                        <div class="panel-body">
                            <p>'.$message.'</p>
                        </div>
                    </div>
                    <!-- /.col-lg-4 -->
                </div></div>';
    return $body_message;
}