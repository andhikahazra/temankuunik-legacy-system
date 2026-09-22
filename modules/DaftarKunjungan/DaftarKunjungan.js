// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    MyApp.$me.nomor = 0;
    MyApp.$me.index = 0;
    MyApp.$me.dataRow = [];
    MyApp.$me.draw = 0;
    MyApp.$me.aksi = 'add';
    var idForm = $('#form_input');
    MyApp.$me.dataForm = null;
   
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
                startDate: function(){
                   d= $('#startDate').val();
                   return d;
                },
                endDate: function () {
                    d= $('#endDate').val();
                   return d;
                },
                draw: function() {
                    MyApp.$me.draw++;
                    return MyApp.$me.draw;
                }
            }
        },
        "columns": [{
                "data": "id",
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
            {"data": "nama"},{"data": "kepentingan"},{"data":"instansi"},{"data":"keterangan_asal"},{"data": "Catatan"},{"data": "tanggal"},
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
                $('#form_input')[0].reset();
                MyApp.$me.aksi = 'update';
                $('#myModal').modal('show');
                validator.resetForm();
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
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

    $('.btTampilkan').on('click',function(e){
        e.preventDefault();
        // MyApp.$me.dataForm['startDate']=$('#startDate').val();
        // MyApp.$me.dataForm['endDate']=$('#endDate').val();

        console.log(getDataForm())
        MyApp.$me.selectorTable.ajax.reload()

    })


    $('#form_input').submit(function(e) {
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
                        data2[i]={};data2[i].id = nama=resp.result[i].id;data2[i].id_tamu = nama=resp.result[i].id_tamu;data2[i].kepentingan = nama=resp.result[i].kepentingan;data2[i].Catatan = nama=resp.result[i].Catatan;data2[i].tgl_input = nama=resp.result[i].tgl_input;
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
    var simpanData = function() {
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
    }

    var validator = $("#form_input").validate({
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            id: 'required',id_tamu: 'required',kepentingan: 'required',Catatan: 'required',tgl_input: 'required',
            kode: "required",
            lapangan_usaha: "required",
        },
        // Specify validation error messages
        messages: {
            id: 'Silahkan Isi Data Id',id_tamu: 'Silahkan Isi Data Id Tamu',kepentingan: 'Silahkan Isi Data Kepentingan',Catatan: 'Silahkan Isi Data Catatan',tgl_input: 'Silahkan Isi Data Tgl Input',
            kode: "Silahkan Isi Data Kode",
            lapangan_usaha: "Silahkan Isi Data Lapangan Usaha",
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
    function getDataForm(){
        let data = $('#formCari').serializeArray();
        return data;
    }

    $('.modal-backdrop').addClass('hide');
    setTimeout(function() {
        MyApp.$me('.overlay').hide();
    }, 500);
})();

//# sourceURL=DaftarKunjungan.js