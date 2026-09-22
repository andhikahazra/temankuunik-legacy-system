<?php
define('SITE_ROOT', realpath(dirname(__FILE__)));
$type = $_POST['type'];
$fieldName = '';
switch ($type) {
    case 'foto':
        $fieldName = 'file-foto';
        # code...
        break;
    case 'ktp':
        $fieldName = 'foto-ktp';
        # code...
        break;

    case 'ijazah':
        $fieldName = 'file-ijazah';
        # code...
        break;

    case 'sertifikat':
        $fieldName = 'file-sertifikat-bahasa';
        # code...
        break;

    case 'cv':
        $fieldName = 'file-curriculum-vitae';
        # code...
        break;

    case 'pengalaman_kerja':
        $fieldName = 'file-pengalaman-kerja';
        # code...
        break;

    default:
        # code...
        break;
}

$namaFile1 = $_FILES[$fieldName]['name'];
$namaSementara1 = $_FILES[$fieldName]['tmp_name'];

// tentukan lokasi file akan dipindahkan
$dirUpload1 = SITE_ROOT . "/files/";

// pindahkan file
$terupload1 = move_uploaded_file($namaSementara1, $dirUpload1 . $namaFile1);

// $filePath = dirname(__FILE__).'/'.$dirUpload.$namaFile;
$filePath1 = $dirUpload1 . $namaFile1;
// print_r($filePath1);die;

$postfields = array();

$upload_file1 = (isset($_FILES[$fieldName])) ? $_FILES[$fieldName] : array();

if ($terupload1) {

    if (function_exists('curl_file_create')) {
        $postfields["file1"] = curl_file_create($filePath1);
    } else {
        $postfields["file1"] = '@' . realpath($filePath1);
    }
}

$postfields['token'] = 'EYJHBGCIOIJIUZUXMIISINR5CCI6IKPXVCJ9';
$postfields['type'] = $type;

// print_r($postfields);exit();
$ch = curl_init();
$headers = array("Content-Type:multipart/form-data");
curl_setopt_array($ch, array(
    CURLOPT_SSL_VERIFYHOST => 0,
    CURLOPT_SSL_VERIFYPEER => 0,
    CURLOPT_POST => 1,
    CURLOPT_URL => "https://cdn.slemankab.go.id/filedisnaker/upload_file.php?action=insert",
    CURLOPT_RETURNTRANSFER => 1,
    CURLINFO_HEADER_OUT => 1,
    CURLOPT_HTTPHEADER => $headers,
    CURLOPT_POSTFIELDS => $postfields
));

$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); // this results 0 every time
$response = curl_exec($ch);

if ($response === false)
    $response = curl_error($ch);

echo stripslashes($response);
curl_close($ch);

// print_r($ch);DIE();
// $result = curl_exec($ch);
// print_r($result);exit();