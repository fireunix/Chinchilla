<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/*
 * Erbauer - Строитель, архитектор базы данных. Upgrade\downgrade backup\recover
 * version: 0.1 alfa
 */

class Erbauer {

    function __construct() {
        $this->ER = & get_instance();
    }

    function index() {
        
    }

    function ActiveVersion() {
        $TablesNow = $this->ER->db->list_tables();
        $NowImage = array();
        $NowImage['tables'] = $TablesNow;
        foreach ($TablesNow as $Table) {
            $NowImage[$Table] = $this->ER->db->list_fields($Table);
        }
        $ImageDB = $this->ImageDB('HEAD');
        $this->DiffVersion($NowImage, $ImageDB);
    }

    private function ImageDB($version) {
        $ImageTables['HEAD']['tables'] = array('dpe_configs', 'dpe_engine_groups', 'dpe_engine_perms',
            'dpe_engine_users', 'dpe_sessions', 'dpe_site_contents',
            'dpe_site_menu', 'dpe_site_modules', 'dpe_site_pages',
            'dpe_visited');
        $ImageTables['HEAD']['dpe_configs'] = array('id', 'name', 'configure');
        $ImageTables['HEAD']['dpe_engine_groups'] = array('id', 'name', 'about');
        $ImageTables['HEAD']['dpe_engine_perms'] = array('id', 'name', 'func', 'geg');
        $ImageTables['HEAD']['dpe_engine_users'] = array('id', 'login', 'password', 'email', 'ip', 'group_id', 'session', 'fail_enter');
        $ImageTables['HEAD']['dpe_sessions'] = array('session_id', 'ip_address', 'user_agent', 'last_activity', 'user_data');
        $ImageTables['HEAD']['dpe_site_contents'] = array('id', 'content', 'level', 'delete', 'type');
        $ImageTables['HEAD']['dpe_site_menu'] = array('id', 'page', 'anchor', 'title', 'hidden', 'position');
        $ImageTables['HEAD']['dpe_site_modules'] = array('id', 'name', 'group', '1enable', 'version', 'settings', 'author', 'about');
        $ImageTables['HEAD']['dpe_site_pages'] = array('id', 'name', 'title', 'meta', 'composition', 'moduls');
        $ImageTables['HEAD']['dpe_visited'] = array('id', 'date', 'browser', 'ip', 'url', 'elapsed_time');
        return $ImageTables[$version];
    }

    private function DiffVersion($ImageNow = array(), $ImageVersion = array()) {
    //    var_dump(array_intersect($ImageNow, $ImageVersion));
    }

}
