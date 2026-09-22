
    $(document).ready(function() {
        const video = document.getElementById('video-feed');
        const canvas = document.getElementById('canvas-capture');
        const captureBtn = $('#capture-btn');
        let stream = null;


        const $inputHP = $('#no_hp');
        const $errorMsg = $('#error-message');

        // Filter Hanya Angka (Bagian 1)
        $inputHP.on('input', function() {
            // Ini memastikan input hanya angka
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });

        // Validasi Pola (Bagian 2: Saat kehilangan fokus/blur)
        $inputHP.on('blur', function() {
            const nomor = $inputHP.val();
            
            // Regex untuk nomor HP:
            // ^\\d{10,13}$: memastikan nomor dimulai (^) dan diakhiri ($) dengan 
            // 10 hingga 13 digit angka (\\d{10,13})
            const regexHP = /^\d{10,13}$/; 
            
            if (nomor.length === 0) {
                $errorMsg.text(''); // Kosongkan jika input kosong
            } else if (!regexHP.test(nomor)) {
                $errorMsg.text('Format nomor HP tidak valid. Harus 10-13 digit angka.');
                // Opsional: kosongkan input atau fokus kembali
                // $(this).focus();
            } else {
                $errorMsg.text('Nomor HP valid.');
                $errorMsg.css('color', 'green');
            }
        });

        let currentTarget = ''; 
        let currentImageData = '';
        const context = canvas.getContext('2d');

       
        function startWebcamStream(callback) {
              // Gunakan resolusi ideal 640x480 untuk kecepatan (bisa diubah)
              const constraints = {
                  video: { width: 320}//{ ideal: 640 }, height: { ideal: 480 } }
              };
              debugger;
              if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                  navigator.mediaDevices.getUserMedia(constraints)
                      .then(function(s) {
                          video.srcObject = s;
                          video.play();
                          const settings = s.getVideoTracks()[0].getSettings();
                          video.width = canvas.width = settings.width;
                          video.height = canvas.height = settings.height;
                          $('#capture-btn').prop('disabled', false);
                          callback(s); // Panggil callback jika berhasil
                      })
                      .catch(function(err) {
                          $('#modal-message').text('Gagal akses webcam: ' + err.name);
                          callback(null); // Panggil callback dengan null jika gagal
                      });
              }
          }

          // --- Fungsi Menghentikan Webcam ---
            function stopWebcamStream() {
                if (video.srcObject) {
                    video.srcObject.getTracks().forEach(track => track.stop());
                    video.srcObject = null;
                }
            }


          $('#capture-btn').on('click', function() {
              // Gambar frame video ke canvas
              context.drawImage(video, 0, 0, canvas.width, canvas.height);
              
              // Konversi gambar di canvas ke format Base64 
              // Hapus 'data:image/png;base64,' di awal string
              currentImageData = canvas.toDataURL('image/png').split(',')[1]; 

              $('#modal-message').text('Snapshot berhasil diambil. Silakan Simpan.');
              $('#save-btn').prop('disabled', false); // Aktifkan tombol Simpan
          });  

      $('#save-btn').on('click', function() {
        if (!currentImageData) {
            alert('Ambil snapshot terlebih dahulu.');
            return;
        }

        $('#save-btn').prop('disabled', true).text('Menyimpan...');
        // let dataTamu = $('form#f_tamu').serializeArray();
        let nomorHp= $('#no_hp2').val();

        // Kirim data gambar dan TIPE target ke PHP
        $.ajax({
            url: 'public/save_foto.php', 
            type: 'POST',
            data: { 
                image: currentImageData,
                target: currentTarget, // Tambahkan parameter target (ktp/wajah)
                nomorhp: nomorHp,
                type_tamu: $('#type_tamu').val()
            },
            dataType: 'json',
            success: function(response) {
              // console.log('test')
                $('#modal-message').text(response.message);
                if (response.status === 'success') {
                  console.log('#result-' + currentTarget)
                    // Tampilkan hasil di area yang sesuai
                    $('#result-' + currentTarget).html(
                        '<img src="data:image/png;base64,' + currentImageData + '" width="150" alt="Hasil Capture">' // Jika menggunakan path file
                    );

                    $('#path-' + currentTarget).val(response.path);
                    // Tutup modal setelah berhasil
                    // $('#close-modal-btn').trigger('click'); 
                }
            },
            error: function() {
                $('#modal-message').text('Gagal menyimpan ke server.');
            },
            complete: function() {
                $('#save-btn').prop('disabled', false).text('Simpan Gambar');
            }
        });
      });

      $('.btnHP').on('click', function(e) {
        e.preventDefault();
        $("form#f_tamu").trigger("reset");
        $("form#f_kunjungan").trigger("reset");  // Reset form values
        $("form#f_tamu input, form#f_tamu select").removeClass("is-valid is-invalid");
        $("form#f_kunjungan textarea, form#f_kunjungan select").removeClass("is-valid is-invalid");
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
              $('#nomor_hp').hide();
              $('#type_tamu').val(tamu.id);
              $('#form_tamu').show();
              $('#no_hp2').val(tamu.no_hp)
              $('#no_hp2').prop('readonly', true);
              $('#nama').prop('readonly', true);
              $('#keterangan').prop('readonly', true);

              $('#instansi').val(tamu.instansi).change();
              $('#instansi').prop('disabled', 'disabled');
              $('#nama').val(tamu.nama);
              $('#keterangan').val(tamu.keterangan_asal);
              if(tamu.path_ktp != null){
                console.log(tamu.path_ktp)
                $('#result-ktp').html(
                          '<img src="public/' + tamu.path_ktp + '" width="150" alt="Hasil Capture">' // Jika menggunakan path file
                      );
              }
                    $('#path-ktp').val(tamu.path_ktp);
              if(tamu.path_wajah != null){
                console.log(tamu.path_wajah)
                $('#result-wajah').html(
                          '<img src="public/' + tamu.path_wajah + '" width="150" alt="Hasil Capture">' // Jika menggunakan path file
                      );
              }

                    $('#path-ktp').val(tamu.path_wajah);



            } else {
              $('#no_hp2').val(no_hp)
              $('#no_hp2').addClass("is-valid");
              $('.btBaru').hide()
              $('#nomor_hp').hide();
              $('#form_tamu').show();
            }
            // $('#form_tamu-tab').removeClass('disabled');
            // $('#form_tamu-tab').tab('show'); // Switch to the second tab
          }
        })

      })
      
      $('#close-modal-btn').on('click', function() {
          stopWebcamStream(); // Matikan webcam
          // $('#webcam-modal').hide();
          currentTarget = ''; // Reset target
          currentImageData = ''; // Reset data gambar
          $('#webcam-modal').modal('hide');
  
      });

      $('#myModal').on('hidden.bs.modal', function () {
        // do something…
          currentTarget = ''; // Reset target
          currentImageData = ''; // Reset data gambar
      })
    

      $('.btt').on('click', function(e){
        e.preventDefault();
        // Ambil nilai dari atribut data-capture-for (ktp atau wajah)
        currentTarget = $(this).data('capture-for'); 
        $('#webcam-modal').modal('show');
        // Atur judul modal
        $('#modal-title').text(currentTarget === 'ktp' ? 'KTP' : 'WAJAH');
        // // $('#webcam-modal').show();
        $('#save-btn').prop('disabled', true); // Reset tombol Save
        $('#modal-message').text('Memulai Webcam...');
        // // debugger;
        // // Mulai Webcam
        startWebcamStream(function(stream) {
            if (stream) {
                $('#modal-message').text('Webcam aktif. Silakan ambil snapshot.');
            }
        });

        console.log('test')
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

         $("form#f_tamu input:not([type='hidden']):not([name='path-ktp']):not([name='path-wajah']), form#f_tamu select").each(function() {
              const $input = $(this);
              const inputValue = $input.val();

              if (!inputValue || inputValue == 0) {
                  isValid = false;
                  $input.addClass("is-invalid").focus();
                  return false; // Break the loop
              } else {
                  $input.removeClass("is-invalid");
              }
          });

        if (isValid) {
          // All inputs are valid, proceed with form submission
          $(this).submit();
          $('#form_tamu').hide();
          $('#form_kunjungan').show();
          // $('#form_kunjungan-tab').removeClass('disabled');
          // $('#form_kunjungan-tab').tab('show');
        } else {
          // At least one input is empty, display an error message or prevent submission
          alert("Silakan diisi sebelum melanjutkan.");
        }
      })

      $("form#f_tamu").on("keyup change", "input, select", function() {
        var inputValue = $(this).val();

        if (inputValue === "") {
          // Handle empty input field
          $(this).addClass("is-invalid");
        } else {
          $(this).addClass("is-valid");
          $(this).removeClass("is-invalid")
        }
      });


      $("form#f_kunjungan").on("keyup change", "input, select, textarea", function() {
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

        var isValid = true;

        $("form#f_kunjungan input, form#f_kunjungan select, form#f_kunjungan textarea").each(function() {
          var inputValue = $(this).val();
          var inputName = $(this).attr('name');

          if (inputName === "grupnb" && !$('#grup').is(':checked')) {
              return true; // Continue to next iteration
          }

          if ((inputValue === "" ) || (inputValue == 0)) {
            if (inputName === "grup") {
                // Skip validation for the grup checkbox itself
                isValid = true;  
            } else {
                isValid = false;
                console.log($(this).attr('id'))
                $(this).addClass("is-invalid");
                return false; // Break the loop
            }
          } else {
              $(this).removeClass("is-invalid"); // Remove invalid class if valid
          }
        });


        if (isValid) {
          // All inputs are valid, proceed with form submission
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
              // alert(response.msg)
              // location.reload();

              showToast();
    
              // Optionally, reload the page after the toast disappears
              setTimeout(function() {
                location.reload(); // Reload the page after 4 seconds
              }, 2000); // Matches the toast's display time
            }
          })
        } else {
          // At least one input is empty, display an error message or prevent submission
          alert("Silakan dilengkapi kembali sebelum melanjutkan.");
        }



        

      })

      function showToast() {
        var notificationToast = new bootstrap.Toast($('#notificationToast'));
        notificationToast.show();
      }


      
      $("#grup").change(function(){
        if(!this.checked){
          $('#grupnb').hide();
          
        }else{
          $('#grupnb').show();
        }
      })
    });
  