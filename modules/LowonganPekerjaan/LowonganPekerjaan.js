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
                "data": "id_lowongan_pekerjaan",
                width: 5
            },
            {
                "data": function(val, item, index) {
                    MyApp.$me.dataRow[MyApp.$me.index] = val;
                    btn = "<a style='color:#e80531;padding: 2px;' href='#' data-index='" + val.id_lowongan_pekerjaan + "' title='Print Data' class='btCetak'>" +
                        "<i class='fa fa-print fa-2x'></i></a>"+
                        "<a style='padding: 2px;' href='#' class='btUpdate' data-index='" + MyApp.$me.index + "'" +
                        " title='Update data'><i class='fa fa-pencil-square fa-2x'></i></a>" +
                        "<a style='color:#e80531;padding: 2px;' href='#' data-index='" + MyApp.$me.index + "' title='Hapus Data' class='btHapus'>" +
                        "<i class='fa fa-trash-o fa-2x'></i></a>";
                    MyApp.$me.index++;
                    return btn;
                }, width: 80,
            },

       
            { "data": "nomor_pendaftaran" }, 
            { "data": function (val, item, index) {
                var tanggal = val.tgl_pendaftaran;
                var date = moment(tanggal).format('DD');
                var year = moment(tanggal).format('YYYY');
                var month = moment(tanggal).format('MM');
                return date + '-' + month + '-' + year;
              } , align:'center'
            }, 
            { "data": "batas_waktu" }, 
            { "data": "nama_pemberi_kerja" }, 
            { "data": "nama_jabatan" }, 
            { "data": "jml_lowongan" }, 
            { "data": "mekanisme_penempatan" }, 
            { "data": "negara"},
            // { "data": "tingkat_pendidikan" }, 
            // { "data": "jurusan_pendidikan" }, 
            { "data": "nama_jurusan" }, 
            // { "data": "keterampilan" }, 
            // { "data": "pengalaman" }, 
            // { "data": "syarat_khusus" }, 
            { "data": "sistem_pengupahan" }, 
            { "data": function (val, item, index) {
                var gaji_sebulan = val.gaji_sebulan;
            
                return "Rp."+gaji_sebulan.toLocaleString("id-ID");
                }
            }, 
            { "data": "status_hubungan_kerja" }, 
            { "data": "jml_jam_kerja" }, 
            { "data": "jaminan_sosial" }, 
            // { "data": "uraian_pekerjaan" }, 
            // { "data": "uraian_tugas" }, 
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
                    //reset combobox
                    $('.cbIdentitaspemberikerja').val('0').select2();
                    $('.cbJabatankerja').val('0').select2();
                    $('.cbNamajabatan').val('0').select2();
                    $('.cbJeniskelamin').val('0').select2();
                    $('.cbMekanismePenempatan').val('0').select2();
                    $('.cbProvinsi').val('0').select2();
                    $('.cbKabupaten').val('0').select2();
                    $('.cbPendkformal').val('0').select2();
                    $('.cbPendktinggi').val('0').select2();
                    $('.cbJurusan').val('0').select2();
                    $('.cbPengupahan').val('0').select2();
                    $('.cbHubkerja').val('0').select2();
                     $('.cbJaminansosial').val('0').select2();

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
                MyApp.setFormValues(idForm, dataRow);
                 $('a[data-first="true"]').click();
                
                //js
                var nilai =dataRow.jaminan_sosial;

                var splitValues = nilai.split(',');
                var multi = document.getElementById('cbJaminansosial');

                multi.value = null; // Reset pre-selected options (just in case)
                var multiLen = multi.options.length;

                for (var i = 0; i < multiLen; i++) {
                     // console.log(splitValues.indexOf(multi.options[i].value));
                  if (splitValues.indexOf(multi.options[i].value) >= 0) {
                    multi.options[i].selected = true;
                    domcbJaminansosial.select2().select2('val',splitValues );
                  }
                }

                load_jabatankerja(dataRow.id_reff_nama_jabatan);

  				load_penddktinggi(dataRow.id_reff_jurusan_pendidikan,dataRow.id_reff_nama_jurusan);
                


                domcbIdentitaspemberikerja.select2().select2('val', dataRow.id_identitas_pemberikerja);
                // domcbNamajabatan.select2().select2('val', dataRow.id_reff_nama_jabatan);
                domcbJeniskelamin.select2().select2('val', dataRow.id_reff_jk);
               

                domcbPengupahan.select2().select2('val', dataRow.id_reff_sistem_pengupahan);
                domcbHubkerja.select2().select2('val', dataRow.id_reff_status_hubungan_kerja);
                
                
                // domcbMekanismePenempatan.select2().select2('val', dataRow.id_reff_mekanisme_penempatan);
                load_provinsi(dataRow.id_reff_provinsi, dataRow.id_reff_kabupaten);
                load_kabupaten(dataRow.id_reff_kabupaten);
                // console.log(dataRow.id_reff_provinsi);

                // domcbPendkformal.select2().select2('val', id_reff_tingkat_pendidikan);
                // load_penddktinggi(dataRow.id_reff_tingkat_pendidikan, id_reff_jurusan_pendidikan);

              

                
                
                
                
            });

            /*Hapus data*/
            selectortable.on('click', '.btHapus', function() {
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                konfirmasi = confirm('Apakah anda yakin ingin menghapus data ' + dataRow.nomor_pendaftaran);
                if (konfirmasi) {
                    hapus(dataRow);
                }
            });

           /*Cetak pdf*/
            selectortable.on('click', '.btCetak', function() {
                id_lowongan_pekerjaan = $(this).data('index');
                // console.log(id_lowongan_pekerjaan);

                var params = {
                    option: 'PUBLIC',
                    action: 'laporanak3',
                    export_type: 'stream',
                    id_lowongan_pekerjaan:id_lowongan_pekerjaan,

                }

                MyApp.ajax(params).done(function (resp) {
                    if (resp.success) {
                        // console.log(resp);
                        MyApp.openPdf(resp.filename, 'Laporan AKIII');

                    }

                });
                /*MyApp.ajax(params).done(function(resp) {
                    // console.log(resp);
                    if (resp.success) {
                        MyApp.loadModuleFile('template/tpl_pdf.html', function(tpl) {
                            var dataRow = [];
                            data2 = [];
                            for (i = 0; i < resp.result.length; i++) {
                                data2[i] = {};
                                data2[i].id_lowongan_pekerjaan = nama = resp.result[i].id_lowongan_pekerjaan;
                                data2[i].tanggal = nama = resp.result[i].tanggal;
                                data2[i].nomor_pendaftaran = nama = resp.result[i].nomor_pendaftaran;
                                data2[i].batas_waktu = nama = resp.result[i].batas_waktu;
                                data2[i].nama_pemberi_kerja = nama = resp.result[i].nama_pemberi_kerja;
                                data2[i].lapangan_usaha = nama = resp.result[i].lapangan_usaha;
                                data2[i].alamat = nama = resp.result[i].alamat;
                                data2[i].KECAMATAN = nama = resp.result[i].KECAMATAN;
                                data2[i].KELURAHAN = nama = resp.result[i].KELURAHAN;
                                data2[i].provinsi = nama = resp.result[i].provinsi;
                                data2[i].kabupaten = nama = resp.result[i].kabupaten;
                                data2[i].no_tlp = nama = resp.result[i].no_tlp;
                                data2[i].email = nama = resp.result[i].email;
                                data2[i].kode_pos = nama = resp.result[i].kode_pos;
                                data2[i].kontak_person = nama = resp.result[i].kontak_person;
                                data2[i].jabatan = nama = resp.result[i].jabatan;
                                data2[i].nama_jabatan = nama = resp.result[i].nama_jabatan;
                                data2[i].jml_lowongan = nama = resp.result[i].jml_lowongan;
                                data2[i].jenis_kelamin = nama = resp.result[i].jenis_kelamin;
                                data2[i].mekanisme_penempatan = nama = resp.result[i].mekanisme_penempatan;
                                data2[i].negara = nama = resp.result[i].negara;
                                data2[i].kota = nama = resp.result[i].kota;
                                data2[i].tingkat_pendidikan = nama = resp.result[i].tingkat_pendidikan;
                                data2[i].jurusan_pendidikan = nama = resp.result[i].jurusan_pendidikan;
                                data2[i].nama_jurusan = nama = resp.result[i].nama_jurusan;
                                data2[i].keterampilan = nama = resp.result[i].keterampilan;
                                data2[i].pengalaman = nama = resp.result[i].pengalaman;
                                data2[i].syarat_khusus = nama = resp.result[i].syarat_khusus;
                                data2[i].sistem_pengupahan = nama = resp.result[i].sistem_pengupahan;
                                data2[i].gaji_sebulan = nama = parseInt(resp.result[i].gaji_sebulan).toLocaleString("id-ID");
                                data2[i].status_hubungan_kerja = nama = resp.result[i].status_hubungan_kerja;
                                data2[i].jml_jam_kerja = nama = resp.result[i].jml_jam_kerja;
                                data2[i].jaminan_sosial = nama = resp.result[i].jaminan_sosial;
                                data2[i].uraian_pekerjaan = nama = resp.result[i].uraian_pekerjaan;
                                data2[i].uraian_tugas = nama = resp.result[i].uraian_tugas;
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
                });*/
            });


        }
    });


    // $("input").on("change", function() {
    //     this.setAttribute(
    //         "data-date",
    //         moment(this.value, "YYYY-MM-DD")
    //         .format(this.getAttribute("data-date-format"))
    //     )
    // }).trigger("change");



    $('#form_target_realisasi').submit(function(e) {
        e.preventDefault();
    });


    $('.cbJabatankerja').change(function(e) {
        if (!MyApp.preventLoad) load_jabatankerja();
    });

    $('.cbMekanismePenempatan').change(function(e) {
        if (!MyApp.preventLoad) load_provinsi();
    });

    $('.cbProvinsi').change(function(e) {
        if (!MyApp.preventLoad) load_kabupaten();
    });

    $('.cbPendkformal').change(function(e) {
        if (!MyApp.preventLoad) load_penddktinggi();
    });

    $('.cbPendktinggi').change(function(e) {
        if (!MyApp.preventLoad) load_jurusan();
    });


  /*  $('.cbPendkformal').change(function(e) {
        if (!MyApp.preventLoad) load_jurusan();
    });

    $('.cbJurusanPendidikan').change(function(e) {
        if (!MyApp.preventLoad) load_namaJurusan();
    });

*/
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
        // domcbJabatan.select2().select2('val', '');
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


    /*load tingkat mekanisme penempatan di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getMekanismePenempatan'
    };
    domcbMekanismePenempatan = $('.cbMekanismePenempatan');
    MyApp.ajax(param2).done(function(resp) {
        domcbMekanismePenempatan.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbMekanismePenempatan.append('<option value="' + val.id_reff_mekanisme_penempatan + '">' + val.mekanisme_penempatan + '</option>');
        });
        // domcbMekanismePenempatan.select2().select2('val', '');
    });

     /*load provinsi di database*/
    var load_provinsi = function(value = 0, data_prov = 0) {

        var param2 = {
            option: 'PUBLIC',
            action: 'getProvinsi',
            id_reff_mekanisme_penempatan: domcbMekanismePenempatan.val()
        };

        domcbProvinsi = $('.cbProvinsi');
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbProvinsi.html('<option value="0" selected>- Pilih Data -</option>');
            $.each(resp.result, function(index, val) {
                domcbProvinsi.append('<option value="' + val.id_reff_provinsi + '">' + val.provinsi + '</option>');
            });
             domcbProvinsi.val(value);
             if (data_prov != 0) {
                load_kabupaten(data_prov);
            }

        });
    }

    var load_kabupaten = function(value = 0) {

        var param2 = {
            option: 'PUBLIC',
            action: 'getKabupaten',
            id_reff_provinsi: domcbProvinsi.val()
        };

        domcbKabupaten = $('.cbKabupaten');
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbKabupaten.html('<option value="0" selected>- Pilih Data -</option>');
            $.each(resp.result, function(index, val) {
                domcbKabupaten.append('<option value="' + val.id_reff_kabupaten + '">' + val.kabupaten + '</option>');
            });
             domcbKabupaten.val(value);

        });
    }

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
        // domcbPendkformal.select2().select2('val', '');
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

     /*load tingkat pengupahan di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getPengupahan'
    };
    domcbPengupahan = $('.cbPengupahan');
    MyApp.ajax(param2).done(function(resp) {
        domcbPengupahan.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbPengupahan.append('<option value="' + val.id_reff_sistem_pengupahan + '">' + val.sistem_pengupahan + '</option>');
        });
        domcbPengupahan.select2().select2('val', '');
    });


     /*load tingkat status hub kerja di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getHubkerja'
    };
    domcbHubkerja = $('.cbHubkerja');
    MyApp.ajax(param2).done(function(resp) {
        domcbHubkerja.html('<option value="0" selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbHubkerja.append('<option value="' + val.id_reff_status_hubungan_kerja + '">' + val.status_hubungan_kerja + '</option>');
        });
        domcbHubkerja.select2().select2('val', '');
    });

    /*load tingkat jaminan sosial di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getJaminansosial'
    };
    domcbJaminansosial = $('.cbJaminansosial');
    MyApp.ajax(param2).done(function(resp) {
        // domcbJaminansosial.html('<option value="0" disabled selected>- Pilih Data -</option>');
        $.each(resp.result, function(index, val) {
            domcbJaminansosial.append('<option value="' + val.jaminan_sosial + '">' + val.jaminan_sosial + '</option>');
        });
        domcbJaminansosial.select2().select2('val', '');
    });



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
         //console.log(dataForm);
        tgl_pendaftaran = dataForm.tgl_pendaftaran;
        batas_waktu = dataForm.batas_waktu;
        jml_lowongan = dataForm.jml_lowongan;
        nama_daerah = dataForm.nama_daerah;
        keterampilan = dataForm.keterampilan;
        pengalaman = dataForm.pengalaman;
        syarat_khusus = dataForm.syarat_khusus;
        gaji_sebulan = dataForm.gaji_sebulan;
        jml_jam_kerja = dataForm.jml_jam_kerja;
        uraian_pekerjaan = dataForm.uraian_pekerjaan;
        uraian_tugas = dataForm.uraian_tugas;
        id_identitas_pemberikerja = dataForm.id_identitas_pemberikerja;
        id_reff_jk = dataForm.id_reff_jk;
        id_reff_mekanisme_penempatan = dataForm.id_reff_mekanisme_penempatan;
        id_reff_tingkat_pendidikan = dataForm.id_reff_tingkat_pendidikan;
        id_reff_jurusan_pendidikan = dataForm.id_reff_jurusan_pendidikan;
        id_reff_nama_jurusan = dataForm.id_reff_nama_jurusan;
        id_reff_sistem_pengupahan = dataForm.id_reff_sistem_pengupahan;
        id_reff_status_hubungan_kerja = dataForm.id_reff_status_hubungan_kerja;
        jaminan_sosial = dataForm.jaminan_sosial;
        id_reff_nama_jabatan = dataForm.id_reff_nama_jabatan;

        if ( tgl_pendaftaran == ''  ){
            alert('Tanggal Pendaftaran Belum Diisi');
        } else if (batas_waktu == ''){
            alert('Batas Waktu Belum Diisi');
        } else if (jml_lowongan == ''){
            alert('Jumlah Lowongan Belum Diisi');
        } else if (nama_daerah == ''){
            alert('Nama Daerah Belum Diisi');
        } else if (keterampilan == ''){
            alert('Keterampilan Belum Diisi');
        } else if (pengalaman == ''){
            alert('Pengalaman Belum Diisi');
        } else if (syarat_khusus == ''){
            alert('Syarat Khusus Belum Diisi');
        } else if (gaji_sebulan == ''){
            alert('Gaji Sebulan Belum Diisi');
        } else if (jml_jam_kerja == ''){
            alert('Jumlah Jam Kerja Belum Diisi');
        } else if (uraian_pekerjaan == ''){
            alert('uraian_pekerjaan Belum Diisi');
        } else if (uraian_tugas == ''){
            alert('Uraian Tugas Belum Diisi');
        } else if (id_identitas_pemberikerja == null){
            alert('Nama Perusahaan Belum Dipilih');
        } else if (id_reff_nama_jabatan == null){
            alert('Nama Jabatan Belum Dipilih');
        } else if (id_reff_jk == null){
            alert('Jenis Kelamin Belum Dipilih');
        } else if (id_reff_mekanisme_penempatan == null){
            alert('Mekanisme Penempatan Belum Dipilih');
        } else if (id_reff_tingkat_pendidikan == null){
            alert('Pendidikan Formal Belum Dipilih');
        } else if (id_reff_jurusan_pendidikan == null){
            alert('Pendidikan Tertinggi Belum Dipilih');
        } else if (id_reff_nama_jurusan == null){
            alert('Jurusan Belum Dipilih');
        } else if (id_reff_sistem_pengupahan == null){
            alert('Sistem Pengupahan Belum Dipilih');
        } else if (id_reff_status_hubungan_kerja == null){
            alert('Hubungan Kerja Belum Dipilih');
        } else if (jaminan_sosial == null){
            alert('Jaminan Sosial Belum Dipilih');
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
	            tgl_pendaftaran: "required",
	            batas_waktu: "required",
	            jml_lowongan: "required",
	            nama_daerah: "required",
	            keterampilan: "required",
	            pengalaman: "required",
	            syarat_khusus: "required",
	            gaji_sebulan: "required",
	            jml_jam_kerja: "required",
	            uraian_pekerjaan: "required",
	            uraian_tugas: "required",
	        },
	        // Specify validation error messages
	        messages: {
	            tgl_pendaftaran: "Silahkan Isi Data Tanggal Pendaftaran",
	            batas_waktu: "Silahkan Isi Data Batas Waktu",
	            jml_lowongan: "Silahkan Isi Data Jumlah Lowongan",
	            nama_daerah: "Silahkan Isi Data Nama Daerah",
	            keterampilan: "Silahkan Isi Data Keterampilan",
	            pengalaman: "Silahkan Isi Data Pengalaman",
	            syarat_khusus: "Silahkan Isi Data Syarat Khusus",
	            gaji_sebulan: "Silahkan Isi Data Gaji Sebulan",
	            jml_jam_kerja: "Silahkan Isi Data Jumlah Jam Kerja",
	            uraian_pekerjaan: "Silahkan Isi Data Uraian Pekerjaan",
	            uraian_tugas: "Silahkan Isi Data Uraian Tugas",																						
	        },
	        // Make sure the form is submitted to the destination defined
	        // in the "action" attribute of the form when valid
	        submitHandler: function(form) {
	            // form.submit();
	            simpanData();
	        }
    });


    var nilai_gaji = document.getElementById("gaji_sebulan");
    nilai_gaji.addEventListener('keyup', function(evt){
        var ev = parseInt(this.value.replace(/\D/g,''),10);
        nilai_gaji.value = ev.toLocaleString('id');
    }, false);



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

//# sourceURL=LowonganPekerjaan.js