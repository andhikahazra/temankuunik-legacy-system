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
      background-color: #AABFB8;
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
      min-height: calc(100vh - 160px);
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
  </style>
</head>

<body>

  <header class="container-fluid">
    <div class="row justify-content-between align-items-center">
      <!-- Nama Website di Kiri -->
      <div class="col-auto">
        <h2 class="mb-0">Temanku Unik</h2>
      </div>

      <!-- Menu di Kanan -->
      <div class="col-auto">
        <nav>
          <ul class="nav">

            <li class="nav-item"><a class="nav-link" href="#">About</a></li>

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
    <div class="container mt-5" style="width: 600px;">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <a class="nav-link active" id="nomor_hp-tab" data-bs-toggle="tab" href="#nomor_hp" role="tab" aria-controls="nomor_hp" aria-selected="true">Nomor HP</a>
        </li>
        <li class="nav-item" role="presentation">
          <a class="nav-link disabled" id="form_tamu-tab" data-bs-toggle="tab" href="#form_tamu" role="tab" aria-controls="form_tamu" aria-selected="false">Form Detail Tamu</a>
        </li>
        <li class="nav-item" role="presentation">
          <a class="nav-link disabled" id="form_kunjungan-tab" data-bs-toggle="tab" href="#form_kunjungan" role="tab" aria-controls="form_kunjungan" aria-selected="false">Detail Kunjungan</a>
        </li>
      </ul>

      <!-- Tab content -->
      <div class="tab-content mt-3">
        <!-- Nomor HP Tab -->
        <div class="tab-pane fade show active" id="nomor_hp" role="tabpanel" aria-labelledby="nomor_hp-tab">
          <h2>Masukkan Nomor HP</h2>
          <form action="" method="POST" autocomplete="off">
            <div class="mb-3 item-center mx-auto" style="width:500px">
              <label for="no_hp" class="form-label">Nomor HP</label>
              <input type="text" class="form-control" id="no_hp" name="no_hp" placeholder="Masukkan Nomor HP" required>
            </div>
            <button type="submit" class="btn btn-success btnHP">Submit</button>
          </form>
        </div>

        <!-- Form Detail Tamu Tab -->
        <div class="tab-pane fade" id="form_tamu" role="tabpanel" aria-labelledby="form_tamu-tab">
          <h2>Form Detail Tamu</h2>
          <form action="" method="POST" id="f_tamu" autocomplete="off">
            <div class="form-group mb-3 row">
              <label for="no_hp">Nomor HP</label>
              <input type="hidden" name="type_tamu" id="type_tamu" value="new">
              <input type="text" class="form-control" id="no_hp2" name="no_hp2" placeholder="Masukkan Nomor HP" readonly>
            </div>
            <div class="form-group mb-3 row">
              <label for="nama">Nama</label>
              <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan Nama" required>
            </div>
            <div class="form-group mb-3 row">
              <label for="instansi">Asal</label>
              <select class="form-select" id="instansi" name="instansi">
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

        <!-- Detail Kunjungan Tab -->
        <div class="tab-pane fade" id="form_kunjungan" role="tabpanel" aria-labelledby="form_kunjungan-tab">
          <h2>Detail Kunjungan</h2>
          <form action="#" method="POST" id="f_kunjungan" autocomplete="off">
            <div class="form-group mb-3 row">
              <label for="no_hp">Keperluan</label>
              <select class="form-select" id="keperluan" name="keperluan">
                <option value="Janji Ketemu">Janji Ketemu</option>
                <option value="Promo Produk">Promo Produk</option>
                <option value="PKL/Magang">PKL/Magang</option>
                <option value="LSM">LSM</option>
                <option value="Menyampaikan Surat/Proposal/Laporan">Menyampaikan Surat/Proposal/Laporan</option>
                <option value="Lainnya">Lainnya</option>
              </select>
            </div>
            <div class="form-group mb-3 row">
              <label for="catatan">Catatan</label>
              <textarea class="form-control" name="catatan" id="catatan"></textarea>
            </div>
            <button type="submit" class="btn btn-success btSimpan">Simpan</button>
          </form>
        </div>
      </div>
    </div>



  </div>

  <!-- Footer -->
  <footer class="text-center">
    <p>&copy; 2024 Temanku Unik</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function() {

      $('.btnHP').on('click', function(e) {
        e.preventDefault();

        let no_hp = $('#no_hp').val()
        // alert(no_hp);

        $.ajax({
          url: 'public/cek_nomor_hp.php',
          type: 'GET',
          dataType: 'json',
          data: {
            no_hp: no_hp
          },
          success: function(response) {
            console.log(response)
            let tamu = response.result;
            if (response.success == true) {
              console.log(tamu)
              // $('#nomor_hp').hide();
              $('#type_tamu').val(tamu.id);
              // $('#form_tamu').show();
              $('#no_hp2').val(tamu.no_hp)
              $('#no_hp2').prop('readonly', true);
              $('#nama').prop('readonly', true);
              $('#keterangan').prop('readonly', true);

              $('#instansi').val(tamu.instansi).change();
              $('#instansi').prop('disabled', 'disabled');
              $('#nama').val(tamu.nama);
              $('#keterangan').val(tamu.keterangan_asal);
            } else {
              $('#no_hp2').val(no_hp)
              $('#no_hp2').addClass("is-valid");
              $('.btBaru').hide()
              // $('#nomor_hp').hide();
              // $('#form_tamu').show();
            }
            $('#form_tamu-tab').removeClass('disabled');
            $('#form_tamu-tab').tab('show'); // Switch to the second tab
          }
        })

      })

      $('.btBaru').on('click', function(e) {
        e.preventDefault();
        $('#f_tamu')[0].reset();
        $('#type_tamu').val("new");
        $("form#f_tamu input").removeAttr("readonly");
        $('#instansi').prop('disabled', false);
        $('.btBaru').hide()
      })

      $('.btNext').on('click', function(e) {
        e.preventDefault();
        var isValid = true;

        $("form#f_tamu input").each(function() {
          var inputValue = $(this).val();

          if (inputValue === "") {
            isValid = false; // Set isValid to false if any input is empty
            console.log($(this).attr('id'))
            $(this).addClass("is-invalid"); // Add an error class for styling
            return false; // Break the loop if an empty input is found
          } else {
            isValid = true;
          }
        });

        if (isValid) {
          // All inputs are valid, proceed with form submission
          $(this).submit();
          // $('#form_tamu').hide();
          // $('#form_kunjungan').show();
          $('#form_kunjungan-tab').removeClass('disabled');
          $('#form_kunjungan-tab').tab('show');
        } else {
          // At least one input is empty, display an error message or prevent submission
          alert("Please fill in all required fields.");
        }
      })

      $("form#f_tamu").on("keyup", "input", function() {
        var inputValue = $(this).val();

        if (inputValue === "") {
          // Handle empty input field
          $(this).addClass("is-invalid");
        } else {
          $(this).addClass("is-valid");
          $(this).removeClass("is-invalid")
        }
      });

      $('.btSimpan').on('click', function(e) {
        e.preventDefault();
        let dataTamu = $('form#f_tamu').serializeArray();
        let dataKunjungan = $('form#f_kunjungan').serializeArray();
        // let data = []; 
        // var combinedData = $.extend({}, dataTamu, dataKunjungan);
        let combinedData = dataTamu.concat(dataKunjungan);

        // Convert the serialized array to an object
        let dataObj = {};
        $.each(combinedData, function(index, field) {
          dataObj[field.name] = field.value;
        });
        // console.log(data);
        $.ajax({
          url: 'public/save_kunjungan.php',
          type: 'POST',
          dataType: 'json',
          data: dataObj,
          success: function(response) {
            console.log(response)
            alert(response.msg)
            location.reload();
          }
        })

      })

    });
  </script>
</body>

</html>