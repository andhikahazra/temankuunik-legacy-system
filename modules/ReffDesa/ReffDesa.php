<?php

class ReffDesa extends Database
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
            "ID_PROP", "ID_KAB", "ID_KEC", "ID_KEL", "KELURAHAN", "KODE_POS"
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
        $sql = 'SELECT * FROM reff_desa';
        // $sql = 'SELECT * FROM reff_desa d LEFT JOIN reff_kecamatan k USING (id_reff_kecamatan)';
        $sql = "SELECT
                  *
                FROM
                  reff_desa d
                  LEFT JOIN reff_kecamatan kc
                    ON d.`id_reff_kecamatan` = kc.`id_reff_kecamatan`
                  LEFT JOIN reff_kabupaten kbp
                    ON d.`id_reff_kabupaten` = kbp.`id_reff_kabupaten`
                  LEFT JOIN reff_provinsi p
                    ON d.`id_reff_provinsi` = p.`id_reff_provinsi`";

        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " WHERE " . $criteria;
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
        $sqlCount = "SELECT count(*) FROM reff_desa ";
        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }

    public function PUBLIC_listPrint($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userId = $this->get_userId();
        // $sql = 'SELECT * FROM reff_desa';
        $sql = "SELECT
                  *
                FROM
                  reff_desa d
                  LEFT JOIN reff_kecamatan kc
                    ON d.`id_reff_kecamatan` = kc.`id_reff_kecamatan`
                  LEFT JOIN reff_kabupaten kbp
                    ON d.`id_reff_kabupaten` = kbp.`id_reff_kabupaten`
                  LEFT JOIN reff_provinsi p
                    ON d.`id_reff_provinsi` = p.`id_reff_provinsi`";
                    
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
        echo $this->dbDataSelectAndReturnAll($sql, $params);
    }

    public function PUBLIC_add()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];
      
        $sql = "INSERT INTO reff_desa (
                  id_reff_provinsi,
                  id_reff_kabupaten,
                  id_reff_kecamatan,
                  KELURAHAN,
                  KODE_POS,
                  user_input,
                  tgl_input
                  
                )
                VALUES
                  (
                    :id_reff_provinsi,
                    :id_reff_kabupaten,
                    :id_reff_kecamatan,
                    :KELURAHAN,
                    :KODE_POS,
                    '".$user."',
                    NOW()
                  )";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $user=$userParams[0]['user_id'];
  
        $sql = "UPDATE
                  reff_desa
                SET
                  id_reff_provinsi = :id_reff_provinsi,
                  id_reff_kabupaten = :id_reff_kabupaten,
                  id_reff_kecamatan = :id_reff_kecamatan,
                  KELURAHAN = :KELURAHAN,
                  KODE_POS = :KODE_POS,
                  user_update = '".$user."',
                  tgl_update = NOW()
                WHERE id_reff_desa = :id_reff_desa";

        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "DELETE FROM reff_desa WHERE id_reff_desa=:id_reff_desa";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    // public function PUBLIC_getKecamatan()
    // {
    //     $params = isset($_GET) ? $_GET : $_POST;
    //     $sql = "SELECT id_reff_kecamatan, ID_PROP, ID_KAB, ID_KEC, KECAMATAN FROM reff_kecamatan";
    //     echo $this->dbDataSelectAndReturnAll($sql);
    // }

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
        // echo $this->dbDataSelectAndReturnAll($sql, $params);
        echo $this->dbFwSelectAndReturnAll($sql, $params);
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
