// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    MyApp.$me.nomor = 0;
    MyApp.$me.index = 0;
    MyApp.$me.dataRow = [];
    MyApp.$me.draw = 0;
    MyApp.$me.aksi = 'add';
    MyApp.$me.totalLp = 0;
    MyApp.$me.totalDataNonLp = 0;
    var dataSeries = [];
    var tahunIndex = []
    var idForm = $('#form_input');
    var optionsGlobal = {}
    var printGlobal = '';
    var tabelGlobal = '';


    MyApp.$me.selectorTable = $('#datatable_fixed_column').DataTable({
        serverSide: true,
        processing: true,
        destroy: true,
        lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        paging: false,
        bInfo: true,
        buttons: [],
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
                "data": "id_data_pilah",
                width: 5
            },
            {
                "data": function(val, item, index) {
                    MyApp.$me.dataRow[val.id_data_pilah] = val;
                    btn = "<button style='color:#4286f4;padding: 2px;' data-index='" + val.id_data_pilah + "' title='Input Data' class='btTambahData'>" +
                        "<i class='fa fa-list fa-2x'></i></button>" +
                        /*"<a style='color:#175fd3;padding: 2px;margin-left: 10px;' href='#' data-index='" + val.id_data_pilah + "' title='view Data' class='btView'>" +
                        "<i class='fa fa-search fa-2x'></i></a>" +*/
                        "";
                    MyApp.$me.index++;
                    return btn;
                },
                width: '5%'
            }, { "data": "judul_data_pilah" }
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

            button = '<button data-aksi="refresh" style="margin: 5px 5px -41px 0" class="btn btn-danger btTop">' +
                '<i class="fa fa-refresh"></i> <span> Refresh</span>' +
                '</button>' +
                /*'<button data-aksi="add" style="margin: 5px 5px 0 0" class="btn btn-success btTop">' +
                '<i class="fa fa-plus"></i> <span> Tambah Data</span>' +
                '</button>' +*/
                '<button data-aksi="pdf" style="margin: 5px 5px -41px 0" class="btn btn-warning btTop">' +
                '<i class="fa fa-file-pdf-o"></i> <span> PDF</span>' +
                '</button>' +
                /*'<button data-aksi="excel" style="margin: 0 5px 0 0" class="btn btn-app btTop">' +
                 '<i class="fa fa-file-excel-o"></i> <span> Excel</span>' +
                 '</button>'+*/
                '<button data-aksi="print" style="margin: 5px 5px -41px 0" class="btn btn-primary btTop">' +
                '<i class="fa fa-print"></i> <span> Print</span>' +
                '</button>';
            $('#datatable_fixed_column_filter').append(button);
            $('.btTop').click(function() {
                aksi = $(this).data('aksi');
                if (aksi === 'add') {
                    MyApp.$me.aksi = 'add';
                    $('#myModal').modal('show');
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

            /*Tambah data*/
            selectortable.on('click', '.btTambahData', function() {
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                var d = new Date();
                var x = 0;
                for (var m = d.getFullYear() - 5; m <= d.getFullYear(); m++) {
                    dataSeries[x] = {};
                    dataSeries[x].name = m;
                    dataSeries[x].data = [];
                    tahunIndex[m] = x;
                    x++;
                }

                loadFormFormat(dataRow);
            });
        }
    });

    /*load form format dari tpl*/
    MyApp.$me.dataRowFormat = {}

    var loadFormFormat = function(dataRow, tahun = 2016) {
        var curtahun = tahun;
        MyApp.$me.dataRowFormat = dataRow;
        if (dataRow.kode_data_pilah == '02') {
            dataSeries = [];
            var d = new Date();
            dataSeries[0] = {};
            dataSeries[0].name = d.getFullYear() - 1;
            dataSeries[0].data = [];
            tahunIndex[d.getFullYear() - 1] = 0;
        }

        params = {
            option: 'PUBLIC',
            action: 'getDataFormat',
            tahun: tahun,
            id_data_pilah: dataRow.id_data_pilah,
            kode_data_pilah: dataRow.kode_data_pilah
        }
        MyApp.ajax(params).done(function(resp) {
            var cell = '';
            var td = '';
            MyApp.$me.kolom = resp.kolom;
            var colspantahun = 0;
            var kolomChild = "";
            var kolomParent = "";
            var kolomTahun = "";
            var categoriesCart = [];
            $.each(resp.kolomHead, function(index, val) {
                if (index !== 0) {
                    kolomParent += "<th style='text-align: center;' class='th-format' colspan='" + val.length + "'>" + index + "</th>";
                }

                $.each(val, function(idx, child) {
                    kolomChild += "<th style='text-align: center; padding: 3px;' class='th-format'>" + child + "</th>";
                    colspantahun++;
                })
            })
            var kolomHeader = "<tr><th style='text-align: center;' class='th-format' rowspan='3'>No</th><th class='th-format' rowspan='3'>" +
                MyApp.$me.dataRowFormat.header_baris;
            $until = (dataRow.kode_data_pilah == '02') ? 1 : 5;
            for (var m = 0; m < $until; m++) {
                kolomTahun += "<th style='text-align: center;' class='th-format' colspan='" + colspantahun + "'>" + resp.tahun[m] + "</th>"
            }

            if (MyApp.$me.dataRowFormat.header_baris.toLowerCase() == 'tahun') {
                kolomHeader += "</th><th></th></tr>" +
                    "<tr>" + kolomParent + "</tr>" +
                    "<tr>" + kolomChild + "</tr>";
            } else if (dataRow.kode_data_pilah == '02') {
                kolomHeader += "</th>" + kolomTahun + "</tr>" +
                    "<tr>" + kolomParent + "</tr>" +
                    "<tr>" + kolomChild + "</tr>";
            } else {
                kolomHeader += "</th>" + kolomTahun + "</tr>" +
                    "<tr>" + kolomParent + kolomParent + kolomParent + kolomParent + kolomParent + "</tr>" +
                    "<tr>" + kolomChild + kolomChild + kolomChild + kolomChild + kolomChild + "</tr>";
            }


            kolomHeader = "<thead>" + kolomHeader + "</thead>";

            MyApp.$me.currtahun = '';
            $.each(resp.result, function(index, val) {
                no = index + 1;
                td += "<td style='text-align: center'>" + no + "</td>";
                $.each(val, function(i, record) {
                    if (record == null) {
                        record = 0;
                    }
                    if (i != 'kode_baris' && i != 'kode_data_pilah') {
                        if (i == 'nama_baris') {
                            MyApp.$me.namabaris = record;
                            td += "<th style='text-align: left;'>" + record + "</th>";
                            categoriesCart.push(record);
                        } else {
                            MyApp.$me.indextahun = i.substring(i.length - 4, i.length);
                            MyApp.$me.pangkaltahun = MyApp.$me.indextahun;

                            indexKolom = i.substring(0, 5);
                            if (MyApp.$me.kolom[indexKolom] == 'L+P') {
                                var nf = new Intl.NumberFormat();
                                MyApp.$me.totalLp = nf.format(MyApp.$me.totalLp);
                                td += "<td style='padding: 3px;text-align: right'>" + MyApp.$me.totalLp + "</td>";

                                if (dataRow.kode_data_pilah == '02') {
                                    // debugger;
                                    cekIndex = i.split('_');
                                    if (cekIndex[1] == '03') {
                                        MyApp.$me.totalLpAll = MyApp.$me.totalLp;
                                    } else {
                                        MyApp.$me.totalLpAll = MyApp.$me.totalLpAll + MyApp.$me.totalLp;
                                    }
                                    var nf = new Intl.NumberFormat();
                                    MyApp.$me.totalLpAll = nf.format(MyApp.$me.totalLpAll);

                                    if (cekIndex[1] == '27') {
                                        dataSeries[tahunIndex[MyApp.$me.indextahun]].data.push(MyApp.$me.totalLp)
                                    }
                                }
                                MyApp.$me.totalLp = 0;
                            } else if (MyApp.$me.kolom[indexKolom] == 'L' || MyApp.$me.kolom[indexKolom] == 'P') {
                                MyApp.$me.isLp = true;
                                MyApp.$me.totalLp = MyApp.$me.totalLp + record;
                                classInput = MyApp.$me.kolom[indexKolom] + MyApp.$me.namabaris;
                                var nf = new Intl.NumberFormat();
                                record = nf.format(record);
                                td += "<td style='padding: 3px;text-align: right'>" + record + "</td>";
                            } else {
                                MyApp.$me.isLp = false;
                                MyApp.$me.totalDataNonLp = MyApp.$me.totalDataNonLp + record;
                                var nf = new Intl.NumberFormat();
                                record = nf.format(record);
                                td += "<td style='padding: 3px;'>" + record + "</td>";
                            }
                            // debugger;
                            if (MyApp.$me.currtahun == '' && dataRow.kode_data_pilah != '02') {
                                MyApp.$me.indextahun = (MyApp.$me.pangkaltahun == 2014) ? 2015 : MyApp.$me.indextahun;
                                MyApp.$me.currtahun = MyApp.$me.indextahun;
                                if (MyApp.$me.isLp == true) {
                                    dataSeries[tahunIndex[MyApp.$me.indextahun]].data.push(MyApp.$me.totalLp)
                                } else {
                                    dataSeries[tahunIndex[MyApp.$me.indextahun]].data.push(MyApp.$me.totalDataNonLp);
                                }
                            }
                            if (MyApp.$me.currtahun != MyApp.$me.indextahun && dataRow.kode_data_pilah != '02') {
                                /*if(MyApp.$me.pangkaltahun==2014){
                                    MyApp.$me.currtahun++;
                                    MyApp.$me.indextahun = MyApp.$me.currtahun;
                                }*/
                                MyApp.$me.indextahun = (MyApp.$me.pangkaltahun == 2014) ? 2015 : MyApp.$me.indextahun;
                                MyApp.$me.currtahun = MyApp.$me.indextahun;
                                if (MyApp.$me.isLp == true) {
                                    dataSeries[tahunIndex[MyApp.$me.indextahun]].data.push(MyApp.$me.totalLp)
                                } else {
                                    dataSeries[tahunIndex[MyApp.$me.indextahun]].data.push(MyApp.$me.totalDataNonLp);
                                }
                                MyApp.$me.totalLp = 0;
                                MyApp.$me.totalDataNonLp = 0;
                                //tahunIndex[m]
                            }


                        }
                    }
                })

                cell += "<tr>" + td + "</tr>";
                td = '';
            })
            if (MyApp.$me.pangkaltahun == 2014) {
                dataOlahSeries = dataSeries;
                dataSeries = []
                $.each(dataOlahSeries, function(idx, val) {
                    // debugger;
                    if (val != undefined) {
                        if (val.data.length !== 0) {
                            dataSeries.push(val)
                        }
                    }
                })
                dataSeries[0].name = '';
            }
            /*dataSeries = [{
                name: 'Tokyo',
                data: [49.9, 71.5, 106.4, 129.2, 144.0]
            }]*/
            // debugger;
            $table = "<table style='border: 1px;' cellspacing='0px' class='table-bordered2 table-bordered'>" + kolomHeader +
                cell + "<tfoot></tfoot></table>";
            tabelGlobal = $table
            $('.renderedFormat').html($table);
            $('.titleDataFormat').html(MyApp.$me.dataRowFormat.judul_data_pilah);
            $('#myModalFormatForm').modal('show');

            /*load grafik*/
            optionsGlobal = {
                chart: {
                    type: 'column'
                },
                title: {
                    text: MyApp.$me.dataRowFormat.judul_data_pilah
                },
                /*subtitle: {
                    text: 'Source: WorldClimate.com'
                },*/
                xAxis: {
                    categories: categoriesCart,
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Jumlah'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: dataSeries

                /*series: [{
                    name: 'Tokyo',
                    data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

                }, {
                    name: 'New York',
                    data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

                }, {
                    name: 'London',
                    data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

                }, {
                    name: 'Berlin',
                    data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

                }]*/
            }
            var chart = Highcharts.chart('container_cart', optionsGlobal);

        })
    }

    /*event on click print*/
    $('.btnPrint').click(function() {
        printDiv('print');
    })

    /*event on click words*/
    $('.btnWord').click(function() {
        printDiv('words');
    })

    function get_html_dataplah() {
        var divToPrint = document.getElementById('printarea');
        printGlobal = divToPrint.innerHTML
        $css = ' <style type="text/css"> ' +
            '.table-bordered, .table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {' +
            '    border: 1px solid #000;font-size: 11px;border-spacing: 0px;border-collapse: collapse;' +
            '}' +
            '        @page {' +
            '                        size: 210mm 330mm;' +
            // '                        margin: 27mm 16mm 27mm 16mm;' +
            '                        margin: 10mm 10mm 10mm 10mm;' +
            '                    }' +
            '@media print {' +
            '        html, body {' +
            '            margin-top: 7mm;margin-left: 3mm;margin-bottom: 7mm;margin-right: 5mm;' +
            '        }' +
            'table{width: 100% !important;}' +
            '.renderedFormat{overflow: none}' +
            '.table-bordered, .table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {' +
            '    border: 1px solid #000;font-size: 11px;border-spacing: 0px;border-collapse: collapse;' +
            '} #printarea{overflow:none}' +
            '.th-format {' +
            '    padding: 2px !important;' +
            '    background-color: #7ED5EB;' +
            '} ' +
            'td{' +
            '   margin: 0px;' +
            '   ' +
            '}' +
            '    }</style>'


        var judul = MyApp.$me.dataRowFormat.judul_data_pilah;
        return '<html><head>' + $css + '</head><body onload="window.print()">' + '<h2>' + judul + '</h2>' + divToPrint.innerHTML.replace('overflow: auto', '') + '</body></html>';
    }


    /*fungsi buat print elemen html*/
    function printDiv(tipe) {
        var html = get_html_dataplah();
        if (tipe == 'print') {
            var newWin = window.open('', 'Print-Window');
            newWin.document.open();
            newWin.document.write(html);
            newWin.document.close();
        } else if (tipe == 'words') {
            html = html.replace("<html><head>", header);
            var cart = $($.parseHTML(html)).filter('#container_cart').html();
            var cartArr = cart.split('<svg')
            var cartArr2 = cartArr[1].split('</svg>')
            cart = '<svg ' + cartArr2[0] + '</svg>'

            // debugger;
            var data = {
                options: JSON.stringify(optionsGlobal),
                filename: 'test.png',
                type: 'image/png',
                svg: cart,
                async: true
            };
            opsi = {
                method: 'post',
                data: data,
                url: 'https://export.highcharts.com/'
            }

            $.ajax(opsi).done(function(resp) {
                var exportUrl = 'https://export.highcharts.com/';
                var imageUrl = exportUrl + resp;
                var htmlWord = "<html xmlns:o='urn:schemas-microsoft-com:office:office' " +
                    "xmlns:w='urn:schemas-microsoft-com:office:word' " +
                    "xmlns='http://www.w3.org/TR/REC-html40'>" +
                    "<head><meta charset='utf-8'></head><body><h2>" + MyApp.$me.dataRowFormat.judul_data_pilah + "</h2><hr>" + tabelGlobal + "<hr><img src='" + imageUrl + "'></body></html>";
                debugger;
                var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(htmlWord);
                var fileDownload = document.createElement("a");
                document.body.appendChild(fileDownload);
                fileDownload.href = source;
                fileDownload.download = 'document.doc';
                fileDownload.click();
                document.body.removeChild(fileDownload);
            })


        }

        /*setTimeout(function () {
            newWin.close();
        }, 10);*/
    }

    /*on change combo tahun*/
    $('#myModalFormatForm').on('change', '#idTahun', function() {
        $tahun = $(this).val();
        loadFormFormat(MyApp.$me.dataRowFormat, $tahun);
    })

    /*on submit form data format*/
    $('#myModalFormatForm').on('click', '.btSimpanDataFormat', function() {
        dataForm = MyApp.getFormValues($('#myModalFormatForm form#formDataFormat'));
        var $dataAll = $.extend(dataForm, MyApp.$me.dataRowFormat);
        /*params = {
            option:'PUBLIC',
            action:'UpdateDataFormat',
            data : $dataAll
        }
        MyApp.ajax(params).done(function (resp) {
            alert('berhasil');
            loadFormFormat(MyApp.$me.dataRowFormat,$dataAll.tahun);
        })*/

        $.ajax({
            url: "service.php?option=PUBLIC&action=UpdateDataFormat&Module=FormatDatagender",
            data: {
                data: $dataAll
            },
            method: "POST"
        }).done(function(resp) {
            alert('Berhasil Menyimpan');
            loadFormFormat(MyApp.$me.dataRowFormat, $dataAll.tahun);
        })

    })

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

    /*on click button pdf data pilah*/
    $('.btnPdf').click(function() {
        export_pdf_data_pilah()
    })

    var export_pdf_data_pilah = function() {
        var html = get_html_dataplah();
        $.ajax({ //&export_type=stream
            url: "service.php?option=PUBLIC&action=pdfdatapilah&Module=LaporanData&export_type=stream",
            data: {
                html: html
            },
            method: "POST"
        }).done(function(resp) {
            resp = JSON.parse(resp)
            if (resp.success) {
                MyApp.openPdf(resp.filename, 'export_pdf');
            }
        })

        /*var params = {
            option: 'PUBLIC',
            action: 'pdfdatapilah',
            export_type: 'stream'
        }
        MyApp.ajax(params).done(function (resp) {
            if (resp.success) {
                MyApp.openPdf(resp.filename, 'export_pdf');
            }
        });*/
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
                        data2[i].id_format = nama = resp.result[i].id_format;
                        data2[i].title = nama = resp.result[i].title;
                        data2[i].grup_format = nama = resp.result[i].grup_format;
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