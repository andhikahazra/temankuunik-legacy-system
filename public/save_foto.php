<?php
include __DIR__ . "/../lib/server/class.os.php";

$os = new Os();

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['image']) || !isset($_POST['target'])) {
    echo json_encode(["status" => "error", "message" => "Permintaan tidak valid."]);
    exit();
}


$type_tamu = htmlspecialchars($_POST['type_tamu']);
$base64_image = $_POST['image'];
$target = $_POST['target']; // 'ktp' atau 'wajah'
$nomorhp = $_POST['nomorhp'];

if ($target !== 'ktp' && $target !== 'wajah') {
     echo json_encode(["status" => "error", "message" => "Target capture tidak valid."]);
     exit();
}

// Dekode dan simpan file di server (Pilihan B - Direkomendasikan)
$image_binary = base64_decode($base64_image);
$file_size = strlen($image_binary); // Ukuran dalam bytes

if ($file_size < 100) { // Anggap < 100 bytes terlalu kecil/kosong
    echo json_encode(["status" => "error", "message" => "Data gambar yang diterima terlalu kecil ($file_size bytes). Mungkin ada masalah upload atau data Base64 kosong."]);
    exit();
}


$filename = $target . '_' . $nomorhp . '_' . time() . '.png';
$file_path = 'uploads/' . $filename; 
$column_name = $target . '_path'; // Menentukan kolom: ktp_path atau wajah_path

if (!is_dir('uploads')) {
    mkdir('uploads', 0777, true);
}


if (!is_dir('uploads')) {
    mkdir('uploads', 0777, true);
}

if (file_put_contents($file_path, $image_binary)) {

    $sql = "insert into foto (nohp, jenisfoto, path) VALUES 
                                      (:nohp, :jenisfoto, :path)";

    $stmt = $os->conn->prepare($sql);
    $stmt->bindParam(':nohp', $nomorhp, PDO::PARAM_STR);
    $stmt->bindParam(':jenisfoto', $target, PDO::PARAM_STR);
    $stmt->bindParam(':path', $file_path, PDO::PARAM_STR);

    if($type_tamu > 0) {
        if($target == 'ktp'){
            $sql2 = "UPDATE tamu
            SET path_ktp = :path
            WHERE no_hp = :nohp";
        } else {
            $sql2 = "UPDATE tamu
            SET path_wajah = :path
            WHERE no_hp = :nohp";
        }

        $stmt2 = $os->conn->prepare($sql2);
        $stmt2->bindParam(':nohp', $nomorhp, PDO::PARAM_STR);    
        $stmt2->bindParam(':path', $file_path, PDO::PARAM_STR);
        $stmt2->execute();
    }
    
    // echo json_encode(["status" => "success", "message" => "Foto $target berhasil diupload.", "path" => $file_path]);

    if ($stmt->execute()) {
        // $result = array('no_hp' => $no_hp);
        // echo '{"success" : true, "msg":"Data Berhasil disimpan"}';
        echo json_encode(["status" => "success", "message" => "Foto $target berhasil diupload.", "path" => $file_path]);
    } else {
        echo json_encode(["status" => "error", "message" => "Gagal update DB: " . $stmt->error]);
    }
    // $stmt->close();
        
} else {
    echo json_encode(["status" => "error", "message" => "Gagal menyimpan file gambar ke server."]);
}


?>