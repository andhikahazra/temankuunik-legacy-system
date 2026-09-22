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

    // var $id_tamu;
    //inssert into tamu
    if ($type_tamu == 'new') {
        $sql = "insert into tamu (nama, no_hp, instansi, keterangan_asal) VALUES 
                                      (:nama, :no_hp, :instansi, :keterangan)";

        $stmt = $os->conn->prepare($sql);
        $stmt->bindParam(':nama', $nama, PDO::PARAM_STR);
        $stmt->bindParam(':no_hp', $no_hp, PDO::PARAM_STR);
        $stmt->bindParam(':instansi', $instansi, PDO::PARAM_STR);
        $stmt->bindParam(':keterangan', $keterangan, PDO::PARAM_STR);
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



    //insert into kunjungan

    $sql = "insert into kunjungan (id_tamu, kepentingan, Catatan) VALUES 
                                      (:id_tamu, :keperluan, :catatan)";

    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':id_tamu', $id_tamu, PDO::PARAM_STR);
    $stmt->bindParam(':keperluan', $keperluan, PDO::PARAM_STR);
    $stmt->bindParam(':catatan', $catatan, PDO::PARAM_STR);
    // $stmt->execute(); 


    if ($stmt->execute()) {
        // $result = array('no_hp' => $no_hp);
        echo '{"success" : true, "msg":"Data Berhasil disimpan"}';
    } else {
        echo '{"success" : false, "msg":"Data Gagal Disimpan"}';
    }
}
