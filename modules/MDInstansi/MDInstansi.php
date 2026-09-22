<?php

class MDInstansi extends Database {

    function __construct() {
        parent::__construct();
    }

    public function data_list() {
        $params = isset($_GET) ? $_GET : $_POST;
        $start=$params['start'];
        $limit=$params['limit'];
        // print_r($params);exit();
        $sql = 'SELECT * FROM reff_unit_kerja where level_unit_kerja=1 order by kode_unit_kerja ASC';
        // echo $this->dbDataSelectPaging($sql,$params,$start,$limit);
        echo $this->dbFwSelectAndReturnAll($sql,$params);
    }

    public function save_data() {
        $params = isset($_GET) ? $_GET : $_POST;

        // $params=$param['data'];
        // print_r($params);exit();

        $flag=$params['flag'];
        if($flag=="1"){
            $sql = "INSERT INTO reff_unit_kerja(id_unit_kerja, unit_kerja, nama_unit_kerja_lengkap,nama_kepala,level_unit_kerja, kode_unit_kerja, kode_unit_kerja_parent,nama_unit_kerja_pendek)
            VALUES ('',:unit_kerja,:nama_unit_kerja_lengkap,:nama_kepala,1,:kode_unit_kerja,:kode_unit_kerja_parent,:nama_unit_kerja_pendek)";
            // print_r($params);exit();
            //echo $this->dbFwSelectAndReturnAll($sql,$params);
            //echo $this->debugSql($sql,$params);exit();
            if($this->dbDataExecute($sql,$params)){
                $a=array("success"=>true,"msg"=>"Data Berhasil Disimpan");
                echo json_encode($a);
            }
        }elseif($flag=="0"){
            $sql = "UPDATE reff_unit_kerja SET unit_kerja=:unit_kerja, nama_unit_kerja_lengkap=:nama_unit_kerja_lengkap, nama_kepala=:nama_kepala, kode_unit_kerja=:kode_unit_kerja, kode_unit_kerja_parent=:kode_unit_kerja_parent,nama_unit_kerja_pendek=:nama_unit_kerja_pendek
            WHERE id_unit_kerja=:id_unit_kerja";
           // echo $this->debugSql($sql,$params);exit();
            echo $this->dbDataExecute($sql,$params);
        }          
        
    }

    public function delete_data(){
        $param = isset($_GET) ? $_GET : $_POST;

        $params=$param['data'];
        //print_r($params);exit();

        // $flag=$params['flag'];
       // if($flag=="del_data"){
            $sql = "DELETE from reff_unit_kerja WHERE id_unit_kerja=:id_unit_kerja";        
            if($this->dbDataExecute($sql,$params)){
                $a=array("success"=>true,"msg"=>"Data Berhasil Dihapus");
                echo json_encode($a);
            }
        // }
    }   

}
