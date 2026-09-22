$(document).ready(function () {
    cbInstansi = $('.cbInstansi');
    cbJenisdata = $('.cbJenisdata');
    cbTahun = $('.cbTahun');
    cbInstansi.select2();
    cbJenisdata.select2();
    cbTahun.select2();
    var MyApp = {};
    MyApp.$me = {};

    cbInstansi.on('change', function () {
        cbJenisdata.html('<option>--Pilih Jenis Data--</option>');
        param = {
            url: 'public-service.php',
            data: {
                instansi: cbInstansi.val(),
                action: 'loadJenisData'
            },
            method: 'POST'
        }
        $.ajax(param).done(function (resp) {
            resp = JSON.parse(resp);
            $.each(resp, function (index, val) {
                cbJenisdata.append('<option value="' + val.kode_data_pilah + '">' + val.judul_data_pilah + '</option>');
            })
        })
    })

    var loadCharts_old = function (data) {
        var kategori = []
        var dataSeri = []
        dataSeri[0]={};
        dataSeri[1]={};
        dataSeri[2]={};

        dataSeri[0]['name'] = "L";
        dataSeri[1]['name'] = "P";
        dataSeri[2]['name'] = "LP";

        dataSeri[0]['data'] = [];
        dataSeri[1]['data'] = [];
        dataSeri[2]['data'] = [];

        dataSeri[0]['lineWidth'] = 3;
        dataSeri[1]['lineWidth'] = 3;
        dataSeri[2]['lineWidth'] = 3;
        for (var i = 0; i < data.result.length; i++) {
            $.each(data.result[i], function (i, record) {
                if (record == null) {
                    record = 0;
                }
                if(i=='nama_baris'){
                    kategori.push(record)
                }
                if (i != 'kode_baris' && i != 'kode_data_pilah' && i != 'nama_baris') {
                    debugger;
                    indexKolom = i.substring(0, 5);
                    if (MyApp.$me.kolom[indexKolom] == 'L+P') {
                        dataSeri[2].data.push(MyApp.$me.totalLp);
                        MyApp.$me.totalLp = 0;
                    } else if (MyApp.$me.kolom[indexKolom] == 'L') {
                        dataSeri[0].data.push(record);
                        MyApp.$me.totalLp = MyApp.$me.totalLp + record;
                    }else if (MyApp.$me.kolom[indexKolom] == 'P') {
                        dataSeri[1].data.push(record);
                        MyApp.$me.totalLp = MyApp.$me.totalLp + record;
                    }
                    /*else {
                        td += "<td>" + record + "</td>";
                    }*/
                }
            })

        }

        Highcharts.chart('container', {
            xAxis: {
                categories: kategori
            },
            title: {
                text: $(".cbJenisdata option:selected").text()
            },
            series: dataSeri,
        });
    }


    var loadCharts = function (data) {
        var kategori = []
        var dataSeri = []

        /*dataSeri[0]={};
        dataSeri[1]={};
        dataSeri[2]={};

        dataSeri[0]['name'] = "L";
        dataSeri[1]['name'] = "P";
        dataSeri[2]['name'] = "LP";

        dataSeri[0]['data'] = [];
        dataSeri[1]['data'] = [];
        dataSeri[2]['data'] = [];

        dataSeri[0]['lineWidth'] = 3;
        dataSeri[1]['lineWidth'] = 3;
        dataSeri[2]['lineWidth'] = 3;*/

        $.each(data.kolomsingle,function (index, val) {
            dataSeri[index]={};
            dataSeri[index]['name'] = val;
            dataSeri[index]['data'] = [];
            dataSeri[index]['lineWidth'] = 3;
        })

        for (var k = 0; k < data.result.length; k++) {
            var m=0;
            $.each(data.result[k], function (i, record) {

                if (record == null) {
                    record = 0;
                }
                if(i=='nama_baris'){
                    kategori.push(record)
                }
                if (i != 'kode_baris' && i != 'kode_data_pilah' && i != 'nama_baris') {
                    // debugger;
                    dataSeri[m].data.push(record);
                    m++;

                    /*indexKolom = i.substring(0, 5);
                    if (MyApp.$me.kolom[indexKolom] == 'L+P') {
                        dataSeri[2].data.push(MyApp.$me.totalLp);
                        MyApp.$me.totalLp = 0;
                    } else if (MyApp.$me.kolom[indexKolom] == 'L') {
                        dataSeri[0].data.push(record);
                        MyApp.$me.totalLp = MyApp.$me.totalLp + record;
                    }else if (MyApp.$me.kolom[indexKolom] == 'P') {
                        dataSeri[1].data.push(record);
                        MyApp.$me.totalLp = MyApp.$me.totalLp + record;
                    }*/
                }
            })
        }
// debugger;
        Highcharts.chart('container', {
            xAxis: {
                categories: kategori
            },
            title: {
                text: $(".cbJenisdata option:selected").text()
            },
            series: dataSeri,
        });
    }

    /*
    contributor @arkan
    on submit filter*/
    $('#smart-form-filter').submit(function (e) {
        e.preventDefault();
        $('#dataTables').html("<h4>Data Tidak Ditemukan</h4>");
        $('#container').html("");
        param = {
            url: 'public-service.php',
            data: $(this).serialize(),
            method: "POST"
        }

        $.ajax(param).done(function (resp) {
            resp = JSON.parse(resp);
            var cell = '';
            var td = '';
            MyApp.$me.kolom = resp.kolom;
            $.each(resp.result, function (index, val) {
                no = index + 1;
                td += "<td style='text-align: center'>" + no + "</td>";
                $.each(val, function (i, record) {
                    if (record == null) {
                        record = 0;
                    }
                    if (i != 'kode_baris' && i != 'kode_data_pilah') {
                        if (i == 'nama_baris') {
                            MyApp.$me.namabaris = record;
                            td += "<td style='text-align: left;font-weight: bold;'>" + record + "</td>";
                        } else {
                            indexKolom = i.substring(0, 5);
                            if (MyApp.$me.kolom[indexKolom] == 'L+P') {
                                td += "<td>" + MyApp.$me.totalLp + "</td>";
                                MyApp.$me.totalLp = 0;
                            } else if (MyApp.$me.kolom[indexKolom] == 'L' || MyApp.$me.kolom[indexKolom] == 'P') {
                                MyApp.$me.totalLp = MyApp.$me.totalLp + record;
                                classInput = MyApp.$me.kolom[indexKolom] + MyApp.$me.namabaris;
                                td += "<td>" + record + "</td>";
                            } else {
                                td += "<td>" + record + "</td>";
                            }
                        }
                    }
                })
                cell += "<tr>" + td + "</tr>";
                td = '';
            })
            var judul = $(".cbJenisdata option:selected").text();
            /*$table = "<h3>" + judul + "</h3>" +
                "<table id='dataTables' class='table-bordered table'>" + resp.head_table +
                cell + "</table>";*/

            $('.judul').html(judul);
            $table = resp.head_table + cell ;
            $('#dataTables').html($table);
            loadCharts(resp);
        })
    })
})