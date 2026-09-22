<?php
// ?logout=1
session_start();
require_once( dirname(__FILE__) . "/lib/server/class.os.php");
include_once __DIR__ . "/lib/Captcha.php";
Captcha::html();
//print_r($_POST);exit;
//print_r(Captcha::check($_POST['chaptcha']));exit;
function getDataByNik($nik)
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://interop.slemankab.go.id/api/xq55x?nik=$nik",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_HTTPHEADER => array(
            "Authorization: Basic cDN0ejA2dnE6VUFVUEJHNEE0V3NHVHBxN3Z5OHl5ZGJubmU2YlJDbDA="
        ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);
    curl_close($curl);
    return json_decode($response, 1);
}

if (isset($_GET['logout'])) {
    require_once dirname(__FILE__) . '/lib/server/class.os.php';
    $os = new Os();
    $sessid = $_COOKIE[COOKIE_KEY];
    $sql = "UPDATE sessions SET time_logout=NOW(), logout_status='logout' WHERE session_id=:sessid ";
    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(":sessid", $sessid, PDO::PARAM_STR);
    $stmt->execute();
    //unset($_COOKIE[COOKIE_KEY]); // <-- doesn't clear cookie in browser client
    setcookie(COOKIE_KEY, "", time() - 3600);
    setcookie(COOKIE_UID, "", time() - 3600);
    echo '{"success": true, "msg":"Logout Berhasil"}';
} else if (isset($_POST['registrasi']) && $_POST['registrasi'] == 1) {
    //    print_r($_POST);exit;
    if (!defined('PATH_TEMPLATE')) define('PATH_TEMPLATE', 'template/smartadmin/');
    ob_start();
    session_start();
    require_once dirname(__FILE__) . '/lib/server/class.os.php';
    $filter = ['update', 'delete', 'select', 'drop', 'insert', 'or', 'union'];
    $os = new Os();
    $params = $_POST;
    $nik = isset($params['nik']) ? $params['nik'] : '';
    $nama = isset($params['nama']) ? $params['nama'] : '';
    $email = isset($params['email']) ? $params['email'] : '';
    $alamat = isset($params['alamat']) ? $params['alamat'] : '';
    $nomor_hp = isset($params['nomor_hp']) ? $params['nomor_hp'] : '';

    $msg = '';
    $userArr = explode(' ', strtolower($username));
    $namaArr = explode(' ', strtolower($nama));
    $arraCheck = array_merge($userArr, $namaArr);
    foreach ($arraCheck as $val) {
        if (in_array($val, $filter)) {
            $msg .= "<li>Anda menggunakan kata yang dilarang</li>";
            break;
        }
    }
    if ($nik == '') {
        $msg .= "<li>NIK harus diisi </li>";
    }
    if ($alamat == '') {
        $msg .= "<li>Alamat harus diisi </li>";
    }
    if ($nomor_hp == '') {
        $msg .= "<li>Nomor HP harus diisi </li>";
    }
    if ($nama == '') {
        $msg .= "<li>Nama harus diisi </li>";
    }
    if ($email == '') {
        $msg .= "<li>Email harus diisi </li>";
    }
    if (!Captcha::check($_POST['chaptcha'])) {
        $msg .= "<li>Captcha harus diisi dan sesuai </li>";
    }

    $sql = 'SELECT count(*) jml_id FROM pendaftar WHERE nik=:nik';
    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':nik', $nik, PDO::PARAM_STR);
    $stmt->execute();
    $dataUser = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($dataUser['jml_id'] > 0) {
        $msg .= "<li>NIK sudah terdaftar </li>";
    }

    /*$sql = 'SELECT count(*) jml_email FROM users WHERE email=:email';
    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();
    $dataEmail = $stmt->fetch(PDO::FETCH_ASSOC);
    if($dataEmail['jml_email'] > 0){
        $msg .="<li>Email sudah terdaftar </li>";
    }*/

    if ($msg != '') {
        include_once PATH_TEMPLATE . "daftar.php";
        exit();
    } else {
        $namaArr = explode('*******', $nama);
        if (count($namaArr) > 1) {
            $dataByNik = getDataByNik($params['nik']);
            $params['nama'] = $dataByNik['result'][0]['NAMA_LGKP'];
            $params['alamat'] = $dataByNik['result'][0]['ALAMAT'];
            //            print_r($params);exit;
        }
        $sql = "insert into pendaftar (nik, nama, alamat, email, no_hp, input_date) VALUES 
                                      (:nik, :nama, :alamat, :email, :nomor_hp, now())";
        $stmt = $os->conn->prepare($sql);
        $stmt->bindParam(':nik', $params['nik'], PDO::PARAM_STR);
        $stmt->bindParam(':nama', $params['nama'], PDO::PARAM_STR);
        $stmt->bindParam(':email', $params['email'], PDO::PARAM_STR);
        $stmt->bindParam(':alamat', $params['alamat'], PDO::PARAM_STR);
        $stmt->bindParam(':nomor_hp', $params['nomor_hp'], PDO::PARAM_STR);
        $stmt->execute();

        $sql2 = "insert into group_has_users (group_id, user_id) VALUES ('member',:username)";
        $stmt = $os->conn->prepare($sql2);
        $stmt->bindParam(':username', $username, PDO::PARAM_STR);
        $stmt->execute();

        header("Location: /?berhasil=1");
        die();
    }
} else {
    // Proses Login dengan POST
    $params = $_POST;
    $username = isset($params['username']) ? $params['username'] : '';
    // $password = isset($params['password']) ? md5($params['password']) : '';
    $password = isset($params['password']) ? $params['password'] : '';

    if (empty($username) || empty($password)) {
        echo '{"success": false, "msg":"Login gagal, User atau password masih kosong"}';
        exit;
    }

    // include 'ariaxai_log_login_failed.php';
        $login_denied = login_denied(array('username' => $username));
        if ($login_denied['denied']) {
            echo '{"success": false, "msg":"Login denied, cobalah ~' . $login_denied['minute'] . ' menit lagi"}';
            exit;
        }


    ob_start();
    // session_start();
    require_once dirname(__FILE__) . '/lib/server/class.os.php';
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
        if ($respon->respon_key === md5($app_key . ':' . SECREY_KEY . ':' . $status)) {
            if (($respon->success == 1) && $status === 'OKE') {
                $auth = true;
            }
        }

        //print_r($respon);exit;
        // karena dari SSO, set variabel berikut berbeda, agar
        // perbandingan dibawah selalu bernilai false
        $md5paswd = 1;
        $data = array('password' => 2);
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
    $expire = time() + 60 * 60 * 24; //$stimeout['hour'] + 60*$stimeout['minute'] + $stimeout['second'];
    setcookie(COOKIE_KEY, $session_id, $expire);
    setcookie(COOKIE_UID, $username, $expire);

    // cek kesesuaian password
    //        echo "$password ".$data['password'];exit();
    if (($auth === true) || ($password == $data['password'])) {
        /* insert ke session */
        $sql = "INSERT INTO sessions (username,session_id,user_id,ip_address,user_agent,time_login, time_updated, time_logout)
                VALUES ('$username','$session_id','$username','$ip_address','$user_agent', NOW(), NOW(), ADDTIME(NOW(),'" . SESSION_TIMEOUT . "'))";
        //        echo $sql;exit();
        $stmt = $os->conn->prepare($sql);
        //        $stmt->bindParam(':user_id', $username, PDO::PARAM_STR);
        $stmt->execute();

        if ($auth === true) {
            $location = APP_INDEX . "?sso=1&session_id=$session_id";
            echo '{"success": true, "location":"' . $location . '"}';
        } else {
            $location = APP_INDEX;
            // header("location:$location");
            echo '{"success": true, "msg":"Login Berhasil"}';
        }
    } else {
        login_failed(array('username' => $username, 'password' => $password));
        // echo '<script type ="text/JavaScript">';  
        // echo 'alert("Login Gagal, silahkan periksa Username dan Password")';  
        // echo '</script>'; 

        // header("refresh:0.1;url=index.php");
        // $location = APP_INDEX;
        // header("location:$location");
        echo '{"success": false, "msg":"Login Gagal, silahkan periksa Username dan Password"}';
        // echo '{"success": false, "msg":"Login gagal, User atau password masih kosong"}';
        // exit;
    }
}


