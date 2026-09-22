<?php

require_once dirname(__FILE__) . '/lib/server/class.os.php';
require_once(dirname(__FILE__) . "/lib/server/class.database.php");
require_once(dirname(__FILE__) . "/lib/server/class.module.php");
$os = new Os();

$session = $os->session_exist();
$opd['kode_unit_kerja'] = 99999;
$opd['unit_kerja'] = "";
if ($session) {
    // print_r($os->getUserUnit());
    $opd = $os->getUserUnit();
    // print_r($opd['unit_kerja']);
    // exit;
} else{
    header("Location: login.php");
}

$page = isset($_GET['page']) ? $_GET['page'] : 'home';

// Mencegah path traversal attack
$allowed_pages = ['home', 'about', 'contact'];
if (!in_array($page, $allowed_pages)) {
    $page = 'home'; // Jika tidak valid, muat halaman home
}

// Memuat template utama
include PUBLIC_TEMPLATE . 'template.php';
