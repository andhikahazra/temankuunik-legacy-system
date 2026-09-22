<?php

class IdentitasPemberiKerja extends Database
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
            "a.nama_pemberi_kerja", 
            "a.id_reff_lapangan_usaha",
            "a.alamat",
            "a.id_reff_kecamatan",
            "a.id_reff_desa",
            "a.no_tlp",
            "a.email",
            "a.kode_pos",
            "a.kontak_person",
            "a.jabatan",
            "b.lapangan_usaha",
            "c.KECAMATAN",
            "d.KELURAHAN",
            "e.nama_badan_usaha"
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
        $sql = 'SELECT a.*, b.lapangan_usaha, c.KECAMATAN, d.KELURAHAN, e.nama_badan_usaha
                    FROM identitas_pemberi_kerja a
                LEFT JOIN reff_lapangan_usaha b
                    ON a.id_reff_lapangan_usaha = b.`id_reff_lapangan_usaha`
                LEFT JOIN `reff_kecamatan` c
                    ON a.`id_reff_kecamatan`=c.`id_reff_kecamatan`
                LEFT JOIN `reff_desa`d
                    ON a.`id_reff_desa`=d.`id_reff_desa`
                LEFT JOIN reff_badan_usaha e
                    ON a.id_reff_badan_usaha=e.id_reff_badan_usaha';

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
            $sql .= " limit $start,$limit";
        }

        // echo $this->debugSQL($sql,$params);die;
        $arrayData = $this->dbDataSelectAndReturnAll($sql, $params, true);
        if ($return) {
            return $arrayData;
        }
        $array = array();
        $sqlCount = "SELECT count(*) FROM identitas_pemberi_kerja ";
        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }


    public function PUBLIC_cekNama($namakerja)
    {
        $params = isset($_GET) ? $_GET : $_POST;

        $sql = "SELECT nama_pemberi_kerja FROM identitas_pemberi_kerja WHERE nama_pemberi_kerja='$namakerja'";

        $hasil = $this->dbDataGetValue($sql);
        
        //print_r($hasil);exit();
        if ($hasil == ''){
           return false;
        } else {
            return true;

        }
    }


    public function PUBLIC_add()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];
        $id_reff_desa = $params['data']['id_reff_desa'];

        if($id_reff_desa == null && $id_reff_desa == ''){
            $desa =0;
        }else {
            $desa =$id_reff_desa;
        }

        $namakerja = $params['data']["nama_pemberi_kerja"];

        $cek_nama = $this->PUBLIC_cekNama($namakerja);

        if ($cek_nama == '1'){
              echo '{"success" : false, "msg":"Nama pemberi kerja sudah ada silahkan lakukan edit!"}';
               exit();

        } else {
            
             $sql = "INSERT INTO identitas_pemberi_kerja (nama_pemberi_kerja,
                                                          id_reff_badan_usaha,
                                                          id_reff_lapangan_usaha,
                                                          id_reff_nama_usaha,
                                                          alamat,
                                                          id_reff_kecamatan,
                                                          id_reff_desa,
                                                          id_reff_provinsi,
                                                          id_reff_kabupaten,
                                                          no_tlp,
                                                          email,
                                                          kode_pos,
                                                          kontak_person,
                                                          jabatan,
                                                          user_input,
                                                          tgl_input)
                                                VALUES 
                                                          (:nama_pemberi_kerja,
                                                           :id_reff_badan_usaha,
                                                           :id_reff_lapangan_usaha,
                                                           :id_reff_nama_usaha,
                                                           :alamat,
                                                           :id_reff_kecamatan,
                                                           '".$desa."',
                                                           :id_reff_provinsi,
                                                           :id_reff_kabupaten,
                                                           :no_tlp,
                                                           :email,
                                                           :kode_pos,
                                                           :kontak_person,
                                                           :jabatan,
                                                           '".$user."',
                                                           NOW())";
                // echo $this->debugSql($sql,$params['data']);exit();
                echo $this->dbDataExecute($sql, $params['data']);
        }


    
        
    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];

        $sql = "UPDATE identitas_pemberi_kerja SET nama_pemberi_kerja=:nama_pemberi_kerja,
                                                   id_reff_badan_usaha=:id_reff_badan_usaha,
                                                   id_reff_lapangan_usaha=:id_reff_lapangan_usaha,
                                                   id_reff_nama_usaha=:id_reff_nama_usaha,
                                                   alamat=:alamat,
                                                   id_reff_kecamatan=:id_reff_kecamatan,
                                                   id_reff_desa=:id_reff_desa,
                                                   id_reff_provinsi=:id_reff_provinsi,
                                                   id_reff_kabupaten=:id_reff_kabupaten,
                                                   no_tlp=:no_tlp,
                                                   email=:email,
                                                   kode_pos=:kode_pos,
                                                   kontak_person=:kontak_person,
                                                   jabatan=:jabatan,
                                                   user_update='".$user."',
                                                   tgl_update=NOW()
                                                   WHERE 
                                                   id_identitas_pemberikerja=:id_identitas_pemberikerja";

        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_listPrint($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userId = $this->get_userId();
        $sql = 'SELECT * FROM identitas_pemberi_kerja';
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
        echo $this->dbDataSelectAndReturnAll($sql, $params);
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
        $pdf->SetAuthor('Kominfo Programmer');
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

      public function PUBLIC_getBadanusaha()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_badan_usaha";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getLapanganusaha()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_lapangan_usaha";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

      public function PUBLIC_getNamausaha()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT id_reff_nama_usaha, kode, nama_usaha 
                FROM reff_nama_usaha
                WHERE id_reff_lapangan_usaha =:id_reff_lapangan_usaha";
        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }

    public function PUBLIC_getProvinsi()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT * FROM reff_provinsi";
        echo $this->dbDataSelectAndReturnAll($sql);
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
        echo $this->dbDataSelectAndReturnAll($sql, $params);
    }

   public function PUBLIC_getKecamatan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        $id_reff_kabupaten=$params['id_reff_kabupaten'];
        if(empty($id_reff_kabupaten)){
            $where = "WHERE 1=1";
        } else {
            $where = "WHERE id_reff_kabupaten='".$id_reff_kabupaten."'";
        }
        $sql = "SELECT * FROM reff_kecamatan $where";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getKalurahan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit();
        if (!empty($params['id_reff_kecamatan'])){
            $where =" b.id_reff_kecamatan=:id_reff_kecamatan ";
        } else {
            $where =" 1=1 LIMIT 1,0";
        }
        $sql = "SELECT b.`id_reff_kecamatan`, IFNULL(a.`id_reff_desa`,0) AS id_reff_desa, a.`KODE_POS`, a.`KELURAHAN` FROM reff_desa a
                RIGHT JOIN reff_kecamatan b
                ON a.`id_reff_kecamatan`=b.`id_reff_kecamatan` WHERE $where";
           // echo $this->debugSql($sql,$params);exit();
        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "DELETE FROM identitas_pemberi_kerja WHERE id_identitas_pemberikerja=:id_identitas_pemberikerja";
        echo $this->dbDataExecute($sql, $params['data']);
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
