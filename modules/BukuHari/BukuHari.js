// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    // MyApp.loadModuleCss('style.css');
    
var loadChart = function(pBulan =null, pTahun = null ){

        var params = {
                    option: 'PUBLIC',
                    action: 'list',
                    bulan: pBulan,
                    tahun: pTahun
                    // data: item
                }

        MyApp.ajax(params).done(function(resp) {
            if (resp.success) {
               
               
                console.log(Object.values(resp.result))
                data = resp.result.kunjungans;
                const tglArray = data.map(item => item.tgl);
                const jmlArray = data.map(item => item.jml);

                data2 = resp.result.kunjungan;
                const tglArray2 = data2.map(item => item.tgl);
                const jmlArray2 = data2.map(item => item.jml);

                const combined = data.map(kunjunganItem => {
                    const matchingKunjungan = data2.find(item => item.tgl === kunjunganItem.tgl);
                    
                    return {
                        tgl: kunjunganItem.tgl,
                        jml_kunjungans: kunjunganItem.jml,
                        jml_kunjungan: matchingKunjungan ? matchingKunjungan.jml : 0 // Default to 0 if no match
                    };
                });
                console.log(combined);
                //start highchart
                Highcharts.chart('linecontainer', {

                    title: {
                        text: 'Jumlah Kunjungan Bulan Ini',
                        align: 'left'
                    },
                     yAxis: {
                        title: {
                            text: 'Jumlah Kunjungan'
                        }
                    },
                    plotOptions: {
                        series: {
                            label: {
                                connectorAllowed: false
                            },
                            pointStart: 1
                        }
                    },

                    series: [{
                        name: 'Jml Kunjungan',
                        data: jmlArray,
                    },
                    {
                        name: 'Jumlah Pengunjung',
                        data: jmlArray2,
                    }
                    ],

                    

                });

                tablexx= $('#datatable_fixed_column').DataTable({
                    lengthChange: false,
                    info: false,
                    bFilter: false,
                    bPaginate: false,
                    scrollX: false,
                    data: combined,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength', 'copy', 'excel', 'pdf', 'print'
                    ],
                    columnDefs: [
                        {"className": "dt-center", "targets": "_all"}
                    ],
                    columns: [  
                                                
                                { 
                                    title: "No", data: null, render: function (data, type, row, meta) {
                                    return meta.row + meta.settings._iDisplayStart + 1;
                                    } 
                                },
                               
                                { title: "Tanggal", data: "tgl" },
                                { title: "Jumlah Kunjungan", data: "jml_kunjungans" },
                                { title: "Jumlah Pengunjung", data: "jml_kunjungan" }

                    ],

                    initComplete: function () {
                        cariField = $('input[type=search]');
                        cariField.addClass('form-control');
                        cariField.attr("placeholder", "Cari Data");

                        //$('#datatable_fixed_column_filter').append(btn);
                        $('.btTop').click(function () {
                            aksi = $(this).data('aksi');
                            if(aksi === 'add'){
                                MyApp.$me.aksi = 'add';
                                $('#myModal').modal('show');
                            }else if(aksi === 'refresh'){
                                MyApp.ajax.reload();
                            }else if(aksi === 'pdf'){
                                export_pdf();
                            }else if(aksi === 'print'){
                                print_hal();
                            }else if(aksi === 'excel'){
                                export_excel();
                            }
                        });
            
                        /*Tambah data*/
                        $('#datatable_fixed_column').on('click','.btTambahData',function () {
                            index = $(this).data('index');
                            dataRow = MyApp.$me.dataRow[index];
                            loadFormFormat(dataRow);
                        });
                    }
                })

                //end highchart

            }
        });
    }


    

    $('.btTampilkan').on("click",function(e){
        e.preventDefault();

        var tahun = $('.cbTahun').val();
        var bulan = $('.cbBulan').val();

        console.log(tahun);
        loadChart(bulan,tahun);        
    })


    $('.btTampilkan').click();

})();

//# sourceURL=BukuHari.js