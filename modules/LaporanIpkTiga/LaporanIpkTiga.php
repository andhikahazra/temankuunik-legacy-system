<?php

class LaporanIpkTiga extends Database {

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
        $sql  = "SELECT id_reff_jabatan_kerja, kode, jabatan_kerja FROM `reff_jabatan_kerja`";

        $qb = new QueryBuilder($sql);
        $result = $this->dbDataSelectAndReturnAll($qb, null, true);
        
        $total = count($result);

        if ($total > 0) {
            
            $data_list = array();
            $row = 0;

            foreach($result as $obj) {

                $id_reff_jabatan_kerja = $obj->id_reff_jabatan_kerja;
         
                if($id_reff_jabatan_kerja !== '') {
                    $obj2 = clone $obj;
                   // print_r($obj2);exit();
                    $id_reff_jabatan_kerja= $obj->id_reff_jabatan_kerja;

                    $bulan_lalu1 = "SELECT COUNT(*) as bulan_lalu1
                                    FROM pencari_kerja a
                                    LEFT JOIN reff_jabatan_kerja b
                                    ON a.id_reff_jabatan_kerja=b.id_reff_jabatan_kerja
                                    WHERE a.`id_reff_jabatan_kerja`='$id_reff_jabatan_kerja' AND a.`jenis_kelamin`='1' AND MONTH(a.tanggal_daftar) < MONTH(CURRENT_DATE())";

                    $bulan_lalu2 = "SELECT COUNT(*) as bulan_lalu2
                                    FROM pencari_kerja a
                                    LEFT JOIN reff_jabatan_kerja b
                                    ON a.id_reff_jabatan_kerja=b.id_reff_jabatan_kerja
                                    WHERE a.`id_reff_jabatan_kerja`='$id_reff_jabatan_kerja' AND a.`jenis_kelamin`='2' AND MONTH(a.tanggal_daftar) < MONTH(CURRENT_DATE())";

                    $bulan_ini1 = "SELECT COUNT(*) as bulan_ini1
                                    FROM pencari_kerja a
                                    LEFT JOIN reff_jabatan_kerja b
                                    ON a.id_reff_jabatan_kerja=b.id_reff_jabatan_kerja
                                    WHERE a.`id_reff_jabatan_kerja`='$id_reff_jabatan_kerja' AND a.`jenis_kelamin`='1' AND MONTH(a.tanggal_daftar) = MONTH(CURRENT_DATE())";

                    $bulan_ini2 = "SELECT COUNT(*) as bulan_ini2
                                    FROM pencari_kerja a
                                    LEFT JOIN reff_jabatan_kerja b
                                    ON a.id_reff_jabatan_kerja=b.id_reff_jabatan_kerja
                                    WHERE a.`id_reff_jabatan_kerja`='$id_reff_jabatan_kerja' AND a.`jenis_kelamin`='2' AND MONTH(a.tanggal_daftar) = MONTH(CURRENT_DATE())";

                    $rs_lalul = $this->dbDataSelectAndReturnAll($bulan_lalu1,$param,true);
                    $rs_lalu2 = $this->dbDataSelectAndReturnAll($bulan_lalu2,$param,true);
                    $rs_ini1 = $this->dbDataSelectAndReturnAll($bulan_ini1,$param,true);
                    $rs_ini2 = $this->dbDataSelectAndReturnAll($bulan_ini2,$param,true);

                    $data_lalul=array();
                    $data_lalu2=array();
                    $data_ini1=array();
                    $data_ini2=array();

                    foreach($rs_lalul as $aa) { 
                         $data_lalul[] = $aa;
                    }
                    $obj->laki_bln_lalu = $data_lalul[0]->bulan_lalu1;

                    foreach($rs_lalu2 as $ab) { 
                         $data_lalu2[] = $ab;
                    }
                    $obj->cew_bln_lalu = $data_lalu2[0]->bulan_lalu2;

                    foreach($rs_ini1 as $ac) { 
                         $data_ini1[] = $ac;
                    }
                    $obj->laki_bln_ini = $data_ini1[0]->bulan_ini1;

                    foreach($rs_ini2 as $ad) { 
                         $data_ini2[] = $ad;
                    }
                    $obj->cew_bln_ini = $data_ini2[0]->bulan_ini2;

                    $sql = "SELECT a.id_reff_nama_jabatan,a.kode, a.nama_jabatan
                            FROM reff_nama_jabatan a
                            WHERE a.id_reff_jabatan_kerja ='$id_reff_jabatan_kerja'";


                   // echo $this->debugSql($sql,$param);
                    // echo "<br><br>";
                    $rs_jabatan = $this->dbDataSelectAndReturnAll($sql,$param,true);
                    // print_r($rs_temuan);exit();
                    
                    $data_jabatan=array();

                    foreach($rs_jabatan as $jb) { 

                         $data_jabatan[] = $jb;
                    }

                    $obj->namajabatan = $data_jabatan;

                    foreach($obj->namajabatan   as $obk) {

                      $id_reff_nama_jabatan = $obk->id_reff_nama_jabatan;

                           if($id_reff_nama_jabatan !== '') {

                              $obk2 = clone $obk;

                             $sql_jbtblnlalu1 ="SELECT COUNT(*) as jbt_bln_lalu1
                                                FROM pencari_kerja a
                                                LEFT JOIN reff_nama_jabatan b
                                                ON a.id_reff_nama_jabatan=b.id_reff_nama_jabatan
                                                WHERE a.`id_reff_nama_jabatan`='$id_reff_nama_jabatan' AND a.`jenis_kelamin`='1' AND MONTH(a.tanggal_daftar) < MONTH(CURRENT_DATE())";
                             $sql_jbtblnlalu2 ="SELECT COUNT(*) as jbt_bln_lalu2
                                                FROM pencari_kerja a
                                                LEFT JOIN reff_nama_jabatan b
                                                ON a.id_reff_nama_jabatan=b.id_reff_nama_jabatan
                                                WHERE a.`id_reff_nama_jabatan`='$id_reff_nama_jabatan' AND a.`jenis_kelamin`='2' AND MONTH(a.tanggal_daftar) < MONTH(CURRENT_DATE())";
                             $sql_jbtblnini1 ="SELECT COUNT(*) as jbt_bln_ini1
                                                FROM pencari_kerja a
                                                LEFT JOIN reff_nama_jabatan b
                                                ON a.id_reff_nama_jabatan=b.id_reff_nama_jabatan
                                                WHERE a.`id_reff_nama_jabatan`='$id_reff_nama_jabatan' AND a.`jenis_kelamin`='2' AND MONTH(a.tanggal_daftar) < MONTH(CURRENT_DATE())";
                             $sql_jbtblnini2 ="SELECT COUNT(*) as jbt_bln_ini2
                                                FROM pencari_kerja a
                                                LEFT JOIN reff_nama_jabatan b
                                                ON a.id_reff_nama_jabatan=b.id_reff_nama_jabatan
                                                WHERE a.`id_reff_nama_jabatan`='$id_reff_nama_jabatan' AND a.`jenis_kelamin`='2' AND MONTH(a.tanggal_daftar) < MONTH(CURRENT_DATE())";

                              // echo $this->debugSQL($sql_ttl,$param);
                              $rs_jbtblnlalu1 = $this->dbDataSelectAndReturnAll($sql_jbtblnlalu1,null,true);
                              $rs_jbtblnlalu2 = $this->dbDataSelectAndReturnAll($sql_jbtblnlalu2,null,true);
                              $rs_jbtblnini1 = $this->dbDataSelectAndReturnAll($sql_jbtblnini1,null,true);
                              $rs_jbtblnini2 = $this->dbDataSelectAndReturnAll($sql_jbtblnini2,null,true);
                              // print_r($rs_ttl);

                              $data_jbtblnlalu1=array();
                              $data_jbtblnlalu2=array();
                              $data_jbtblnini1=array();
                              $data_jbtblnini2=array();

                              foreach($rs_jbtblnlalu1 as $bb) { 

                                   $data_jbtblnlalu1[] = $bb;
                              }
                              $obk->laki_jbt_bln_lalu = $data_jbtblnlalu1[0]->jbt_bln_lalu1;

                              foreach($rs_jbtblnlalu2 as $bc) { 

                                   $data_jbtblnlalu2[] = $bc;
                              }
                              $obk->cew_jbt_bln_lalu = $data_jbtblnlalu2[0]->jbt_bln_lalu2;

                              foreach($rs_jbtblnini1 as $bd) { 

                                   $data_jbtblnini1[] = $bd;
                              }
                              $obk->laki_jbt_bln_ini = $data_jbtblnini1[0]->jbt_bln_ini1;

                              foreach($rs_jbtblnini2 as $be) { 

                                   $data_jbtblnini2[] = $be;
                              }
                              $obk->cew_jbt_bln_ini = $data_jbtblnini2[0]->jbt_bln_ini2;


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
