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
        bInfo: true,
        pageLength: 50,
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
                "data": "id_reff_kecamatan",
                width: 5
            },
            {
                "data": function(val, item, index) {
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
            /* { "data": "id_reff_kecamatan" }, { "data": "ID_PROP" }, { "data": "ID_KAB" }, { "data": "ID_KEC" },  */
            { "data": "provinsi" },
            { "data": "kabupaten" },
            { "data": "KECAMATAN" },
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
                    $('.cbProvinsi').val('0').select2();
                    $('.cbKabupaten').val('0').select2();

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
                MyApp.$me.aksi = 'update';
                $('#myModal').modal('show');
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                MyApp.setFormValues(idForm, dataRow);

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
                     domcbProvinsi.select2().select2('val', dataRow.id_reff_provinsi);
                });

                /*load kabupaten di database*/
                $('.cbProvinsi').on("change", function() {
                    var param2 = {
                        option: 'PUBLIC',
                        action: 'getKabupaten',
                        id_reff_provinsi: $('.cbProvinsi').val()
                    };
                    domcbKabupaten = $('.cbKabupaten');
             
                    MyApp.ajax(param2).done(function(resp) {
                        // MyApp.preventLoad = true;
                        domcbKabupaten.html('<option value="0" selected>- Pilih Kabupaten -</option>');
                        $.each(resp.result, function(index, val) {
                            domcbKabupaten.append('<option value="' + val.id_reff_kabupaten + '">' + val.kabupaten + '</option>');
                        });
                       domcbKabupaten.select2().select2('val', dataRow.id_reff_kabupaten);
                    });
                });
                
            });

            /*Hapus data*/
            selectortable.on('click', '.btHapus', function() {
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                konfirmasi = confirm('Apakah anda yakin ingin menghapus data ' + dataRow.KECAMATAN);
                if (konfirmasi) {
                    hapus(dataRow);
                }
            });

        }
    });


    $('#form_target_realisasi').submit(function(e) {
        e.preventDefault();
    });

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
        domcbProvinsi.select2().select2('val', '');
    });

    /*load kabupaten di database*/
    $('.cbProvinsi').on("change", function() {
        var param2 = {
            option: 'PUBLIC',
            action: 'getKabupaten',
            id_reff_provinsi: $('.cbProvinsi').val()
        };
        domcbKabupaten = $('.cbKabupaten');
 
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbKabupaten.html('<option value="0" selected>- Pilih Kabupaten -</option>');
            $.each(resp.result, function(index, val) {
                domcbKabupaten.append('<option value="' + val.id_reff_kabupaten + '">' + val.kabupaten + '</option>');
            });
            // domcbKabupaten.select2().select2('val', '');
        });
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
                        data2[i].id_reff_kecamatan = nama = resp.result[i].id_reff_kecamatan;
                        data2[i].ID_PROP = nama = resp.result[i].ID_PROP;
                        data2[i].ID_KAB = nama = resp.result[i].ID_KAB;
                        data2[i].ID_KEC = nama = resp.result[i].ID_KEC;
                        data2[i].KECAMATAN = nama = resp.result[i].KECAMATAN;
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
    $('.btSimpan').on('click', function() {
        idForm = $('#form_input');
        dataForm = MyApp.getFormValues(idForm);
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
        })
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

//# sourceURL=SampleModule.js