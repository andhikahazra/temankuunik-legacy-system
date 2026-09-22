<?php
// ?logout=1
session_start();
include_once __DIR__ . "/lib/Captcha.php";
Captcha::html();
//print_r($_POST);exit;
//print_r(Captcha::check($_POST['chaptcha']));exit;
function getDataByNik($nik){
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
    return json_decode($response,1);
}
if(isset($_GET['logout'])) {
    require_once dirname(__FILE__).'/lib/server/class.os.php';
    $os = new Os();
    $sessid = $_COOKIE[COOKIE_KEY];
    $sql = "UPDATE sessions SET time_logout=NOW(), logout_status='logout' WHERE session_id=:sessid ";
    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(":sessid", $sessid, PDO::PARAM_STR);
    $stmt->execute();
    //unset($_COOKIE[COOKIE_KEY]); // <-- doesn't clear cookie in browser client
    setcookie(COOKIE_KEY, "", time()-3600);
    setcookie(COOKIE_UID, "", time()-3600);
    echo '{"success": true, "msg":"Logout Berhasil"}';
}else if(isset($_POST['registrasi']) && $_POST['registrasi']==1){
//    print_r($_POST);exit;
if (!defined('PATH_TEMPLATE')) define('PATH_TEMPLATE', 'template/smartadmin/');
    ob_start();
    session_start();
    require_once dirname(__FILE__).'/lib/server/class.os.php';
    $filter = ['update','delete','select','drop','insert','or','union'];
    $os = new Os();
    $msg = '';
    /*cek kuota*/
    $sql = 'SELECT count(*) jml FROM pendaftar';
    $stmt = $os->conn->prepare($sql);
    $stmt->execute();
    $dataUser = $stmt->fetch(PDO::FETCH_ASSOC);

    if($dataUser['jml'] > 625){
        $msg .="<li>Pendaftaran gagal karena kuota sudah terpenuhi</li>";
    }
//    print_r($msg);exit;
    /*END Cek Kuota*/

    $params = $_POST;
    $nik = isset($params['nik']) ? $params['nik'] : '' ;
    $nama = isset($params['nama']) ? $params['nama'] : '' ;
    $email = isset($params['email']) ? $params['email'] : '' ;
    $alamat = isset($params['alamat']) ? $params['alamat'] : '' ;
    $nomor_hp = isset($params['nomor_hp']) ? $params['nomor_hp'] : '' ;
    $smartphone = isset($params['smartphone']) ? $params['smartphone'] : '' ;
    $minat = isset($params['minat']) ? $params['minat'] : '' ;
    $kecamatan = isset($params['kecamatan']) ? $params['kecamatan'] : '' ;
    $tanggal_lahir = isset($params['tanggal_lahir']) ? $params['tanggal_lahir'] : '' ;

    $kab = '';
    if(isset($_SESSION['DATA_NIK'])){
        $nama = $_SESSION['DATA_NIK']['content'][0]['NAMA_LGKP'];
        $alamat = $_SESSION['DATA_NIK']['content'][0]['ALAMAT'];
        $kab = $_SESSION['DATA_NIK']['content'][0]['KAB_NAME'];
//            print_r($params['smartphone']);exit;
    }
    $dataByNik = getDataByNik($nik);
    if($kab == ''){
        $dataByNik = getDataByNik($nik);
        $kab = $dataByNik['DATA_NIK']['content'][0]['KAB_NAME'];
    }

//    print_r($kab);exit;

    $username='';
    $userArr = explode(' ',strtolower($username));
    $namaArr = explode(' ',strtolower($nama));
    $arraCheck = array_merge($userArr,$namaArr);
    foreach ($arraCheck as $val){
        if(in_array($val,$filter)){
            $msg.="<li>Anda menggunakan kata yang dilarang</li>";
            break;
        }
    }
    if($kab !='SLEMAN'){
        $msg .="<li>Hanya KTP Sleman yang diijinkan mendaftar</li>";
    }
    if($nik==''){
        $msg .="<li>NIK harus diisi </li>";
    }
    if($tanggal_lahir==''){
        $msg .="<li>Tanggal lahir harus diisi </li>";
    }
    if($alamat==''){
        $msg .="<li>Alamat harus diisi </li>";
    }
    if($kecamatan==''){
        $msg .="<li>Kecamatan harus diisi </li>";
    }
    if($nomor_hp ==''){
        $msg .="<li>Nomor HP harus diisi </li>";
    }
    if($nama==''){
        $msg .="<li>Nama harus diisi </li>";
    }
    if($email==''){
        $msg .="<li>Email harus diisi </li>";
    }
    if($smartphone==''){
        $msg .="<li>Pilihan kepemilikan smartphone harus diisi </li>";
    }
    if(!Captcha::check($_POST['chaptcha'])){
        $msg .="<li>Captcha harus diisi dan sesuai </li>";
    }
//    print_r($params);exit;

    $sql = 'SELECT count(*) jml_id FROM pendaftar WHERE nik=:nik';
    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':nik', $nik, PDO::PARAM_STR);
    $stmt->execute();
    $dataUser = $stmt->fetch(PDO::FETCH_ASSOC);
    if($dataUser['jml_id'] > 0){
        $msg .="<li>NIK sudah terdaftar </li>";
    }


    /*$sql = 'SELECT count(*) jml_email FROM users WHERE email=:email';
    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();
    $dataEmail = $stmt->fetch(PDO::FETCH_ASSOC);
    if($dataEmail['jml_email'] > 0){
        $msg .="<li>Email sudah terdaftar </li>";
    }*/

    if($msg != ''){
        include_once PATH_TEMPLATE."daftar.php";
        exit();
    }else{
//        $namaArr = explode('*******',$nama);
//        print_r($_SESSION['DATA_NIK']['content'][0]['NAMA_LGKP']);exit;

        $sql = "insert into pendaftar (nik, nama, alamat, email, no_hp, input_date,smartphone,minat,kecamatan,tanggal_lahir) VALUES  
                                      ('$nik', '$nama', '$alamat', '$email', '$nomor_hp', now(),'$smartphone','$minat','$kecamatan','$tanggal_lahir')";
//        echo $sql;exit;
        $os = new Os();
        $stmt2 = $os->conn->prepare($sql);
        /*$stmt->bindParam(':nik', $params['nik'], PDO::PARAM_STR);
        $stmt->bindParam(':nama', $params['nama'], PDO::PARAM_STR);
        $stmt->bindParam(':email', $params['email'], PDO::PARAM_STR);
        $stmt->bindParam(':alamat', $params['alamat'], PDO::PARAM_STR);
        $stmt->bindParam(':nomor_hp', $params['nomor_hp'], PDO::PARAM_STR);*/
        $stmt2->execute();

        $sql2 = "insert into group_has_users (group_id, user_id) VALUES ('member',:username)";
        $stmt = $os->conn->prepare($sql2);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->execute();

        header("Location: ./?berhasil=1");
        die();
    }

} else {
    // Proses Login dengan POST
    $params = $_POST;
    $username = isset($params['username']) ? $params['username'] : '' ;
    $password = isset($params['password']) ? $params['password'] : '' ;

    if(empty($username) || empty($password)) {
        echo '{"success": false, "msg":"Login gagal, User atau password masih kosong"}';
        exit;
    }

    ob_start();
    session_start();
    require_once dirname(__FILE__).'/lib/server/class.os.php';
    $os = new Os();

    $auth = false;
    if (isset($params['sso_key'])) {
        $sso_key = $params['sso_key'];
        define('SECREY_KEY', 'D8F5F93CC0842319438D2B2862B927C5FB1FACA1');

        $app_key = md5("$sso_key:" . SECREY_KEY);
        $queryparameter = http_build_query($_GET) . "&app_key=$app_key";
        $auth_url = 'http://192.168.80.25/sso/auth.php?' . $queryparameter;
        $username = $_GET['username'];
        //print_r($auth_url); exit;
        // $hasil = ['OKE','UNAUTHORIZED','INVALID','EXPIRED','INVALID']
        $hasil = file_get_contents($auth_url);
        $respon = json_decode($hasil);

        $status = $respon->status;
        if($respon->respon_key === md5($app_key . ':' . SECREY_KEY . ':' . $status ) ) {
            if(($respon->success ==1) && $status === 'OKE') {
                $auth = true;
            }
        }

        //print_r($respon);exit;
        // karena dari SSO, set variabel berikut berbeda, agar
        // perbandingan dibawah selalu bernilai false
        $md5paswd = 1;
        $data = array('password'=> 2);
    } else {
        // query untuk mendapatkan record dari username
        $sql = 'SELECT password FROM users WHERE BINARY user_id=:username';
        $stmt = $os->conn->prepare($sql);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->execute();
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
//            print_r($data);exit();
    }

    $user_Id = $username;

    $ip_address = $_SERVER['REMOTE_ADDR'];
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    //$nowtime = date("Y-m-d H:i:s");

    $session_id = md5(uniqid(rand(), true));
    $expire = time() + 60 * 60 * 24;//$stimeout['hour'] + 60*$stimeout['minute'] + $stimeout['second'];
    setcookie(COOKIE_KEY, $session_id, $expire);
    setcookie(COOKIE_UID, $username, $expire);

    // cek kesesuaian password
//        echo "$password ".$data['password'];exit();
    if (($auth === true) || ($password == $data['password'])) {
        /* insert ke session */
        $sql = "INSERT INTO sessions (username,session_id,user_id,ip_address,user_agent,time_login, time_updated, time_logout)
                VALUES ('$username','$session_id','$username','$ip_address','$user_agent', NOW(), NOW(), ADDTIME(NOW(),'".SESSION_TIMEOUT."'))";
//        echo $sql;exit();
        $stmt = $os->conn->prepare($sql);
//        $stmt->bindParam(':user_id', $username, PDO::PARAM_STR);
        $stmt->execute();

        if ($auth === true) {
            $location = APP_INDEX."?sso=1&session_id=$session_id";
            echo '{"success": true, "location":"'. $location .'"}';
        } else {
            echo '{"success": true, "msg":"Login Berhasil"}';
        }
    } else {
        echo '{"success": false, "msg":"Login Gagal, silahkan periksa Username dan Password"}';
    }
}
