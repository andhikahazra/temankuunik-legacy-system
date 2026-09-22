<?php

class UserUnit extends Database
{

    function __construct()
    {
        parent::__construct();
    }

    public function PUBLIC_userList($ret = false)
    {
        $sql  = "SELECT * FROM users";
        if ($ret) {
            return $this->dbDataSelectAndReturnAll($sql, null, true);
        } else {
            echo $this->dbDataSelectAndReturnAll($sql);
        }
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
            "kode_instansi", "kode_indikator"
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

    public function PUBLIC_list_old($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userId = $this->get_userId();
        if (isset($_POST['kode_instansi'])) {
            $kodeInstansi = $_POST['kode_instansi'];
        } else {
            $kodeInstansi = '';
        }
        $sql = 'SELECT * FROM ref_sumberdata';
        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where " . $criteria;
            $sql .= " and kode_sumberdata not in
                     (select kode_sumberdata from instansi_has_sumberdata 
                     where kode_instansi='$kodeInstansi')";
        } else {
            $sql .= " where kode_sumberdata not in
                     (select kode_sumberdata from instansi_has_sumberdata 
                     where kode_instansi='$kodeInstansi')";
        }
        if (isset($_POST['start'])) {
            $start = $_POST['start'];
            $limit = $_POST['length'];
            if ($limit == '-1') {
                $limit = 100000;
            }
            $sql .= " limit $start,$limit ";
        }
        //        echo $sql;exit();
        $arrayData = $this->dbDataSelectAndReturnAll($sql, $params, true);
        if ($return) {
            return $arrayData;
        }
        $array = array();
        $sqlCount = "SELECT count(*) FROM instansi_has_indikator ";
        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where " . $criteria;
            $sql .= " and kode_sumberdata not in
                     (select kode_sumberdata from instansi_has_sumberdata 
                     where kode_instansi='$kodeInstansi')";
        } else {
            $sql .= " where kode_sumberdata not in
                     (select kode_sumberdata from instansi_has_sumberdata 
                     where kode_instansi='$kodeInstansi')";
        }

        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }

    public function PUBLIC_list($return = false)
    {
        error_reporting(0);
        $params = isset($_GET) ? $_GET : $_POST;
        $currYear = $_POST['year'];
        // $userUnit = $this->PUBLIC_getUserInstansi(true);
        // $data['app'] = 'teppa';
        // $data['module'] = 'getListInstansi';
        // $data['action'] = 'read';
        // $data['json'] = '{%22tahun%22:%22' . $currYear . '%22}';
        // $response = $this->requestApi($data);
        // $response = json_decode($response);
        // $response = $response->result;

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://interop.slemankab.go.id/api/xqj56?level=1",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "Authorization: Basic ZnpjbTVhdmU6ZzM1T0JyN0JZYlhtQnhrWmxQWm5OdldJQllTOGhxMW4="
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            $response = json_decode($response);
            $response = $response->result;
            // echo $response;
        }

        // die;

        $userId = $_POST['user_id'];

        $sqlUserInstansi = "SELECT kode_unit_kerja FROM user_has_unit WHERE user_id='$userId'";
        $arrayDataInstansi = $this->dbDataSelectAndReturnAll($sqlUserInstansi, $params, true);


        $sql = "SELECT * FROM reff_unit_kerja where level_unit_kerja<=2 order by kode_unit_kerja ASC";
        // echo $this->dbDataSelectPaging($sql,$params,$start,$limit);
        $arrayDataInstansi3 = $this->dbFwSelectAndReturnAll($sql,$params,true);
        // $arrayDataInstansi = $arrayDataInstansi->result;
        

        $arrayDataInstansi2 = array();
        foreach ($arrayDataInstansi as $val) {
            array_push($arrayDataInstansi2, $val->kode_unit_kerja);
        }
        $newData = array();
        
        // foreach ($response as $val) {
        foreach ($arrayDataInstansi3 as $val) {
            if (!in_array($val->kode_unit_kerja, $arrayDataInstansi2)) {
                array_push($newData, $val);
            }
        }

        // print_r($newData);exit;
        $dataDev = array(
            "kode_unit_kerja" => "777",
            "unit_kerja" => "Developer",
            "nama_unit_kerja_lengkap" => "Developer",
            "nama_unit_kerja_pendek" => "Developer",
            "id_eselon" => "21",
            "level_unit_kerja" => "1",
            "nomor_unit_kerja" =>" ",
            "kode_unit_kerja_parent" => "01",
            "aktif" => "1",
            "caption_kepala_unit_kerja" => "Developer",
        );
        array_push($newData, $dataDev);

        // print_r($newData);exit;
        $array = array();
        $countData = count($newData);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$newData;
        echo json_encode($array);
    }

    public function PUBLIC_list2($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $currYear = $_POST['year'];
        //        $userUnit = $this->PUBLIC_getUserInstansi(true);
        // $data['app'] = 'teppa';
        // $data['module'] = 'getListInstansi';
        // $data['action'] = 'read';
        // $data['json'] = '{%22tahun%22:%22' . $currYear . '%22}';
        // $response = $this->requestApi($data);
        // $response = json_decode($response);
        // $response = $response->result;

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://interop.slemankab.go.id/api/xqj56?level=1",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "Authorization: Basic ZnpjbTVhdmU6ZzM1T0JyN0JZYlhtQnhrWmxQWm5OdldJQllTOGhxMW4="
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            $response = json_decode($response);
            $response = $response->result;
            // echo $response;
        }

        $userId = $_POST['user_id'];

        $sqlUserInstansi = "SELECT kode_unit_kerja FROM user_has_unit WHERE user_id='$userId'";
        $arrayDataInstansi = $this->dbDataSelectAndReturnAll($sqlUserInstansi, $params, true);
        // print_r($arrayDataInstansi);die;

        $sql = "SELECT * FROM reff_unit_kerja where level_unit_kerja<=2 order by kode_unit_kerja ASC";
        // echo $this->dbDataSelectPaging($sql,$params,$start,$limit);
        $arrayDataInstansi3 = $this->dbFwSelectAndReturnAll($sql,$params,true);


        $arrayDataInstansi2 = array();
        foreach ($arrayDataInstansi as $val) {
            array_push($arrayDataInstansi2, $val->kode_unit_kerja);
        }
        $newData = array();
        
        // print_r((array)$arrayDataInstansi2);exit;
        foreach ($arrayDataInstansi3 as $val) {
            if (in_array($val->kode_unit_kerja, $arrayDataInstansi2)) {
                array_push($newData, $val);
            }
        }
            //    print_r($newData);exit;
        $array = array();
        $countData = count($newData);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$newData;
        echo json_encode($array);
    }

    public function PUBLIC_list2_old($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userId = $this->get_userId();
        if (isset($_POST['kode_instansi'])) {
            $kodeInstansi = $_POST['kode_instansi'];
        } else {
            $kodeInstansi = '';
        }
        $sql = 'SELECT * FROM ref_sumberdata';
        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where " . $criteria;
            $sql .= " and kode_sumberdata in(select kode_sumberdata from instansi_has_sumberdata 
            where kode_instansi='$kodeInstansi')";
        } else {
            $sql .= " where kode_sumberdata in(select kode_sumberdata from instansi_has_sumberdata 
            where kode_instansi='$kodeInstansi')";
        }
        //        echo $sql;exit();
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
        $sqlCount = "SELECT count(*) FROM instansi_has_sumberdata ";
        if (isset($_POST['search']['value']) && $_POST['search']['value'] != '') {
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where " . $criteria;
            $sql .= " and kode_sumberdata in(select kode_sumberdata from instansi_has_sumberdata 
            where kode_instansi='$kodeInstansi')";
        } else {
            $sql .= " where kode_sumberdata in(select kode_sumberdata from instansi_has_sumberdata 
            where kode_instansi='$kodeInstansi')";
        }
        $countData = $this->dbDataGetValue($sqlCount);
        $array['recordsTotal'] = $countData;
        $array['recordsFiltered'] = $countData;
        $array['draw'] = $_POST['draw'];
        $array['data'] = (array)$arrayData;
        echo json_encode($array);
    }


    public function PUBLIC_tambahkan()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        // print_r($params);exit;
        $params['data']['kode_unit_kerja2'] = $params['data']['kode_unit_kerja'];
        $sql = "INSERT INTO user_has_unit (user_id,id_unit_kerja,kode_unit_kerja) VALUES 
                                          (:user_id,:kode_unit_kerja,:kode_unit_kerja2)";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "update instansi_has_indikator set kode_instansi=:kode_instansi,kode_indikator=:kode_indikator
                 WHERE id=:id";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $params['data']['kode_unit_kerja2'] = $params['data']['kode_unit_kerja'];
        $sql = "DELETE FROM user_has_unit 
                 WHERE kode_unit_kerja=:kode_unit_kerja 
                 AND id_unit_kerja=:kode_unit_kerja2
                 AND user_id=:user_id";
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

    public function PUBLIC_getUserInstansi()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $os =  new Os;
        $unit = $os->getUserUnit();
        $unit = json_decode($unit);
        $userUnit = array();

        for ($i = 0; $i < count($unit); $i++) {
            if ($unit[$i]->id_unit < 10) {
                $unit[$i]->id_unit = sprintf('%02d', $unit[$i]->id_unit);
            }
            array_push($userUnit, $unit[$i]->id_unit);
        }
        return $userUnit;
    }
    public function PUBLIC_getListInstansi()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $currYear = $params['year'];
        //        $userUnit = $this->PUBLIC_getUserInstansi(true);
        $data['app'] = 'teppa';
        $data['module'] = 'getListInstansi';
        $data['action'] = 'read';
        $data['json'] = '{%22tahun%22:%22' . $currYear . '%22}';
        $response = $this->requestApi($data);
        $response = json_decode($response);
        $response = $response->result;
        $return = new stdClass();
        // $return->user_instansi = $userUnit;

        $return->list_instansi = $response;

        echo json_encode($return);
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
