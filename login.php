<?php
require_once dirname(__FILE__).'/lib/server/class.os.php';
$os = new Os();
$title = APP_TITLE; 
include_once PATH_TEMPLATE."login.php";
exit;
$session = $os->session_exist();
if (isset($_GET['publik']) && $_GET['publik']==1) {
    $title = APP_TITLE;
    include_once PATH_TEMPLATE."publik.php";
    exit();
}
// check session dulu , jika masih aktif maka redirect saja OKE

$title = APP_TITLE;
if (isset($_GET['login']) && $_GET['login']==1) {
    if ($session) {
        header('location: '.APP_INDEX);
        exit();
    }
    include_once PATH_TEMPLATE."login.php";
    exit();
}else if (isset($_GET['daftar']) && $_GET['daftar']==1) {
    include_once PATH_TEMPLATE."daftar.php";
    exit();
}else if (isset($_GET['berhasil']) && $_GET['berhasil']==1) {
    include_once PATH_TEMPLATE."berhasil.php";
    exit();
}
include_once PATH_TEMPLATE."home.php";
?>

<script src="app/login.js"></script>
<!--<script src="app/s.js"></script>-->
<!-- MD5 library : https://github.com/blueimp/JavaScript-MD5 -->
<script src="plugins/md5/md5.min.js"></script>