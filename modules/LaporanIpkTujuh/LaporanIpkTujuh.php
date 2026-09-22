<?php

class LaporanIpkTujuh extends Database {

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
        $sql  = "SELECT id_reff_tingkat_pendidikan, tingkat_pendidikan FROM `reff_tingkat_pendidikan`";

        $qb = new QueryBuilder($sql);
        $result = $this->dbDataSelectAndReturnAll($qb, null, true);
        
        $total = count($result);

        if ($total > 0) {
            
            $data_list = array();
            $row = 0;

            foreach($result as $obj) {

                $id_reff_tingkat_pendidikan = $obj->id_reff_tingkat_pendidikan;
         
                if($id_reff_tingkat_pendidikan !== '') {
                    $obj2 = clone $obj;
                   // print_r($obj2);exit();
                    $id_reff_tingkat_pendidikan= $obj->id_reff_tingkat_pendidikan;

                    $bulan_lalu1 = "SELECT id_reff_mekanisme_penempatan, mekanisme_penempatan FROM `reff_mekanisme_penempatan`";

                    $rs_lalul = $this->dbDataSelectAndReturnAll($bulan_lalu1,$param,true);
                  
                    $data_lalul=array();
                  

                    foreach($rs_lalul as $aa) { 
                         $data_lalul[] = $aa;
                    }
                    $obj->penempatan = $data_lalul;

                        foreach(  $obj->penempatan  as $obl) {
                                             
                             $id_reff_mekanisme_penempatan = $obl->id_reff_mekanisme_penempatan;

                             if($id_reff_mekanisme_penempatan !== '') {

                                $obl2 = clone $obl;

                                $sql_ttl = "SELECT count(*) as jml_laki FROM `reff_tingkat_pendidikan` a
                                            LEFT JOIN `lowongan_pekerjaan` b
                                            ON a.id_reff_tingkat_pendidikan=b.`id_reff_tingkat_pendidikan`
                                            WHERE a.`id_reff_tingkat_pendidikan`='$id_reff_tingkat_pendidikan' 
                                            AND b.`id_reff_mekanisme_penempatan`='$id_reff_mekanisme_penempatan' AND b.id_reff_jk ='1'";
                                // echo $this->debugSQL($sql_ttl,$param);
                                $rs_ttl = $this->dbDataSelectAndReturnAll($sql_ttl,null,true);
                                $data_ttl=array();
                                foreach($rs_ttl as $b) { 
                                     $data_ttl[] = $b;
                                }

                                $sql_ttl1 = "SELECT count(*) as jml_cew FROM `reff_tingkat_pendidikan` a
                                            LEFT JOIN `lowongan_pekerjaan` b
                                            ON a.id_reff_tingkat_pendidikan=b.`id_reff_tingkat_pendidikan`
                                            WHERE a.`id_reff_tingkat_pendidikan`='$id_reff_tingkat_pendidikan' 
                                            AND b.`id_reff_mekanisme_penempatan`='$id_reff_mekanisme_penempatan' AND b.id_reff_jk ='2'";
                                // echo $this->debugSQL($sql_ttl,$param);
                                $rs_ttl1 = $this->dbDataSelectAndReturnAll($sql_ttl1,null,true);
                                $data_ttl1=array();
                                foreach($rs_ttl1 as $b1) { 
                                     $data_ttl1[] = $b1;
                                }

                                $obl->jml_laki = $data_ttl[0]->jml_laki;
                                $obl->jml_cew = $data_ttl1[0]->jml_cew;
                                $obl->tot_jml = ($data_ttl[0]->jml_laki) + ($data_ttl1[0]->jml_cew);

                             }
                        }


                    $rows[] = $obj;
            }

              
            $data['data_surat'] = $rows;



        }

        if ($return) {
                return $data;
            } else {
                echo '{"success" : true, "msg":"Berhasil mengambil data", "total":' . $total . ', "result":' . json_encode($result) . '}';
            }
        }
   
    }

   

}
