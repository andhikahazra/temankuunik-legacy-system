<?php

class LaporanIpkEmpat extends Database {

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
        $sql  = "SELECT id_reff_jurusan_pendidikan, kode, jurusan_pendidikan FROM `reff_jurusan_pendidikan`";

        $qb = new QueryBuilder($sql);
        $result = $this->dbDataSelectAndReturnAll($qb, null, true);
        
        $total = count($result);

        if ($total > 0) {
            
            $data_list = array();
            $row = 0;

            foreach($result as $obj) {

                $id_reff_jurusan_pendidikan = $obj->id_reff_jurusan_pendidikan;
         
                if($id_reff_jurusan_pendidikan !== '') {
                    $obj2 = clone $obj;
                   // print_r($obj2);exit();
                    $id_reff_jurusan_pendidikan= $obj->id_reff_jurusan_pendidikan;

                    $bulan_lalu1 = "SELECT COUNT(*) as bulan_lalu1 FROM lowongan_pekerjaan a
                                    JOIN identitas_pemberi_kerja b
                                    ON a.`id_identitas_pemberikerja`=b.`id_identitas_pemberikerja`
                                    WHERE a.`id_reff_jurusan_pendidikan` = '$id_reff_jurusan_pendidikan' AND a.`id_reff_jk`='1' AND
                                    MONTH(tgl_pendaftaran) < MONTH(CURRENT_DATE())";


                   // echo $this->debugSql($sql,$param);
                    // echo "<br><br>";
                    $rs_lalul = $this->dbDataSelectAndReturnAll($bulan_lalu1,$param,true);
                    // print_r($rs_temuan);exit();
                    
                    $data_lalul=array();

                    foreach($rs_lalul as $aa) { 
                         $data_lalul[] = $aa;
                    }

                  

                    $obj->laki_bln_lalu = $data_lalul[0]->bulan_lalu1;


                    $sql = "SELECT a.id_reff_nama_jurusan,a.kode, a.nama_jurusan
                            FROM reff_nama_jurusan a
                            WHERE a.id_reff_jurusan_pendidikan ='$id_reff_jurusan_pendidikan'";


                   // echo $this->debugSql($sql,$param);
                    // echo "<br><br>";
                    $rs_jurusan = $this->dbDataSelectAndReturnAll($sql,$param,true);
                    // print_r($rs_temuan);exit();
                    
                    $data_jurusan=array();

                    foreach($rs_jurusan as $jr) { 

                         $data_jurusan[] = $jr;
                    }

                    $obj->namajurusan = $data_jurusan;

                    foreach($obj->namajurusan   as $obk) {

                      $id_reff_nama_jurusan = $obk->id_reff_nama_jurusan;

                           if($id_reff_nama_jurusan !== '') {

                              $obk2 = clone $obk;

                              $sql_jurblnlalu1 ="SELECT COUNT(*) AS jur_bln_lalu1 FROM lowongan_pekerjaan a
                                                 JOIN identitas_pemberi_kerja b
                                                 ON a.`id_identitas_pemberikerja`=b.`id_identitas_pemberikerja`
                                                 WHERE id_reff_nama_jurusan ='$id_reff_nama_jurusan'
                                                 AND a.`id_reff_jk`='1'
                                                 AND MONTH(a.tgl_pendaftaran) < MONTH(CURRENT_DATE())";


                              // echo $this->debugSQL($sql_ttl,$param);
                              $rs_jurblnlalu1 = $this->dbDataSelectAndReturnAll($sql_jurblnlalu1,null,true);
                              // print_r($rs_ttl);

                              $data_jurblnlalu1=array();

                              foreach($rs_jurblnlalu1 as $bb) { 
                                   $data_jurblnlalu1[] = $bb;
                              }

                              $obk->laki_jur_bln_lalu = $data_jurblnlalu1[0]->jur_bln_lalu1;

                           
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
