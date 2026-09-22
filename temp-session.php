<?php
// ?logout=1
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
    $sql2 = "insert into group_has_users (group_id, user_id) VALUES ('member',:username)";
    $stmt = $os->conn->prepare($sql2);
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmt->execute();
}
