// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    MyApp.$me.nomor = 0;
    MyApp.$me.index = 0;
    MyApp.$me.dataRow = [];
    MyApp.$me.draw = 0;
    MyApp.$me.aksi = 'add';
    var idForm = $('#form_input');

    var print_presensi = function() {
        var params = {
            option: 'PUBLIC',
            action: 'presensi',
            export_type: 'stream'
        }
        MyApp.ajax(params).done(function(resp) {
            if (resp.success) {
                MyApp.openPdf(resp.filename, 'export_pdf');
            }
        });
    };


    MyApp.$me.selectorTable = $('#datatable_fixed_column').DataTable({
        serverSide: true,
        processing: true,
        destroy: true,
        lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        bInfo: false,
        "scrollX": true,
        "scrollY": 300,
        "iDisplayLength": 20,
        lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "Semua"]
        ],
        buttons: [
            'pageLength', 'excel'
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
                "data": "id_pendaftar",
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
                width: 10
            },
            {
                "data": function(val, item) {
                    const monthNames = ["Januari", "Februari", "Marrt", "April", "Mei", "Juni",
                        "Juli", "Augustus", "September", "Oktober", "November", "Desember"
                    ];
                    var dateObj = new Date(val.input_date);
                    var month = monthNames[dateObj.getMonth()];
                    var day = String(dateObj.getDate()).padStart(2, '0');
                    var year = dateObj.getFullYear();
                    var seconds = dateObj.getSeconds();
                    var minutes = dateObj.getMinutes();
                    var hour = dateObj.getHours();
                    var output = day + ' ' + month + ' ' + year /*+'<br> '+hour+':'+minutes+':'+seconds*/ ;
                    return output;
                    //input_date
                }
            },
            { "data": "nik" },
            { "data": "nama" },
            {
                "data": function(val, id) {
                    if (val.tanggal_lahir) {
                        var d = new Date();
                        var yearNow = d.getFullYear();
                        var dateLahir = new Date(val.tanggal_lahir);
                        var thnLahir = dateLahir.getFullYear();
                        return (yearNow - thnLahir);
                    } else {
                        return 0;
                    }
                }
            },
            { "data": "alamat" },
            { "data": "kecamatan" },
            { "data": "email" },
            { "data": "no_hp" },
            {
                "data": function(val, id) {
                    return (val.smartphone == 0) ? "Tidak Punya" : "Punya";
                }
            },
            { "data": "minat" },

        ],
        dom: 'Bfrtip',
        rowCallback: function(row, data, index) {
            $('td:eq(0)', row).html(index + 1);
            return row;
        },
        "columnDefs": [{
            "targets": '_all',
            "createdCell": function(td, cellData, rowData, row, col) {
                $(td).css('padding', '5px');
            }
        }, { width: 2000, targets: 1 }],
        initComplete: function() {
            cariField = $('input[type=search]');
            cariField.addClass('form-control');
            cariField.attr("placeholder", "Cari Data");

            $('.dataTables_filter label').contents().filter(function() {
                return this.nodeType == 3
            }).each(function() {
                this.textContent = this.textContent.replace('Search:', '');
            });

            button = '<button data-aksi="refresh" style="margin: 0px 5px 0 0" class="btn btn-danger btTop">' +
                '<i class="fa fa-refresh"></i> <span> Refresh</span>' +
                '</button>' +
                /*'<button data-aksi="add" style="margin: 5px 5px 0 0" class="btn btn-success btTop">' +
                '<i class="fa fa-plus"></i> <span> Tambah Data</span>' +
                '</button>' +*/
                '<button data-aksi="pdf" style="margin: 0px 5px 0 0" class="btn btn-warning btTop">' +
                '<i class="fa fa-file-pdf-o"></i> <span> Cetak Undangan</span>' +
                '</button>'
                /*'<button data-aksi="excel" style="margin: 0 5px 0 0" class="btn btn-app btTop">' +
                 '<i class="fa fa-file-excel-o"></i> <span> Excel</span>' +
                 '</button>'+*/
                /*'<button data-aksi="presensi" style="margin: 0px 5px 0 0" class="btn btn-primary btTop">' +
                '<i class="fa fa-print"></i> <span> Cetak Presensi</span>' +
                '</button>'*/
            ;
            $('.dt-buttons').append(button);
            $('.btTop').click(function() {
                aksi = $(this).data('aksi');
                if (aksi === 'add') {
                    MyApp.$me.aksi = 'add';
                    $('#myModal').modal('show');
                } else if (aksi === 'refresh') {
                    MyApp.$me.selectorTable.ajax.reload();
                } else if (aksi === 'pdf') {
                    $('#myModalUndangan').modal('show');
                    // export_pdf();
                } else if (aksi === 'presensi') {
                    print_presensi();
                    // print_hal();
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
                var dateArr = dataRow.input_date.split(' ')
                dataRow.input_date = dateArr[0];
                MyApp.setFormValues(idForm, dataRow);
            });

            /*Hapus data*/
            selectortable.on('click', '.btHapus', function() {
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                konfirmasi = confirm('Apakah anda yakin ingin menghapus data ' + dataRow.id);
                if (konfirmasi) {
                    hapus(dataRow);
                }
            });

        }
    });


    $('#form_target_realisasi').submit(function(e) {
        e.preventDefault();
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
    var export_pdf = function(dataForm) {
        var params = {
            option: 'PUBLIC',
            action: 'pdf',
            data: dataForm,
            export_type: 'stream'
        }
        MyApp.ajax(params).done(function(resp) {
            if (resp.success) {
                MyApp.openPdf(resp.filename, 'export_pdf');
            }
        });
    };


    $('.btnCetak').click(function() {
        var dataForm = MyApp.getFormValues($('#form_input_undangan'))
        export_pdf(dataForm);
    })

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
                        data2[i].id_pendaftar = nama = resp.result[i].id_pendaftar;
                        data2[i].nik = nama = resp.result[i].nik;
                        data2[i].nama = nama = resp.result[i].nama;
                        data2[i].alamat = nama = resp.result[i].alamat;
                        data2[i].email = nama = resp.result[i].email;
                        data2[i].no_hp = nama = resp.result[i].no_hp;
                        data2[i].input_date = nama = resp.result[i].input_date;
                        data2[i].update_date = nama = resp.result[i].update_date;
                        data2[i].user_update = nama = resp.result[i].user_update;
                        data2[i].smartphone = nama = resp.result[i].smartphone;
                        data2[i].minat = nama = resp.result[i].minat;
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