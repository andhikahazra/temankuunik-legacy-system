// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    MyApp.$me.nomor = 0;
    MyApp.$me.index = 0;
    MyApp.$me.dataRow = [];
    MyApp.$me.draw = 0;
    MyApp.$me.aksi = 'add';
    var idForm = $('#form_input');
    MyApp.$me.selectorTable = $('#datatable_fixed_column').DataTable({
        serverSide: true,
        processing: true,
        // scrollY: 'auto',
        // "scrollY": "200px",
        // "sScrollY": "600",
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bScrollCollapse": true,
        "scrollCollapse": true,
        // responsive: true,
        lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        pageLength: 20,
        destroy: true,
        bInfo: true,
        buttons: [
            'excel'
        ],
        ajax: {
            url: "service.php",
            method: "POST",
            data: {
                Module: MyApp.curMod,
                option: "PUBLIC",
                action: "list",
                draw: function() {
                    MyApp.$me.draw++;
                    return MyApp.$me.draw;
                }
            }
        },
        "columns": [{
                "data": "id_penempatan_kerja",
                width: 5
            },
            {
                "data": function(val, item, index) {
                    MyApp.$me.dataRow[MyApp.$me.index] = val;
                    btn ="<a style='padding: 2px;' href='#' class='btUpdate' data-index='" + MyApp.$me.index + "'" +
                        " title='Update data'><i class='fa fa-pencil-square fa-2x'></i></a>" +
                        "<a style='color:#e80531;padding: 2px;' href='#' data-index='" + MyApp.$me.index + "' title='Hapus Data' class='btHapus'>" +
                        "<i class='fa fa-trash-o fa-2x'></i></a>";
                    MyApp.$me.index++;
                    return btn;
                }, width: 80,
            },

       
            { "data": "nik" },
            { "data": "nama_lengkap" }, 
            { "data": function (val, item, index) {
                var tanggal = val.tgl_penempatan;
                var date = moment(tanggal).format('DD');
                var year = moment(tanggal).format('YYYY');
                var month = moment(tanggal).format('MM');
                return date + '-' + month + '-' + year;
              } , align:'center'
            }, 
            { "data": "nama_pemberi_kerja" }, 
            { "data": "alamat" },
        ],
        dom: 'Bfrtip',
        rowCallback: function(row, data, index) {
            $('td:eq(0)', row).html(index + 1);
            return row;
        },
        initComplete: function() {
            cariField = $('input[type=search]');
            cariField.addClass('form-control');
            cariField.attr("placeholder", "Cari Data");

            $('.dataTables_filter label').contents().filter(function() {
                return this.nodeType == 3
            }).each(function() {
                this.textContent = this.textContent.replace('Search:', '');
            });

            button = '<button data-aksi="refresh" style="margin: 5px 5px 0 0" class="btn btn-danger btTop">' +
                '<i class="fa fa-refresh"></i> <span> Refresh</span>' +
                '</button>' +
                '<button data-aksi="add" style="margin: 5px 5px 0 0" class="btn btn-success btTop">' +
                '<i class="fa fa-plus"></i> <span> Tambah Data</span>' +
                '</button>';
            $('#datatable_fixed_column_filter').append(button);
            $('.btTop').click(function() {
                aksi = $(this).data('aksi');
                if (aksi === 'add') {
                    MyApp.$me.aksi = 'add';
                    $('#myModal').modal('show');
                    $('#form_input')[0].reset();

                    $('a[data-first="true"]').click();
                    MyApp.preventLoad = false;
                    validator.resetForm();

                    //reset combobox
                    var today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth() + 1; //January is 0!

                    var yyyy = today.getFullYear();
                    if (dd < 10) { dd = '0' + dd }
                    if (mm < 10) { mm = '0' + mm }
                    today = yyyy + '-' + mm + '-' + dd;
                    // console.log(today);
                    $("input[name*='tgl_penempatan']").val(today);
                    $('.cbPendkformal').val('0').select2();
                    $('.cbPendktinggi').val('0').select2();
                    $('.cbJurusan').val('0').select2();
                    $('.cbJeniskelamin').val('0').select2();
                    $('.cbIdentitaspemberikerja').val('0').select2();
                    $('.cbPendkformaltmpt').val('0').select2();
                    $('.cbPendktinggitmpt').val('0').select2();
                    $('.cbJurusantmpt').val('0').select2();
                    $('.cbJeniskelamintmpt').val('0').select2();
                    $('.cbJabatankerja').val('0').select2();
                    $('.cbNamajabatan').val('0').select2();
                    $('.cbJnskelamin').val('0').select2();
                    
                    

                } else if (aksi === 'refresh') {
                    MyApp.$me.selectorTable.ajax.reload();
                } else if (aksi === 'pdf') {
                    export_pdf();
                } else if (aksi === 'print') {
                    print_hal();
                } else if (aksi === 'excel') {
                    export_excel();
                }
            });

            selectortable = $('table');
            /*update data*/
            selectortable.on('click', '.btUpdate', function() {
                MyApp.preventLoad = false;
                MyApp.$me.aksi = 'update';
                $('#myModal').modal('show');
                validator.resetForm();
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                MyApp.setFormValues(idForm, dataRow);
                $('a[data-first="true"]').click();

                $('.cbPendkformal').val(dataRow.id_reff_tingkat_pendidikan).select2();
                $('.cbPendktinggi').val(dataRow.id_reff_jurusan_pendidikan).select2();
                $('.cbJurusan').val(dataRow.id_reff_nama_jurusan).select2();
                $('.cbJeniskelamin').val(dataRow.jenis_kelamin).select2();
                domcbIdentitaspemberikerja.select2().select2('val', dataRow.id_identitas_pemberikerja);
                $('.cbJabatankerja').val(dataRow.id_reff_jabatan_kerja).select2();
                $('.cbNamajabatan').val(dataRow.id_reff_nama_jabatan).select2();
                $('.cbJnskelamin').val(dataRow.id_reff_jk_tmpt).select2();
                $('.cbPendkformaltmpt').val(dataRow.id_reff_tingkat_pendidikan_tmpt).select2();
                $('.cbPendktinggitmpt').val(dataRow.id_reff_jurusan_pendidikan_tmpt).select2();
                $('.cbJurusantmpt').val(dataRow.id_reff_nama_jurusan_tmpt).select2();
            
            });

            /*Hapus data*/
            selectortable.on('click', '.btHapus', function() {
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                konfirmasi = confirm('Apakah anda yakin ingin menghapus data ' + dataRow.nik);
                if (konfirmasi) {
                    hapus(dataRow);
                }
            });
        }
    });



    $('#form_target_realisasi').submit(function(e) {
        e.preventDefault();
    });


    $('.cbPendkformal').change(function(e) {
        if (!MyApp.preventLoad) load_penddktinggi();
    });

    $('.cbPendktinggi').change(function(e) {
        if (!MyApp.preventLoad) load_jurusan();
    });

      $('.cbJabatankerja').change(function(e) {
        if (!MyApp.preventLoad) load_jabatankerja();
    });

       $('.cbPendkformaltmpt').change(function(e) {
        if (!MyApp.preventLoad) load_penddktinggitmpt();
    });

    $('.cbPendktinggitmpt').change(function(e) {
        if (!MyApp.preventLoad) load_jurusantmpt();
    });

    $('#close-tempat').on('click',function(){
        $('#myModal').modal('hide');
        var $active = $('.wizard .nav-tabs li.active');
        $active.prev().removeClass('disabled');
        prevTab($active);
        $('a[data-first="true"]').click();
        MyApp.$me.selectorTable.ajax.reload();

    });


    $('#btnCariNik').on("click",function(){
        var params = {
            option : 'PUBLIC',
            action : 'getnik',
            nik : $("#cariNik").val(),
        }

    MyApp.ajax(params).done(function(resp) {
        if (resp.success) {
            var data = resp.result;
            // console.log(data[0].nama_lengkap);
            $('.cbJeniskelamin').val(data[0].jenis_kelamin).select2();
            $('.cbPendkformal').val(data[0].id_reff_tingkat_pendidikan).select2();
            $('.cbPendktinggi').val(data[0].id_reff_jurusan_pendidikan).select2();
            $('.cbJurusan').val(data[0].id_reff_nama_jurusan).select2();
            
            $('#nama_lengkap').val(data[0].nama_lengkap);
            $('#id_pencari_kerja').val(data[0].id_pencari_kerja);

        }  else {
            $('#nama_lengkap').val('');
            $('#cariNik').focus();
        }

        });

    });

   /*load tingkat jenis kelamin di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getJenisKelamin'
    };
    domcbJeniskelamin = $('.cbJeniskelamin');
    MyApp.ajax(param2).done(function(resp) {
        domcbJeniskelamin.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbJeniskelamin.append('<option value="' + val.id_reff_jk + '">' + val.jenis_kelamin + '</option>');
        });
        domcbJeniskelamin.select2().select2('val', '');
    });


    /*load tingkat tinggi usaha di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getPendkformal'
    };
    domcbPendkformal = $('.cbPendkformal');
    MyApp.ajax(param2).done(function(resp) {
        domcbPendkformal.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbPendkformal.append('<option value="' + val.id_reff_tingkat_pendidikan + '">' + val.tingkat_pendidikan + '</option>');
        });
        domcbPendkformal.select2().select2('val', '');
    });

    var load_penddktinggi = function(value = 0, data_penddktinggi = 0) {
    var params = {
        option: 'PUBLIC',
        action: 'getPendktinggi',
        id_reff_tingkat_pendidikan: domcbPendkformal.val()
    }
    
    domcbPendktinggi = $('.cbPendktinggi');
    MyApp.ajax(params).done(function(resp) {
                // console.log(resp);
                 domcbPendktinggi.html('<option value="0" selected>- Pilih Data -</option>');
                $.each(resp.result, function(index, val) {
                    domcbPendktinggi.append('<option value="' + val.id_reff_jurusan_pendidikan + '">' + val.jurusan_pendidikan + '</option>');
                });
                 domcbPendktinggi.val(value);
                 if (data_penddktinggi != 0) {
                        load_jurusan(data_penddktinggi);
                 }

                 domcbPendktinggi.select2().select2('val', '');
        });
    }

    var load_jurusan = function(value = 0) {
    var params = {
        option: 'PUBLIC',
        action: 'getPendkjurusan',
        id_reff_jurusan_pendidikan: domcbPendktinggi.val()
    }
    
    domcbJurusan = $('.cbJurusan');
    MyApp.ajax(params).done(function(resp) {
                // console.log(resp);
                 domcbJurusan.html('<option value="0" disabled selected>- Pilih Data -</option>');
                $.each(resp.result, function(index, val) {
                    domcbJurusan.append('<option value="' + val.id_reff_nama_jurusan + '">' + val.nama_jurusan + '</option>');
                });
                
                 domcbJurusan.val(value);
        });
    }
    

   $('#btnCariPendaftaran').on("click",function(){
        var params = {
            option : 'PUBLIC',
            action : 'getloker',
            nomor_pendaftaran : $("#cariPendaftaran").val(),
        }

    MyApp.ajax(params).done(function(resp) {
        if (resp.success) {
            var data = resp.result;
            var batas_waktu = data[0].batas_waktu;
            var selisih_waktu = data[0].selisih_waktu;
            var id_lowongan_pekerjaan=data[0].id_lowongan_pekerjaan;
            var jml_lowongan = data[0].jml_lowongan;
            // console.log(id_lowongan_pekerjaan);
            if (selisih_waktu > batas_waktu ){
                var nilai_waktu =0; 
            } else {
                 var nilai_waktu =batas_waktu - selisih_waktu; 
            }

                var params = {
                    option : 'PUBLIC',
                    action : 'getlowongan',
                    id : id_lowongan_pekerjaan,
                }

                MyApp.ajax(params).done(function(resp) {
                    if (resp.success) {
                       var jmllow = resp.result[0].jml;

                       var selisih_low = jml_lowongan - jmllow;
                       // console.log(selisih_low);

                         $('.cbIdentitaspemberikerja').val(data[0].id_identitas_pemberikerja).select2();
                         $('.cbJabatankerja').val(data[0].id_reff_jabatan_kerja).select2();
                         $('.cbNamajabatan').val(data[0].id_reff_nama_jabatan).select2();
                         $('.cbJnskelamin').val(data[0].id_reff_jk).select2();
                         $('.cbPendkformaltmpt').val(data[0].id_reff_tingkat_pendidikan).select2();
                         $('.cbPendktinggitmpt').val(data[0].id_reff_jurusan_pendidikan).select2();
                         $('.cbJurusantmpt').val(data[0].id_reff_nama_jurusan).select2();
                         $('#id_identitas_pemberikerja').val(data[0].id_identitas_pemberikerja);
                         $('#jml_lowongan').val(selisih_low);
                         $('#batas_waktu').val(nilai_waktu);
                         $('#id_lowongan_pekerjaan').val(id_lowongan_pekerjaan);
                         

                    }
                });       

        }  else {
            $('#nama_lengkap').val('');
            $('#cariPendaftaran').focus();
        }

        });

    });

     /*load tingkat jenis kelamin di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getJenisKelamin'
    };
    domcbcbJnskelamin = $('.cbJnskelamin');
    MyApp.ajax(param2).done(function(resp) {
        domcbcbJnskelamin.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbcbJnskelamin.append('<option value="' + val.id_reff_jk + '">' + val.jenis_kelamin + '</option>');
        });
        domcbcbJnskelamin.select2().select2('val', '');
    });

   /*load pemberi kerja di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getIdentitaspemberikerja'
    };
    domcbIdentitaspemberikerja = $('.cbIdentitaspemberikerja');
    MyApp.ajax(param2).done(function(resp) {
        domcbIdentitaspemberikerja.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbIdentitaspemberikerja.append('<option value="' + val.id_identitas_pemberikerja + '">' + val.nama_pemberi_kerja + '</option>');
        });
        domcbIdentitaspemberikerja.select2().select2('val', '');
    });


    /*load Jabatan Kerja di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getJabatankerja'
    };
    domcbJabatankerja = $('.cbJabatankerja');
    MyApp.ajax(param2).done(function(resp) {
        // MyApp.preventLoad = true;
        domcbJabatankerja.html('<option value="0" disabled selected>- Pilih Jabatan -</option>');
        $.each(resp.result, function(index, val) {
            domcbJabatankerja.append('<option value="' + val.id_reff_jabatan_kerja + '">' + val.jabatan_kerja + '</option>');
        });
        domcbJabatankerja.select2().select2('val', '');
    });

    /*load Nama Jabatan di database*/
    var load_jabatankerja = function(value = 0) {
        var param2 = {
            option: 'PUBLIC',
            action: 'getNamajabatan',
            id_reff_jabatan_kerja: domcbJabatankerja.val()
        };

        domcbNamajabatan = $('.cbNamajabatan');
        MyApp.ajax(param2).done(function(resp) {
             // console.log(resp);
            domcbNamajabatan.html('<option value="0" selected>- Pilih Data -</option>');
            $.each(resp.result, function(index, val) {
                domcbNamajabatan.append('<option value="' + val.id_reff_nama_jabatan + '">' + val.nama_jabatan + '</option>');
            });
            // domcbNamajabatan.select2().select2('val', '');
             domcbNamajabatan.val(value);
        });
    }



    /*load tingkat tinggi usaha di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getPendkformal'
    };
    domcbPendkformaltmpt = $('.cbPendkformaltmpt');
    MyApp.ajax(param2).done(function(resp) {
        domcbPendkformaltmpt.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbPendkformaltmpt.append('<option value="' + val.id_reff_tingkat_pendidikan + '">' + val.tingkat_pendidikan + '</option>');
        });
        domcbPendkformaltmpt.select2().select2('val', '');
    });

    var load_penddktinggitmpt = function(value = 0, data_penddktinggitmpt = 0) {
    var params = {
        option: 'PUBLIC',
        action: 'getPendktinggi',
        id_reff_tingkat_pendidikan: domcbPendkformaltmpt.val()
    }
    
    domcbPendktinggitmpt = $('.cbPendktinggitmpt');
    MyApp.ajax(params).done(function(resp) {
                // console.log(resp);
                 domcbPendktinggitmpt.html('<option value="0" selected>- Pilih Data -</option>');
                $.each(resp.result, function(index, val) {
                    domcbPendktinggitmpt.append('<option value="' + val.id_reff_jurusan_pendidikan + '">' + val.jurusan_pendidikan + '</option>');
                });
                 domcbPendktinggitmpt.val(value);
                 if (data_penddktinggitmpt != 0) {
                        load_jurusantmpt(data_penddktinggitmpt);
                 }

                 domcbPendktinggitmpt.select2().select2('val', '');
        });
    }

    var load_jurusantmpt = function(value = 0) {
    var params = {
        option: 'PUBLIC',
        action: 'getPendkjurusan',
        id_reff_jurusan_pendidikan: domcbPendktinggitmpt.val()
    }
    
    domcbJurusantmpt = $('.cbJurusantmpt');
    MyApp.ajax(params).done(function(resp) {
                // console.log(resp);
                 domcbJurusantmpt.html('<option value="0" disabled selected>- Pilih Data -</option>');
                $.each(resp.result, function(index, val) {
                    domcbJurusantmpt.append('<option value="' + val.id_reff_nama_jurusan + '">' + val.nama_jurusan + '</option>');
                });
                
                 domcbJurusantmpt.val(value);
        });
    }

    /*export excel*/
    var export_excel = function() {
        MyApp.showLoading('Export excel');
        var param = {
            option: 'PUBLIC',
            action: 'excel',
            export_type: 'stream'
        };
        MyApp.ajax(param).done(function(resp) {
            if (resp.success) {
                window.location = MyApp.rootPath() + resp.filename;
                MyApp.hideLoading();
            }

        });
    };

    /*export pdf*/
    var export_pdf = function() {
        var params = {
            option: 'PUBLIC',
            action: 'pdf',
            export_type: 'stream'
        }
        MyApp.ajax(params).done(function(resp) {
            if (resp.success) {
                MyApp.openPdf(resp.filename, 'export_pdf');
            }
        });
    };

    /*Print Halaman*/
    var print_hal = function() {
        var params = {
            option: 'PUBLIC',
            action: 'listPrint'
        }
        MyApp.ajax(params).done(function(resp) {
            console.log(resp);
            if (resp.success) {
                MyApp.loadModuleFile('template/tpl_pdf.html', function(tpl) {
                    var dataRow = [];
                    data2 = [];
                    for (i = 0; i < resp.result.length; i++) {
                        data2[i] = {};
                        

                        //var print
                    }

                    dataRow.value = data2;
                    dataRow.judul = "Data Print ";
                    tpl = tpl + "<script type='javascript'>$(document).ready(function() { window.print() })</script>";
                    var rendered = Mustache.render(tpl, dataRow);
                    var win = window.open("", "Title", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1200, height=600");
                    win.document.body.innerHTML = rendered;
                    win.print();
                }).done(function() {

                });
            }
        });
    };

    /*simpan form*/
    // $('.btSimpan').on('click', function() {
      var simpanData = function() {
        idForm = $('#form_input');
        dataForm = MyApp.getFormValues(idForm);
         console.log(dataForm);
        tgl_penempatan = dataForm.tgl_penempatan;
        nik = dataForm.nik;
        nama_lengkap = dataForm.nama_lengkap;
        id_reff_jk = dataForm.id_reff_jk;
        id_reff_tingkat_pendidikan = dataForm.id_reff_tingkat_pendidikan;
        id_reff_jurusan_pendidikan = dataForm.id_reff_jurusan_pendidikan;
        id_reff_nama_jurusan = dataForm.id_reff_nama_jurusan;
        nomor_pendaftaran = dataForm.nomor_pendaftaran;
        batas_waktu = dataForm.batas_waktu;
        id_identitas_pemberikerja = dataForm.id_identitas_pemberikerja;
        id_reff_nama_jabatan = dataForm.id_reff_nama_jabatan;
        id_reff_jk_tmpt = dataForm.id_reff_jk_tmpt;
        id_reff_tingkat_pendidikan_tmpt = dataForm.id_reff_tingkat_pendidikan_tmpt;
        id_reff_jurusan_pendidikan_tmpt = dataForm.id_reff_jurusan_pendidikan_tmpt;
        id_reff_nama_jurusan_tmpt = dataForm.id_reff_nama_jurusan_tmpt;
        jml_lowongan = dataForm.jml_lowongan;

        if ( tgl_penempatan == ''  ){
            alert('Tanggal Penempatan masih kosong');
        } else if (nik == ''){
            alert('NIK masih kosong');
        } else if (nama_lengkap == ''){
            alert('Nama Lengkap masih kosong');
        } else if (id_reff_jk == null){
            alert('Jenis Kelamin masih kosong');
        } else if (id_reff_tingkat_pendidikan == null){
            alert('Pendidikan Formal masih kosong');
        } else if (id_reff_jurusan_pendidikan == null){
            alert('Pendidikan Tertinggi masih kosong');
        } else if (id_reff_nama_jurusan == null){
            alert('Jurusan masih kosong');
        } else if (nomor_pendaftaran == ''){
            alert('Nomor Pendaftaran masih kosong');
        } else if (batas_waktu == ''){
            alert('Batas Waktu masih kosong');
        } else if (batas_waktu == 0){
            alert('Waktu daftar sudah habis');
        } else if (id_identitas_pemberikerja == null){
            alert('Nama Perusahaan masih kosong');
        } else if (id_reff_jk_tmpt == null){
            alert('Jenis Kelamin masih kosong');
        } else if (id_reff_tingkat_pendidikan_tmpt == null){
            alert('Pendidikan Formal masih kosong');
        } else if (id_reff_jurusan_pendidikan_tmpt == null){
            alert('Pendidikan Tertinggi masih kosong');
        } else if (id_reff_nama_jurusan_tmpt == null){
            alert('Jurusan masih kosong');
        } else if (jml_lowongan == null ){
            alert('Jurusan masih kosong');
        } else if (jml_lowongan == 0){
            alert('Jumlah Lowongan sudah terpenuhi');
        } else {
            params = {
                option: 'PUBLIC',
                action: MyApp.$me.aksi,
                data: dataForm
            };

            MyApp.ajax(params).done(function(resp) {
                if (resp.success == true) {
                    $('#myModal').modal('hide');
                    alert(resp.msg);
                    var $active = $('.wizard .nav-tabs li.active');
                    $active.prev().removeClass('disabled');
                    prevTab($active);
                    $('#first').find('span').trigger('click');

                    MyApp.$me.selectorTable.ajax.reload();
                } else {
                    alert(resp.msg);
                }
            });
        }
        
    };

    var validator = $("#form_input").validate({
        // Specify validation rules
 
            rules: {
                // The key name on the left side is the name attribute
                // of an input field. Validation rules are defined
                // on the right side
                tgl_penempatan: "required",
                nik: "required",
                nama_lengkap: "required",
                id_reff_jk: "required",
                id_reff_tingkat_pendidikan: "required",
                id_reff_jurusan_pendidikan: "required",
                id_reff_nama_jurusan: "required"
            },
            // Specify validation error messages
            messages: {
                tgl_penempatan: "Silahkan Isi Data Tanggal Penempatan",
                nik: "Silahkan Isi Data NIK",
                nama_lengkap: "Silahkan Isi Data Nama",

            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                // form.submit();
                simpanData();
            }
    });


    /*hapus data*/
    var hapus = function(dataForm) {
            params = {
                option: 'PUBLIC',
                action: 'delete',
                data: dataForm
            };
            MyApp.ajax(params).done(function(resp) {
                if (resp.success == true) {
                    alert(resp.msg);

                    MyApp.$me.selectorTable.ajax.reload();
                } else {
                    alert(resp.msg);
                }
            })
        }
        // simulasi loading... hide setelah 500ms
    $('.modal-backdrop').addClass('hide');
    setTimeout(function() {
        MyApp.$me('.overlay').hide();
    }, 500);

    //Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();

    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {

        var $target = $(e.target);

        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function(e) {

        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active);

    });
    $(".prev-step").click(function(e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    });

    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
    }

    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }
})();

//# sourceURL=PenempatanKerja.js