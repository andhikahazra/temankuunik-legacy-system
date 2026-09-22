<?php
include __DIR__ . "/../lib/server/class.os.php";

$os = new Os();


if (isset($_POST)) {
    // print_r($_POST);
    // exit;

    $type_tamu = htmlspecialchars($_POST['type_tamu']);
    $no_hp = htmlspecialchars($_POST['no_hp2']);
    $nama = htmlspecialchars($_POST['nama']);
    $instansi = isset($_POST['instansi']) ? htmlspecialchars($_POST['instansi']) : '';
    $keterangan = htmlspecialchars($_POST['keterangan']);
    $keperluan = htmlspecialchars($_POST['keperluan']);
    $catatan = htmlspecialchars($_POST['catatan']);
    $grupnb = htmlspecialchars($_POST['grupnb']);
    $path_ktp = htmlspecialchars($_POST['path-ktp']);
    $path_wajah = htmlspecialchars($_POST['path-wajah']);
    $opd = htmlspecialchars($_POST['opd']);

    // var $id_tamu;
    //inssert into tamu
    if ($type_tamu == 'new') {
        $sql = "insert into tamu (nama, no_hp, instansi, keterangan_asal,path_ktp,path_wajah) VALUES 
                                      (:nama, :no_hp, :instansi, :keterangan, :path_ktp, :path_wajah)";

        $stmt = $os->conn->prepare($sql);
        $stmt->bindParam(':nama', $nama, PDO::PARAM_STR);
        $stmt->bindParam(':no_hp', $no_hp, PDO::PARAM_STR);
        $stmt->bindParam(':instansi', $instansi, PDO::PARAM_STR);
        $stmt->bindParam(':keterangan', $keterangan, PDO::PARAM_STR);
        $stmt->bindParam(':path_ktp', $path_ktp, PDO::PARAM_STR);
        $stmt->bindParam(':path_wajah', $path_wajah, PDO::PARAM_STR);
        $stmt->execute();


        $sql = 'SELECT id FROM tamu WHERE no_hp=:no_hp';
        $stmt = $os->conn->prepare($sql);
        $stmt->bindParam(':no_hp', $no_hp, PDO::PARAM_STR);
        $stmt->execute();
        $dataUser = $stmt->fetch(PDO::FETCH_ASSOC);

        $id_tamu = $dataUser['id'];
    } else {
        $id_tamu = $type_tamu;
    }

    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip_address = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        // Jika tidak ada proxy, gunakan REMOTE_ADDR
        $ip_address = $_SERVER['REMOTE_ADDR'];
    }

    // print_r($ip_address);
    // exit;
    //insert into kunjungan

    $sql = "insert into kunjungan (opd, id_tamu, kepentingan, Catatan, rombongan, ip_address) VALUES 
                                      (:opd,:id_tamu, :keperluan, :catatan,:grupnb,:ip_address)";

    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':id_tamu', $id_tamu, PDO::PARAM_STR);
    $stmt->bindParam(':keperluan', $keperluan, PDO::PARAM_STR);
    $stmt->bindParam(':catatan', $catatan, PDO::PARAM_STR);
    $stmt->bindParam(':grupnb', $grupnb, PDO::PARAM_STR);
    $stmt->bindParam(':opd', $opd, PDO::PARAM_STR);
    $stmt->bindParam(':ip_address', $ip_address, PDO::PARAM_STR);
    // $stmt->execute(); 


    if ($stmt->execute()) {
        // $result = array('no_hp' => $no_hp);
        echo '{"success" : true, "msg":"Data Berhasil disimpan"}';
    } else {
        echo '{"success" : false, "msg":"Data Gagal Disimpan"}';
    }
}