function login_denied($data) {
    $os = new Os();
    // $dbconn = new mysqli('192.168.100.35', 'sso', 'sso2015', 'sso');

    $username = $data['username'];
    // $username = $dbconn->real_escape_string($data['username']);

    if (isset($_SERVER['HTTP_CLIENT_IP'])) {
        $http_client_ip = $_SERVER['HTTP_CLIENT_IP'];
    } else {
        $http_client_ip = '';
    }
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $http_x_forwarded_for = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $http_x_forwarded_for = '';
    }
    if (isset($_SERVER['REMOTE_ADDR'])) {
        $remote_addr = $_SERVER['REMOTE_ADDR'];
    } else {
        $remote_addr = '';
    }
    $http_user_agent = $_SERVER['HTTP_USER_AGENT'];

    $query = "SELECT COUNT(*), TIMESTAMPDIFF(MINUTE, NOW(), DATE_ADD(MIN(datetime), INTERVAL 30 MINUTE)) 
    FROM log_login_failed 
    WHERE username =:username
      AND http_client_ip =:http_client_ip
      AND http_x_forwarded_for =:http_x_forwarded_for
      AND remote_addr =:remote_addr 
      AND http_user_agent =:http_user_agent
      AND datetime > DATE_SUB(NOW(), INTERVAL 30 MINUTE)";


    $stmt = $os->conn->prepare($query);
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmt->bindParam(':http_client_ip', $http_client_ip, PDO::PARAM_STR);
    $stmt->bindParam(':http_x_forwarded_for', $http_x_forwarded_for, PDO::PARAM_STR);
    $stmt->bindParam(':remote_addr', $remote_addr, PDO::PARAM_STR);
    $stmt->bindParam(':http_user_agent', $http_user_agent, PDO::PARAM_STR);
    $stmt->execute();
    $data = $stmt->fetch(PDO::FETCH_BOTH);

    // print_r($data);exit;
    $row=$data;

    if ($row[0] >= 3) {
        return array('denied' => true, 'minute' => $row[1]);
    } else {
        return array('denied' => false);
    }
}

