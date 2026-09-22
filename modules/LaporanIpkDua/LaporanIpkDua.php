<?php

class LaporanIpkDua extends Database {

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

                    $bulan_lalu1 = "SELECT COUNT(*) AS bulan_lalu1
                            FROM reff_jurusan_pendidikan a
                            LEFT JOIN `pencari_kerja_pendidikan` b
                            ON a.`id_reff_jurusan_pendidikan`=b.`id_reff_jurusan_pendidikan`
                            LEFT JOIN pencari_kerja c
                            ON b.id_pencari_kerja= c.`id_pencari_kerja`
                            WHERE a.`id_reff_jurusan_pendidikan`='$id_reff_jurusan_pendidikan' AND c.`jenis_kelamin`='1' AND MONTH(tanggal_daftar) < MONTH(CURRENT_DATE())";

                     $bulan_lalu2 = "SELECT COUNT(*) AS bulan_lalu2
                            FROM reff_jurusan_pendidikan a
                            LEFT JOIN `pencari_kerja_pendidikan` b
                            ON a.`id_reff_jurusan_pendidikan`=b.`id_reff_jurusan_pendidikan`
                            LEFT JOIN pencari_kerja c
                            ON b.id_pencari_kerja= c.`id_pencari_kerja`
                            WHERE a.`id_reff_jurusan_pendidikan`='$id_reff_jurusan_pendidikan' AND c.`jenis_kelamin`='2' AND MONTH(tanggal_daftar)< MONTH(CURRENT_DATE())";


                    $bulan_ini1 = "SELECT COUNT(*) AS bulan_ini1
                            FROM reff_jurusan_pendidikan a
                            LEFT JOIN `pencari_kerja_pendidikan` b
                            ON a.`id_reff_jurusan_pendidikan`=b.`id_reff_jurusan_pendidikan`
                            LEFT JOIN pencari_kerja c
                            ON b.id_pencari_kerja= c.`id_pencari_kerja`
                            WHERE a.`id_reff_jurusan_pendidikan`='$id_reff_jurusan_pendidikan' AND c.`jenis_kelamin`='1' AND MONTH(tanggal_daftar) = MONTH(CURRENT_DATE())";

                     $bulan_ini2 = "SELECT COUNT(*) AS bulan_ini2
                            FROM reff_jurusan_pendidikan a
                            LEFT JOIN `pencari_kerja_pendidikan` b
                            ON a.`id_reff_jurusan_pendidikan`=b.`id_reff_jurusan_pendidikan`
                            LEFT JOIN pencari_kerja c
                            ON b.id_pencari_kerja= c.`id_pencari_kerja`
                            WHERE a.`id_reff_jurusan_pendidikan`='$id_reff_jurusan_pendidikan' AND c.`jenis_kelamin`='2' AND MONTH(tanggal_daftar)=MONTH(CURRENT_DATE())";

                   // echo $this->debugSql($sql,$param);
                    // echo "<br><br>";
                    $rs_lalul = $this->dbDataSelectAndReturnAll($bulan_lalu1,$param,true);
                    $rs_lalu2 = $this->dbDataSelectAndReturnAll($bulan_lalu2,$param,true);
                    $rs_inil = $this->dbDataSelectAndReturnAll($bulan_ini1,$param,true);
                    $rs_ini2 = $this->dbDataSelectAndReturnAll($bulan_ini2,$param,true);
                    // print_r($rs_temuan);exit();
                    
                    $data_lalul=array();
                     $data_lalu2=array();
                     $data_inil=array();
                     $data_ini2=array();

                    foreach($rs_lalul as $aa) { 
                         $data_lalul[] = $aa;
                    }

                     foreach($rs_lalu2 as $ab) { 
                         $data_lalu2[] = $ab;
                    }

                    foreach($rs_inil as $ac) { 
                         $data_inil[] = $ac;
                    }

                    foreach($rs_ini2 as $ad) { 
                         $data_ini2[] = $ad;
                    }

                    $obj->laki_bln_lalu = $data_lalul[0]->bulan_lalu1;
                    $obj->cew_bln_lalu = $data_lalu2[0]->bulan_lalu2;
                    $obj->laki_bln_ini = $data_inil[0]->bulan_ini1;
                    $obj->cew_bln_ini = $data_ini2[0]->bulan_ini2;

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

