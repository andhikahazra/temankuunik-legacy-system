
    $(document).ready(function() {

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

        $("form#f_tamu input, form#f_tamu select").each(function() {
          var inputValue = $(this).val();

          if ((inputValue === "" ) || (inputValue == 0)) {
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

          if ((inputValue === "" ) || (inputValue == 0)) {
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
    

    });
  