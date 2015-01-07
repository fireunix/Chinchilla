<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Edit_page extends MX_Controller {

    function index($id = 0) {
        //Проверка на доступ
        $this->acs->check_perms('edit_page_show');
        
        $data = array();
        $data['title'] = "Редактирование страниц";

        if ($id === 0)
            $data['body'] = $this->all_pages();
        else
            $data['body'] = $this->edit_page_id($id);

        $this->load->module('engine_modules/make_page')->edit_page($data);
    }

    private function all_pages() {
        $result = $this->load->model('engine_modules/pages_model')->show();
        $table = '';
        foreach ($result as $page) {
            $table .= '<tr class="odd gradeX">
                        <td>'.$page['id'].'</td>
                        <td>'.$page['name'].'</td>
                        <td>'.$page['title'].'</td>
                   
                        <td><!-- <a href="'.base_url().'engine/edit_page/'.$page['id'].'" title="Редактировать">Редактировать</a> -->
                        <a target="_blank" href="'.base_url().$page['name'].'" title="Просмотреть"><button><i class="fa fa-eye fa-1"></i></button></a>                    
                        <a target="_blank" href="'.base_url().'engine/edit_page_inline/'.$page['name'].'" title="Редактировать"><button><i class="fa fa-pencil-square fa-1"></i></button></a>                    
                        <a href="'.base_url().'engine/delete_page/'.$page['id'].'" title="Удалить"><button><i class="fa fa-trash"></i></button></a>                    
                        <a href="'.base_url().'engine/edit_elem_page/'.$page['name'].'" title="Редактировать элементы страницы"><button><i class="fa fa-file-text"></i></button></a>                    
                        </td>
                    </tr>';
        }

        $content = '<!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Страницы вашего сайта
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Название</th>
                                            <th>Заголовок</th>
                                            <th>Действие</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       '.$table.'
                                       
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
        return $content;
    }

    private function edit_page_id($id = 0) {


        $post = $this->input->post(NULL, FALSE);
        if (is_array($post)) {
            $contents = array();
            foreach ($post as $key => $content) {
                if (is_numeric($key)) {
                    $contents[$key] = $content;
                }
            }

            $this->load->model('engine_modules/pages_model')->update_content($contents);
        }
        $id = $id + 0;
        /* проверка на корректность данных */
        if (!is_int($id))
            return 'Ошибка аргумента';
        /* проверка на существование такой страницы */
        $check = $this->load->model('engine_modules/pages_model')->check_page($id);

        if ($check === 0)
            return 'Такой страницы не существует';
        else
            return $this->make_page_components($id);
    }

    private function make_page_components($id = 0) {
        if (!is_int($id))
            return 'Ошибка аргумента';
        $page = array();
        $page = $this->load->model('engine_modules/pages_model')->show_content_page($id);
        $content = '<form method="post"><div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Содержимое страницы
                        </div>
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
'.$this->prepare_list_content($page).'
                            </div>
                        </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                    <input name="save" type="submit" value="Сохранить">                
                </form>';
        return $content;
    }

    private function prepare_list_content($page = array()) {
        $list_contents = '';
        foreach ($page as $content) {
            $list_contents .= '<div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#'.$content['name'].'" class="collapsed">'.$content['name'].'</a>
                                        </h4>
                                    </div>
                                    <div id="'.$content['name'].'" class="panel-collapse collapse" style="height: 0px;">
                                        <div class="panel-body">
                                        <script type="text/javascript" src="'.inc_ph().'js/tinymce/tinymce.min.js" style="height: 500px;"></script>
<script type="text/javascript">
tinymce.init({
    selector: "textarea",
    theme: "modern",
    language: "ru",
    height: "350px",
    plugins: [
        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen",
        "insertdatetime media nonbreaking save table contextmenu directionality",
        "emoticons template paste textcolor colorpicker textpattern"
    ],
    toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
    toolbar2: "print preview media | forecolor backcolor emoticons",
    image_advtab: true,
    templates: [
        {title: \'Test template 1\', content: \'Test 1\'},
        {title: \'Test template 2\', content: \'Test 2\'}
    ]
});
</script>
    <textarea name="'.$content['id'].'" style="width:100%">'.$content['content'].'</textarea>

                                           
                                        </div>
                                    </div>
                                </div>
                                ';
        }
        return $list_contents;
    }

    function edit_page_inline($name_page = "") {
        //Проверка на доступ
        $this->acs->check_perms('edit_page');
        $uri = array();
        $page_data = array();
        $uri = $this->load->module('validator_uri')->validate($this->uri->segment_array());
        $page_data = $this->load->module('page')->get(array('page' => $name_page), 'inline');
        $temp = array();
        foreach ($page_data as $key => $content) {
            if (is_array($content)) {
                $temp[$key] = '<div class="well well-small" style="margin: 2px;"> Модуль '.$content['name'].' <a target="_blank" href="'.base_url().'engine/moduls/settings/'.$content['name'].'">Настроить</a></div>';
            } else {
                $temp[$key] = '<div contenteditable="true" id="'.$key.'">'.$content.'</div>';
            }
        }

        $temp['other_css'] = '<script>var dump_file="'.base_url().'index.php/engine/edit_page_inline_save/'.$name_page.'";</script>'
        .'<script src="'.base_url().'dpe/include_engine/js/ckeditor/ckeditor.js"></script>';
        echo $this->load->module('site')->out($temp);
    }

    function edit_page_inline_save($name_page = "", $post = array()) {
        $resuls = $this->load->model('engine_modules/pages_model')->edit_page_save($name_page, $post);
    }

}
