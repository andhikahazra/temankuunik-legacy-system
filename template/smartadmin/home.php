<?php
error_reporting(0);
session_start();
include_once __DIR__ . "/../../lib/Captcha.php";
//session_destroy();
Captcha::reset();
Captcha::reset_cek();
//echo Captcha::html_math();
//print_r($_SESSION);exit;

if (!defined('PATH_TEMPLATE')) define('PATH_TEMPLATE', 'template/smartadmin/');
?>
<html lang="en-us" id="extr-page">
<head>
    <meta charset="utf-8">
    <title> Pendaftaran Bimtek Bisnis Online - Kabupaten Sleman</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- #CSS Links -->
    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="<?php echo PATH_TEMPLATE ?>css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="<?php echo PATH_TEMPLATE ?>css/font-awesome.min.css">

    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen"
          href="<?php echo PATH_TEMPLATE ?>css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="<?php echo PATH_TEMPLATE ?>css/smartadmin-skins.min.css">

    <!-- SmartAdmin RTL Support -->
    <link rel="stylesheet" type="text/css" media="screen" href="<?php echo PATH_TEMPLATE ?>css/smartadmin-rtl.min.css">

    <!-- We recommend you use "your_style.css" to override SmartAdmin
         specific styles this will also ensure you retrain your customization with each SmartAdmin update.
    <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

    <!-- #FAVICONS -->
    <link rel="shortcut icon" href="<?php echo PATH_TEMPLATE ?>img/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<?php echo PATH_TEMPLATE ?>img/favicon/favicon.ico" type="image/x-icon">

    <!-- #GOOGLE FONT -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

    <!-- #APP SCREEN / ICONS -->
    <!-- Specifying a Webpage Icon for Web Clip
         Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="<?php echo PATH_TEMPLATE ?>img/splash/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo PATH_TEMPLATE ?>img/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120"
          href="<?php echo PATH_TEMPLATE ?>img/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152"
          href="<?php echo PATH_TEMPLATE ?>img/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="<?php echo PATH_TEMPLATE ?>img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="<?php echo PATH_TEMPLATE ?>img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="<?php echo PATH_TEMPLATE ?>img/splash/iphone.png"
          media="screen and (max-device-width: 320px)">

</head>
<body id="login">
<!-- possible classes: minified, no-right-panel, fixed-ribbon, fixed-header, fixed-width-->
<header id="header">
    <div style="width: 100%;padding-bottom: 30px;">
				<span id="logo2">
                    <a href="https://bimtekbo.slemankab.go.id">
                    <h1 class="txt-color-red login-header-big"> <?php echo APP_TITLE; ?></h1>
                    </a>
                </span>
        <span class="pull-right" style="margin-top: -50px;">
            <a href="https://bimtekbo.slemankab.go.id/?daftar=1">
                <button class="btn  btn-danger">DAFTAR GRATIS</button>
            </a>
        </span>
    </div>

</header>

<div id="main" role="main">

    <!-- MAIN CONTENT -->
    <div id="content" class="container">

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 hidden-xs hidden-sm">
                <h1 class="txt-color-red login-header-big">Bimbingan Teknis Bisnis Online bagi Masyarakat Sleman</h1>
                <hr>
                <h1 style="font-weight: bold;color: #9f191f;">KUOTA PESERTA TERBATAS...!!!</h1>
                <div class="hero">

                    <div class="pull-left login-desc-box-l">
                        <h4 class="paragraph-header">
                            Bimbingan Teknis Ini Gratis Terbuka Untuk Umum Masyarakat Sleman
                        </h4>

                        <hr>
                        <p>
                            Pelatihan pemasaran online digital bagi masyarakat umum
                            yang ingin dapat menggunakan media online untuk memaksimalkan potensi sebagai reseller,
                            dropshipper, atau sejenisnya.
                        </p>
                        <h5 class="about-heading">Tujuan</h5>
                        <p>
                            Menggerakkan ekonomi masyarakat Sleman di masa pandemi Covid-19.
                        <h1 style="font-weight: bold;color: #9f191f;">GRATIS...!!!</h1>

                        <!--<a href="https://bimtekbo.slemankab.go.id/?daftar=1">
                            <button class="btn btn-lg btn-success">DAFTAR GRATIS</button>
                        </a>-->
                        </p>
                    </div>

                    <!--<img src="<?php /*echo PATH_TEMPLATE */ ?>img/demo/iphoneview.png" alt=""
                         class="pull-right display-image" style="width:210px">-->
                    <img src="./img/gambar1.JPG"
                         alt=""
                         class="pull-right display-image" style="width:45%;height:100%;padding-top:50px;">

                </div>

                <div class="row">
                    <!--<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <h5 class="about-heading">Tentang Pelatihan</h5>
                        <p>

                        </p>
                    </div>-->
                    <!--<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <h5 class="about-heading">Info</h5>
                        <p>
                            Bagi yang sudah mendaftar, untuk waktu dan tempat pelaksanaan akan diberitahukan lebih lanjut.
                        </p>
                    </div>-->
                </div>

            </div>
            <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                <img src="./img/bo.png"
                     alt=""
                     class="display-image" style="width:100%;margin-top: 10px;">
            </div>
        </div>
    </div>
</div>

<!--================================================== -->

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>

<!--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script> if (!window.jQuery.ui) {
        document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
    } </script>-->

<!-- BOOTSTRAP JS -->
<script src="<?php echo PATH_TEMPLATE ?>js/bootstrap/bootstrap.min.js"></script>

<!--[if IE 8]>

<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

<![endif]-->

<!-- MAIN APP JS FILE -->
<!--<script src="--><?php //echo PATH_TEMPLATE ?><!--js/app.seed.js"></script>-->

<script type="text/javascript">
    $(document).ready(function () {
        var reloadCaptcha = function(){
            param = {
                url: 's.php',
                method: 'POST',
                data: {
                    reload_captcha: 1,
                }
            }
            $.ajax(param).done(function (resp) {
                $('.capcaymath').html(resp);
            })
        }
        $(document).on('click', '.btCek', function (e) {
            e.preventDefault();
            /*reload kode capcay baru*/

            //    var htmlcapcay = "<?php //echo Captcha::html_math()?>//";
            //debugger;
            //     $('.capcaymath').html();
            param = {
                url: 's.php',
                method: 'POST',
                data: {
                    nik: $('.nik').val(),
                    captchaceknik: $('.hasil').val()
                }
            }
            $.ajax(param).done(function (resp) {
                resp = JSON.parse(resp);
                if (resp.success) {
                    reloadCaptcha();
                    $('.nama').val(resp.result.nama);
                    $('.alamat').val(resp.result.alamat);
                    $('.kecamatan').val(resp.result.kecamatan);
                } else {
                    alert(resp.msg);
                }
            })
        })

    })
</script>

</body>
</html>