function login_failed($data) {

    $os = new Os();

    $username = $data['username'];
    $password = $data['password'];

    if (isset($_SERVER['HTTP_CLIENT_IP'])) {
        $http_client_ip = $_SERVER['HTTP_CLIENT_IP'];
    } else {
        $http_client_ip = '';
    }
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $http_x_forwarded_for = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $http_x_forwarded_for = '';
    }
    if (isset($_SERVER['REMOTE_ADDR'])) {
        $remote_addr = $_SERVER['REMOTE_ADDR'];
    } else {
        $remote_addr = '';
    }
    $http_user_agent = $_SERVER['HTTP_USER_AGENT'];

    $query = "INSERT INTO log_login_failed (id, datetime, username, password, http_client_ip, http_x_forwarded_for, remote_addr, http_user_agent) 
    VALUES (NULL, NOW(), :username, :password, :http_client_ip, :http_x_forwarded_for, :remote_addr, :http_user_agent)";

    // $stmt = $db->prepare($query);
    $stmt = $os->conn->prepare($query);
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmt->bindParam(':password', $password, PDO::PARAM_STR);
    $stmt->bindParam(':http_client_ip', $http_client_ip, PDO::PARAM_STR);
    $stmt->bindParam(':http_x_forwarded_for', $http_x_forwarded_for, PDO::PARAM_STR);
    $stmt->bindParam(':remote_addr', $remote_addr, PDO::PARAM_STR);
    $stmt->bindParam(':http_user_agent', $http_user_agent, PDO::PARAM_STR);
    $stmt->execute();
}