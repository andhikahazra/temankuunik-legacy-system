<?php

class PencariKerja extends Database
{

    function __construct()
    {
        parent::__construct();
    }

    private function get_userId()
    {
        $user = new os;
        $userData = $user->getUserData();
        $userDataArr = json_decode($userData);
        $userId = $userDataArr->user_id;
        return $userId;
    }

    private function findField()
    {
        $findField = [
            "a.tanggal_daftar", "a.no_pendaftaran", "a.nik", "nama_lengkap", "tempat_lahir", "tangal_lahir", "jenis_kelamin", "alamat", "no_hp", "email", "a.kode_pos", "s.status","catatan_pengantar_kerja", "lokasi", "dalam_negeri"
        ];
        return $findField;
    }

    private function buildSqlSearchingCriteria($keywords, $findField)
    {
        $arrayKata = explode(' ', $keywords);
        foreach ($arrayKata as $hasil) {
            foreach ($findField as $fieldName) {
                $criteria[] = "LOWER($fieldName) like '%$hasil%'";
            }
            $queryCriteria[] = implode(" OR ", $criteria);
        }
        $resultCriteria = implode(" OR ", $queryCriteria);
        return $resultCriteria;
    }

    public function PUBLIC_list($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userId = $this->get_userId();
        $sql = 'SELECT 
                    DISTINCT a.id_pencari_kerja,
                    a.no_pendaftaran,
                    a.tanggal_daftar,
                    a.nik,
                    a.nama_lengkap,
                    SUBSTRING_INDEX(SUBSTRING_INDEX(nama_lengkap, " ", 1), " ", -1) AS first_name,
                    tempat_lahir,
                    tangal_lahir,
                    jenis_kelamin, 
                    CASE 
                        WHEN jenis_kelamin = 1 THEN "Laki-laki" 
                        WHEN jenis_kelamin = 2 THEN "Perempuan" 
                    END AS jenis_kelamin_,
                    id_agama, 
                    CASE 
                        WHEN id_agama = 1 THEN "Islam" 
                        WHEN id_agama = 2 THEN "Kristen" 
                        WHEN id_agama = 3 THEN "Katholik" 
                        WHEN id_agama = 4 THEN "Hindu" 
                        WHEN id_agama = 5 THEN "Budha" 
                        WHEN id_agama = 6 THEN "Kepercayaan kepada Tuhan YME" 
                    END AS agama,
                    alamat,
                    rt,
                    rw,
                    `no`,
                    a.id_reff_kecamatan,
                    k.KECAMATAN,
                    a.id_reff_desa,
                    d.KELURAHAN,
                    no_hp,
                    email,
                    a.kode_pos,
                    a.`status` `status`,
                    s.`status` `status_`,
                    a.id_reff_tingkat_pendidikan,
                    tp.tingkat_pendidikan,
                    a.id_reff_jurusan_pendidikan,
                    jp.jurusan_pendidikan,
                    a.id_reff_nama_jurusan,
                    nj.nama_jurusan,
                    pkp.jurusan_manual,
                    pkp.nem_ipk,
                    pkp.ketrampilan,
                    file_foto,
                    pkp.file_ijazah,
                    file_sertifikat_bahasa,
                    file_ktp,
                    file_curriculum_vitae,
                    bahasa_dikuasai,
                    bahasa_lainnya,
                    (SELECT GROUP_CONCAT(ba.bahasa_asing) FROM reff_bahasa_asing ba WHERE ba.id_reff_bahasa_asing IN (a.bahasa_dikuasai)) bahasa_dikuasai_,
                    catatan_pengantar_kerja,
                    a.id_reff_jabatan_kerja,
                    jk.jabatan_kerja,
                    a.id_reff_nama_jabatan,
                    (SELECT url_files FROM files WHERE id_files = a.file_foto) data_foto,
                    (SELECT url_files FROM files WHERE id_files = a.file_ijazah) data_ijazah,
                    (SELECT url_files FROM files WHERE id_files = a.file_sertifikat_bahasa) data_sertifikat_bahasa,
                    (SELECT url_files FROM files WHERE id_files = a.file_ktp) data_ktp,
                    (SELECT url_files FROM files WHERE id_files = a.file_curriculum_vitae) data_curriculum_vitae,
                    njb.nama_jabatan,
                    lokasi,
                    CASE 
                        WHEN lokasi = 1 THEN "Dalam Negeri" 
                        WHEN lokasi = 2 THEN "Luar Negeri" 
                    END AS lokasi_,
                    dalam_negeri,
                    a.id_upah_pencaker,
                    up.upah_pencaker,
                    TIMESTAMPDIFF(MONTH, a.tanggal_daftar, CURDATE()) AS bulan,
                    IF (TIMESTAMPDIFF(MONTH, a.tanggal_daftar, CURDATE()) < 25, "Aktif", "Non Aktif") AS statusku
                    
                    
                FROM pencari_kerja a
                LEFT JOIN reff_tingkat_pendidikan tp USING (id_reff_tingkat_pendidikan)
                LEFT JOIN reff_nama_jurusan nj USING (id_reff_nama_jurusan)
                LEFT JOIN reff_jabatan_kerja jk USING (id_reff_jabatan_kerja)
                LEFT JOIN reff_nama_jabatan njb USING (id_reff_nama_jabatan)
                LEFT JOIN reff_upah_pencaker up USING (id_upah_pencaker)
                LEFT JOIN reff_kecamatan k USING (id_reff_kecamatan)
                LEFT JOIN reff_desa d USING (id_reff_desa)
                LEFT JOIN reff_status s ON (s.`id_status` = a.`status`)
                LEFT JOIN pencari_kerja_pendidikan pkp ON (pkp.`id_pencari_kerja` = a.`id_pencari_kerja`)
                LEFT JOIN reff_jurusan_pendidikan jp ON (jp.`id_reff_jurusan_pendidikan` = pkp.`id_reff_jurusan_pendidikan`)';

        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where " . $criteria;
            // print_r($sql);exit();
        }
        if (isset($_POST['start'])) {
            $start = $_POST['start'];
            $limit = $_POST['length'];
            if ($limit == '-1') {
                $limit = 100000;
            }
         
            $sql .= " ORDER BY a.tanggal_daftar DESC, a.no_pendaftaran DESC limit $start,$limit";
        }

