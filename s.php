<?php
session_start();
include_once __DIR__ . "/lib/Captcha.php";

//echo Captcha::html_math();

if(isset($_POST['nik']) && $_POST['nik'] !=''){
//    echo $_SESSION['CAPTCHA_CEK'];exit;
    if($_SESSION['CAPTCHA_CEK'] != $_POST['captchaceknik'] || $_POST['captchaceknik']==''){
        echo json_encode(array("success"=>false,"msg"=>"Kode Captcha tidak valid"));
        exit;
    }
    $nik = $_POST['nik'];
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://interop.slemankab.go.id/api/6wy56?NIK=$nik",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_HTTPHEADER => array(
            "Authorization: Basic ZmU2MXRyN2N0dDdyOmdvNzA2ZnZsbmM3d251dXRzZzN4bDVhcTM3MHBhYjNoZWp6ZTRyZm8="
        ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);

    curl_close($curl);

    if ($err) {
        echo "cURL Error #:" . $err;
    } else {
        $response = json_decode($response,1);
        $_SESSION[$nik] = $response;
        $_SESSION["DATA_NIK"] = $response;
        if($response['content'][0]['KAB_NAME'] !='SLEMAN'){
            $return = array();
            $return['success']=false;
            $return['msg'] = 'Hanya KTP Sleman yang diijinkan mendaftar';
            echo json_encode($return);
            exit;
        }

        $strLenNama = strlen($response['content'][0]['NAMA_LGKP']);
        $nama = substr($response['content'][0]['NAMA_LGKP'],0,4).
            "*******".
            substr($response['content'][0]['NAMA_LGKP'],($strLenNama-3),($strLenNama-1));
//        echo substr($response['content'][0]['NAMA_LGKP'],0,5);exit;

        $strLenAlamat = strlen($response['content'][0]['ALAMAT']);
        $alamat = substr($response['content'][0]['ALAMAT'],0,5).
            "*******".
            substr($response['content'][0]['ALAMAT'],($strLenAlamat-3),($strLenAlamat-1));
//        echo $alamat;exit;

//        print_r($_SESSION);exit;
        $return = array();
        $return['success']=true;
        $return['result']['nama'] = $nama;
        $return['result']['alamat'] = $alamat;
        $return['result']['kecamatan'] = $response['content'][0]['KEC_NAME'];
        echo json_encode($return);
    }
}else if(isset($_POST['reload_captcha']) && $_POST['reload_captcha'] ==1){
    Captcha::reset_cek();
    echo Captcha::html_math();
}
