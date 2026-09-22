<?php

class LowonganPekerjaan extends Database
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
            "a.tgl_pendaftaran",
            "a.nomor_pendaftaran",
            "b.nama_pemberi_kerja",
            "c.mekanisme_penempatan",
            "d.tingkat_pendidikan",
            "e.jurusan_pendidikan",
            "f.nama_jurusan",
            "g.sistem_pengupahan",
            "h.status_hubungan_kerja",
            "i.nama_jabatan",
            "j.jenis_kelamin",
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
        $sql ="SELECT
                  a.*,
                  b.`nama_pemberi_kerja`,
                  c.`mekanisme_penempatan`,
                  d.`tingkat_pendidikan`,
                  e.`jurusan_pendidikan`,
                  f.`nama_jurusan`,
                  g.`sistem_pengupahan`,
                  h.`status_hubungan_kerja`,
                  i.`nama_jabatan`,
                  j.`jenis_kelamin`,
                  k.`provinsi` as negara,
                  l.kabupaten as kota
                FROM
                  lowongan_pekerjaan a
                  LEFT JOIN identitas_pemberi_kerja b
                    ON a.`id_identitas_pemberikerja` = b.`id_identitas_pemberikerja`
                  LEFT JOIN `reff_mekanisme_penempatan` c
                    ON a.`id_reff_mekanisme_penempatan` = c.`id_reff_mekanisme_penempatan`
                  LEFT JOIN reff_tingkat_pendidikan d
                    ON a.`id_reff_tingkat_pendidikan` = d.`id_reff_tingkat_pendidikan`
                  LEFT JOIN reff_jurusan_pendidikan e
                    ON a.`id_reff_jurusan_pendidikan` = e.`id_reff_jurusan_pendidikan`
                  LEFT JOIN `reff_nama_jurusan` f
                    ON a.`id_reff_nama_jurusan` = f.`id_reff_nama_jurusan`
                  LEFT JOIN `reff_sistem_pengupahan` g
                    ON a.`id_reff_sistem_pengupahan` = g.`id_reff_sistem_pengupahan`
                  LEFT JOIN `reff_status_hubungan_kerja` h
                    ON a.`id_reff_status_hubungan_kerja` = h.`id_reff_status_hubungan_kerja`
                  LEFT JOIN `reff_nama_jabatan` i
                    ON a.`id_reff_nama_jabatan` = i.`id_reff_nama_jabatan`
                  LEFT JOIN `reff_jk` j
                    ON a.`id_reff_jk` = j.`id_reff_jk`
                  LEFT JOIN `reff_provinsi` k
                    ON a.`id_reff_provinsi` = k.`id_reff_provinsi`
                  LEFT JOIN `reff_kabupaten` l
                    ON a.`id_reff_kabupaten` = l.`id_reff_kabupaten`";

        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where " . $criteria;
        }
        if (isset($_POST['start'])) {
            $start = $_POST['start'];
            $limit = $_POST['length'];
            if($limit == '-1') {
                $limit = 100000;
            }
            $sql .= " limit $start,$limit ";
        }

        $arrayData = $this->dbDataSelectAndReturnAll($sql, $params, true);
        if ($return) {
            return $arrayData;
        }
        $array = array();
        $sqlCount = "SELECT count(*) FROM lowongan_pekerjaan ";
        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }

    public function PUBLIC_laporanak3($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userId = $this->get_userId();
        $sql = 'SELECT
                  a.*,
                  DATE_FORMAT(
                    a.`tgl_pendaftaran`,
                    "%d - %m - %Y"
                  ) AS tanggal,
                  b.`nama_pemberi_kerja`,
                  aa.lapangan_usaha,
                  b.alamat,
                  b.no_tlp,
                  b.email,
                  b.kode_pos,
                  b.kontak_person,
                  b.jabatan,
                  bb.KECAMATAN,
                  cc.KELURAHAN,
                  c.`mekanisme_penempatan`,
                  d.`tingkat_pendidikan`,
                  e.`jurusan_pendidikan`,
                  f.`nama_jurusan`,
                  g.`sistem_pengupahan`,
                  h.`status_hubungan_kerja`,
                  i.`nama_jabatan`,
                  j.`jenis_kelamin`,
                  k.provinsi AS negara,
                  l.kabupaten AS kota,
                  rp.`provinsi`,
                  rkb.`kabupaten`
                FROM
                  lowongan_pekerjaan a
                  LEFT JOIN identitas_pemberi_kerja b
                    ON a.`id_identitas_pemberikerja` = b.`id_identitas_pemberikerja`
                  LEFT JOIN reff_lapangan_usaha aa
                    ON b.`id_reff_lapangan_usaha` = aa.`id_reff_lapangan_usaha`
                  LEFT JOIN `reff_kecamatan` bb
                    ON b.`id_reff_kecamatan` = bb.`id_reff_kecamatan`
                  LEFT JOIN `reff_desa` cc
                    ON b.`id_reff_desa` = cc.`id_reff_desa`
                  LEFT JOIN reff_provinsi rp
                    ON b.`id_reff_provinsi`=rp.`id_reff_provinsi`
                  LEFT JOIN reff_kabupaten rkb
                    ON b.`id_reff_kabupaten`=rkb.`id_reff_kabupaten`
                  LEFT JOIN `reff_mekanisme_penempatan` c
                    ON a.`id_reff_mekanisme_penempatan` = c.`id_reff_mekanisme_penempatan`
                  LEFT JOIN reff_tingkat_pendidikan d
                    ON a.`id_reff_tingkat_pendidikan` = d.`id_reff_tingkat_pendidikan`
                  LEFT JOIN reff_jurusan_pendidikan e
                    ON a.`id_reff_jurusan_pendidikan` = e.`id_reff_jurusan_pendidikan`
                  LEFT JOIN `reff_nama_jurusan` f
                    ON a.`id_reff_nama_jurusan` = f.`id_reff_nama_jurusan`
                  LEFT JOIN `reff_sistem_pengupahan` g
                    ON a.`id_reff_sistem_pengupahan` = g.`id_reff_sistem_pengupahan`
                  LEFT JOIN `reff_status_hubungan_kerja` h
                    ON a.`id_reff_status_hubungan_kerja` = h.`id_reff_status_hubungan_kerja`
                  LEFT JOIN `reff_nama_jabatan` i
                    ON a.`id_reff_nama_jabatan` = i.`id_reff_nama_jabatan`
                  LEFT JOIN `reff_jk` j
                    ON a.`id_reff_jk` = j.`id_reff_jk`
                  LEFT JOIN `reff_provinsi` k
                    ON a.`id_reff_provinsi` = k.`id_reff_provinsi`
                  LEFT JOIN `reff_kabupaten` l
                    ON a.`id_reff_kabupaten` = l.`id_reff_kabupaten`
                  WHERE a.`id_lowongan_pekerjaan` =:id_lowongan_pekerjaan';
                
        $rsl =  $this->dbDataSelectAndReturnAll($sql, $params);
        $hasil_return = json_decode($rsl);
        $data = $hasil_return->result[0];
          // print_r($hasil_return);exit();
            $htmlTpl = "tpl_pdf.html";
            $html = $this->createHtmlExport();
            

            $html->addHtmlFile($htmlTpl, array('result'=>$data));
               // print_r($html);exit();
            require_once 'lib/mpdf-7.0.0/vendor/autoload.php';

            $mpdf = new \Mpdf\Mpdf(['format' => 'A4',
                                    'margin_top' => 5,
                                    'margin_left' => 5,
                                    'margin_right' => 5,
                                    'mirrorMargins' => true]);

            $mpdf->curlAllowUnsafeSslRequests = true;
            $mpdf->WriteHTML($html->returnHtml());
            // $mpdf->AddPage('A4-L');
            // $mpdf->WriteHTML($html->returnHtml());
            $mpdf->Output('Laporan-AKIII.pdf','I');
            exit();
    }

 	public function generatependaftaran()
    {

        $params = isset($_GET) ? $_GET : $_POST;

        $sql = 'SELECT COUNT(id_lowongan_pekerjaan) AS maxKode FROM lowongan_pekerjaan';
        $hasil = $this->dbDataGetValue($sql);

        return $hasil;
       
    }

   
    public function PUBLIC_add()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];
        $jam_sos= implode(',',$params['data']['jaminan_sosial']);
        // $nomor_pendaftaran='001';
        $gaji=str_replace('.', '', $params['data']['gaji_sebulan']);
        $generateno= $this->generatependaftaran();
        $noUrut= $generateno + 1;
        // print_r($noUrut);exit();
        $array_bln = array(1=>"I","II","III", "IV", "V","VI","VII","VIII","IX","X", "XI","XII");
        $bulan = date('n');

        $romawi =  $array_bln[date('n')];
        $tahun = date ('Y');
        $nomor = "/DISNAKER/".$romawi."/".$tahun;
        $kode =  sprintf("%03s", $noUrut);
        // $nomor_pendaftaran = $kode.$nomor;
        $no_daftar = str_pad($noUrut, 5, "0", STR_PAD_LEFT);
        $nomor_pendaftaran = "L-".$no_daftar;
 // print_r($nomor_pendaftaran);exit();
        $sql = "INSERT into lowongan_pekerjaan (
        				nomor_pendaftaran,
                        tgl_pendaftaran,
                        batas_waktu,
                        id_identitas_pemberikerja,
                        id_reff_jabatan_kerja,
                        id_reff_nama_jabatan,
                        jml_lowongan,
                        id_reff_mekanisme_penempatan,
                        id_reff_provinsi,
                        id_reff_kabupaten,
                        id_reff_jk,
                        id_reff_tingkat_pendidikan,
                        id_reff_jurusan_pendidikan,
                        id_reff_nama_jurusan,
                        keterampilan,
                        pengalaman,
                        syarat_khusus,
                        id_reff_sistem_pengupahan,
                        gaji_sebulan,
                        id_reff_status_hubungan_kerja,
                        jml_jam_kerja,
                        jaminan_sosial,
                        uraian_pekerjaan,
                        uraian_tugas,
                        user_input,
                        tgl_input) 
                        VALUES ('".$nomor_pendaftaran."',
                                CURDATE(),
                                :batas_waktu,
                                :id_identitas_pemberikerja,
                                :id_reff_jabatan_kerja,
                                :id_reff_nama_jabatan,
                                :jml_lowongan,
                                :id_reff_mekanisme_penempatan,
                                :id_reff_provinsi,
                                :id_reff_kabupaten,
                                :id_reff_jk,
                                :id_reff_tingkat_pendidikan,
                                :id_reff_jurusan_pendidikan,
                                :id_reff_nama_jurusan,
                                :keterampilan,
                                :pengalaman,
                                :syarat_khusus,
                                :id_reff_sistem_pengupahan,
                                '".$gaji."',
                                :id_reff_status_hubungan_kerja,
                                :jml_jam_kerja,
                                '".$jam_sos."',
                                :uraian_pekerjaan,
                                :uraian_tugas,
                                '".$user."',
                                NOW())";
                                // echo $this->debugSql($sql, $params['data']);exit();
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];
        $jam_sos= implode(',',$params['data']['jaminan_sosial']);
        $gaji=str_replace('.', '', $params['data']['gaji_sebulan']);

        $sql = "UPDATE lowongan_pekerjaan SET
                        batas_waktu=:batas_waktu,
                        id_identitas_pemberikerja=:id_identitas_pemberikerja,
                        id_reff_jabatan_kerja=:id_reff_jabatan_kerja,
                        id_reff_nama_jabatan=:id_reff_nama_jabatan,
                        jml_lowongan=:jml_lowongan,
                        id_reff_mekanisme_penempatan=:id_reff_mekanisme_penempatan,
                        id_reff_provinsi=:id_reff_provinsi,
                        id_reff_kabupaten=:id_reff_kabupaten,
                        id_reff_jk=:id_reff_jk,
                        id_reff_tingkat_pendidikan=:id_reff_tingkat_pendidikan,
                        id_reff_jurusan_pendidikan=:id_reff_jurusan_pendidikan,
                        id_reff_nama_jurusan=:id_reff_nama_jurusan,
                        keterampilan=:keterampilan,
                        pengalaman=:pengalaman,
                        syarat_khusus=:syarat_khusus,
                        id_reff_sistem_pengupahan=:id_reff_sistem_pengupahan,
                        gaji_sebulan='".$gaji."',
                        id_reff_status_hubungan_kerja=:id_reff_status_hubungan_kerja,
                        jml_jam_kerja=:jml_jam_kerja,
                        jaminan_sosial='".$jam_sos."',
                        uraian_pekerjaan=:uraian_pekerjaan,
                        uraian_tugas=:uraian_tugas,
                        user_update='".$user."',
                        tgl_update=NOW()
                 WHERE id_lowongan_pekerjaan=:id_lowongan_pekerjaan";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "DELETE FROM lowongan_pekerjaan WHERE id_lowongan_pekerjaan=:id_lowongan_pekerjaan";
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
        $pdf = $this->createHtml2Pdf(null, $data, 'cetak_pdf.html');
        // set document information
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Programmer Diskominfo Sleman');
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


    public function PUBLIC_getIdentitaspemberikerja()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM identitas_pemberi_kerja";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

     public function PUBLIC_getJabatankerja()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT id_reff_jabatan_kerja, kode, jabatan_kerja
                FROM reff_jabatan_kerja";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getNamajabatan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $sql = "SELECT * FROM reff_nama_jabatan 
                WHERE id_reff_jabatan_kerja=:id_reff_jabatan_kerja";
                 // echo $this->debugSql($sql, $params);exit();
        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }


    public function PUBLIC_getJeniskelamin()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_jk";
        echo $this->dbDataSelectAndReturnAll($sql);
    }


    public function PUBLIC_getMekanismePenempatan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_mekanisme_penempatan";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getProvinsi()
    {
        $params = isset($_GET) ? $_GET : $_POST;

        $id_reff_mekanisme_penempatan=$params['id_reff_mekanisme_penempatan'];
        if(empty($id_reff_mekanisme_penempatan)){
            $where = "WHERE 1=1";
        } else {
            $where = "WHERE id_reff_mekanisme_penempatan='".$id_reff_mekanisme_penempatan."'";
        }
        // print_r($params);exit();
        $sql = "SELECT * FROM reff_provinsi $where";
           // echo $this->debugSql($sql,$params);exit();
        echo $this->dbDataSelectAndReturnAll($sql, $params);
    }

     public function PUBLIC_getKabupaten()
    {
        $params = isset($_GET) ? $_GET : $_POST;

        $id_reff_provinsi=$params['id_reff_provinsi'];
        if(empty($id_reff_provinsi)){
            $where = "WHERE 1=1";
        } else {
            $where = "WHERE id_reff_provinsi='".$id_reff_provinsi."'";
        }
        // print_r($params);exit();
        $sql = "SELECT * FROM reff_kabupaten $where";
           // echo $this->debugSql($sql,$params);exit();
        // echo $this->dbDataSelectAndReturnAll($sql, $params);
        echo $this->dbFwSelectAndReturnAll($sql, $params);
    }

    public function PUBLIC_getPendkformal()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_tingkat_pendidikan";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getPendktinggi()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        if (!empty($params['id_reff_tingkat_pendidikan'])){
            $where =" id_reff_tingkat_pendidikan=:id_reff_tingkat_pendidikan ";
        } else {
            $where =" 1=1";
        }
        $sql = "SELECT * FROM reff_jurusan_pendidikan WHERE $where";
           // echo $this->debugSql($sql,$params);exit();
        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }

    public function PUBLIC_getPendkjurusan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        if (!empty($params['id_reff_jurusan_pendidikan'])){
            $where =" id_reff_jurusan_pendidikan=:id_reff_jurusan_pendidikan ";
        } else {
            $where =" 1=1";
        }
        $sql = "SELECT * FROM reff_nama_jurusan WHERE $where";
           // echo $this->debugSql($sql,$params);exit();
        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }

      public function PUBLIC_getPengupahan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_sistem_pengupahan";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getHubkerja()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_status_hubungan_kerja";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

  
    public function PUBLIC_getJaminansosial()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_jaminan_sosial";
        echo $this->dbDataSelectAndReturnAll($sql);
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
