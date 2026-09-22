<?php
// require_once dirname(_DIR_,2).'/lib/server/class.os.php';
include __DIR__ . "/../lib/server/class.os.php";
// require_once( dirname(_FILE_) . "/../lib/server/class.database.php");
$os = new Os();


if (isset($_GET['no_hp'])) {
    $no_hp = $_GET['no_hp'];

    $sql = 'SELECT * FROM tamu WHERE no_hp=:no_hp';
    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':no_hp', $no_hp, PDO::PARAM_STR);
    $stmt->execute();
    $dataUser = $stmt->fetch(PDO::FETCH_ASSOC);

    // print_r($dataUser);
    if ($dataUser == null) {
        $result = array('no_hp' => $no_hp);
        echo '{"success" : false, "msg":"Data Belum Ada",  "result":' . json_encode($result) . '}';
    } else {
        echo '{"success" : true, "msg":"Data Ditemukan",  "result":' . json_encode($dataUser) . '}';
    }
}
