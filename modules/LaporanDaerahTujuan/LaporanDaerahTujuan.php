<?php

class LaporanDaerahTujuan extends Database {

    function __construct() {
        parent::__construct();
    }

    public function PUBLIC_list($return = false) {
     $param = isset($_GET) ? $_GET : $_POST;
        // print_r($param);exit();
        // $id_pemeriksaan=$param['id_pemeriksaan'];
        // $params=$param['data'];
        // $IdSurat=$param['id_surat_tugas'];
        $userParams = $this->getUserParams();

        $userParams = json_decode($userParams, true);
        $tahun =  $userParams[0]['param01'];
        $sql  = "SELECT id_reff_provinsi, provinsi FROM reff_provinsi WHERE `id_reff_mekanisme_penempatan` = '1' OR `id_reff_mekanisme_penempatan`='2' ";

        $qb = new QueryBuilder($sql);
        $result = $this->dbDataSelectAndReturnAll($qb, null, true);
        
        $total = count($result);

        if ($total > 0) {
            
            $data_list = array();
            $row = 0;

            foreach($result as $obj) {

                $id_reff_provinsi = $obj->id_reff_provinsi;
         
                if($id_reff_provinsi !== '') {
                    $obj2 = clone $obj;
                   // print_r($obj2);exit();
                   /* $id_reff_provinsi= $obj->id_reff_provinsi;

                    $bulan_lalu1 = "SELECT kode_bulan AS bulan FROM reff_bulan GROUP BY bulan";

                    $rs_lalul = $this->dbDataSelectAndReturnAll($bulan_lalu1,$param,true);
                  
                    $data_lalul=array();

                    foreach($rs_lalul as $aa) { 
                         $data_lalul[] = $aa;
                    }
                    
                    $obj->bulan = $data_lalul;*/

                    $arr = array(1,2,3,4,5,6,7,8,9,10,11,12);
                    $data_ttl=array();
                    $object = (object) $arr;
                        foreach($object  as $obl) {
                                             
                             $bulan = $obl;

                             if($bulan !== '') {

                                // $obl2 = clone $obl;

                                $sql_ttl = "SELECT COUNT(*) as jml_laki FROM lowongan_pekerjaan 
                                            WHERE id_reff_provinsi ='$id_reff_provinsi' AND MONTH(`tgl_pendaftaran`)='$bulan' AND id_reff_jk='1'";
                                // echo $this->debugSQL($sql_ttl,$param);
                                $rs_ttl = $this->dbDataSelectAndReturnAll($sql_ttl,null,true);
                                // $data_ttl=array();
                                foreach($rs_ttl as $b) {  
                                     $data_ttl[] = $b;
                                }
                             }
                        }

                    $obj->bulan = $data_ttl;
                    $rows[] = $obj;
            }
           
            $data['data_surat'] = $rows;
            // print_r($data);exit();
        }

        if ($return) {
                return $data;
            } else {
                echo '{"success" : true, "msg":"Berhasil mengambil data", "total":' . $total . ', "result":' . json_encode($result) . '}';
            }
        }
   
    }

   

}
