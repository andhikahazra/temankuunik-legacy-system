<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Temanku Unik</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #AABFB8;
      /* Warna full page */
      color: #517470;
    }

    header,
    footer {
      padding: 20px;
      background-color: #eeeeee;
    }

    header {
      border-bottom: 1px solid #ddd;
      /* Garis lembut di bawah header */
    }

    footer {
      border-top: 1px solid #ddd;
      /* Garis lembut di atas footer */
    }

    .content {
      padding: 40px;
      min-height: calc(100vh - 210px);
      /* Menyisakan ruang untuk header & footer */
    }

    .nav-item a {
      color: #517470;
      /* Warna menu */
      /*      color: ;*/
    }

    .nav-item:hover {
      color: #B5C6B4;
    }

    form {
      color: black;
    }
  </style>
</head>

<body>

  <header class="container-fluid">
    <div class="row justify-content-between align-items-center">
      <!-- Nama Website di Kiri -->
      <div class="col-auto ms-5">
        <!-- <h2 class="mb-0">Temanku Unik</h2> -->
        <a href="http://devtemankuunik.slemankab.go.id/"><img src="img/temankuunik.png" alt="Logo Website" class="img-fluid" style="max-width: 150px;"></a>
        <div class="d-flex align-items-center"><?= $opd['unit_kerja']; ?></div>
      </div>

      <!-- Menu di Kanan -->
      <div class="col-auto">
        <nav>
          <ul class="nav">

            <li class="nav-item"><a class="nav-link" href="index.php?page=about">About</a></li>

          </ul>
        </nav>
      </div>
    </div>
  </header>

  <!-- <div class="content text-center">
    <div class="container mt-5" id="nomor_hp">
        <h2>Masukkan Nomor HP</h2>
        <form action="" method="POST">
            <div class="mb-3 item-center mx-auto" style="width:500px">
                <label for="no_hp" class="form-label">Nomor HP</label>
                <input type="text" class="form-control" id="no_hp" name="no_hp" placeholder="Masukkan Nomor HP" required>
            </div>
            <button type="submit" class="btn btn-success btnHP">Submit</button>
        </form>
    </div>
    <div class="container mt-5" id="form_tamu" style="width:500px;display: none;">
        <h2>Form Detail Tamu</h2>
        <form action="" method="POST" id="f_tamu">
            <div class="form-group mb-3 row" >
                <label for="no_hp" >Nomor HP</label>
                <input type="hidden" name="type_tamu" id="type_tamu" value="new">
                <input type="text" class="form-control" id="no_hp2" name="no_hp2" placeholder="Masukkan Nomor HP" readonly>
            </div>

            <div class="form-group mb-3 row">
                <label for="nama">Nama</label>
                <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan Nama" required>
            </div>

            <div class="form-group mb-3 row">
                <label for="instansi" >Asal</label>
                <select class="form-control" id="instansi" name="instansi"> 
                  <option value="Instansi Pemkab Sleman">Instansi Pemkab Sleman</option>
                  <option value="Pegawai Swasta">Pegawai Swasta</option>
                  <option value="Akademisi">Akademisi</option>
                  <option value="LSM">LSM</option>
                  <option value="Masyarakat">Masyarakat</option>
                  <option value="Lainnya">Lainnya</option>
                </select>                
            </div>

            <div class="form-group mb-3 row">
                <label for="pekerjaan">Keterangan</label>
                <input type="text" class="form-control" id="keterangan" name="keterangan" placeholder="Keterangan Asal" required>
            </div>
            <button type="submit" class="btn btn-warning btBaru">DATA BARU</button>
            <button type="submit" class="btn btn-success btNext">SELANJUTNYA</button>
        </form>
    </div>
    <div class="container mt-5 " id="form_kunjungan" style="width:500px;display: none;">
        <h2>Detail Kunjungan</h2>
        <form action="#" method="POST" id='f_kunjungan'>
            <div class="form-group mb-3 row" >
                <label for="no_hp" >Keperluan</label>
                 <select class="form-control" id="keperluan" name="keperluan"> 
                    <option value="Janji Ketemu">Janji Ketemu</option>
                    <option value="Promo Produk">Promo Produk</option>
                    <option value="PKL/Magang">PKL/Magang</option>
                    <option value="LSM">LSM</option>
                    <option value="Menyampaikan Surat/Proposal/Laporan">Menyampaikan Surat/Proposal/Laporan</option>
                    <option value="Lainnya">Lainnya</option>
                </select>    
            </div>

            <div class="form-group mb-3 row">
                <label for="nama">Catatan</label>
                <textarea class="form-control" name="catatan" id="catatan"></textarea>
            </div>

           

            <button type="submit" class="btn btn-success btSimpan">Simpan</button>
        </form>
    </div>
  </div> -->

  <div class="content text-center">

    <?php
    // Memuat konten dinamis
    include 'public/' . $page . '.php';
    ?>


  </div>

  <!-- Footer -->
  <footer class="text-center">
    <p>&copy; 2024 Temanku Unik</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <?php
  if (file_exists('public/js/' . $page . '.js')) {
    echo '<script src="public/js/' . $page . '.js"></script>';
  }
  ?>

</body>

</html>