                              $sql_jurblnlalu1 = "SELECT COUNT(*) AS jur_bln_lalu1 FROM reff_nama_jurusan a
                                                    LEFT JOIN pencari_kerja_pendidikan b
                                                    ON a.id_reff_nama_jurusan=b.id_reff_nama_jurusan
                                                    LEFT JOIN pencari_kerja c
                                                    ON b.id_pencari_kerja= c.`id_pencari_kerja`
                                                    WHERE  a.id_reff_nama_jurusan ='$id_reff_nama_jurusan' 
                                                          AND c.`jenis_kelamin`='1' 
                                                          AND MONTH(c.tanggal_daftar) < MONTH(CURRENT_DATE())";

                              $sql_jurblnlalu2 = "SELECT COUNT(*) AS jur_bln_lalu2 FROM reff_nama_jurusan a
                                                    LEFT JOIN pencari_kerja_pendidikan b
                                                    ON a.id_reff_nama_jurusan=b.id_reff_nama_jurusan
                                                    LEFT JOIN pencari_kerja c
                                                    ON b.id_pencari_kerja= c.`id_pencari_kerja`
                                                    WHERE  a.id_reff_nama_jurusan ='$id_reff_nama_jurusan' 
                                                    AND c.`jenis_kelamin`='2' 
                                                    AND MONTH(c.tanggal_daftar) < MONTH(CURRENT_DATE())";

                              $sql_jurblnini1 = "SELECT COUNT(*) AS jur_bln_ini1 FROM reff_nama_jurusan a
                                                    LEFT JOIN pencari_kerja_pendidikan b
                                                    ON a.id_reff_nama_jurusan=b.id_reff_nama_jurusan
                                                    LEFT JOIN pencari_kerja c
                                                    ON b.id_pencari_kerja= c.`id_pencari_kerja`
                                                    WHERE  a.id_reff_nama_jurusan ='$id_reff_nama_jurusan' 
                                                          AND c.`jenis_kelamin`='1' 
                                                          AND MONTH(c.tanggal_daftar) = MONTH(CURRENT_DATE())";

                              $sql_jurblnini2 = "SELECT COUNT(*) AS jur_bln_ini2 FROM reff_nama_jurusan a
                                                    LEFT JOIN pencari_kerja_pendidikan b
                                                    ON a.id_reff_nama_jurusan=b.id_reff_nama_jurusan
                                                    LEFT JOIN pencari_kerja c
                                                    ON b.id_pencari_kerja= c.`id_pencari_kerja`
                                                    WHERE  a.id_reff_nama_jurusan ='$id_reff_nama_jurusan' 
                                                    AND c.`jenis_kelamin`='2' 
                                                    AND MONTH(c.tanggal_daftar) = MONTH(CURRENT_DATE())";

                              // echo $this->debugSQL($sql_ttl,$param);
                              $rs_jurblnlalu1 = $this->dbDataSelectAndReturnAll($sql_jurblnlalu1,null,true);
                              $rs_jurblnlalu2 = $this->dbDataSelectAndReturnAll($sql_jurblnlalu2,null,true);
                              $rs_jurblnini1 = $this->dbDataSelectAndReturnAll($sql_jurblnini1,null,true);
                              $rs_jurblnini2 = $this->dbDataSelectAndReturnAll($sql_jurblnini2,null,true);
                              // print_r($rs_ttl);

                              $data_jurblnlalu1=array();
                              $data_jurblnlalu2=array();
                              $data_jurblnini1=array();
                              $data_jurblnini2=array();

                              foreach($rs_jurblnlalu1 as $bb) { 

                                   $data_jurblnlalu1[] = $bb;
                              }

                              $obk->laki_jur_bln_lalu = $data_jurblnlalu1[0]->jur_bln_lalu1;

                              foreach($rs_jurblnlalu2 as $bc) { 

                                   $data_jurblnlalu2[] = $bc;
                              }

                              $obk->cew_jur_bln_lalu = $data_jurblnlalu2[0]->jur_bln_lalu2;


                              foreach($rs_jurblnini1 as $bd) { 

                                   $data_jurblnini1[] = $bd;
                              }

                              $obk->laki_jur_bln_ini = $data_jurblnini1[0]->jur_bln_ini1;

                              foreach($rs_jurblnini2 as $be) { 

                                   $data_jurblnini2[] = $be;
                              }

                              $obk->cew_jur_bln_ini = $data_jurblnini2[0]->jur_bln_ini2;

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
