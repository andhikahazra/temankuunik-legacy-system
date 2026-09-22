<?php

class ReffNamaJurusan extends Database
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
            "nj.id_reff_nama_jurusan",
            "nj.id_reff_jurusan_pendidikan",
            "nj.kode",
            "nj.nama_jurusan",
            "jp.jurusan_pendidikan",
            "jp.kode",
            "tp.id_reff_tingkat_pendidikan",
            "tp.tingkat_pendidikan",
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
        $sql = 'SELECT nj.id_reff_nama_jurusan, nj.id_reff_jurusan_pendidikan, nj.kode, nj.nama_jurusan, jp.jurusan_pendidikan, jp.kode kd_jurusan_pendidikan, tp.id_reff_tingkat_pendidikan, tp.tingkat_pendidikan
                FROM reff_nama_jurusan nj 
                LEFT JOIN reff_jurusan_pendidikan jp USING (id_reff_jurusan_pendidikan)
                LEFT JOIN reff_tingkat_pendidikan tp ON (tp.id_reff_tingkat_pendidikan = jp.id_reff_tingkat_pendidikan)';
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
        $sqlCount = "SELECT count(*) FROM reff_nama_jurusan ";
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
        $sql = 'SELECT * FROM reff_nama_jurusan';
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

    public function PUBLIC_add()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "INSERT INTO reff_nama_jurusan (id_reff_tingkat_pendidikan, id_reff_jurusan_pendidikan,kode,nama_jurusan) VALUES 
                                          (:id_reff_tingkat_pendidikan, :id_reff_jurusan_pendidikan,:kode,:nama_jurusan)";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "UPDATE reff_nama_jurusan set id_reff_tingkat_pendidikan=:id_reff_tingkat_pendidikan,id_reff_jurusan_pendidikan=:id_reff_jurusan_pendidikan,kode=:kode,nama_jurusan=:nama_jurusan
                 WHERE id_reff_nama_jurusan=:id_reff_nama_jurusan";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "DELETE FROM reff_nama_jurusan WHERE id_reff_nama_jurusan=:id_reff_nama_jurusan";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_getTingkatPendidikan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT id_reff_tingkat_pendidikan, tingkat_pendidikan, kode, keterangan FROM reff_tingkat_pendidikan";
        echo $this->dbDataSelectAndReturnAll($sql);
    }

    public function PUBLIC_getJurusanPendidikan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "SELECT id_reff_jurusan_pendidikan, id_reff_tingkat_pendidikan, jurusan_pendidikan, kode FROM reff_jurusan_pendidikan WHERE id_reff_tingkat_pendidikan=:id_reff_tingkat_pendidikan";
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
