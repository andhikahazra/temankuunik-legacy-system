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
        destroy: true,
        lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        pageLength: 20,
        bInfo: true,
        buttons: [
            'pageLength', 'copy', 'excel', 'pdf', 'print'
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
                "data": "id_identitas_pemberikerja",
                width: 5
            },
            {
                "data": function(val, item, index) {
                    // console.log(val);
                    MyApp.$me.dataRow[MyApp.$me.index] = val;
                    btn = "<a style='padding: 2px;' href='#' class='btUpdate' data-index='" + MyApp.$me.index + "'" +
                        " title='Update data'><i class='fa fa-pencil-square fa-2x'></i></a>" +
                        "<a style='color:#e80531;padding: 2px;' href='#' data-index='" + MyApp.$me.index + "' title='Hapus Data' class='btHapus'>" +
                        "<i class='fa fa-trash-o fa-2x'></i></a>";
                    MyApp.$me.index++;
                    return btn;
                },
                width: '8%'
            },
            // { "data": "id_reff_nama_jurusan" },
            { "data": "nama_pemberi_kerja" },
            { "data": "nama_badan_usaha" },
            { "data": "lapangan_usaha" },
            { "data": function (val, item, index) {
                var alamat = val.alamat;
                var kecamatan = val.KECAMATAN;
                var desa = val.KELURAHAN;
                var kodepos = val.kode_pos;

                if(desa==null){
                    namades='';
                } else {
                    namades=", "+desa+"";
                }

                 val ="<p>"+alamat+""+namades+", " +kecamatan+", " +kodepos+"</p>";
                return val;
              } 
            },
            { "data": "no_tlp" },
            { "data": "email" },
            { "data": "kontak_person" },
            { "data": "jabatan" },
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

                    validator.resetForm();
                    $(".cbProvinsi").val('0').select2();
                    $(".cbKabupaten").val('0').select2();
                    $('.cbBadanusaha').val('0').select2();
                    $('.cbLapanganusaha').val('0').select2();
                    $('.cbNamausaha').val('0').select2();
                    $(".cbKecamatan").val('0').select2();
                    $(".cbKalurahan").val('0').select2();
               
                    MyApp.preventLoad = false;
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
                //debugger;
                MyApp.setFormValues(idForm, dataRow);
                $('a[data-first="true"]').click();

                domcbBadanusaha.select2().select2('val', dataRow.id_reff_badan_usaha);
                load_namausaha(dataRow.id_reff_nama_usaha);
                load_kabupaten(dataRow.id_reff_kabupaten, dataRow.id_reff_kecamatan);
                load_kecamatan(dataRow.id_reff_kecamatan, dataRow.id_reff_desa);
                load_desa(dataRow.id_reff_desa);

            });

            /*Hapus data*/
            selectortable.on('click', '.btHapus', function() {
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                konfirmasi = confirm('Apakah anda yakin ingin menghapus data ' + dataRow.nama_pemberi_kerja);
                if (konfirmasi) {
                    hapus(dataRow);
                }
            });

        }
    });


    $('#form_target_realisasi').submit(function(e) {
        e.preventDefault();
    });

    $('.cbLapanganusaha').change(function(e) {
        if (!MyApp.preventLoad) load_namausaha();
    });

    $('.cbProvinsi').change(function(e) {
        if (!MyApp.preventLoad) load_kabupaten();
    });

    $('.cbKabupaten').change(function(e) {
        if (!MyApp.preventLoad) load_kecamatan();
    });

    $('.cbKecamatan').change(function(e) {
        $("input[name*='kode_pos']").val('');
        if (!MyApp.preventLoad) load_desa();
    });

    $('.cbKalurahan').change(function(e) {
        var selected = $(this).find('option:selected');
        var kode_pos = selected.data('pos');
        $("input[name*='kode_pos']").val(kode_pos);
        // debugger;
    });

     /*load badan usaha didatabase*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getBadanusaha'
    };
    domcbBadanusaha = $('.cbBadanusaha');
    MyApp.ajax(param2).done(function(resp) {
        domcbBadanusaha.html('<option value="0" selected>- Pilih Data Badan Usaha -</option>');
        $.each(resp.result, function(index, val) {
            domcbBadanusaha.append('<option value="' + val.id_reff_badan_usaha + '">' + val.nama_badan_usaha + '</option>');
        });
        domcbBadanusaha.select2().select2('val', '');
    });

     /*load tingkat lapangan usaha di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getLapanganusaha'
    };
    domcbLapanganusaha = $('.cbLapanganusaha');
    MyApp.ajax(param2).done(function(resp) {
        domcbLapanganusaha.html('<option value="0" selected>- Pilih Data Lapangan Usaha -</option>');
        $.each(resp.result, function(index, val) {
            domcbLapanganusaha.append('<option value="' + val.id_reff_lapangan_usaha + '">' + val.lapangan_usaha + '</option>');
        });
        // domcbLapanganusaha.select2().select2('val', '');
    });

     var load_namausaha = function(value = 0) {

        var param2 = {
            option: 'PUBLIC',
            action: 'getNamausaha',
            id_reff_lapangan_usaha: domcbLapanganusaha.val()
        };

        domcbNamausaha = $('.cbNamausaha');
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbNamausaha.html('<option value="0" selected>- Pilih Usaha -</option>');
            $.each(resp.result, function(index, val) {
                domcbNamausaha.append('<option value="' + val.id_reff_nama_usaha + '">' + val.nama_usaha + '</option>');
            });
             domcbNamausaha.val(value);
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
                        data2[i].nama_pemberi_kerja = nama = resp.result[i].nama_pemberi_kerja;
                        data2[i].id_reff_lapangan_usaha = nama = resp.result[i].id_reff_lapangan_usaha;
                        data2[i].alamat = nama = resp.result[i].alamat;
                        data2[i].no_tlp = nama = resp.result[i].no_tlp;
                        data2[i].email = nama = resp.result[i].email;
                        data2[i].kode_pos = nama = resp.result[i].kode_pos;
                        data2[i].kontak_person = nama = resp.result[i].kontak_person;
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


    /*load tingkat provinsi di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getProvinsi'
    };
    domcbProvinsi = $('.cbProvinsi');
    MyApp.ajax(param2).done(function(resp) {
        // MyApp.preventLoad = true;
        domcbProvinsi.html('<option value="0" selected>- Pilih Provinsi -</option>');
        $.each(resp.result, function(index, val) {
            domcbProvinsi.append('<option value="' + val.id_reff_provinsi + '">' + val.provinsi + '</option>');
        });
        // domcbProvinsi.select2().select2('val', '');
    });

    /*load kabupaten di database*/
    var load_kabupaten = function(value = 0, data_kab = 0) {

        var param2 = {
            option: 'PUBLIC',
            action: 'getKabupaten',
            id_reff_provinsi: domcbProvinsi.val()
        };

        domcbKabupaten = $('.cbKabupaten');
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbKabupaten.html('<option value="0" selected>- Pilih Kabupaten -</option>');
            $.each(resp.result, function(index, val) {
                domcbKabupaten.append('<option value="' + val.id_reff_kabupaten + '">' + val.kabupaten + '</option>');
            });
             domcbKabupaten.val(value);
            if (data_kab != 0) {
                load_kecamatan(data_kab);
            }
        });
    }

    /*load tingkat kecamatan di database*/
    var load_kecamatan = function(value = 0, data_kec = 0) {
        var param2 = {
            option: 'PUBLIC',
            action: 'getKecamatan',
            id_reff_kabupaten: domcbKabupaten.val()
        };

        domcbKecamatan = $('.cbKecamatan');
        MyApp.ajax(param2).done(function(resp) {
            domcbKecamatan.html('<option value="0" selected>- Pilih Data Kecamatan -</option>');
            $.each(resp.result, function(index, val) {
                domcbKecamatan.append('<option value="' + val.id_reff_kecamatan + '">' + val.KECAMATAN + '</option>');
            });
                domcbKecamatan.val(value);

                if (data_kec != 0) {
                    load_desa(data_kec);
                }
            // domcbKecamatan.select2().select2('val', '');
        });
    }

      /*load tingkat join kecamatan kalurahan di database*/
    // $('.cbKecamatan').on("change", function() {
    var load_desa = function(value = 0) {
        var param2 = {
            option: 'PUBLIC',
            action: 'getKalurahan',
            id_reff_kecamatan: domcbKecamatan.val()
        }
    
        domcbKalurahan = $('.cbKalurahan');
        MyApp.ajax(param2).done(function(resp) {
            // console.log(resp);
             domcbKalurahan.html('<option value="0" selected>- Pilih Data Kalurahan -</option>');
            $.each(resp.result, function(index, val) {
                domcbKalurahan.append('<option value="' + val.id_reff_desa + '" data-pos="' + val.KODE_POS + '">' + val.KELURAHAN + '</option>');
            });

            domcbKalurahan.val(value);
            // domcbKalurahan.select2().select2('val', dataRow.id_reff_desa);
        });
    }
    // });

    /*simpan form*/
    //$('.btSimpan').on('click', function() {
     var simpanData = function() {
        idForm = $('#form_input');
        dataForm = MyApp.getFormValues(idForm);
        var id_reff_badan_usaha = dataForm.id_reff_badan_usaha;
        var id_reff_lapangan_usaha = dataForm.id_reff_lapangan_usaha;
        var id_reff_nama_usaha = dataForm.id_reff_nama_usaha;
        var id_reff_kecamatan = dataForm.id_reff_kecamatan;
        var id_reff_desa = dataForm.id_reff_desa;
        
        if ( id_reff_badan_usaha == null || id_reff_badan_usaha == 0){
            alert('Anda belum memilih badan usaha');
        }else if ( id_reff_lapangan_usaha == null || id_reff_lapangan_usaha == 0){
            alert('Anda belum memilih lapangan usaha');
        } else if (id_reff_kecamatan==null || id_reff_kecamatan == 0){
            alert('Anda belum memilih kecamatan');
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
            nama_pemberi_kerja: "required",
            alamat: "required",
            no_tlp: "required",
            email: {
                required: true,
                // Specify that email should be validated
                // by the built-in "email" rule
                email: true
              },
            // kode_pos: "required",
            kontak_person: "required",
            jabatan: "required",
           
        },
        // Specify validation error messages
        messages: {
            nama_pemberi_kerja: "Silahkan Isi Data Nama Perusahaan",
            alamat: "Silahkan Isi Data Alamat",
            no_tlp: "Silahkan Isi Data Nomor Telepon",
            email: "Silahkan Isi Data Email dengan benar",
            kode_pos: "Silahkan Isi Data Kode Pos",
            // kontak_person: "Silahkan Isi Data Kontak Person",
            jabatan: "Silahkan Isi Data Jabatan",
           
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
})();

//# sourceURL=IdentitasPemberiKerja.js