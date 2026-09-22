<?php

class PenempatanKerja extends Database
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
          "a.id_penempatan_kerja",
          "a.nik",
          "a.nama_lengkap",
          "b.jenis_kelamin",
          "a.tgl_penempatan",
          "a.id_reff_tingkat_pendidikan",
          "a.id_reff_jurusan_pendidikan",
          "a.id_reff_nama_jurusan",
          "d.nama_pemberi_kerja",
          "d.alamat",
          "a.nomor_pendaftaran",
          "a.batas_waktu",
          "a.jml_lowongan",
          "a.id_identitas_pemberikerja",
          "a.id_reff_nama_jabatan",
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
        $sql ="SELECT a.id_penempatan_kerja,
                      a.nomor_penempatan,
                      a.id_pencari_kerja,
                      a.id_lowongan_pekerjaan,
                      a.nik,
                      a.`nama_lengkap`,
                      b.jenis_kelamin,
                      a.tgl_penempatan,
                      a.id_reff_tingkat_pendidikan,
                      a.id_reff_jurusan_pendidikan,
                      a.id_reff_nama_jurusan,
                      d.nama_pemberi_kerja,
                      d.alamat,
                      a.nomor_pendaftaran,
                      a.batas_waktu,
                      a.jml_lowongan,
                      a.`id_identitas_pemberikerja`,
                      a.id_reff_jabatan_kerja,
                      a.`id_reff_nama_jabatan`,
                      c.id_reff_jk as id_reff_jk_tmpt,
                      a.id_reff_tingkat_pendidikan_tmpt,
                      a.id_reff_jurusan_pendidikan_tmpt,
                      a.id_reff_nama_jurusan_tmpt

              FROM penempatan_kerja a
              LEFT JOIN pencari_kerja b ON (a.`id_pencari_kerja` = b.`id_pencari_kerja`)
              LEFT JOIN lowongan_pekerjaan c ON (a.`id_lowongan_pekerjaan` = c.`id_lowongan_pekerjaan`)
              LEFT JOIN identitas_pemberi_kerja d ON (c.`id_identitas_pemberikerja` = d.`id_identitas_pemberikerja`)";

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
        $sqlCount = "SELECT count(*) FROM penempatan_kerja ";
        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }

        public function generatependaftaran()
    {

        $params = isset($_GET) ? $_GET : $_POST;

        $sql = 'SELECT COUNT(id_penempatan_kerja) AS maxKode FROM penempatan_kerja';
        $hasil = $this->dbDataGetValue($sql);

        return $hasil;
       
    }

      public function PUBLIC_cekNik($nonik)
    {
        $params = isset($_GET) ? $_GET : $_POST;

        $sql = "SELECT nik FROM penempatan_kerja WHERE nik='$nonik'";
        $hasil = $this->dbDataGetValue($sql);
        

        if ($hasil == 0){
           return false;
        } else {
            return true;

        }
    }

   
    public function PUBLIC_add()
    {
        $params = isset($_GET) ? $_GET : $_POST;
       
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];

        $nonik = $params['data']["nik"]; 
        $cek_nik = $this->PUBLIC_cekNik($nonik);

        $generateno= $this->generatependaftaran();
        $noUrut= $generateno + 1;
        $no_daftar = str_pad($noUrut, 5, "0", STR_PAD_LEFT);
        $nomor_penempatan = "T-".$no_daftar;
 
     
        if ($cek_nik == '0'){
            $sql = "INSERT into penempatan_kerja (
                                nomor_penempatan,
                                tgl_penempatan,
                                id_pencari_kerja,
                                id_lowongan_pekerjaan,
                                nik,
                                nama_lengkap,
                                nomor_pendaftaran,
                                id_reff_tingkat_pendidikan,
                                id_reff_jurusan_pendidikan,
                                id_reff_nama_jurusan,
                                id_identitas_pemberikerja,
                                id_reff_jabatan_kerja,
                                id_reff_nama_jabatan,
                                jml_lowongan,
                                batas_waktu,
                                id_reff_tingkat_pendidikan_tmpt,
                                id_reff_jurusan_pendidikan_tmpt,
                                id_reff_nama_jurusan_tmpt,
                                tgl_input,
                                user_input)

                            VALUES ('".$nomor_penempatan."',
                                    :tgl_penempatan,
                                    :id_pencari_kerja,
                                    :id_lowongan_pekerjaan,
                                    :nik,
                                    :nama_lengkap,
                                    :nomor_pendaftaran,
                                    :id_reff_tingkat_pendidikan,
                                    :id_reff_jurusan_pendidikan,
                                    :id_reff_nama_jurusan,
                                    :id_identitas_pemberikerja,
                                    :id_reff_jabatan_kerja,
                                    :id_reff_nama_jabatan,
                                    :jml_lowongan,
                                    :batas_waktu,
                                    :id_reff_tingkat_pendidikan_tmpt,
                                    :id_reff_jurusan_pendidikan_tmpt,
                                    :id_reff_nama_jurusan_tmpt,
                                    NOW(),
                                    '".$user."')";
                                    // echo $this->debugSql($sql, $params['data']);exit();
                            echo $this->dbDataExecute($sql, $params['data']);

                       
        }else {

                 echo '{"success" : false, "msg":"Nik sudah ada silahkan lakukan edit!"}';
               exit();

        }
    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];

        $sql = "UPDATE penempatan_kerja SET
                            nomor_penempatan=:nomor_penempatan,
                            tgl_penempatan=:tgl_penempatan,
                            id_pencari_kerja=:id_pencari_kerja,
                            id_lowongan_pekerjaan=:id_lowongan_pekerjaan,
                            nik=:nik,
                            nama_lengkap=:nama_lengkap,
                            nomor_pendaftaran=:nomor_pendaftaran,
                            id_reff_tingkat_pendidikan=:id_reff_tingkat_pendidikan,
                            id_reff_jurusan_pendidikan=:id_reff_jurusan_pendidikan,
                            id_reff_nama_jurusan=:id_reff_nama_jurusan,
                            id_identitas_pemberikerja=:id_identitas_pemberikerja,
                            id_reff_jabatan_kerja=:id_reff_jabatan_kerja,
                            id_reff_nama_jabatan=:id_reff_nama_jabatan,
                            jml_lowongan=:jml_lowongan,
                            batas_waktu=:batas_waktu,
                            id_reff_tingkat_pendidikan_tmpt=:id_reff_tingkat_pendidikan_tmpt,
                            id_reff_jurusan_pendidikan_tmpt=:id_reff_jurusan_pendidikan_tmpt,
                            id_reff_nama_jurusan_tmpt=:id_reff_nama_jurusan_tmpt,
                            user_update='".$user."',
                            tgl_update=NOW()
                 WHERE id_penempatan_kerja=:id_penempatan_kerja";
        // echo $this->debugSql($sql, $params['data']);exit();
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "DELETE FROM penempatan_kerja WHERE id_penempatan_kerja=:id_penempatan_kerja";
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

     public function PUBLIC_getlowongan(){
         $params = isset($_GET) ? $_GET : $_POST; 
          $sql = "SELECT COUNT(*) as jml FROM penempatan_kerja WHERE id_lowongan_pekerjaan=:id";
            echo $this->dbDataSelectAndReturnAll($sql, $params);

     }

     public function PUBLIC_getloker(){
        $params = isset($_GET) ? $_GET : $_POST; 

         $sql = "SELECT a.`id_lowongan_pekerjaan`, b.`id_identitas_pemberikerja`, b.`nama_pemberi_kerja` , a.id_reff_jabatan_kerja,
                  a.id_reff_nama_jabatan , a.jml_lowongan, a.id_reff_jk, a.`id_reff_tingkat_pendidikan`, 
                  a.`id_reff_jurusan_pendidikan`, a.`id_reff_nama_jurusan` , a.`batas_waktu`, 
                  DATEDIFF(CURRENT_DATE(), a.tgl_pendaftaran) AS selisih_waktu
                 FROM lowongan_pekerjaan a
                 LEFT JOIN identitas_pemberi_kerja b
                 ON a.`id_identitas_pemberikerja`=b.`id_identitas_pemberikerja`
                 WHERE a.nomor_pendaftaran=:nomor_pendaftaran";

        echo $this->dbDataSelectAndReturnAll($sql, $params);
    
    }


    public function PUBLIC_getnik(){
        $params = isset($_GET) ? $_GET : $_POST; 

         $sql = "SELECT a.id_pencari_kerja, a.`nik`, a.`nama_lengkap`, a.`jenis_kelamin`,b.`id_reff_tingkat_pendidikan`, b.`id_reff_jurusan_pendidikan`, b.`id_reff_nama_jurusan` 
                 FROM pencari_kerja a
                 LEFT JOIN `pencari_kerja_pendidikan` b
                 ON a.`id_pencari_kerja` = b.`id_pencari_kerja`
                 WHERE a.nik=:nik";

        echo $this->dbDataSelectAndReturnAll($sql, $params);
    
    }


    public function PUBLIC_getJeniskelamin()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_jk";
        echo $this->dbDataSelectAndReturnAll($sql);
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
        
         if (!empty($params['id_reff_jabatan_kerja'])){
            $where =" id_reff_jabatan_kerja=:id_reff_jabatan_kerja ";
        } else {
            $where =" 1=1";
        }

        $sql = "SELECT * FROM reff_nama_jabatan WHERE $where";
                 // echo $this->debugSql($sql, $params);exit();
        echo $this->dbDataSelectAndReturnAll($sql,$params);
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
