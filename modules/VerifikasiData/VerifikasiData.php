<?php

class VerifikasiData extends Database
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

    private function findField() {
        $findField = [
            "judul_data_pilah"
        ];
        return $findField;
    }

    private function buildSqlSearchingCriteria($keywords, $findField) {
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

    public function PUBLIC_list($return=false)
    {
        $params = isset($_GET) ? $_GET : $_POST;
        $user = new os;
        $userData = $user->getUserData();
        $userDataArr = json_decode($userData);
//        print_r($userDataArr->param03);exit();
        if(strtolower($userDataArr->param03)=='admin'){
            $where = " where aktif=1 ";
        }else{
            $where = " where aktif=1 and lower(instansi)='".strtolower($userDataArr->param03)."' ";
        }
        $sql = 'SELECT * FROM data_pilah '.$where ;

        if(isset($_POST['search']['value']) && $_POST['search']['value'] !=''){
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
//            $sql .= " where ".$criteria;
            $sql .= " and LOWER(judul_data_pilah) like '%$keywords%'";
        }
        if (isset($_POST['start']) && $_POST['length'] != -1) {
            $start = $_POST['start'];
            $limit = $_POST['length'];
            if($limit == '-1') {
                $limit = 100000;
            }
            $sql .= " limit $start,$limit ";
        }

        $arrayData = $this->dbDataSelectAndReturnAll($sql, $params, true);
        if($return){
            return $arrayData;
        }
//        print_r($arrayData);exit;
        $c=0;
        foreach ($arrayData as $val){
            $kodeDataPilah = $val->kode_data_pilah;
            $thnAwal = (int)date("Y");
            $thn=array();
            for($i=$thnAwal-4;$i<=$thnAwal;$i++){
                array_push($thn,$i);
            }
            $thn=implode(',',$thn);
            if($val->header_baris =='Tahun'){
                $sqlVerifikasi = "select * from verifikasi_data where kode_data_pilah='$kodeDataPilah' and tahun=2014";
//                echo $sqlVerifikasi;
            }else{
                $sqlVerifikasi = "select * from verifikasi_data where kode_data_pilah='$kodeDataPilah' and tahun in ($thn)";
            }

            $verifiedData = $this->dbDataSelectAndReturnAll($sqlVerifikasi, null, true);
//            print_r($val->header_baris);exit;
            if(count($verifiedData)<5 and $val->header_baris !='Tahun'){
                $arrayData[$c]->verified=0;
            }elseif(count($verifiedData)<1 and $val->header_baris =='Tahun'){
                $arrayData[$c]->verified=0;
            }else{
                $arrayData[$c]->verified=1;
                foreach ($verifiedData as $item){
                    if($item->verified==0){
                        $arrayData[$c]->verified=0;
                        break;
                    }/*else if($val->header_baris =='Tahun' && $item->verified==1){
                        $arrayData[$c]->verified=1;
                        break;
                    }*/
                }
            }
            $c++;
        }
//        exit;
//        print_r($arrayData);exit;
        $array = array();
        $sqlCount = "SELECT count(*) FROM data_pilah $where ";
        if(isset($_POST['search']['value']) && $_POST['search']['value'] !=''){
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " and ".$criteria;
        }
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
        $sql = 'SELECT * FROM format_datagender';
        if(isset($_POST['search']['value']) && $_POST['search']['value'] !=''){
            $keywords = strtolower($_POST['search']['value']);
            $findField = $this->findField();
            $criteria = $this->buildSqlSearchingCriteria($keywords, $findField);
            $sql .= " where ".$criteria;
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

    public function PUBLIC_add(){
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "insert into format_datagender (title,grup_format) VALUES 
                                          (:title,:grup_format)";
        echo $this->dbDataExecute($sql,$params['data']);
    }

    private function format_1 ($params){
//        print_r($params);exit;
        $tahun = $params['tahun'];
        $idFormat = $params['id_format'];
        $sqlCek = "select count(*) from data_per_format where tahun=:tahun and id_format=:id_format";
        $hasil = $this->dbDataGetValue($sqlCek,$params);
        if($hasil == 0){
            $kec = array('Berbah',
                'Cangkringan',
                'Depok',
                'Gamping',
                'Godean',
                'Kalasan',
                'Minggar',
                'Mlati',
                'Moyudan',
                'Ngaglik',
                'Ngemplak',
                'Pakem',
                'Prambanan',
                'Sayegan',
                'Sleman',
                'Tempel',
                'Turi');
            $values = array();
            foreach ($kec as $val){
                $eachVal = "($idFormat,$tahun,'tahun','$val',0,0,-1)";
                array_push($values,$eachVal);
            }
            $values = implode(',',$values);
            $sqlInsert = "insert into data_per_format (id_format, tahun, kolom, baris, count_l, count_p, count_lp) VALUES 
                                                       $values
                                                       ";
            $this->dbDataExecute($sqlInsert);
        }
        $sql = "select 
                data_per_format.id_data,
                data_per_format.id_format,
                data_per_format.tahun,
                data_per_format.kolom,
                data_per_format.baris,
                data_per_format.count_l,
                data_per_format.count_p,
                (data_per_format.count_l + data_per_format.count_l) count_lp,
                format_datagender.title from data_per_format 
                inner join format_datagender on format_datagender.id_format = data_per_format.id_format
                where data_per_format.tahun=:tahun and data_per_format.id_format=:id_format";
        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }

    private function format_2 ($params){
//        print_r($params);exit;
        $tahun = $params['tahun'];
        $idFormat = $params['id_format'];
        $sqlCek = "select count(*) from data_per_format where tahun=:tahun and id_format=:id_format";
        $hasil = $this->dbDataGetValue($sqlCek,$params);
        $rowId='';
        $kec = array('Berbah',
                     'Cangkringan',
                     'Depok',
                     'Gamping',
                     'Godean',
                     'Kalasan',
                     'Minggar',
                     'Mlati',
                     'Moyudan',
                     'Ngaglik',
                     'Ngemplak',
                     'Pakem',
                     'Prambanan',
                     'Sayegan',
                     'Sleman',
                     'Tempel',
                     'Turi');
        $values = array();

        if($hasil == 0){
            foreach ($kec as $val){
                $rowId = md5($val.date('YMD:his'));
                $eachVal = "($idFormat,$tahun,'jml_panti','$val',-1,-1,0,'$rowId'),
                            ($idFormat,$tahun,'tahun','$val',0,0,0,'$rowId')";
                array_push($values,$eachVal);
            }
            $values = implode(',',$values);
            $sqlInsert = "insert into data_per_format (id_format, tahun, kolom, baris, count_l, count_p, count_lp,row_id) VALUES 
                                                       $values
                                                       ";
//            echo $sqlInsert;exit;
            $this->dbDataExecute($sqlInsert);
        }
        $sql = "SELECT 
                     (SELECT baris FROM data_per_format WHERE kolom='tahun' AND baris = a.`baris`) keterangan,
                     (SELECT count_lp FROM data_per_format WHERE kolom='jml_panti' AND baris = a.`baris`) jml_panti,
                     (SELECT count_l FROM data_per_format WHERE kolom='tahun' AND baris = a.`baris`) count_l,
                     (SELECT count_p FROM data_per_format WHERE kolom='tahun' AND baris = a.`baris`) count_p,
                     (SELECT count_lp FROM data_per_format WHERE kolom='tahun' AND baris = a.`baris`) count_lp,
                     b.title,a.row_id,a.tahun FROM data_per_format a
                INNER JOIN format_datagender b ON b.id_format = a.id_format
                where a.tahun=:tahun and a.id_format=:id_format group by a.baris";

        /*$sql = "select data_per_format.*,format_datagender.title from data_per_format a
                inner join format_datagender b on b.id_format = a.id_format
                where a.tahun=:tahun and a.id_format=:id_format";*/
        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }



    public function PUBLIC_getDataFormat_old(){
        $params = isset($_GET) ? $_GET : $_POST;
        $formatClass = str_replace('-','_',$params['grup_format']);
        $this->$formatClass($params);
    }

    private function inser_baris ($params){
        $kodeDatPilah = $params;
        $sqlCek = "select count(*) from data_pilah_baris where kode_data_pilah='$kodeDatPilah'";
        $hasil = $this->dbDataGetValue($sqlCek,$params);
//        print_r($hasil);exit;
        $rowId='';
        $kec = array('Berbah',
            'Cangkringan',
            'Depok',
            'Gamping',
            'Godean',
            'Kalasan',
            'Minggar',
            'Mlati',
            'Moyudan',
            'Ngaglik',
            'Ngemplak',
            'Pakem',
            'Prambanan',
            'Sayegan',
            'Sleman',
            'Tempel',
            'Turi');
        $values = array();

        if($hasil == 0){
            $urut = 1;
            foreach ($kec as $val){
                $rowId = md5($val.date('YMD:his'));
                $kodeLast = ($urut<10)?"0$urut":$urut;
                $kodeBaris = $kodeDatPilah.'.'.$kodeLast;
                $eachVal = "('$kodeDatPilah','$urut','$kodeBaris','$val',1)
                            ";
                array_push($values,$eachVal);
                $urut++;
            }
            $values = implode(',',$values);
            $sqlInsert = "insert into data_pilah_baris (kode_data_pilah, no_urut, kode_baris, nama_baris, aktif) VALUES 
                                                       $values
                                                       ";
//            echo $sqlInsert;exit;
            $this->dbDataExecute($sqlInsert);
        }
        /*$sql = "SELECT
                     (SELECT baris FROM data_per_format WHERE kolom='keterangan' AND row_id = a.`row_id`) keterangan,
                     (SELECT baris FROM data_per_format WHERE kolom='forum_komunikasi' AND row_id = a.`row_id`) forum_komunikasi,
                     (SELECT count_l FROM data_per_format WHERE kolom='ypac' AND row_id = a.`row_id`) ypac,
                     (SELECT count_p FROM data_per_format WHERE kolom='aliansi_rbm' AND row_id = a.`row_id`) aliansi_rbm,
                     (SELECT count_lp FROM data_per_format WHERE kolom='jumlah' AND row_id = a.`row_id`) jumlah,
                     b.title,a.row_id,a.tahun FROM data_per_format a
                INNER JOIN format_datagender b ON b.id_format = a.id_format
                where a.tahun=:tahun and a.id_format=:id_format GROUP BY a.row_id";*/

        /*$sql = "select data_per_format.*,format_datagender.title from data_per_format a
                inner join format_datagender b on b.id_format = a.id_format
                where a.tahun=:tahun and a.id_format=:id_format";*/
//        echo $this->dbDataSelectAndReturnAll($sql,$params);
    }

    public function PUBLIC_getDataFormat(){
        $params = isset($_GET) ? $_GET : $_POST;
        $kodeDatapilah = $params['kode_data_pilah'];
        $this->inser_baris($kodeDatapilah);
        $thn = array($params['tahun'],$params['tahun']);
        $result = array();
//        $kodeDatapilah = 16;
        $sqlGenerate = "SELECT genQueryDataPilah ('$kodeDatapilah', $thn[0], $thn[1])";
//        echo $sqlGenerate;exit;
        $sqlHasil = $this->dbDataGetValue($sqlGenerate);

//        echo $sqlHasil;exit;
        $sqlCekKolomTahun = "select lower(header_baris) from data_pilah where kode_data_pilah='$kodeDatapilah'";
        $hasilIsTahun = $this->dbDataGetValue($sqlCekKolomTahun);
        if($hasilIsTahun=='tahun'){
            $result['isTahun']=true;
        }else{
            $result['isTahun']=false;
        }

        $sqlKolom = "select a.*,
                      (select count(*) from data_pilah_kolom where kode_data_pilah='$kodeDatapilah' and header_kolom = a.header_kolom) colspan,
                      (select count(*) from data_pilah_kolom where kode_data_pilah='$kodeDatapilah' ) colspanTahun,
                      (SELECT COUNT(*) FROM (SELECT * FROM data_pilah_kolom
                  WHERE kode_data_pilah = '$kodeDatapilah' GROUP BY header_kolom
                    )xx)+1 rowspan
                      from data_pilah_kolom a where kode_data_pilah='$kodeDatapilah' order by a.kode_kolom asc ";
        $koloms = $this->dbDataSelectAndReturnAll($sqlKolom,null,true);
//print_r($koloms);exit();
        $th1 ='';
        $th2 ='';
        $curHeader = '';
        $kolomHead = array();
        $kolomParentHead = array();
        foreach ($koloms as $kol){
//            print_r($kol);exit;
            if($kol->header_kolom === '' || $kol->header_kolom === 0 || $kol->header_kolom === null){
                array_push($kolomParentHead,0);
                $kolomHead[0][] = $kol->nama_kolom;
            }else{
                array_push($kolomParentHead,$kol->header_kolom);
//                print_r($kol->header_kolom);exit;
                $kolomHead[$kol->header_kolom][] = $kol->nama_kolom;
            }
        }
//        print_r($thn);exit;
        $namaKolomArr = array();
        foreach ($thn as $th){
            $th0="<th class='th-format' colspan='".$koloms[0]->colspanTahun."'>".$th."</th>";
            foreach ($koloms as $val){
                $namaKolomArr[str_replace(".","_",$val->kode_kolom)] = $val->nama_kolom;
                if($val->header_kolom){
                    if($curHeader != $val->header_kolom){
                        $th1.="<th class='th-format' colspan='".$val->colspan."'>".$val->header_kolom."</th>";
                        $curHeader = $val->header_kolom;
                    }
                }else if(!$val->header_kolom && $val->nama_kolom !='L' && $val->nama_kolom !='P' && $val->nama_kolom !='L+P'){
                    $th1.="<th class='th-format' rowspan='".((int)$val->rowspan-1)."'>".$val->nama_kolom."</th>";
                    $curHeader = $val->header_kolom;
                }
                if($val->nama_kolom =='L' || $val->nama_kolom =='P' || $val->nama_kolom =='L+P'){
                    $th2.="<th class='th-format'>".$val->nama_kolom."</th>";
                }

            }
            if($thn[0] == $thn[1]){break;}
        }
        $tr1 = '';
        if($th1 !=''){
            $tr1 = "<tr>
                    $th1
                </tr>";
        }
//        echo $th1;exit;

        /*if( $result['isTahun']){
            $tr1 = "<tr></tr>";
        }*/

        $rowspan = ($koloms[0]->rowspan==2)?$koloms[0]->rowspan:3;
        $head = "<tr>
                    <th class='th-format' rowspan='".$rowspan."'>No</th>
                    <th class='th-format' rowspan='".$rowspan."'>Kecamatan</th>                    
                    $th0
                </tr> 
                $tr1
                <tr>
                    $th2
                </tr>
                ";
        $data = $this->dbDataSelectAndReturnAll($sqlHasil,null,true);

        $tahun = $params['tahun'];
        $sqlCekVerifikasi = "select count(*) from verifikasi_data where kode_data_pilah='$kodeDatapilah' and tahun='$tahun'";
        $hasilCek = $this->dbDataGetValue($sqlCekVerifikasi);
        $verifikasi=array();
        if($hasilCek==0){
            $verifikasi['verified']=0;
            $verifikasi['keterangan']='';
        }else{
            $sqlCekVerifikasi = "select * from verifikasi_data where kode_data_pilah='$kodeDatapilah' and tahun='$tahun'";
            $hasilData = $this->dbDataSelectAndReturnAll($sqlCekVerifikasi,null,true);
            $verifikasi['verified']=$hasilData[0]->verified;
            $verifikasi['keterangan']=$hasilData[0]->keterangan;
        }

        $result['head_table'] = $head;
        $result['kolom'] = $namaKolomArr;
//        $result['kolomParent'] = $kolomParentHead;
        $result['kolomHead'] = $kolomHead;
        $result['success']=true;
        $result['result']=$data;
        $result['verifikasi']=$verifikasi;
        print_r(json_encode($result));
    }


    public function PUBLIC_UpdateDataFormat(){
        $params = isset($_GET) ? $_POST : $_POST;
//        print_r($params);exit;
        $tahun = $params['data']['tahun'];
        $kode_data_pilah = $params['data']['kode_data_pilah'];
        $keterangan = $params['data']['keterangan'];
        $verifikasi = $params['data']['verifikasi'];
        $user = $this->get_userId();
        $sqlCek = "select count(*) from verifikasi_data where kode_data_pilah='$kode_data_pilah' and tahun='$tahun'";
        $hasilCek = $this->dbDataGetValue($sqlCek);
        if($hasilCek==0){
            $sql = "insert into verifikasi_data (kode_data_pilah,tahun,verified,keterangan,input_date,user_input) values 
                                                ('$kode_data_pilah',$tahun,$verifikasi,'$keterangan',now(),'$user')";
        }else{
            $sql = "update verifikasi_data set keterangan='$keterangan',verified=$verifikasi,user_update='$user',update_date=now() where kode_data_pilah='$kode_data_pilah' and tahun='$tahun'";
        }
        echo $this->dbDataExecute($sql);
    }

    public function PUBLIC_update(){
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "update format_datagender set title=:title,grup_format=:grup_format
                 WHERE id_format=:id_format";
        echo $this->dbDataExecute($sql,$params['data']);
    }

    public function PUBLIC_delete(){
        $params = isset($_GET) ? $_GET : $_POST;
        $sql = "delete from format_datagender WHERE id_format=:id_format";
        echo $this->dbDataExecute($sql,$params['data']);
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
}




