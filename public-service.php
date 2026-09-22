<?php
if (!defined('PATH_TEMPLATE')) define('PATH_TEMPLATE', 'template/smartadmin/');
ob_start();
session_start();
require_once dirname(__FILE__).'/lib/server/class.os.php';
$filter = ['update','delete','select','drop','insert','or','union'];
$os = new Os();

if(isset($_POST['action'])){
    if($_POST['action'] == 'loadJenisData'){
        $instansi = $_POST['instansi'];
        $sql = "select * from data_pilah where instansi=:instansi";
        $stmt = $os->conn->prepare($sql);
        $stmt->bindParam(':instansi', $instansi, PDO::PARAM_STR);
        $stmt->execute();
        $dataPilahArr = array();
        while ($dataPilah = $stmt->fetch(PDO::FETCH_ASSOC)){
            array_push($dataPilahArr,$dataPilah);
        }
        print_r(json_encode($dataPilahArr));
    }
}

if(isset($_POST['show-data']) && $_POST['show-data']==1){
    $params = $_POST;
    $kodeDatapilah = $params['kode_data_pilah'];
    $thn = array($params['tahun'],$params['tahun']);
    $sqlGenerate = "SELECT genQueryDataPilah ('$kodeDatapilah', $thn[0], $thn[1]) query";
    $stmt = $os->conn->prepare($sqlGenerate);
    $stmt->execute();
    $sqlHasil = $stmt->fetch(PDO::FETCH_ASSOC);
    $sqlHasil=$sqlHasil['query'];

    $sqlKolom = "select a.*,
                      (select count(*) from data_pilah_kolom where kode_data_pilah='$kodeDatapilah' and header_kolom = a.header_kolom) colspan,
                      (select count(*) from data_pilah_kolom where kode_data_pilah='$kodeDatapilah' ) colspanTahun,
                      (SELECT COUNT(*) FROM (SELECT * FROM data_pilah_kolom
                  WHERE kode_data_pilah = '$kodeDatapilah' GROUP BY header_kolom
                    )xx)+1 rowspan
                      from data_pilah_kolom a where kode_data_pilah='$kodeDatapilah' order by a.kode_kolom";
    $stmt = $os->conn->prepare($sqlKolom);
    $stmt->execute();
    $koloms = array();
    $kolomsingle = array();
    while($kolom = $stmt->fetch(PDO::FETCH_ASSOC)){
        array_push($koloms,$kolom);
        array_push($kolomsingle,$kolom['header_kolom'].' '.$kolom['nama_kolom']);
    }

    $th1 ='';
    $th2 ='';
    $curHeader = '';
//        print_r($kolomsingle);exit;
    $namaKolomArr = array();
    foreach ($thn as $th){
        $th0="<th class='th-format' colspan='".$koloms[0]['colspanTahun']."'>".$th."</th>";
        foreach ($koloms as $val){
            $namaKolomArr[str_replace(".","_",$val['kode_kolom'])] = $val['nama_kolom'];
            if($val['header_kolom']){
                if($curHeader != $val['header_kolom']){
                    $th1.="<th class='th-format' colspan='".$val['colspan']."'>".$val['header_kolom']."</th>";
                    $curHeader = $val['header_kolom'];
                }
            }else if(!$val['header_kolom'] && $val['nama_kolom'] !='L' && $val['nama_kolom'] !='P' && $val['nama_kolom'] !='L+P'){
                $th1.="<th class='th-format' rowspan='".((int)$val->rowspan-1)."'>".$val->nama_kolom."</th>";
                $curHeader = $val->header_kolom;
            }
            if($val['nama_kolom'] =='L' || $val['nama_kolom'] =='P' || $val['nama_kolom'] =='L+P'){
                $th2.="<th class='th-format'>".$val['nama_kolom']."</th>";
            }

        }
        if($thn[0] == $thn[1]){break;}
    }
    $tr1 = '';
    if($th1 !=''){
        $tr1 = "<tr class='bg-color-greenLight'>
                    $th1
                </tr>";
    }

    $rowspan = ($koloms[0]['rowspan']==2)?$koloms[0]['rowspan']:3;
    $head = "<tr class='bg-color-greenLight'>
                    <th valign='middle' class='th-format' rowspan='".$rowspan."' style='width: 50px;vertical-align: middle'>No</th>
                    <th valign='middle' class='th-format' rowspan='".$rowspan."' style='width: 150px;vertical-align: middle'>Kecamatan</th>                    
                    $th0
                </tr> 
                $tr1
                <tr class='bg-color-greenLight'>
                    $th2
                </tr>
                ";
//        echo $head;exit;

    $stmt = $os->conn->prepare($sqlHasil);
    $stmt->execute();
    $data = array();
    while($dataEach = $stmt->fetch(PDO::FETCH_ASSOC)){
        array_push($data,$dataEach);
    }

//    $data = $this->dbDataSelectAndReturnAll($sqlHasil,null,true);
    $result = array();
    $result['head_table'] = $head;
    $result['kolom'] = $namaKolomArr;
    $result['kolomsingle'] = $kolomsingle;
    $result['success']=true;
    $result['result']=$data;
    print_r(json_encode($result));
}