        $arrayData = $this->dbDataSelectAndReturnAll($sql, $params, true);
        if ($return) {
            return $arrayData;
        }
        $array = array();
        $sqlCount = "SELECT count(*) FROM pencari_kerja ";
        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }
   
    public function PUBLIC_list_pengalaman($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userId = $this->get_userId();
        $sql = '
        ';
        // (SELECT url_files FROM files WHERE id_files = a.file_foto) data_foto,
        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where " . $criteria;
        }
        if (isset($_POST['start'])) {
            $start = $_POST['start'];
            $limit = $_POST['length'];
            if ($limit == '-1') {
                $limit = 100000;
            }
            $sql .= " limit $start,$limit ";
        }

        $arrayData = $this->dbDataSelectAndReturnAll($sql, $params, true);
        if ($return) {
            return $arrayData;
        }
        $array = array();
        $sqlCount = "SELECT count(*) FROM pencari_kerja ";
        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }

     public function PUBLIC_laporanak1($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $id_pencari_kerja=$params['id_pencari_kerja'];
        $userId = $this->get_userId();
        $sql = 'SELECT id_pencari_kerja,
                    no_pendaftaran,
                    DATE_FORMAT(
                    a.`tanggal_daftar`,
                    "%d-%m-%Y"
                    ) AS tanggal_daftar,
                    DATE_FORMAT((tanggal_daftar  + INTERVAL "2" YEAR), "%d-%m-%Y") AS duatahun,
                    nik,
                    nama_lengkap,
                    SUBSTRING_INDEX(SUBSTRING_INDEX(nama_lengkap, " ", 1), " ", -1) AS first_name,
                    tempat_lahir,
                    DATE_FORMAT(
                    a.`tangal_lahir`,
                    "%d-%m-%Y"
                    ) AS tangal_lahir,
                    jenis_kelamin, 
                    CASE 
                        WHEN jenis_kelamin = 1 THEN "Laki-laki" 
                        WHEN jenis_kelamin = 2 THEN "Perempuan" 
                    END AS jenis_kelamin_,
                    id_agama, 
                    CASE 
                        WHEN id_agama = 1 THEN "Islam" 
                        WHEN id_agama = 2 THEN "Kristen" 
                        WHEN id_agama = 3 THEN "Katholik" 
                        WHEN id_agama = 4 THEN "Hindu" 
                        WHEN id_agama = 5 THEN "Budha" 
                        WHEN id_agama = 6 THEN "Kepercayaan kepada Tuhan YME" 
                    END AS agama,
                    alamat,
                    rt,
                    rw,
                    `no`,
                    a.id_reff_kecamatan,
                    k.KECAMATAN,
                    a.id_reff_desa,
                    d.KELURAHAN,
                    no_hp,
                    email,
                    a.kode_pos,
                    a.`status` `status`,
                    s.`status` `status_`,
                    file_foto,
                    file_ktp,
                    catatan_pengantar_kerja,
                    a.id_reff_jabatan_kerja,
                    jk.jabatan_kerja,
                    a.id_reff_nama_jabatan,
                    (SELECT url_files FROM files WHERE id_files = a.file_foto) data_foto,
                    (SELECT url_files FROM files WHERE id_files = a.file_ktp) data_ktp,
                    njb.nama_jabatan,
                    lokasi,
                    CASE 
                        WHEN lokasi = 1 THEN "Dalam Negeri" 
                        WHEN lokasi = 2 THEN "Luar Negeri" 
                    END AS lokasi_,
                    dalam_negeri,
                    CASE 
                        WHEN dalam_negeri = 0 THEN "" 
                        WHEN dalam_negeri = 1 THEN "[Lokasi Tempat Tinggal]" 
                        WHEN dalam_negeri = 2 THEN "[Wilayah Lain]"
                        END AS dalam_negeri_,
                    a.id_upah_pencaker,
                    up.upah_pencaker
                FROM pencari_kerja a
              
                LEFT JOIN reff_jabatan_kerja jk USING (id_reff_jabatan_kerja)
                LEFT JOIN reff_nama_jabatan njb USING (id_reff_nama_jabatan)
                LEFT JOIN reff_upah_pencaker up USING (id_upah_pencaker)
                LEFT JOIN reff_kecamatan k USING (id_reff_kecamatan)
                LEFT JOIN reff_desa d USING (id_reff_desa)
                LEFT JOIN reff_status s ON (s.id_status = a.`status`) WHERE a.id_pencari_kerja ="'.$id_pencari_kerja.'" ';
        $qb = new QueryBuilder($sql);
        $result = $this->dbDataSelectAndReturnAll($qb, null, true);

        $total = count($result);
        if ($total > 0) {

            $data_list = array();
            $row = 0;

            foreach($result as $obj) {

                $id_pencari_kerja = $obj->id_pencari_kerja;

                  // Ambil id_pencari_kerja
                if($id_pencari_kerja !== '') {
                    $obj2 = clone $obj;
                   
                    $params['id_pencari_kerja'] = $obj->id_pencari_kerja;

                    // pendidikan loop
                    $sql =  "SELECT a.id_pencari_kerja_pendidikan, a.`id_pencari_kerja`, a.`jurusan_manual`,a.`nem_ipk`, a.`ketrampilan`, a.tahun_lulus,
                                    b.`tingkat_pendidikan`, d.nama_jurusan
                            FROM pencari_kerja_pendidikan a
                            LEFT JOIN reff_tingkat_pendidikan b
                            ON a.`id_reff_tingkat_pendidikan`=b.`id_reff_tingkat_pendidikan`
                            LEFT JOIN `reff_jurusan_pendidikan` c
                            ON a.`id_reff_jurusan_pendidikan` = c.`id_reff_jurusan_pendidikan`
                            LEFT JOIN `reff_nama_jurusan` d
                            ON a.`id_reff_nama_jurusan` = d.`id_reff_nama_jurusan`
                            WHERE a.id_pencari_kerja =:id_pencari_kerja ORDER BY a.id_pencari_kerja_pendidikan DESC LIMIT 0,1";
                            // echo $this->debugSQL($sql,$params);exit();
                   
                    $rs_pendidikan = $this->dbDataSelectAndReturnAll($sql,$params,true);
                    
                    $data_pendidikan=array();

                    foreach($rs_pendidikan as $a) { 

                         $data_pendidikan[] = $a;
                    }

                    $obj->pendidikan = $data_pendidikan;

                    // bahasa loop
                    $sql_bahasa = "SELECT a.`id_pencari_kerja`, a.`bahasa_dikuasai`, b.`bahasa_asing`
                                FROM pencari_kerja_bahasa a
                                LEFT JOIN reff_bahasa_asing b
                                ON a.`bahasa_dikuasai`=b.`id_reff_bahasa_asing`
                                WHERE a.`id_pencari_kerja` =:id_pencari_kerja";


                    $rs_bahasa = $this->dbDataSelectAndReturnAll($sql_bahasa,$params,true);
                    
                    $data_bahasa=array();

                    foreach($rs_bahasa as $b) { 

                         $data_bahasa[] = $b;
                    }

                    $obj->bahasa = $data_bahasa;

                    // pengalaman loop
                    $sql_pengalaman = "SELECT a.`id_pencari_kerja`, a.`jabatan`, a.`uraian_tugas` ,a.`lama_kerja_bulan`,
                                       a.`lama_kerja_tahun`, a.`pemberi_pengguna`
                                       FROM `pencari_kerja_pengalaman` a
                                       WHERE a.`id_pencari_kerja` =:id_pencari_kerja";
        
                    $rs_pengalaman = $this->dbDataSelectAndReturnAll($sql_pengalaman,$params,true);
                    
                    $data_pengalaman=array();

                    foreach($rs_pengalaman as $b) { 

                         $data_pengalaman[] = $b;
                    }

                    $obj->pengalaman = $data_pengalaman;
                    
                    $rows[] = $obj;

               
            }
            $data['data_hasil'] = $rows;

        
            //  if ($return) {
            //     return $data;
            // } else {
            //     echo '{"success" : true, "msg":"Berhasil mengambil data", "total":' . $total . ', "result":' . json_encode($data) . '}';
            // }
            //SAVE PDF
            $htmlTpl = "ak1_pdf.html";
            $html = $this->createHtmlExport();

            // $htmlTpl1 = "ak11_pdf.html";
            // $html1 = $this->createHtmlExport();
            

            $html->addHtmlFile($htmlTpl, $data);
              // $html1->addHtmlFile($htmlTpl1,$data);
               // print_r($html);exit();
            require_once 'lib/mpdf-7.0.0/vendor/autoload.php';

            $mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8', 'format' => [210, 320],'orientation' => 'L',
                                    'margin_top' => 4,
                                    'margin_left' => 4,
                                    'margin_right' => 4,
                                    'mirrorMargins' => true]);
            // 210, 111
            // require_once 'lib/mpdf-6-0-1/vendor/autoload.php';
            // left,right,
            // $mpdf = new mPDF('c','A4-L','','',5,5,7,3,3,3);
            // $mpdf->showImageErrors = true;
            $mpdf->curlAllowUnsafeSslRequests = true;
            $mpdf->WriteHTML($html->returnHtml());
            /*$mpdf->AddPage(['format' => 'A4-L',
                                    'margin_top' => 5,
                                    'margin_left' => 5,
                                    'margin_right' => 5,
                                    'mirrorMargins' => true]);
            $mpdf->WriteHTML($html1->returnHtml());*/
            $mpdf->Output('Laporan-AKI.pdf','I');
            exit();

        }

        }
        // echo $this->dbDataSelectAndReturnAll($sql, $params);
    }


     public function PUBLIC_laporanak2($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $id_pencari_kerja=$params['id_pencari_kerja'];
        $userId = $this->get_userId();
        $sql = 'SELECT id_pencari_kerja,
                    no_pendaftaran,
                    DATE_FORMAT(
                    a.`tanggal_daftar`,
                    "%d - %m - %Y"
                    ) AS tanggal_daftar,
                    nik,
                    nama_lengkap,
                    SUBSTRING_INDEX(SUBSTRING_INDEX(nama_lengkap, " ", 1), " ", -1) AS first_name,
                    tempat_lahir,
                    DATE_FORMAT(
                    a.`tangal_lahir`,
                    "%d - %m - %Y"
                    ) AS tangal_lahir,
                    jenis_kelamin, 
                    CASE 
                        WHEN jenis_kelamin = 1 THEN "Laki-laki" 
                        WHEN jenis_kelamin = 2 THEN "Perempuan" 
                    END AS jenis_kelamin_,
                    id_agama, 
                    CASE 
                        WHEN id_agama = 1 THEN "Islam" 
                        WHEN id_agama = 2 THEN "Kristen" 
                        WHEN id_agama = 3 THEN "Katholik" 
                        WHEN id_agama = 4 THEN "Hindu" 
                        WHEN id_agama = 5 THEN "Budha" 
                        WHEN id_agama = 6 THEN "Kepercayaan kepada Tuhan YME" 
                    END AS agama,
                    alamat,
                    rt,
                    rw,
                    `no`,
                    a.id_reff_kecamatan,
                    k.KECAMATAN,
                    a.id_reff_desa,
                    d.KELURAHAN,
                    no_hp,
                    email,
                    a.kode_pos,
                    a.`status` `status`,
                    s.`status` `status_`,
                    file_foto,
                    file_ktp,
                    catatan_pengantar_kerja,
                    a.id_reff_jabatan_kerja,
                    jk.jabatan_kerja,
                    a.id_reff_nama_jabatan,
                    (SELECT url_files FROM files WHERE id_files = a.file_foto) data_foto,
                    (SELECT url_files FROM files WHERE id_files = a.file_ktp) data_ktp,
                    njb.nama_jabatan,
                    lokasi,
                    CASE 
                        WHEN lokasi = 1 THEN "Dalam Negeri" 
                        WHEN lokasi = 2 THEN "Luar Negeri" 
                    END AS lokasi_,
                    dalam_negeri,
                    CASE 
                        WHEN dalam_negeri = 0 THEN "" 
                        WHEN dalam_negeri = 1 THEN "[Lokasi Tempat Tinggal]" 
                        WHEN dalam_negeri = 2 THEN "[Wilayah Lain]"
                        END AS dalam_negeri_,
                    a.id_upah_pencaker,
                    up.upah_pencaker
                FROM pencari_kerja a
              
                LEFT JOIN reff_jabatan_kerja jk USING (id_reff_jabatan_kerja)
                LEFT JOIN reff_nama_jabatan njb USING (id_reff_nama_jabatan)
                LEFT JOIN reff_upah_pencaker up USING (id_upah_pencaker)
                LEFT JOIN reff_kecamatan k USING (id_reff_kecamatan)
                LEFT JOIN reff_desa d USING (id_reff_desa)
                LEFT JOIN reff_status s ON (s.id_status = a.`status`) WHERE a.id_pencari_kerja ="'.$id_pencari_kerja.'" ';

        $qb = new QueryBuilder($sql);
        $result = $this->dbDataSelectAndReturnAll($qb, null, true);

        $total = count($result);
        if ($total > 0) {

            $data_list = array();
            $row = 0;

            foreach($result as $obj) {

                $id_pencari_kerja = $obj->id_pencari_kerja;
                // print_r($id_surat_tugas);exit();

                  // Ambil id_pencari_kerja
                if($id_pencari_kerja !== '') {
                    $obj2 = clone $obj;
                   
                    $params['id_pencari_kerja'] = $obj->id_pencari_kerja;
                    $id_pencari_kerja = $obj->id_pencari_kerja;

                    // pendidikan loop
                    $sql =  "SELECT a.id_pencari_kerja_pendidikan, a.`id_pencari_kerja`, a.`jurusan_manual`,a.`nem_ipk`, a.`ketrampilan`, a.tahun_lulus,
                                    b.`tingkat_pendidikan`, d.nama_jurusan
                            FROM pencari_kerja_pendidikan a
                            LEFT JOIN reff_tingkat_pendidikan b
                            ON a.`id_reff_tingkat_pendidikan`=b.`id_reff_tingkat_pendidikan`
                            LEFT JOIN `reff_jurusan_pendidikan` c
                            ON a.`id_reff_jurusan_pendidikan` = c.`id_reff_jurusan_pendidikan`
                            LEFT JOIN `reff_nama_jurusan` d
                            ON a.`id_reff_nama_jurusan` = d.`id_reff_nama_jurusan`
                            WHERE a.id_pencari_kerja =:id_pencari_kerja ORDER BY a.id_pencari_kerja_pendidikan DESC LIMIT 0,1";
                            // echo $this->debugSQL($sql,$params);exit();
                   
                    // echo "<br><br>";
                    $rs_pendidikan = $this->dbDataSelectAndReturnAll($sql,$params,true);
                    
                    $data_pendidikan=array();

                    foreach($rs_pendidikan as $a) { 

                         $data_pendidikan[] = $a;
                    }

                    $obj->pendidikan = $data_pendidikan;

                    // bahasa loop
                    $sql_bahasa = "SELECT a.`id_pencari_kerja`, a.`bahasa_dikuasai`, b.`bahasa_asing`
                                FROM pencari_kerja_bahasa a
                                LEFT JOIN reff_bahasa_asing b
                                ON a.`bahasa_dikuasai`=b.`id_reff_bahasa_asing`
                                WHERE a.`id_pencari_kerja` =:id_pencari_kerja";


                    $rs_bahasa = $this->dbDataSelectAndReturnAll($sql_bahasa,$params,true);
                    
                    $data_bahasa=array();

                    foreach($rs_bahasa as $b) { 

                         $data_bahasa[] = $b;
                    }

                    $obj->bahasa = $data_bahasa;

                    // pengalaman loop
                    $sql_pengalaman = "SELECT a.`id_pencari_kerja`, a.`jabatan`, a.`uraian_tugas` ,a.`lama_kerja_bulan`,
                                       a.`lama_kerja_tahun`, a.`pemberi_pengguna`, 
                                       (SELECT COUNT(*) FROM pencari_kerja_pengalaman WHERE id_pencari_kerja ='".$id_pencari_kerja."') AS jml_pengalaman
                                       FROM `pencari_kerja_pengalaman` a
                                       WHERE a.`id_pencari_kerja` =:id_pencari_kerja";
         // echo $this->debugSQL($sql_pengalaman,$params);exit();
                    $rs_pengalaman = $this->dbDataSelectAndReturnAll($sql_pengalaman,$params,true);
                    
                    $data_pengalaman=array();

                    foreach($rs_pengalaman as $b) { 

                         $data_pengalaman[] = $b;
                    }

                    $obj->pengalaman = $data_pengalaman;
                    $obj->jml_pengalaman = ($data_pengalaman[0]->jml_pengalaman + 3);
                    
                    $rows[] = $obj;

               
            }
            $data['result'] = $rows;
            // print_r($data);exit();

            //  if ($return) {
            //     return $data;
            // } else {
            //     echo '{"success" : true, "msg":"Berhasil mengambil data", "total":' . $total . ', "result":' . json_encode($data) . '}';
            // }
            //SAVE PDF
            $htmlTpl = "tpl_pdf.html";
            $html = $this->createHtmlExport();
            

            $html->addHtmlFile($htmlTpl, $data);
               // print_r($html);exit();
            require_once 'lib/mpdf-7.0.0/vendor/autoload.php';

            $mpdf = new \Mpdf\Mpdf(['format' => 'A4',
                                    'margin_top' => 5,
                                    'margin_left' => 5,
                                    'margin_right' => 5,
                                    'mirrorMargins' => true]);
            // require_once 'lib/mpdf-6-0-1/vendor/autoload.php';
            // left,right,
            // $mpdf = new mPDF('c','A4-L','','',5,5,7,3,3,3);
            // $mpdf->showImageErrors = true;
            $mpdf->curlAllowUnsafeSslRequests = true;
            $mpdf->WriteHTML($html->returnHtml());
            // $mpdf->AddPage('A4-L');
            // $mpdf->WriteHTML($html->returnHtml());
            $mpdf->Output('Laporan-AKII.pdf','I');
            exit();

        }

        }
        // echo $this->dbDataSelectAndReturnAll($sql, $params);
    }

    public function PUBLIC_GetId($ret = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $id_pencari_kerja = $params['data']["id_pencari_kerja"]; 
        $nik = $params['data']["nik"];

        if (empty($id_pencari_kerja)){
            $sql = 'SELECT id_pencari_kerja,nik FROM pencari_kerja WHERE nik = "'.$nik.'" ORDER BY id_pencari_kerja DESC LIMIT 0,1';
        } else {
             $sql = 'SELECT id_pencari_kerja,nik FROM pencari_kerja WHERE nik = "'.$nik.'" and id_pencari_kerja="'.$id_pencari_kerja.'"
             ORDER BY id_pencari_kerja DESC LIMIT 0,1';
        }

        if($ret) {
           return $this->dbDataSelectAndReturnAll($sql);
        } else {
            echo $this->dbDataSelectAndReturnAll($sql);
        }
    }

      public function PUBLIC_cekNik($nonik)
    {
        $params = isset($_GET) ? $_GET : $_POST;

        $sql = "SELECT nik FROM pencari_kerja WHERE nik='$nonik'";
        $hasil = $this->dbDataGetValue($sql);
        

        if ($hasil == 0){
           return false;
        } else {
            return true;

        }
    }

    public function PUBLIC_addPencariKerja()
    {
        $params = isset($_GET) ? $_GET : $_POST;

        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];
        $flag=$params['flag'];

        $nonik = $params['data']["nik"]; 
        $cek_nik = $this->PUBLIC_cekNik($nonik);
        // print_r($cek_nik);exit();

        $tahun = date("Y");
        $nomor_daftar_edit= $params['data']["no_pendaftaran"];

        $sql_no = "SELECT no_pendaftaran nomor FROM pencari_kerja WHERE YEAR(tanggal_daftar) ='$tahun' ORDER BY nomor DESC LIMIT 0,1 ";
        $data = (int) $this->dbDataGetValue($sql_no);
        // $noterakhir = 1473;
        $params['data']["no_pendaftaran"] = $data + 1;

       
        $params['data']["no_pendaftaran"] = str_pad($params['data']["no_pendaftaran"], 4, "0", STR_PAD_LEFT);

        if(is_array($params['data']["bahasa_dikuasai"])){
            $params['data']["bahasa_dikuasai"]= implode(',',$params['data']["bahasa_dikuasai"]);
        }
        if($params['data']["dalam_negeri"] == ""){
            $params['data']["dalam_negeri"] = 0;
        }

         if ($params['data']["lokasi"] ==""){
            $params['data']["lokasi"] =0;
        }

        if ($params['data']["id_reff_jabatan_kerja"] ==""){
            $params['data']["id_reff_jabatan_kerja"] =0;
        }

        if ($params['data']["id_reff_nama_jabatan"] ==""){
            $params['data']["id_reff_nama_jabatan"] =0;
        }

         if ($params['data']["id_upah_pencaker"] ==""){
            $params['data']["id_upah_pencaker"] =0;
        }


        if ($flag=='1'){

            if ($cek_nik == '0'){

            $sql = "INSERT into pencari_kerja 
                                (no_pendaftaran,
                               tanggal_daftar,
                               nik,
                               nama_lengkap,
                               tempat_lahir,
                               tangal_lahir,
                               jenis_kelamin,
                               id_agama,
                               alamat,
                               rt,
                               rw,
                               `no`,
                               id_reff_kecamatan,
                               id_reff_desa,
                               no_hp,
                               email,
                               kode_pos,
                               `status`,
                               file_ktp,
                               file_foto,
                               user_input,
                               tgl_input) 

                VALUES   (:no_pendaftaran,
                          :tanggal_daftar,
                          :nik,
                          :nama_lengkap,
                          :tempat_lahir,
                          :tangal_lahir,
                          :jenis_kelamin,
                          :id_agama,
                          :alamat,
                          :rt,
                          :rw,
                          :no,
                          :id_reff_kecamatan,
                          :id_reff_desa,
                          :no_hp,
                          :email,
                          :kode_pos,
                          :status,
                          :file_ktp,
                          :file_foto,
                          '".$user."',
                          NOW())";

        // echo $this->debugSql($sql, $params['data']);exit();
                    if($this->dbDataExecute($sql, $params['data'])){

                            $a=array("success"=>true,"msg"=>"Data Berhasil Disimpan");
                            echo json_encode($a);
                    }

            } else if ($cek_nik == '1') {

                 echo '{"success" : false, "msg":"Nik sudah ada silahkan lakukan edit!"}';
               exit();

            }

        } else if ($flag=='0'){

             $sql = "UPDATE pencari_kerja SET  no_pendaftaran='".$nomor_daftar_edit."',
                                               tanggal_daftar=:tanggal_daftar,
                                               nik=:nik,
                                               nama_lengkap=:nama_lengkap,
                                               tempat_lahir=:tempat_lahir,
                                               tangal_lahir=:tangal_lahir,
                                               jenis_kelamin=:jenis_kelamin,
                                               id_agama=:id_agama,
                                               alamat=:alamat,
                                               rt=:rt,
                                               rw=:rw,
                                               no=:no,
                                               id_reff_kecamatan=:id_reff_kecamatan,
                                               id_reff_desa=:id_reff_desa,
                                               no_hp=:no_hp,
                                               email=:email,
                                               kode_pos=:kode_pos,
                                               status=:status,
                                               file_ktp=:file_ktp,
                                               file_foto=:file_foto,
                                               
                                               user_update='".$user."',
                                               tgl_update=NOW()
                                               WHERE id_pencari_kerja = :id_pencari_kerja";

            // echo $this->debugSql($sql, $params['data']);exit();
            if($this->dbDataExecute($sql, $params['data'])){

                    $a=array("success"=>true,"msg"=>"Data Berhasil Disimpan");
                    echo json_encode($a);
            }

        }
    
    }

    public function PUBLIC_add()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $tahun = date("Y");
        $sql_no = "SELECT count(id_pencari_kerja) jml FROM pencari_kerja WHERE YEAR(tanggal_daftar) = $tahun";
        $data = (int) $this->dbDataGetValue($sql_no);
        $params['data']["no_pendaftaran"] = $data + 1;
        $params['data']["no_pendaftaran"] = str_pad($params['data']["no_pendaftaran"], 5, "0", STR_PAD_LEFT);
        if(is_array($params['data']["bahasa_dikuasai"])){
            $params['data']["bahasa_dikuasai"]= implode(',',$params['data']["bahasa_dikuasai"]);
        }
        if($params['data']["dalam_negeri"] == ""){
            $params['data']["dalam_negeri"] = 0;
        }
        // print_r($params['data']["bahasa_dikuasai"]);die;

        $sql = "INSERT into pencari_kerja (no_pendaftaran,tanggal_daftar,nik,nama_lengkap,tempat_lahir,tangal_lahir,jenis_kelamin,id_agama,alamat,rt,rw,`no`,id_reff_kecamatan,id_reff_desa,no_hp,email,kode_pos,`status`,id_reff_tingkat_pendidikan, id_reff_jurusan_pendidikan, id_reff_nama_jurusan,nem_ipk,jurusan_manual,ketrampilan,bahasa_lainnya,file_ktp,file_foto,file_ijazah,file_sertifikat_bahasa,file_curriculum_vitae,bahasa_dikuasai,catatan_pengantar_kerja,id_reff_jabatan_kerja,id_reff_nama_jabatan,lokasi,dalam_negeri,id_upah_pencaker) VALUES 
                                          (:no_pendaftaran,:tanggal_daftar,:nik,:nama_lengkap,:tempat_lahir,:tangal_lahir,:jenis_kelamin,:id_agama,:alamat,:rt,:rw,:no,:id_reff_kecamatan,:id_reff_desa,:no_hp,:email,:kode_pos,:status,:id_reff_tingkat_pendidikan,:id_reff_jurusan_pendidikan,:id_reff_nama_jurusan,:nem_ipk,:jurusan_manual,:ketrampilan,:bahasa_lainnya,:file_ktp,:file_foto,:file_ijazah,:file_sertifikat_bahasa,:file_curriculum_vitae,:bahasa_dikuasai,:catatan_pengantar_kerja,:id_reff_jabatan_kerja,:id_reff_nama_jabatan,:lokasi,:dalam_negeri,:id_upah_pencaker)";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_addpendidikan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];

        $sql = "INSERT INTO pencari_kerja_pendidikan
                            (id_pencari_kerja,
                            nik,
                            id_reff_tingkat_pendidikan, 
                            id_reff_jurusan_pendidikan, 
                            id_reff_nama_jurusan,
                            nem_ipk,
                            jurusan_manual,
                            ketrampilan,
                            tahun_lulus,  
                            file_ijazah,
                            user_input,
                            tgl_input)
                VALUES (:id_pencari_kerja,
                        :nik,
                        :id_reff_tingkat_pendidikan, 
                        :id_reff_jurusan_pendidikan, 
                        :id_reff_nama_jurusan,
                        :nem_ipk,
                        :jurusan_manual,
                        :ketrampilan,
                        :tahun_lulus,  
                        :file_ijazah,
                        '".$user."',
                        NOW())";

         // echo $this->debugSql($sql,$params);exit();
        echo $this->dbDataExecute($sql, $params);
    }

      public function PUBLIC_getPendidikan($ret = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();

        $id_pencari_kerja=$params['id_pencari_kerja'];
        // $nik=$params['nik'];
        
        if(empty($id_pencari_kerja)){
            $where = "WHERE 1=1";
        } else {
            $where = "WHERE a.id_pencari_kerja='".$id_pencari_kerja."'  ";
        }


        $sql = "SELECT f.nama_lengkap, f.nik, a.id_pencari_kerja_pendidikan, a.id_pencari_kerja, a.`jurusan_manual`, a.tahun_lulus,
                       a.`ketrampilan`, a.`nem_ipk`, a.`file_ijazah`, b.url_files, c.tingkat_pendidikan, d.`jurusan_pendidikan`,
                       e.`nama_jurusan`
                FROM pencari_kerja_pendidikan a
                LEFT JOIN files b
                    ON a.file_ijazah = b.id_files
                LEFT JOIN reff_tingkat_pendidikan c
                    ON a.`id_reff_tingkat_pendidikan` = c.`id_reff_tingkat_pendidikan`
                LEFT JOIN `reff_jurusan_pendidikan` d
                    ON d.`id_reff_jurusan_pendidikan`= a.`id_reff_jurusan_pendidikan`
                LEFT JOIN `reff_nama_jurusan` e
                    ON a.`id_reff_nama_jurusan`=e.`id_reff_nama_jurusan`
                LEFT JOIN pencari_kerja f
                ON a.id_pencari_kerja = f.id_pencari_kerja $where";

        echo $this->dbFwSelectAndReturnAll($sql, $params);
        exit();
    }

     public function PUBLIC_delPendidikan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        
        $sql = "delete from pencari_kerja_pendidikan where id_pencari_kerja_pendidikan = :id";
        if($this->dbDataExecute($sql,$params)){
                $a=array("success"=>true,"msg"=>"Data Berhasil Dihapus");
                echo json_encode($a);
        }else {
               echo '{"succes":false,"msg":"Gagal menghapus data"}';
               exit();
        }
    }

    public function PUBLIC_addbahasa()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];

        if(is_array($params["bahasa_dikuasai"])){
            $params["bahasa_dikuasai"]= implode(',',$params["bahasa_dikuasai"]);
        }


        $sql = "INSERT INTO pencari_kerja_bahasa
                            (id_pencari_kerja,
                            nik,
                            bahasa_dikuasai,
                            file_sertifikat_bahasa,
                            user_input,
                            tgl_input)
                VALUES (:id_pencari_kerja,
                        :nik,
                        :bahasa_dikuasai, 
                        :file_sertifikat_bahasa,
                        '".$user."',
                        NOW())";

         // echo $this->debugSql($sql,$params);exit();
        echo $this->dbDataExecute($sql, $params);
    }

    public function PUBLIC_getBahasa($ret = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $id_pencari_kerja=$params['id_pencari_kerja'];
        // $nik=$params['nik'];
        
        if(empty($id_pencari_kerja)){
            $where = "WHERE 1=1";
        } else {
            $where = "WHERE a.id_pencari_kerja='".$id_pencari_kerja."'  ";
        }

        $sql = "SELECT a.id_pencari_kerja_bahasa,d.nama_lengkap, d.nik, b.bahasa_asing, c.url_files 
                FROM pencari_kerja_bahasa a
                    LEFT JOIN reff_bahasa_asing b
                ON a.bahasa_dikuasai = b.id_reff_bahasa_asing
                    LEFT JOIN files c
                ON a.file_sertifikat_bahasa = c.id_files
                    LEFT JOIN pencari_kerja d
                ON a.id_pencari_kerja = d.id_pencari_kerja  $where";

        echo $this->dbFwSelectAndReturnAll($sql, $params);
        exit();
    }

     public function PUBLIC_delBahasa()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        
        $sql = "delete from pencari_kerja_bahasa where id_pencari_kerja_bahasa = :id";
        if($this->dbDataExecute($sql,$params)){
                $a=array("success"=>true,"msg"=>"Data Berhasil Dihapus");
                echo json_encode($a);
        }else {
               echo '{"succes":false,"msg":"Gagal menghapus data"}';
               exit();
        }
    }
    
    public function PUBLIC_addpengalaman()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];

        $sql = "INSERT INTO pencari_kerja_pengalaman
                            (id_pencari_kerja,
                            nik, 
                            jabatan, 
                            uraian_tugas, 
                            lama_kerja_tahun, 
                            lama_kerja_bulan, 
                            pemberi_pengguna, 
                            file_upload,
                            user_input,
                            tgl_input)
                VALUES (:id_pencari_kerja,
                        :nik, 
                        :pengalaman_jabatan, 
                        :uraian_tugas, 
                        :lama_kerja_tahun, 
                        :lama_kerja_bulan, 
                        :pemberi_pengguna, 
                        :file_pengalaman_kerja,
                        '".$user."',
                        NOW())";

         // echo $this->debugSql($sql,$params);exit();
        echo $this->dbDataExecute($sql, $params);
    }


     public function PUBLIC_getPengalaman($ret = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();

        $id_pencari_kerja=$params['id_pencari_kerja'];
        // $nik=$params['nik'];
        
        if(empty($id_pencari_kerja)){
            $where = "WHERE 1=1";
        } else {
            $where = "WHERE a.id_pencari_kerja='".$id_pencari_kerja."' ";
        }



        $sql = "SELECT a.*, b.url_files, c.nama_lengkap, c.nik
                FROM pencari_kerja_pengalaman a
                LEFT JOIN files b
                ON a.file_upload = b.id_files
                LEFT JOIN pencari_kerja c
                ON a.id_pencari_kerja = c.id_pencari_kerja $where";

        echo $this->dbFwSelectAndReturnAll($sql, $params);
         exit();
    }

     public function PUBLIC_delPengalaman()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        
        $sql = "delete from pencari_kerja_pengalaman where id_pencari_kerja_pengalaman = :id";
        if($this->dbDataExecute($sql,$params)){
                $a=array("success"=>true,"msg"=>"Data Berhasil Dihapus");
                echo json_encode($a);
        }else {
               echo '{"succes":false,"msg":"Gagal menghapus data"}';
               exit();
        }
    }


     public function PUBLIC_UpdateCatatan(){

        $params = isset($_GET) ? $_GET : $_POST;

        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];

         if($params["dalam_negeri"] == ""){
            $params["dalam_negeri"] = 0;
        }

         if ($params["lokasi"] ==""){
            $params["lokasi"] =0;
        }

        if ($params["id_reff_jabatan_kerja"] ==""){
            $params["id_reff_jabatan_kerja"] =0;
        }

        if ($params["id_reff_nama_jabatan"] ==""){
            $params["id_reff_nama_jabatan"] =0;
        }

         if ($params["id_upah_pencaker"] ==""){
            $params["id_upah_pencaker"] =0;
        }

        $sql = "UPDATE pencari_kerja SET  
                       catatan_pengantar_kerja=:catatan_pengantar_kerja,
                       id_reff_jabatan_kerja=:id_reff_jabatan_kerja,
                       id_reff_nama_jabatan=:id_reff_nama_jabatan,
                       lokasi=:lokasi,
                       dalam_negeri=:dalam_negeri,
                       id_upah_pencaker=:id_upah_pencaker,
                       user_update='".$user."',
                       tgl_update=NOW()
                       WHERE id_pencari_kerja = :id_pencari_kerja";

                                                // echo $this->debugSql($sql, $params);exit();
            if($this->dbDataExecute($sql, $params)){

                    $a=array("success"=>true,"msg"=>"Data Berhasil Disimpan");
                    echo json_encode($a);
            }

    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // $params['data']["bahasa_dikuasai"]= implode(',',$params['data']["bahasa_dikuasai"]);
        if(is_array($params['data']["bahasa_dikuasai"])){
            $params['data']["bahasa_dikuasai"]= implode(',',$params['data']["bahasa_dikuasai"]);
        }
        $sql = "UPDATE pencari_kerja SET tanggal_daftar=:tanggal_daftar,nik=:nik,nama_lengkap=:nama_lengkap,tempat_lahir=:tempat_lahir,tangal_lahir=:tangal_lahir,jenis_kelamin=:jenis_kelamin,id_agama=:id_agama,alamat=:alamat,rt=:rt,rw=:rw,`no`=:no,id_reff_kecamatan=:id_reff_kecamatan,id_reff_desa=:id_reff_desa,no_hp=:no_hp,email=:email,kode_pos=:kode_pos,status=:status, id_reff_tingkat_pendidikan=:id_reff_tingkat_pendidikan, id_reff_jurusan_pendidikan=:id_reff_jurusan_pendidikan, id_reff_nama_jurusan=:id_reff_nama_jurusan,nem_ipk=:nem_ipk,jurusan_manual=:jurusan_manual,ketrampilan=:ketrampilan,bahasa_lainnya=:bahasa_lainnya,file_ktp=:file_ktp,file_foto=:file_foto,file_curriculum_vitae=:file_curriculum_vitae,file_ijazah=:file_ijazah,file_sertifikat_bahasa=:file_sertifikat_bahasa,bahasa_dikuasai=:bahasa_dikuasai,catatan_pengantar_kerja=:catatan_pengantar_kerja,id_reff_jabatan_kerja=:id_reff_jabatan_kerja,id_reff_nama_jabatan=:id_reff_nama_jabatan,lokasi=:lokasi,dalam_negeri=:dalam_negeri,id_upah_pencaker=:id_upah_pencaker
                 WHERE id_pencari_kerja=:id_pencari_kerja";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "DELETE a.*, b.*, c.*, d.*
                    FROM `pencari_kerja` a
                    LEFT JOIN `pencari_kerja_pendidikan` b
                    ON a.`id_pencari_kerja` = b.`id_pencari_kerja`
                    LEFT JOIN `pencari_kerja_bahasa` c
                    ON a.id_pencari_kerja = c.id_pencari_kerja
                    LEFT JOIN `pencari_kerja_pengalaman` d
                    ON a.id_pencari_kerja = d.id_pencari_kerja
                WHERE a.id_pencari_kerja=:id_pencari_kerja";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_pdf()
    {
        $data['value'] = $this->PUBLIC_list(true);
        $i = 0;
        $data['judul'] = "Export data pdf";

        /**
         * Untuk memanggil fungsi create html2pdf, ada 3 parameter yang dikirimkan yaitu :
         *  - module name
         *  - data
         *  - template html
         *
         * @contributor arkan
         * */
        $pdf = $this->createHtml2Pdf(null, $data, 'tpl_pdf.html');
        // set document information
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Arkan Herawan');
        $pdf->SetTitle('Contoh export pdf');
        $pdf->SetSubject('export pdf dengan digital signature');
        $pdf->SetKeywords('TCPDF, PDF, example, test, guide');

        // remove default header/footer
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);

        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_RIGHT, PDF_MARGIN_TOP);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

        // set auto page breaks
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // add a page
        $pdf->AddPage();

        // print a some of text
        $pdf->writeHTML($pdf->content, true, 0, true, 0);

        //Close and output PDF document
        $pdf->Output('export_pdf_file.pdf', 'D');
    }

    public function PUBLIC_getStatus()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT id_status, `status` FROM reff_status";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getFiles()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT file_foto, file_ktp, file_ijazah, file_sertifikat_bahasa, file_curriculum_vitae
        FROM pencari_kerja WHERE id_pencari_kerja=:id_pencari_kerja";
        $files = $this->dbDataSelectAndReturnAll($sql, $params, true)[0];
        // print_r($files);die;

        if ($files->file_foto != '') {
            $sql_foto = "SELECT id_files, url_files, size, caption
        FROM files WHERE id_files=" . $files->file_foto;
            $data = $this->dbDataSelectAndReturnAll($sql_foto, $params, true);
            $data2 = [];
            $config = [];
            foreach ($data as $val) {
                $data2[] = $val->url_files;
                $config[] = [
                    'key' => $val->id_files,
                    'caption' => $val->caption,
                    'size' => $val->size,
                    'downloadUrl' => $val->url_files, // the url to download the file
                    'url' => $val->url_files, // server api to delete the file based on key
                ];
            }
            $out_foto = ['initialPreview' => $data2, 'initialPreviewConfig' => $config, 'initialPreviewAsData' => true];
        } else {
            $out_foto = ['initialPreview' => '', 'initialPreviewConfig' => '', 'initialPreviewAsData' => true];
        }

        if ($files->file_ktp != '') {
            $sql_ktp = "SELECT id_files, url_files, size, caption
        FROM files WHERE id_files=" . $files->file_ktp;
            $data = $this->dbDataSelectAndReturnAll($sql_ktp, $params, true);
            $data2 = [];
            $config = [];
            foreach ($data as $val) {
                $data2[] = $val->url_files;
                $config[] = [
                    'key' => $val->id_files,
                    'caption' => $val->caption,
                    'size' => $val->size,
                    'downloadUrl' => $val->url_files, // the url to download the file
                    'url' => $val->url_files, // server api to delete the file based on key
                ];
            }
            $out_ktp = ['initialPreview' => $data2, 'initialPreviewConfig' => $config, 'initialPreviewAsData' => true];
        } else {
            $out_ktp = ['initialPreview' => '', 'initialPreviewConfig' => '', 'initialPreviewAsData' => true];
        }

        if ($files->file_ijazah != '') {
            $sql_file_ijazah = "SELECT id_files, url_files, size, caption
        FROM files WHERE id_files=" . $files->file_ijazah;
            $data = $this->dbDataSelectAndReturnAll($sql_file_ijazah, $params, true);
            $data2 = [];
            $config = [];
            foreach ($data as $val) {
                $ext = pathinfo($val->url_files, PATHINFO_EXTENSION);
                switch ($ext) {
                    case 'mp4':
                        $type_file = "video";
                        # code...
                        break;
                    case 'doc':
                        $type_file = "office";
                        # code...
                        break;
                    case 'xls':
                        $type_file = "office";
                        # code...
                        break;
                    case 'ppt':
                        $type_file = "office";
                        # code...
                        break;
                    case 'tif':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'ai':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'eps':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'pdf':
                        $type_file = "pdf";
                        # code...
                        break;
                    case 'txt':
                        $type_file = "text";
                        # code...
                        break;
                    case 'html':
                        $type_file = "html";
                        # code...
                        break;

                    default:
                        $type_file = "image";
                        break;

                }

                $data2[] = $val->url_files;
                $config[] = [
                    'type' => $type_file,
                    'key' => $val->id_files,
                    'caption' => $val->caption,
                    'size' => $val->size,
                    'downloadUrl' => $val->url_files, // the url to download the file
                    'url' => $val->url_files, // server api to delete the file based on key
                ];
            }
            $out_ijazah = ['initialPreview' => $data2, 'initialPreviewConfig' => $config, 'initialPreviewAsData' => true];
        } else {
            $out_ijazah = ['initialPreview' => '', 'initialPreviewConfig' => '', 'initialPreviewAsData' => true];
        }
        if ($files->file_sertifikat_bahasa != '') {
            $sql_file_sertifikat_bahasa = "SELECT id_files, url_files, size, caption
        FROM files WHERE id_files=" . $files->file_sertifikat_bahasa;
            $data = $this->dbDataSelectAndReturnAll($sql_file_sertifikat_bahasa, $params, true);
            $data2 = [];
            $config = [];
            foreach ($data as $val) {
                                $ext = pathinfo($val->url_files, PATHINFO_EXTENSION);
                switch ($ext) {
                    case 'mp4':
                        $type_file = "video";
                        # code...
                        break;
                    case 'doc':
                        $type_file = "office";
                        # code...
                        break;
                    case 'xls':
                        $type_file = "office";
                        # code...
                        break;
                    case 'ppt':
                        $type_file = "office";
                        # code...
                        break;
                    case 'tif':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'ai':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'eps':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'pdf':
                        $type_file = "pdf";
                        # code...
                        break;
                    case 'txt':
                        $type_file = "text";
                        # code...
                        break;
                    case 'html':
                        $type_file = "html";
                        # code...
                        break;

                    default:
                        $type_file = "image";
                        break;

                }
                
                $data2[] = $val->url_files;
                $config[] = [
                    'type' => $type_file,
                    'key' => $val->id_files,
                    'caption' => $val->caption,
                    'size' => $val->size,
                    'downloadUrl' => $val->url_files, // the url to download the file
                    'url' => $val->url_files, // server api to delete the file based on key
                ];
            }
            $out_sertifikat_bahasa = ['initialPreview' => $data2, 'initialPreviewConfig' => $config, 'initialPreviewAsData' => true];
        } else {
            $out_sertifikat_bahasa = ['initialPreview' => '', 'initialPreviewConfig' => '', 'initialPreviewAsData' => true];
        }
        if ($files->file_curriculum_vitae != '') {
            $sql_file_curriculum_vitae = "SELECT id_files, url_files, size, caption
        FROM files WHERE id_files=" . $files->file_curriculum_vitae;
            $data = $this->dbDataSelectAndReturnAll($sql_file_curriculum_vitae, $params, true);
            $data2 = [];
            $config = [];
            foreach ($data as $val) {
                                $ext = pathinfo($val->url_files, PATHINFO_EXTENSION);
                switch ($ext) {
                    case 'mp4':
                        $type_file = "video";
                        # code...
                        break;
                    case 'doc':
                        $type_file = "office";
                        # code...
                        break;
                    case 'xls':
                        $type_file = "office";
                        # code...
                        break;
                    case 'ppt':
                        $type_file = "office";
                        # code...
                        break;
                    case 'tif':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'ai':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'eps':
                        $type_file = "gdocs";
                        # code...
                        break;
                    case 'pdf':
                        $type_file = "pdf";
                        # code...
                        break;
                    case 'txt':
                        $type_file = "text";
                        # code...
                        break;
                    case 'html':
                        $type_file = "html";
                        # code...
                        break;

                    default:
                        $type_file = "image";
                        break;

                }
                
                $data2[] = $val->url_files;
                $config[] = [
                    'type' => $type_file,
                    'key' => $val->id_files,
                    'caption' => $val->caption,
                    'size' => $val->size,
                    'downloadUrl' => $val->url_files, // the url to download the file
                    'url' => $val->url_files, // server api to delete the file based on key
                ];
            }
            $out_curriculum_vitae = ['initialPreview' => $data2, 'initialPreviewConfig' => $config, 'initialPreviewAsData' => true];
        } else {
            $out_curriculum_vitae = ['initialPreview' => '', 'initialPreviewConfig' => '', 'initialPreviewAsData' => true];
        }
        $out = ['foto' => $out_foto, 'ktp' => $out_ktp, 'ijazah' => $out_ijazah, 'sertifikat_bahasa' => $out_sertifikat_bahasa, 'curriculum_vitae' => $out_curriculum_vitae];

        echo json_encode($out);
    }

    public function PUBLIC_getBahasaDikuasai()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT id_reff_bahasa_asing, bahasa_asing FROM reff_bahasa_asing";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getcbTingkatPendidikan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT id_reff_tingkat_pendidikan, tingkat_pendidikan, kode, keterangan
	                FROM reff_tingkat_pendidikan";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getJurusanPendidikan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = " SELECT id_reff_jurusan_pendidikan, id_reff_tingkat_pendidikan, jurusan_pendidikan, kode
	                FROM reff_jurusan_pendidikan WHERE id_reff_tingkat_pendidikan =:id_reff_tingkat_pendidikan";
        // $sql = " SELECT id_reff_jurusan_pendidikan, id_reff_tingkat_pendidikan, jurusan_pendidikan, kode FROM reff_jurusan_pendidikan";
        echo $this->dbDataSelectAndReturnAll($sql, $params);
    }

    public function PUBLIC_getNamaJurusan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = " SELECT id_reff_nama_jurusan, id_reff_tingkat_pendidikan, id_reff_jurusan_pendidikan, kode, nama_jurusan
	                FROM reff_nama_jurusan WHERE id_reff_jurusan_pendidikan=:id_reff_jurusan_pendidikan";
        // $sql = " SELECT id_reff_nama_jurusan, id_reff_tingkat_pendidikan, id_reff_jurusan_pendidikan, kode, nama_jurusan FROM reff_nama_jurusan";
        echo $this->dbDataSelectAndReturnAll($sql, $params);
    }

    public function PUBLIC_getJabatan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = " SELECT id_reff_jabatan_kerja, kode, jabatan_kerja
                    FROM reff_jabatan_kerja";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getNamaJabatan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = " SELECT id_reff_nama_jabatan, id_reff_jabatan_kerja, kode_jabatan_kerja, kode, nama_jabatan
                    FROM reff_nama_jabatan WHERE id_reff_jabatan_kerja=:id_reff_jabatan_kerja";
        // $sql = " SELECT id_reff_nama_jabatan, id_reff_jabatan_kerja, kode_jabatan_kerja, kode, nama_jabatan FROM reff_nama_jabatan";
        echo $this->dbDataSelectAndReturnAll($sql, $params);
    }


    public function PUBLIC_getUpah()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = " SELECT id_upah_pencaker, upah_pencaker
                    FROM reff_upah_pencaker";
        echo $this->dbDataSelectAndReturnAll($sql);
    }


    public function PUBLIC_getKecamatan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = " SELECT id_reff_kecamatan, ID_PROP, ID_KAB, ID_KEC, KECAMATAN
                    FROM reff_kecamatan";
        echo $this->dbDataSelectAndReturnAll($sql);
    }


    public function PUBLIC_getDesa()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = " SELECT id_reff_desa, id_reff_kecamatan, ID_PROP, ID_KAB, ID_KEC, ID_KEL, KELURAHAN, KODE_POS FROM reff_desa
                    WHERE id_reff_kecamatan = :id_reff_kecamatan";
        echo $this->dbDataSelectAndReturnAll($sql, $params);
    }

     public function PUBLIC_getNik(){
        $params = isset($_GET) ? $_GET : $_POST; 
        // print_r($params);exit();
        
        $sql = "SELECT nik FROM pencari_kerja WHERE nik=:nik";
        // echo $this->debugSQL($sql,$params);exit();

        $hasil = $this->dbDataGetValue($sql,$params);      

        if ($hasil == 0) {
              echo '{"success" : false, "msg":"Nik belum ada silahkan lanjutkan untuk pengisian form"}';
        } else {
            echo '{"success" : false, "msg":"Nik sudah ada silahkan lakukan edit!"}';
        }
    }

    /*public function PUBLIC_pdf()
    {
        $data['value'] = $this->PUBLIC_list(true);
        $i=0;
        $data['judul'] = "Export data pdf";
        $pdf = $this->createHtml2Pdf();
        $pdf->setPageSize(210, 330, 'P'); // width, height, orientation = [P]ortrait [L]anscape
        $pdf->setMargins(7, 7, 10, 15); // left, right, top, bottom (milimeter)
        $pdf->mpdf->defaultfooterline = 0;
        $pdf->addHtmlFile('tpl_pdf.html', $data);
        $pdf->savePdf("Data-pdf.pdf");
    }*/
}
