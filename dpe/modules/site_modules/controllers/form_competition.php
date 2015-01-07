<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

Class Form_Competition extends MX_Controller {

    function run() {

        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = 'mp3|doc|docx';
        $config['max_size'] = '10240';
        $config['encrypt_name'] = TRUE;


        $this->load->library('upload', $config);


        if (!$this->upload->do_upload('portfolio')) {
            $error = array('error' => $this->upload->display_errors());
            $content = $this->load->view('site_modules/FormMp3View_form', $error, TRUE);
        } else {
            $data = array('upload_data' => $this->upload->data());
            $NameMp3 = $data['upload_data']['file_name'];
            $content = $this->load->view('site_modules/FormMp3View_success', $data, TRUE);
        }

        if (!$this->upload->do_upload('mp3')) {
            $error = array('error' => $this->upload->display_errors());
            $content = $this->load->view('site_modules/FormMp3View_form', $error, TRUE);
        } else {
            $data = array('upload_data' => $this->upload->data());
            $NamePortf = $data['upload_data']['file_name'];
            $content = $this->load->view('site_modules/FormMp3View_success', $data, TRUE);
            $this->AddDataBase($NameMp3, $NamePortf);
        }

        return $content;
		
    }

    function settings() {
        $AllRecord = $this->db->get('dpe_module_Form');
        $AllRecord = $AllRecord->result_array();
        $table = '';
        foreach ($AllRecord as $info) {
            $table .= '<tr class="odd gradeX">
                        <td>'.$info['id'].'</td>
                        <td><a href="'.base_url().'uploads/'.$info['mp3'].'" target="_blank">'.$info['mp3'].'</a></td>
                        <td><a href="'.base_url().'uploads/'.$info['portfolio'].'" target="_blank">'.$info['portfolio'].'</a></td>
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
                                            <th>Аудио Файл</th>
                                            <th>Заявка</th>
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

    private function AddDataBase($NameMp3 = '', $NamePortf = '') {
        if (empty($NameMp3) || empty($NamePortf))
            return 0;

        $data = array(
            'mp3' => $NameMp3,
            'portfolio' => $NamePortf,
        );

        $this->db->insert('dpe_module_Form', $data);
    }

    public function install() {
        if (!$this->db->table_exists('dpe_module_Form')) {
            $this->load->dbforge();


            $fields = array(
                'id' => array(
                    'type' => 'INT',
                    'constraint' => 5,
                    'unsigned' => TRUE,
                    'auto_increment' => TRUE
                ),
                'mp3' => array(
                    'type' => 'VARCHAR',
                    'constraint' => '256',
                ),
                'portfolio' => array(
                    'type' => 'VARCHAR',
                    'constraint' => '256',
                ),
            );
            $this->dbforge->add_key('id', TRUE);
            $this->dbforge->add_field($fields);
            $this->dbforge->create_table('dpe_module_Form');

            $data = array(
                'name' => 'form_competition',
                'enable' => '1',
                'version' => '1',
                'settings' => '[]',
                'group' => '[]',
                'author' => 'Хемуль',
                'about' => 'Модуль для загрузки и использования контента, загруженного на сайте',
            );
            $this->db->insert($this->config->item('site_modules'), $data);
        }
        return TRUE;
    }

}
