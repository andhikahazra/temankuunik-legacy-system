<?php

class BukuHari extends Database
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
            "id_tamu","kepentingan","Catatan","tgl_input"];
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
        // print_r($params);exit;
        $bulan = $params['bulan'];
        $tahun = $params['tahun'];
        if (($tahun==0) OR ($bulan==0)){

            $tanggal=date("Y-m-d");
            $bulan=date('m');
            $tahun=date('Y');
        }else{
            // print_r($params);exit();
            // CONCAT(@tahun, '-', @bulan, '-01')
            $tanggal=$params['tahun' ].'-'.$params['bulan'].'-01';
        }


        

        $userId = $this->get_userId();
        $sql = "SELECT t2.*,ifnull(k2.jml,0) jml from
                (select tgl from tanggal t where tgl <= DAY(LAST_DAY('$tanggal'))) t2
                left join
                (select date(k.tgl_input) tglk , count(*) jml from kunjungan k 
                where month(k.tgl_input)=$bulan and year(k.tgl_input)=$tahun
                group by date(tgl_input) )k2 on 
                t2.tgl=day(k2.tglk) 
                order by t2.tgl";

        // print_r($sql);exit;

        $array1 = $this->dbDataSelectAndReturnAll($sql, $params, true);

        $sql2 = "SELECT t2.*,ifnull(k2.jml,0) jml from
                (select tgl from tanggal t where tgl <= DAY(LAST_DAY('$tanggal'))) t2
                left join
                (select date(k.tgl_input) tglk , count(distinct(id_tamu)) jml from kunjungan k 
                where month(k.tgl_input)=$bulan and year(k.tgl_input)=$tahun
                group by date(tgl_input) )k2 on 
                t2.tgl=day(k2.tglk) 
                order by t2.tgl";

        $array2 = $this->dbDataSelectAndReturnAll($sql2, $params, true);

        $arrayData = array();
        $arrayData['kunjungans']=$array1;
        $arrayData['kunjungan']=$array2;
        $array = array();
        
        $array['success']= true;
        $array['result'] = (array)$arrayData;
        echo json_encode($array);
    }

    public function PUBLIC_listPrint($return = false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $userId = $this->get_userId();
        $sql = 'SELECT * FROM kunjungan';
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
        $sql = "insert into kunjungan (id_tamu,kepentingan,Catatan,tgl_input) VALUES 
                                          (:id_tamu,:kepentingan,:Catatan,:tgl_input)";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_update()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "update kunjungan set id_tamu=:id_tamu,kepentingan=:kepentingan,Catatan=:Catatan,tgl_input=:tgl_input
                 WHERE id=:id";
        echo $this->dbDataExecute($sql, $params['data']);
    }

    public function PUBLIC_delete()
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "delete from kunjungan WHERE id=:id";
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
