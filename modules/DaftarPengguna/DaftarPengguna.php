<?php

class DaftarPengguna extends Database {

    function __construct() {
        parent::__construct();
    }

    public function data_list() {
        $params = isset($_GET) ? $_GET : $_POST;
         // print_r($params);exit();
        $instansi='';
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $params['user']=$userParams[0]['user_id'];
        $start=$params['start'];
        $limit=$params['limit'];
        // print_r($params);exit();
        $where='WHERE ';
        if($instansi==''){
            $where .= '1=1';
        }else{
            $instansi= $params['instansi'];
            $where .= " a.id_unit_kerja=$instansi";
        }
        $sql = "SELECT reff.user_id,reff.nama,reff.email,reff.username,b.unit_kerja, b.caption_kepala_unit_kerja FROM users reff
                    LEFT JOIN user_has_unit a
                    ON reff.`user_id`=a.`user_id`
                    LEFT JOIN reff_unit_kerja b
                    ON a.`id_unit_kerja`=b.`id_unit_kerja` $where";
                    // echo $sql;
        echo $this->dbDataSelectPaging($sql,$params,$start,$limit);
    }

    public function save_data() {
        $params = isset($_GET) ? $_GET : $_POST;
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $params['user']=$userParams[0]['user_id'];
        // $params=$param['data'];
        // print_r($params);exit();

        $flag=$params['flag'];
        if($flag=="ins_data"){
            $sql = "INSERT INTO reff_no_terpakai(id,nomor_surat,perihal,status,pembuat)
            VALUES ('',:nomor,:perihal,0,:user)";
            // print_r($params);exit();
            //echo $this->dbFwSelectAndReturnAll($sql,$params);
            //echo $this->debugSql($sql,$params);exit();
            if($this->dbDataExecute($sql,$params)){
                $a=array("success"=>true,"msg"=>"Data Berhasil Disimpan");
                echo json_encode($a);
            }
        }elseif($flag=="upd_data"){
            $sql = "UPDATE reff_no_terpakai SET nomor_surat=:nomor_surat, perihal=:perihal
            WHERE id=:id";
           // echo $this->debugSql($sql,$params);exit();
            echo $this->dbDataExecute($sql,$params);
        }          
        
    }

    public function delete_data(){
        $param = isset($_GET) ? $_GET : $_POST;

        $params=$param['data'];
        //print_r($params);exit();

        $flag=$params['flag'];
       if($flag=="del_data"){
            $sql = "DELETE from reff_no_terpakai WHERE id=:id";        
            if($this->dbDataExecute($sql,$params)){
                $a=array("success"=>true,"msg"=>"Data Berhasil Dihapus");
                echo json_encode($a);
            }
        }
    }
     public function PUBLIC_noList($ret = false) {
        $params = isset($_GET) ? $_GET : $_POST;
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $sql  = "SELECT * FROM reff_no_surat";
        if($ret) {
            return $this->dbDataSelectAndReturnAll($sql,null,true);
        } else {
            echo $this->dbDataSelectAndReturnAll($sql);
        }
    }    

}
