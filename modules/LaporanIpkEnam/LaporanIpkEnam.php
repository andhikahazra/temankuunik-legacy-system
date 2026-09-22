<?php

class LaporanIpkEnam extends Database {

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
        $sql  = "SELECT `id_reff_lapangan_usaha`, `kode`, `lapangan_usaha`
                 FROM `reff_lapangan_usaha`";

        $qb = new QueryBuilder($sql);
        $result = $this->dbDataSelectAndReturnAll($qb, null, true);
        
        $total = count($result);

        if ($total > 0) {
            
            $data_list = array();
            $row = 0;

            foreach($result as $obj) {

                $id_reff_lapangan_usaha = $obj->id_reff_lapangan_usaha;
         
                if($id_reff_lapangan_usaha !== '') {
                    $obj2 = clone $obj;
                   // print_r($obj2);exit();
                    $id_reff_lapangan_usaha= $obj->id_reff_lapangan_usaha;

                    $bulan_lalu1 = "SELECT COUNT(*) as bulan_lalu1
                                    FROM reff_lapangan_usaha a
                                    LEFT JOIN identitas_pemberi_kerja b
                                    ON a.id_reff_lapangan_usaha=b.id_reff_lapangan_usaha
                                    LEFT JOIN lowongan_pekerjaan c
                                    ON b.id_identitas_pemberikerja=c.id_identitas_pemberikerja
                                    WHERE a.`id_reff_lapangan_usaha`='$id_reff_lapangan_usaha' 
                                    AND c.`id_reff_jk`='1' AND MONTH(c.tgl_pendaftaran) < MONTH(CURRENT_DATE())";

                    $rs_lalul = $this->dbDataSelectAndReturnAll($bulan_lalu1,$param,true);
                  
                    $data_lalul=array();
                  

                    foreach($rs_lalul as $aa) { 
                         $data_lalul[] = $aa;
                    }
                    $obj->laki_bln_lalu = $data_lalul[0]->bulan_lalu1;

                  

                    $sql = "SELECT a.id_reff_nama_usaha,a.kode, a.nama_usaha
                            FROM `reff_nama_usaha` a
                            WHERE a.id_reff_lapangan_usaha ='$id_reff_lapangan_usaha'";


                   // echo $this->debugSql($sql,$param);
                    // echo "<br><br>";
                    $rs_usaha = $this->dbDataSelectAndReturnAll($sql,$param,true);
                    // print_r($rs_temuan);exit();
                    
                    $data_usaha=array();

                    foreach($rs_usaha as $ush) { 

                         $data_usaha[] = $ush;
                    }

                    $obj->namausaha = $data_usaha;

                    foreach($obj->namausaha   as $obk) {

                      $id_reff_nama_usaha = $obk->id_reff_nama_usaha;

                           if($id_reff_nama_usaha !== '') {

                              $obk2 = clone $obk;

                             $sql_ushblnlalu1 ="SELECT COUNT(*) AS ush_bln_lalu1
                                                FROM reff_nama_usaha a
                                                LEFT JOIN identitas_pemberi_kerja b
                                                ON a.id_reff_nama_usaha=b.id_reff_nama_usaha
                                                LEFT JOIN lowongan_pekerjaan c
                                                ON b.id_identitas_pemberikerja=c.id_identitas_pemberikerja
                                                WHERE a.`id_reff_nama_usaha`='$id_reff_nama_usaha' 
                                                AND c.`id_reff_jk`='1' AND MONTH(c.tgl_pendaftaran) < MONTH(CURRENT_DATE())";
                    

                              // echo $this->debugSQL($sql_ttl,$param);
                              $rs_ushblnlalu1 = $this->dbDataSelectAndReturnAll($sql_ushblnlalu1,null,true);
                             
                              $data_ushblnlalu1=array();
                            
                              foreach($rs_ushblnlalu1 as $bb) { 
                                   $data_ushblnlalu1[] = $bb;
                              }
                              $obk->laki_ush_bln_lalu = $data_ushblnlalu1[0]->ush_bln_lalu1;


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
