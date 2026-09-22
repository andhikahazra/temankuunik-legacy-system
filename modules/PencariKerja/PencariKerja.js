// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    MyApp.$me.nomor = 0;
    MyApp.$me.index = 0;
    MyApp.$me.dataRow = [];
    MyApp.$me.draw = 0;
    MyApp.$me.aksi = 'add';
    var i3=0;
    MyApp.$me.item3=[];
    cek=0;
    
    var idForm = $('#form_input');
       // var checkedValue = $('#msgcheckbox:checked').val();
    MyApp.$me.selectorTable = $('#datatable_fixed_column').DataTable({
        serverSide: true,
        processing: true,
        // scrollY: 'auto',
        // "scrollY": "200px",
        "sScrollY": "600",
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bScrollCollapse": true,
        "scrollCollapse": true,
        // responsive: true,
        destroy: true,
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
                "data": "id_pencari_kerja",
                width: 5
            },
            {
                "data": function(val, item, index) {
                    MyApp.$me.dataRow[MyApp.$me.index] = val;
                    // console.log(val.id_pencari_kerja);
                    btn = "<a style='padding: 2px;' href='#' class='btUpdate' data-index='" + MyApp.$me.index + "'" +
                        " title='Update data'><i class='fa fa-pencil-square fa-2x'></i></a>" +
                        "<a style='color:#e80531;padding: 2px;' href='#' data-index='" + MyApp.$me.index + "' title='Hapus Data' class='btHapus'>" +
                        "<i class='fa fa-trash-o fa-2x'></i></a>";
                    MyApp.$me.index++;
                    return btn;
                },
                width: '8%'
            }, {
                "data": function(val, item, index) {
                    MyApp.$me.dataRow[MyApp.$me.index] = val;
                    // console.log(val.id_pencari_kerja);
                    btn = "<a style='color:#343bc7;padding: 2px;' href='#' data-index='" + val.id_pencari_kerja + "' title='Print Data' class='btCetakak1'>" +
                        "<i class='fa fa-print fa-2x'></i></a>";
                    MyApp.$me.index++;
                    return btn;
                },
                width: '8%'
            },
            {
                "data": function(val, item, index) {
                    MyApp.$me.dataRow[MyApp.$me.index] = val;
                    // console.log(val.id_pencari_kerja);
                    btn = "<a style='color:#e80531;padding: 2px;' href='#' data-index='" + val.id_pencari_kerja + "' title='Cetak Data AKII' class='btCetakak2'>" +
                        "<i class='fa fa-print fa-2x'></i></a>";
                    MyApp.$me.index++;
                    return btn;
                },
                width: '8%'
            },
            // { "data": "id_pencari_kerja" },
            {
                "data": "data_foto",
                "render": function(data, type, row, meta) {
                    if (data === null) {
                        return '<img src="img/no_photo.png" alt="File Kosong" height="70" width="50"/>';
                    } else {
                        return '<a target="_blank" href="' + data + '"><img src="' + data + '" alt="' + data + '"height="70" width="50"/></a>';
                    }
                }
            },
            {
                "data": "data_ktp",
                "render": function(data, type, row, meta) {
                    if (data === null) {
                        return 'File Kosong';
                    } else {
                        return '<a target="_blank" href="' + data + '"><i class="fa fa-download" title="Download Berkas"></i></a>';
                    }
                },
            },
            { "data": "no_pendaftaran" },
            { "data": "tanggal_daftar" },
            { "data": "nik" },
            { "data": "nama_lengkap" },
            { "data": "tempat_lahir" },
            { "data": "tangal_lahir" },
            { "data": "jenis_kelamin_" },
            { "data": "agama" },
            { "data": "alamat" },
            { "data": "no_hp" },
            { "data": "email" },
            { "data": "kode_pos" },
            { "data": "status_" },
            { "data": "jurusan_pendidikan" },
            { "data": function(data, type, row, meta) {
 
                    id_pencari_kerja = data.id_pencari_kerja;
                    first_name = data.first_name;
             
                    btn = "<a style='padding: 2px;' href='#' class='detail_ijazah' data-idpencaker='" + id_pencari_kerja + "'" +
                        " title='File Ijazah'><b><i>Ijazah "+ first_name +"</i></b></a>";
                    
                     return btn;
                   
                },
            },
            { "data": function(data, type, row, meta) {
 
                    id_pencari_kerja = data.id_pencari_kerja;
                    first_name = data.first_name;
             
                    btn = "<a style='padding: 2px;' href='#' class='detail_bahasa' data-idpencaker='" + id_pencari_kerja + "'" +
                        " title='Sertifikat Bahasa'><b><i>Sertifikat Bahasa "+ first_name +"</i></b></a>";
                    
                     return btn;
                   
                },
            },
             { "data": function(data, type, row, meta) {
 
                    id_pencari_kerja = data.id_pencari_kerja;
                    first_name = data.first_name;
             
                    btn = "<a style='padding: 2px;' href='#' class='detail_cv' data-idpencaker='" + id_pencari_kerja + "'" +
                        " title='Surat Pengalaman'><b><i>Surat Pengalaman "+ first_name +"</i></b></a>";
                    
                     return btn;
                   
                },
            },
            // { "data": "bahasa_dikuasai_" },
            { "data": "catatan_pengantar_kerja" },
            { "data": "jabatan_kerja" },
            { "data": "nama_jabatan" },
            { "data": "lokasi_" },
            { "data": "upah_pencaker" },
            { "data": "statusku" },
             
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
                    cek=1;
                    $(".role-step2").addClass('disabled');
                    $(".role-step3").addClass('disabled');
                    MyApp.$me.aksi = 'add';
                    $('#myModal').modal('show');
                    // $("input[name*='tanggal_daftar']").datepicker({ format: 'mm/dd/yyyy' }).datepicker('setDate', '+0');
                    $('#form_input')[0].reset();
                    domcbBahasaDikuasai.select2().select('val', '');
                    $('a[data-first="true"]').click();
                    MyApp.preventLoad = false;
                    validator.resetForm();
                    destroy_fileinput();
                    set_files();
                    var today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth() + 1; //January is 0!

                    var yyyy = today.getFullYear();
                    if (dd < 10) { dd = '0' + dd }
                    if (mm < 10) { mm = '0' + mm }
                    today = yyyy + '-' + mm + '-' + dd;
                    console.log(today);
                    $("input[name*='tanggal_daftar']").val(today);
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
                cek=0;
                $(".role-step2").removeClass('disabled');
                $(".role-step3").removeClass('disabled');
                $('#form_input')[0].reset();
                destroy_fileinput();
                // set_files();
                // get_file_uploaded();
                MyApp.preventLoad = false;
                MyApp.$me.aksi = 'update';
                validator.resetForm();
                $('#myModal').modal('show');
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                MyApp.setFormValues(idForm, dataRow);
                // if (dataRow.bahasa_dikuasai.includes(","))
                //     dataRow.bahasa_dikuasai = dataRow.bahasa_dikuasai.split(',');
                // else
                //     dataRow.bahasa_dikuasai = dataRow.bahasa_dikuasai;
                // domcbBahasaDikuasai.val(dataRow.bahasa_dikuasai).trigger("change");
                load_desa(dataRow.id_reff_desa);
                // load_jurusan(dataRow.id_reff_jurusan_pendidikan, dataRow.id_reff_nama_jurusan);
                
                load_jabatan(dataRow.id_reff_nama_jabatan);
                // debugger;
                get_file_uploaded(dataRow);
                $('a[data-first="true"]').click();
                // debugger;
                // domcbStatus.val(dataRow.status);
                // console.log(dataRow.lokasi);
              
                if (dataRow.lokasi == 2) {
                    $('.dalamNegeri').hide();
                    $('.cbDalamNegeri').val('0');
                } else {
                    $('.dalamNegeri').show();
                }
                   
            });

            /*Hapus data*/
            selectortable.on('click', '.btHapus', function() {
                index = $(this).data('index');
                dataRow = MyApp.$me.dataRow[index];
                konfirmasi = confirm('Apakah anda yakin ingin menghapus data ' + dataRow.nama_lengkap);
                if (konfirmasi) {
                    hapus(dataRow);
                }
            });


             // start detail ijazah pendidikan 
            selectortable.on('click', '.detail_ijazah', function() {
            // debugger;
            var idpencaker = $(this).data("idpencaker");
            // console.log(idpencaker);

            
                // MyApp.loadModuleFile('Template/detail_pendidikan.html', function (tpl) {
                                  
                    var params = {
                          option: 'PUBLIC',
                          action: 'getPendidikan',
                          id_pencari_kerja: idpencaker,

                    }    
                  
                        MyApp.ajax(params).done(function(resp){
                        // console.log(resp.success);
                            if (resp.success){

                                 var data = resp.result;
                                 // console.log(data);

                                    if(data.length == 0){

                                        // alert("Data Kosong!");
                                        return 0;

                                    } else {
                                         
                                         $('#myModalPendidikan').modal('show');

                                        var template =
                                            '<div style="text-align:center;font-size:14pt;font-weight:bold; text-transform: uppercase;">Data Pendidikan</div> <br/>'+ 
                                            '<div class="box-body">'+

                                            '<table style="border:none; width:40%; border-collapse:collapse; cellspacing:0; cellpadding:0">'+
                                            '<tbody>'+
                                                '<tr>'+
                                                    '<td  style="border:none; display:inline-block;"><b>Nama :<b/></td>'+
                                                    '<td style="border:none; display:inline-block;"><u>'+ data[0].nama_lengkap+'</u></td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                    '<td style="border:none; display:inline-block;"><b>NIK &nbsp&nbsp :&nbsp</b></td>'+
                                                    '<td style="border:none; display:inline-block;"><u>'+ data[0].nik +'</u></td>'+
                                                '</tr>'+
                                            '</tbody>'+
                                            '</table>'+

                                            '<table class="responstable"  style="width:100%;maxheight:400px;" border="1">'+
                                               '<thead style="background: WhiteSmoke;">'+
                                                    '<tr>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Pendidikan Tertinggi</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Jurusan Tertinggi</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Nama Jurusan</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Nama Jurusan (Form AK I)</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">NEM/IPK</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Ketrampilan</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">File Ijazah</td>'+
                                                    '</tr>'+
                                                '</thead>'+
                                                '<tbody>';

                                                for (var x = 0; x < data.length; x++) {
                                                  
                                                   // console.log(data[x].url_files);
                                                    if (data[x].url_files === null) {
                                                        var ijazah = 'File Kosong';
                                                    } else {
                                                       var ijazah = '<a target="_blank" href="' + data[x].url_files + '"><i class="fa fa-download" title="Download Berkas"></i></a>';
                                                    }

                                                    template =template+
                                                    '<tr>'+
                                                        '<td>'+ data[x].tingkat_pendidikan +'</td>'+
                                                        '<td>'+data[x].jurusan_pendidikan+'</td>'+
                                                        '<td>'+data[x].nama_jurusan+'</td>'+
                                                        '<td>'+data[x].jurusan_manual+'</td>'+
                                                        '<td>'+data[x].nem_ipk+'</td>'+
                                                        '<td>'+data[x].ketrampilan+'</td>'+
                                                        '<td style="text-align:center;">'+ijazah+'</td>'+
                                                    '</tr>';
                                                }

                                                '</tbody>'+
                                            '</table>'+
                                            '</div>';

                                        $('#table-datapendidikan').html(template,data);
                                    }

                            } else {
                                alert(resp.msg);
                                $('#table-datapendidikan').html("");
                           
                            }
                        })
                      
            }); //end detail ijazah pendidikan


        // start detail bahasa
            selectortable.on('click', '.detail_bahasa', function() {
            // debugger;
            var idpencaker = $(this).data("idpencaker");
            // console.log(idpencaker);

           
                // MyApp.loadModuleFile('Template/detail_pendidikan.html', function (tpl) {
                                  
                    var params = {
                          option: 'PUBLIC',
                          action: 'getBahasa',
                          id_pencari_kerja: idpencaker,

                    }    

                  
                        MyApp.ajax(params).done(function(resp){
                        // console.log(resp.success);
                            if (resp.success){

                                 var data = resp.result;
                                 // console.log(data);


                                    if(data.length == 0){

                                        // alert("Data Kosong!");
                                        return 0;
                                        
                                    } else {

                                        $('#myModalBahasa').modal('show');

                                        var template =
                                            '<div style="text-align:center;font-size:14pt;font-weight:bold; text-transform: uppercase;">Data Bahasa</div> <br/>'+ 
                                            '<div class="box-body">'+

                                            '<table style="border:none; width:40%; border-collapse:collapse; cellspacing:0; cellpadding:0">'+
                                            '<tbody>'+
                                                '<tr>'+
                                                    '<td  style="border:none; display:inline-block;"><b>Nama :<b/></td>'+
                                                    '<td style="border:none; display:inline-block;"><u>'+ data[0].nama_lengkap+'</u></td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                    '<td style="border:none; display:inline-block;"><b>NIK &nbsp&nbsp :&nbsp</b></td>'+
                                                    '<td style="border:none; display:inline-block;"><u>'+ data[0].nik +'</u></td>'+
                                                '</tr>'+
                                            '</tbody>'+
                                            '</table>'+

                                            '<table class="responstable"  style="width:100%;maxheight:200px;" border="1">'+
                                               '<thead style="background: WhiteSmoke;">'+
                                                    '<tr>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Bahasa Yang Dikuasai</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">File Sertifikat</td>'+
                                                    '</tr>'+
                                                '</thead>'+
                                                '<tbody>';

                                                for (var x = 0; x < data.length; x++) {
                                                  
                                                   // console.log(data[x].url_files);
                                                    if (data[x].url_files === null) {
                                                        var bahasa = 'File Kosong';
                                                    } else {
                                                       var bahasa = '<a target="_blank" href="' + data[x].url_files + '"><i class="fa fa-download" title="Download Berkas"></i></a>';
                                                    }

                                                    template =template+
                                                    '<tr>'+
                                                        '<td>'+ data[x].bahasa_asing +'</td>'+
                                                        '<td style="text-align:center;">'+ bahasa +'</td>'+
                                                    '</tr>';
                                                }

                                                '</tbody>'+
                                            '</table>'+
                                            '</div>';

                                        $('#table-databahasa').html(template,data);
                                    }

                            } else {
                                alert(resp.msg);
                                $('#table-databahasa').html("");
                           
                            }
                        })
                      
            }); // end detail bahasa

            
            // start detail cv
             selectortable.on('click', '.detail_cv', function() {
            // debugger;
            var idpencaker = $(this).data("idpencaker");
            // console.log(idpencaker);

                // MyApp.loadModuleFile('Template/detail_pendidikan.html', function (tpl) {
                                  
                    var params = {
                          option: 'PUBLIC',
                          action: 'getPengalaman',
                          id_pencari_kerja: idpencaker,

                    }    
                  
                        MyApp.ajax(params).done(function(resp){
                        // console.log(resp.success);
                            if (resp.success){

                                 var data = resp.result;
                                 // console.log(data);

                                 if(data.length == 0){

                                        // alert("Data Kosong!");
                                        return 0;
                                        
                                    } else {

                                        $('#myModalCV').modal('show');

                                        var template =
                                            '<div style="text-align:center;font-size:14pt;font-weight:bold; text-transform: uppercase;"> Daftar Riwayat Hidup</div> <br/>'+ 
                                            // '<div style="text-align:left;font-size:10pt;"><p>Nama : '+ data[0].nama_lengkap +'<br/>Nik : '+ data[0].nik +'</p></div>'+
                                            '<div class="box-body">'+

                                            '<table style="border:none; width:40%; border-collapse:collapse; cellspacing:0; cellpadding:0">'+
                                            '<tbody>'+
                                                '<tr>'+
                                                    '<td  style="border:none; display:inline-block;"><b>Nama :<b/></td>'+
                                                    '<td style="border:none; display:inline-block;"><u>'+ data[0].nama_lengkap+'</u></td>'+
                                                '</tr>'+
                                                '<tr>'+
                                                    '<td style="border:none; display:inline-block;"><b>NIK &nbsp&nbsp :&nbsp</b></td>'+
                                                    '<td style="border:none; display:inline-block;"><u>'+ data[0].nik +'</u></td>'+
                                                '</tr>'+
                                            '</tbody>'+
                                            '</table>'+

                                            '<table class="responstable"  style="width:100%;maxheight:200px;" border="1">'+
                                               '<thead style="background: WhiteSmoke;">'+
                                                    '<tr>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Jabatan</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Uraian Tugas</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Lama Kerja</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">Pemberi/Pengguna</td>'+
                                                        '<td style="text-align:center; vertical-align: text-bottom">File CV</td>'+
                                                    '</tr>'+
                                                '</thead>'+
                                                '<tbody>';

                                                for (var x = 0; x < data.length; x++) {
                                                  
                                                   // console.log(data[x].url_files);
                                                    if (data[x].url_files === null) {
                                                        var cv = 'File Kosong';
                                                    } else {
                                                       var cv = '<a target="_blank" href="' + data[x].url_files + '"><i class="fa fa-download" title="Download Berkas"></i></a>';
                                                    }

                                                    template =template+
                                                    '<tr>'+
                                                        '<td>'+ data[x].jabatan +'</td>'+
                                                        '<td>'+ data[x].uraian_tugas +'</td>'+
                                                        '<td>'+ data[x].lama_kerja_tahun +' tahun '+ data[x].lama_kerja_bulan+' bulan</td>'+
                                                        '<td>'+ data[x].pemberi_pengguna +'</td>'+
                                                        '<td style="text-align:center;">'+ cv +'</td>'+
                                                    '</tr>';
                                                }

                                                '</tbody>'+
                                            '</table>'+
                                            '</div>';

                                        $('#table-datacv').html(template,data);
                                    }

                            } else {
                                alert(resp.msg);
                                $('#table-datacv').html("");
                           
                            }
                        })
                      
            });// end detail cv

         

            
            /*Cetak pdf AKII*/
            selectortable.on('click', '.btCetakak2', function() {
                id_pencari_kerja = $(this).data('index');
                // console.log(id_pencari_kerja);

                var params = {
                    option: 'PUBLIC',
                    action: 'laporanak2',
                    export_type: 'stream',
                    id_pencari_kerja:id_pencari_kerja,

                }


                 MyApp.ajax(params).done(function (resp) {
                    if (resp.success) {
                        // console.log(resp);
                        MyApp.openPdf(resp.filename, 'Laporan AKII');
                        //window.location = MyApp.rootPath() + resp.filename;

                    }
                });

               /* MyApp.ajax(params).done(function(resp) {
                    // console.log(resp);
                    if (resp.success) {
                        MyApp.loadModuleFile('template/tpl_pdf.html', function(tpl) {
                            var dataRow = [];
                            data2 = [];

                            for (i = 0; i < resp.result.data_hasil.length; i++) {
                                data2[i] = {};
                                data2[i].id_pencari_kerja = nama = resp.result.data_hasil[i].id_pencari_kerja;
                                data2[i].no_pendaftaran = nama = resp.result.data_hasil[i].no_pendaftaran;
                                data2[i].tanggal_daftar = nama = resp.result.data_hasil[i].tanggal_daftar;
                                data2[i].nik = nama = resp.result.data_hasil[i].nik;
                                data2[i].nama_lengkap = nama = resp.result.data_hasil[i].nama_lengkap;
                                data2[i].first_name = nama = resp.result.data_hasil[i].first_name;
                                data2[i].tempat_lahir = nama = resp.result.data_hasil[i].tempat_lahir;
                                data2[i].tangal_lahir = nama = resp.result.data_hasil[i].tangal_lahir;
                                data2[i].jenis_kelamin = nama = resp.result.data_hasil[i].jenis_kelamin;
                                data2[i].jenis_kelamin_ = nama = resp.result.data_hasil[i].jenis_kelamin_;
                                data2[i].id_agama = nama = resp.result.data_hasil[i].id_agama;
                                data2[i].agama = nama = resp.result.data_hasil[i].agama;
                                data2[i].alamat = nama = resp.result.data_hasil[i].alamat;
                                data2[i].rt = nama = resp.result.data_hasil[i].rt;
                                data2[i].rw = nama = resp.result.data_hasil[i].rw;
                                data2[i].no = nama = resp.result.data_hasil[i].no;
                                data2[i].KECAMATAN = nama = resp.result.data_hasil[i].KECAMATAN;
                                data2[i].KELURAHAN = nama = resp.result.data_hasil[i].KELURAHAN;
                                data2[i].no_hp = nama = resp.result.data_hasil[i].no_hp;
                                data2[i].email = nama = resp.result.data_hasil[i].email;
                                data2[i].kode_pos = nama = resp.result.data_hasil[i].kode_pos;
                                data2[i].status_ = nama = resp.result.data_hasil[i].status_;
                                data2[i].catatan_pengantar_kerja = nama = resp.result.data_hasil[i].catatan_pengantar_kerja;
                                data2[i].jabatan_kerja = nama = resp.result.data_hasil[i].jabatan_kerja;
                                data2[i].nama_jabatan = nama = resp.result.data_hasil[i].nama_jabatan;
                                data2[i].lokasi_ = nama = resp.result.data_hasil[i].lokasi_;
                                data2[i].dalam_negeri_ =resp.result.data_hasil[i].dalam_negeri_;
                                data2[i].upah_pencaker = nama = resp.result.data_hasil[i].upah_pencaker;
                                data2[i].pendidikan =resp.result.data_hasil[i].pendidikan;
                                data2[i].bahasa =resp.result.data_hasil[i].bahasa;
                                data2[i].pengalaman =resp.result.data_hasil[i].pengalaman;
                                data2[i].jml_pengalaman  = resp.result.data_hasil[i].pengalaman.length + 3;

                                if (resp.result.data_hasil[i].bahasa.length > 1){
                                     data2[i].koma = ',';

                                } else {
                                     data2[i].koma = '';
                                }
                                
                            }

                            dataRow.value = data2;
                            console.log(dataRow);
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

            selectortable.on('click', '.btCetakak1', function() {
                id_pencari_kerja = $(this).data('index');
                // console.log(id_pencari_kerja);

                var params = {
                    option: 'PUBLIC',
                    action: 'laporanak1',
                    export_type: 'stream',
                    id_pencari_kerja:id_pencari_kerja,

                }

             
                MyApp.ajax(params).done(function (resp) {
                    if (resp.success) {
                        console.log(resp);
                        MyApp.openPdf(resp.filename, 'Laporan AKI');
                        //window.location = MyApp.rootPath() + resp.filename;

                    }

                });
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

    var set_files = function() {
        var data = {
            initialPreview: [],
            initialPreviewAsData: true,
            initialPreviewConfig: []
        }
        set_file_foto(data);
        set_foto_ktp(data);
        set_file_ijazah(data);
        set_file_sertifikat_bahasa(data);
        // set_file_curriculum_vitae(data);
         set_file_pengalaman_kerja(data);
    }
    var destroy_fileinput = function() {
        $("#file-foto").fileinput('destroy');
        $("#foto-ktp").fileinput('destroy');
        $("#file-ijazah").fileinput('destroy');
        $("#file-sertifikat-bahasa").fileinput('destroy');
        // $("#file-curriculum-vitae").fileinput('destroy');
        $("#file-pengalaman-kerja").fileinput('destroy');
    }
    var get_file_uploaded = function(data) {
        // debugger;
        var param2 = {
            option: 'PUBLIC',
            action: 'getFiles',
            id_pencari_kerja: data.id_pencari_kerja,
        };
        MyApp.ajax(param2).done(function(resp) {
            // debugger;
            set_file_foto(resp.foto);
            set_foto_ktp(resp.ktp);
            set_file_ijazah(resp.ijazah);
            set_file_sertifikat_bahasa(resp.sertifikat_bahasa);
            // set_file_curriculum_vitae(resp.curriculum_vitae);
            set_file_pengalaman_kerja(resp.file_pengalaman_kerja);
        });
    }


    var set_file_foto = function(data) {
        var $file_foto = $("#file-foto");
        $file_foto.fileinput({
            language: 'id',
            allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            // allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'exe', 'doc', 'docx', 'xls', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            uploadUrl: 'upload/upload.php',
            // uploadUrl: 'upload/upload.php',
            deleteUrl: 'upload/delete.php',
            uploadExtraData: { type: 'foto' },
            // deleteExtraData: { id_reff_resto_foto: vm.id_reff_resto_foto, type: 'tenant' },
            // maxFileCount: 1,
            // uploadAsync: false, // Try this
            autoReplace: true,
            overwriteInitial: true,
            initialPreviewShowDelete: false,
            // minFileCount: 1,
            maxFileCount: 1,
            showRemove: false,
            showClose: false,
            // showDrag: false,
            // showBrowse: false,
            showMove: false,
            showUpload: false,
            browseOnZoneClick: true,
            initialPreviewAsData: true,
            // ini perlu di masukkan
            initialPreview: data.initialPreview,
            // layoutTemplates: {actionDelete: ''}, // disable thumbnail deletio
            // ini perlu di masukkan
            initialPreviewConfig: data.initialPreviewConfig,
        }).on('fileuploaded', function(a, b) {
            $("input[name*='file_foto']").val(b.response.id_files);
        }).on("filebatchselected", function() {
            $file_foto.fileinput("upload");
        });
    }

    var set_foto_ktp = function(data) {
        var $foto_ktp = $("#foto-ktp");
        $foto_ktp.fileinput({
            language: 'id',
            allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            // allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'exe', 'doc', 'docx', 'xls', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            uploadUrl: 'upload/upload.php',
            // uploadUrl: 'upload/upload.php',
            deleteUrl: 'upload/delete.php',
            uploadExtraData: { type: 'ktp' },
            // deleteExtraData: { id_reff_resto_foto: vm.id_reff_resto_foto, type: 'tenant' },
            // maxFileCount: 1,
            // uploadAsync: false, // Try this
            autoReplace: true,
            overwriteInitial: true,
            initialPreviewShowDelete: false,
            // minFileCount: 1,
            maxFileCount: 1,
            showRemove: false,
            showClose: false,
            // showDrag: false,
            // showBrowse: false,
            showMove: false,
            showUpload: false,
            browseOnZoneClick: true,
            initialPreviewAsData: true,
            // ini perlu di masukkan
            initialPreview: data.initialPreview,
            // layoutTemplates: {actionDelete: ''}, // disable thumbnail deletio
            // ini perlu di masukkan
            initialPreviewConfig: data.initialPreviewConfig,
        }).on('fileuploaded', function(a, b) {
            $("input[name*='file_ktp']").val(b.response.id_files);
        }).on("filebatchselected", function() {
            $foto_ktp.fileinput("upload");
        });
    }

    var set_file_ijazah = function(data) {
        var $file_ijazah = $("#file-ijazah");
        $file_ijazah.fileinput({
            language: 'id',
            allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            // allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'exe', 'doc', 'docx', 'xls', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            uploadUrl: 'upload/upload.php',
            deleteUrl: 'upload/delete.php',
            uploadExtraData: { type: 'ijazah' },
            // deleteExtraData: { id_reff_resto_foto: vm.id_reff_resto_foto, type: 'tenant' },
            // maxFileCount: 1,
            // uploadAsync: false, // Try this
            autoReplace: true,
            overwriteInitial: true,
            initialPreviewShowDelete: false,
            // minFileCount: 1,
            maxFileCount: 1,
            showRemove: false,
            showClose: false,
            // showDrag: false,
            // showBrowse: false,
            showMove: false,
            showUpload: false,
            browseOnZoneClick: true,
            initialPreviewAsData: true,
            // ini perlu di masukkan
            initialPreview: data.initialPreview,
            // layoutTemplates: {actionDelete: ''}, // disable thumbnail deletio
            // ini perlu di masukkan
            initialPreviewConfig: data.initialPreviewConfig,
        }).on('fileuploaded', function(a, b) {
            $("input[name*='file_ijazah']").val(b.response.id_files);
        }).on("filebatchselected", function(event, files) {
            $file_ijazah.fileinput("upload");
        });
    }

    var set_file_sertifikat_bahasa = function(data) {
        var $file_sertifikat_bahasa = $("#file-sertifikat-bahasa");
        $file_sertifikat_bahasa.fileinput({
            language: 'id',
            allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            // allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'exe', 'doc', 'docx', 'xls', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            uploadUrl: 'upload/upload.php',
            deleteUrl: 'upload/delete.php',
            uploadExtraData: { type: 'sertifikat' },
            // deleteExtraData: { id_reff_resto_foto: vm.id_reff_resto_foto, type: 'tenant' },
            // maxFileCount: 1,
            // uploadAsync: false, // Try this
            autoReplace: true,
            overwriteInitial: true,
            initialPreviewShowDelete: false,
            // minFileCount: 1,
            maxFileCount: 1,
            showRemove: false,
            showClose: false,
            // showDrag: false,
            // showBrowse: false,
            showMove: false,
            showUpload: false,
            browseOnZoneClick: true,
            initialPreviewAsData: true,
            // ini perlu di masukkan
            initialPreview: data.initialPreview,
            // layoutTemplates: {actionDelete: ''}, // disable thumbnail deletio
            // ini perlu di masukkan
            initialPreviewConfig: data.initialPreviewConfig,
        }).on('fileuploaded', function(a, b) {
            $("input[name*='file_sertifikat_bahasa']").val(b.response.id_files);
        }).on("filebatchselected", function(event, files) {
            $file_sertifikat_bahasa.fileinput("upload");
        });
    }

    // var set_file_curriculum_vitae = function(data) {
    //     var $file_curriculum_vitae = $("#file-curriculum-vitae");
    //     $file_curriculum_vitae.fileinput({
    //         language: 'id',
    //         allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
    //         // allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'exe', 'doc', 'docx', 'xls', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
    //         uploadUrl: 'upload/upload.php',
    //         deleteUrl: 'upload/delete.php',
    //         uploadExtraData: { type: 'cv' },
    //         // deleteExtraData: { id_reff_resto_foto: vm.id_reff_resto_foto, type: 'tenant' },
    //         // maxFileCount: 1,
    //         // uploadAsync: false, // Try this
    //         autoReplace: true,
    //         overwriteInitial: true,
    //         initialPreviewShowDelete: false,
    //         // minFileCount: 1,
    //         maxFileCount: 1,
    //         showRemove: false,
    //         showClose: false,
    //         // showDrag: false,
    //         // showBrowse: false,
    //         showMove: false,
    //         showUpload: false,
    //         browseOnZoneClick: true,
    //         initialPreviewAsData: true,
    //         // ini perlu di masukkan
    //         initialPreview: data.initialPreview,
    //         // layoutTemplates: {actionDelete: ''}, // disable thumbnail deletio
    //         // ini perlu di masukkan
    //         initialPreviewConfig: data.initialPreviewConfig,
    //     }).on('fileuploaded', function(a, b) {
    //         $("input[name*='file_curriculum_vitae']").val(b.response.id_files);
    //     }).on("filebatchselected", function(event, files) {
    //         $file_curriculum_vitae.fileinput("upload");
    //     });
    // }

    var set_file_pengalaman_kerja = function(data) {
        var $file_pengalaman_kerja = $("#file-pengalaman-kerja");
        $file_pengalaman_kerja.fileinput({
            language: 'id',
            allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            // allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'tif', 'exe', 'doc', 'docx', 'xls', 'pdf'], // setelah tiff hanya percobaan dan akan dihapus nantinya
            uploadUrl: 'upload/upload.php',
            deleteUrl: 'upload/delete.php',
            uploadExtraData: { type: 'pengalaman_kerja' },
            // deleteExtraData: { id_reff_resto_foto: vm.id_reff_resto_foto, type: 'tenant' },
            // maxFileCount: 1,
            // uploadAsync: false, // Try this
            autoReplace: true,
            overwriteInitial: true,
            initialPreviewShowDelete: false,
            // minFileCount: 1,
            maxFileCount: 1,
            showRemove: false,
            showClose: false,
            // showDrag: false,
            // showBrowse: false,
            showMove: false,
            showUpload: false,
            browseOnZoneClick: true,
            initialPreviewAsData: true,
            // ini perlu di masukkan
            // initialPreview: data.initialPreview,
            // layoutTemplates: {actionDelete: ''}, // disable thumbnail deletio
            // ini perlu di masukkan
            // initialPreviewConfig: data.initialPreviewConfig,
        }).on('fileuploaded', function(a, b) {
            $("input[name*='file_pengalaman_kerja']").val(b.response.id_files);
        }).on("filebatchselected", function(event, files) {
            $file_pengalaman_kerja.fileinput("upload");
        });
    }


    $('#form_target_realisasi').submit(function(e) {
        e.preventDefault();
    });

    $('.cbJabatan').change(function(e) {
        // console.log('masuk juragan');
        // debugger;
        if (!MyApp.preventLoad) load_jabatan();
    });

    $('.cbTingkatPendidikan').change(function(e) {
        if (!MyApp.preventLoad) load_jurusan();
    });

    $('.cbJurusanPendidikan').change(function(e) {
        if (!MyApp.preventLoad) load_namaJurusan();
    });

    $('.cbKecamatan').change(function(e) {
        $("input[name*='kode_pos']").val('');
        if (!MyApp.preventLoad) load_desa();
    });

    $('.cbDesa').change(function(e) {
        var selected = $(this).find('option:selected');
        var kode_pos = selected.data('pos');
        $("input[name*='kode_pos']").val(kode_pos);
        // debugger;
    });

    $('.dalamNegeri').hide();

    $('.cbLokasi').change(function() {
        console.log(this.value);
        if (this.value == 2) {
            $('.dalamNegeri').hide();
            $('.cbDalamNegeri').val('0');
        } else {
            $('.dalamNegeri').show();
        }
        // debugger;
    });

    /*load status di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getStatus'
    };
    domcbStatus = $('.cbStatus');
    MyApp.ajax(param2).done(function(resp) {
        // MyApp.preventLoad = true;
        domcbStatus.html('<option value="0" disabled selected>- Pilih Status -</option>');
        $.each(resp.result, function(index, val) {
            domcbStatus.append('<option value="' + val.id_status + '">' + val.status + '</option>');
        });
        // domcbStatus.select2().select2('val', '');
    });

    /*load Bahasa yang dikuasai di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getBahasaDikuasai'
    };
    domcbBahasaDikuasai = $('.cbBahasaDikuasai');
    MyApp.ajax(param2).done(function(resp) {
        // MyApp.preventLoad = true;
        // domcbBahasaDikuasai.html('<option value="0" disabled selected>- Pilih Bahasa Yang Dikuasai -</option>');
        $.each(resp.result, function(index, val) {
            domcbBahasaDikuasai.append('<option value="' + val.id_reff_bahasa_asing + '">' + val.bahasa_asing + '</option>');
            // domcbBahasaDikuasai.append('<div class="col-md-3 form-check"> <input type="checkbox" name="bahasa_dikuasai[]" class="form-check-input" value="' + val.id_reff_bahasa_asing + '" /> ' + val.bahasa_asing + ' </div>');
        });
        // domcbBahasaDikuasai.select2().select2('val', '');
        domcbBahasaDikuasai.select2();
        // $(".sasaran2").select2();
    });

    /*load tingkat pendidikan di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getcbTingkatPendidikan'
    };
    domcbTingkatPendidikan = $('.cbTingkatPendidikan');
    MyApp.ajax(param2).done(function(resp) {
        // MyApp.preventLoad = true;
        domcbTingkatPendidikan.html('<option value="0" disabled selected>- Pilih Tingkat Pendidikan -</option>');
        $.each(resp.result, function(index, val) {
            domcbTingkatPendidikan.append('<option value="' + val.id_reff_tingkat_pendidikan + '">' + val.tingkat_pendidikan + '</option>');
        });
        // domcbTingkatPendidikan.select2().select2('val', '');
    });

    if ($('[type="date"]').prop('type') != 'date') {
        $('[type="date"]').datepicker();
    }

    /*load Jurugsan pendidikan di database*/
    var load_jurusan = function(value = 0, data_jur = 0) {
        var param2 = {
            option: 'PUBLIC',
            action: 'getJurusanPendidikan',
            id_reff_tingkat_pendidikan: domcbTingkatPendidikan.val()
        };
        domcbJurusanPendidikan = $('.cbJurusanPendidikan');
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbJurusanPendidikan.html('<option value="0" disabled selected>- Pilih Jurusan Pendidikan -</option>');
            $.each(resp.result, function(index, val) {
                domcbJurusanPendidikan.append('<option value="' + val.id_reff_jurusan_pendidikan + '">' + val.jurusan_pendidikan + '</option>');
            });
            domcbJurusanPendidikan.val(value);
            if (data_jur != 0) {
                load_namaJurusan(data_jur);
            }
            // domcbJurusanPendidikan.select2().select2('val', '');
        });
    }

    /*load Nama Jurusan di database*/
    var load_namaJurusan = function(value = 0) {
        var param2 = {
            option: 'PUBLIC',
            action: 'getNamaJurusan',
            id_reff_jurusan_pendidikan: domcbJurusanPendidikan.val()
        };
        domcbNamaJurusan = $('.cbNamaJurusan');
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbNamaJurusan.html('<option value="0" disabled selected>- Pilih Nama Jurusan -</option>');
            $.each(resp.result, function(index, val) {
                domcbNamaJurusan.append('<option value="' + val.id_reff_nama_jurusan + '">' + val.nama_jurusan + '</option>');
            });
            domcbNamaJurusan.val(value);
            // domcbNamaJurusan.select2().select2('val', '');
        });
    }

    /*load Jabatan di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getJabatan',
        id_reff_tingkat_pendidikan: domcbTingkatPendidikan.val()
    };
    domcbJabatan = $('.cbJabatan');
    MyApp.ajax(param2).done(function(resp) {
        // MyApp.preventLoad = true;
        domcbJabatan.html('<option value="0" disabled selected>- Pilih Jabatan -</option>');
        $.each(resp.result, function(index, val) {
            domcbJabatan.append('<option value="' + val.id_reff_jabatan_kerja + '">' + val.jabatan_kerja + '</option>');
        });
        // domcbJabatan.select2().select2('val', '');
    });

    /*load Nama Jabatan di database*/
    var load_jabatan = function(value = 0) {
        var param2 = {
            option: 'PUBLIC',
            action: 'getNamaJabatan',
            id_reff_jabatan_kerja: domcbJabatan.val()
        };
        domcbNamaJabatan = $('.cbNamaJabatan');
        MyApp.ajax(param2).done(function(resp) {
            // MyApp.preventLoad = true;
            domcbNamaJabatan.html('<option value="0" disabled selected>- Pilih Nama Jabatan -</option>');
            $.each(resp.result, function(index, val) {
                domcbNamaJabatan.append('<option value="' + val.id_reff_nama_jabatan + '">' + val.nama_jabatan + '</option>');
            });
            domcbNamaJabatan.val(value);
            // domcbNamaJabatan.select2().select2('val', '');
        });
    }

    /*load Upah di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getUpah'
    };
    domcbUpah = $('.cbUpah');
    MyApp.ajax(param2).done(function(resp) {
        // MyApp.preventLoad = true;
        domcbUpah.html('<option value="0" disabled selected>- Pilih Upah -</option>');
        $.each(resp.result, function(index, val) {
            domcbUpah.append('<option value="' + val.id_upah_pencaker + '">' + val.upah_pencaker + '</option>');
        });
        // domcbUpah.select2().select2('val', '');
    });

    /*load Kecamatan di database*/
    var param2 = {
        option: 'PUBLIC',
        action: 'getKecamatan'
    };
    domcbKecamatan = $('.cbKecamatan');
    MyApp.ajax(param2).done(function(resp) {
        domcbKecamatan.html('<option value="0" disabled selected>- Pilih Kecamatan -</option>');
        $.each(resp.result, function(index, val) {
            domcbKecamatan.append('<option value="' + val.id_reff_kecamatan + '">' + val.KECAMATAN + '</option>');
        });
        // domcbKecamatan.select2().select2('val', '');
    });


    /*load Kecamatan di database*/
    var load_desa = function(value = 0) {
        var param2 = {
            option: 'PUBLIC',
            action: 'getDesa',
            id_reff_kecamatan: domcbKecamatan.val()
        };
        domcbDesa = $('.cbDesa');
        MyApp.ajax(param2).done(function(resp) {
            domcbDesa.html('<option value="0" disabled selected>- Pilih Desa -</option>');
            $.each(resp.result, function(index, val) {
                domcbDesa.append('<option value="' + val.id_reff_desa + '" data-pos="' + val.KODE_POS + '">' + val.KELURAHAN + '</option>');
            });
            domcbDesa.val(value);
            // domcbDesa.select2().select2('val', '');
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
                        data2[i].id_pencari_kerja = nama = resp.result[i].id_pencari_kerja;
                        data2[i].no_pendaftaran = nama = resp.result[i].no_pendaftaran;
                        data2[i].tanggal_daftar = nama = resp.result[i].tanggal_daftar;
                        data2[i].nik = nama = resp.result[i].nik;
                        data2[i].nama_lengkap = nama = resp.result[i].nama_lengkap;
                        data2[i].tempat_lahir = nama = resp.result[i].tempat_lahir;
                        data2[i].tangal_lahir = nama = resp.result[i].tangal_lahir;
                        data2[i].jenis_kelamin = nama = resp.result[i].jenis_kelamin;
                        data2[i].id_agama = nama = resp.result[i].id_agama;
                        data2[i].alamat = nama = resp.result[i].alamat;
                        data2[i].no_hp = nama = resp.result[i].no_hp;
                        data2[i].email = nama = resp.result[i].email;
                        data2[i].kode_pos = nama = resp.result[i].kode_pos;
                        data2[i].status = nama = resp.result[i].status;
                        data2[i].jurusan_manual = nama = resp.result[i].jurusan_manual;
                        data2[i].nem_ipk = nama = resp.result[i].nem_ipk;
                        data2[i].ketrampilan = nama = resp.result[i].ketrampilan;
                        data2[i].bahasa_lainnya = nama = resp.result[i].bahasa_lainnya;
                        data2[i].file_foto = nama = resp.result[i].file_foto;
                        data2[i].file_ijazah = nama = resp.result[i].file_ijazah;
                        data2[i].file_sertifikat_bahasa = nama = resp.result[i].file_sertifikat_bahasa;
                        data2[i].bahasa_dikuasai = nama = resp.result[i].bahasa_dikuasai;
                        data2[i].catatan_pengantar_kerja = nama = resp.result[i].catatan_pengantar_kerja;
                        data2[i].id_reff_jabatan_kerja = nama = resp.result[i].id_reff_jabatan_kerja;
                        data2[i].id_reff_nama_jabatan = nama = resp.result[i].id_reff_nama_jabatan;
                        data2[i].lokasi = nama = resp.result[i].lokasi;
                        data2[i].dalam_negeri = nama = resp.result[i].dalam_negeri;
                        data2[i].id_upah_pencaker = nama = resp.result[i].id_upah_pencaker;

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


    var simpanDataPencaker =function(){
        // debugger;
        idForm = $('#form_input');
        dataForm = MyApp.getFormValues(idForm);

        console.log(dataForm);
        // console.log(dataForm.jenis_kelamin);

        params = {
            option: 'PUBLIC',
            action: 'addPencariKerja',
            data: dataForm,
            flag:cek,
        };

         MyApp.ajax(params).done(function(resp) {
            if (resp.success == true) {
                alert(resp.msg);
                        var params = {
                            option : 'PUBLIC',
                            action : 'GetId',
                           data: dataForm,
                        }

                        MyApp.ajax(params).done(function(resp){
                            // console.log(resp);
                            if (resp.success){
                                var data = resp.result;
                                // console.log(data);
                                // debugger;
                                var theId = data[0].id_pencari_kerja;
                                $('#id1').val(theId); 
                                $('#id_pencaker').val(theId);
                                var theNik = data[0].nik;
                                $('#nik1').val(theNik);
                                 $('#no_nik').val(theNik);
                                var $active = $('.wizard .nav-tabs li.active');
                                $active.next().removeClass('disabled');
                                nextTab($active);
                               
                            }
                        });

            } else {
                alert(resp.msg);
            }
        })

    }

    /*simpan form*/
    var simpanData = function() {
        idForm = $('#form_input');
        dataForm = MyApp.getFormValues(idForm);
        // alert("Valid: " + idForm.valid());
        // var checkbox_value = "";
        // $(":checkbox").each(function() {
        //     var ischecked = $(this).is(":checked");
        //     if (ischecked) {
        //         checkbox_value += $(this).val() + ",";
        //     }
        // });
        // checkbox_value = checkbox_value.substring(',', checkbox_value.length - 1);
        // // alert(checkbox_value);
        // dataForm.bahasa_dikuasai = checkbox_value;

        // debugger;
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
            tanggal_daftar: 'required',
            nik: 'required',
            nama_lengkap: 'required',
            tempat_lahir: 'required',
            tangal_lahir: "required",
            jenis_kelamin: "required",
            id_agama: "required",
            alamat: "required",
            no_hp: "required",
            email: {
                required: true,
                email: true
            },
            id_upah_pencaker: "required",
            // id_reff_tingkat_pendidikan: "required",
            // id_reff_jurusan_pendidikan: "required",
            // id_reff_nama_jurusan: "required",
            id_reff_kecamatan: "required",
            id_reff_desa: "required",
            id_reff_jabatan_kerja: "required",
            id_reff_nama_jabatan: "required",
        },
        // Specify validation error messages
        messages: {
            tanggal_daftar: 'Silahkan Isi Data Tanggal Daftar',
            nik: 'Silahkan Isi Data NIK',
            nama_lengkap: 'Silahkan Isi Data Nama Lengkap',
            tempat_lahir: 'Silahkan Isi Data Tempat Lahir',
            tangal_lahir: "Silahkan Isi Data Tangal Lahir",
            jenis_kelamin: "Silahkan Isi Data Jenis Kelamin",
            id_agama: "Silahkan Isi Data Agama",
            alamat: "Silahkan Isi Data Alamat",
            no_hp: "Silahkan Isi Data Nomor Hp",
            email: "Silahkan Isi Data Email yang valid",
            id_upah_pencaker: "Silahkan Isi Data Upah yang diinginkan",
            id_reff_tingkat_pendidikan: "Silahkan Isi Data Tingkat Pendidikan",
            id_reff_jurusan_pendidikan: "Silahkan Isi Data Jurusan Pendidikan",
            id_reff_nama_jurusan: "Silahkan Isi Data Nama Jurusan",
            id_reff_kecamatan: "Silahkan Isi Data Kecamatan",
            id_reff_desa: "Silahkan Isi Data Desa",
            id_reff_jabatan_kerja: "Silahkan Isi Data Jabatan Kerja",
            id_reff_nama_jabatan: "Silahkan Isi Data Nama Jabatan",
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        // success: function(label) {
        //     label.addClass("valid").text("Ok!");
        //     alert('sukses');
        //     debugger;
        // },
        submitHandler: function(form) {
            // $("input[name*='nik']").focus();
            // debugger;
            // form.submit();
            // simpanData();
            simpanDataPencaker();
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



    // function add pendidikan  
    $('.btSimpanPendidikan').on("click",function(){
     // debugger;
    var id_reff_tingkat_pendidikan  = $('#id_reff_tingkat_pendidikan').val();
    var id_reff_nama_jurusan        = $('#id_reff_nama_jurusan').val();
    var id_reff_jurusan_pendidikan  = $('#id_reff_jurusan_pendidikan').val();
    var jurusan_manual              = $('#jurusan_manual').val();
    var nem_ipk                     = $('#nem_ipk').val();
    var ketrampilan                 = $('#ketrampilan').val();
    var tahun_lulus                 = $('#tahun_lulus').val();
    var file_ijazah                 = $('#file_ijazah').val();
    var id1                         = $('#id1').val();
    var nik1                        = $('#nik1').val();
    
        if (jurusan_manual != "" && nem_ipk != "" && ketrampilan !='' && tahun_lulus !='' && id1 !='') {

            var params = {
                    option : 'PUBLIC',
                    action : 'addpendidikan',
                    id_reff_tingkat_pendidikan:id_reff_tingkat_pendidikan,
                    id_reff_nama_jurusan :id_reff_nama_jurusan,
                    id_reff_jurusan_pendidikan : id_reff_jurusan_pendidikan,
                    jurusan_manual : jurusan_manual,
                    nem_ipk : nem_ipk,
                    ketrampilan : ketrampilan,
                    tahun_lulus : tahun_lulus,
                    file_ijazah : file_ijazah,
                    id_pencari_kerja : id1,
                    nik : nik1,
                }

             MyApp.ajax(params).done(function(resp){
                alert(resp.msg) ;      
                if (resp.success){            
                    $('#table-pendidikan').jsGrid("loadData");
                    $("#id_reff_tingkat_pendidikan").val('0').select2();
                    $("#id_reff_jurusan_pendidikan").val('0').select2();
                    $('#id_reff_nama_jurusan').val('0').select2();
                    $('#jurusan_manual').val('');
                    $('#nem_ipk').val('');
                    $('#ketrampilan').val('');
                    $('#tahun_lulus').val('');
                    // $('#file_ijazah').fileinput('destroy');
                     // destroy_fileinput();
                     $("#file-ijazah").fileinput('destroy');
                       set_files();
                 } 
             }) 
        } else {
             alert("Silakan lengkapi data terlebih dahulu!");
        }                                           
   
    });

    $("#myModal").on("click",function(){
        $("#table-pendidikan").jsGrid("loadData");
    });

    //  inisialisasi jsGrid untuk table pendidikan
    $("#table-pendidikan").jsGrid({
        width: '100%',
        // autowidth: false,
        // shrinkToFit: true,
        noDataContent: 'Not found',
        inserting: false,
        editing: false,
        sorting: true,
        paging: true,
        autoload: true,
        pageSize: 10,
        pageLoading: true,
        pageIndex: 1,
        pageButtonCount: 5,
        deleteConfirm: 'Yakin akan menghapus data yg dipilih?',
        invalidMessage: 'Ada data yang tidak valid!',
        controller: {
            loadData: function(filter) {
               // debugger;
                var d = $.Deferred();
                var startIndex = (filter.pageIndex - 1) * filter.pageSize;
               // debugger;
                var param = {
                        option: 'PUBLIC',
                        action: 'getPendidikan',
                        start: startIndex,
                        limit: filter.pageSize,
                        id_pencari_kerja : $('#id1').val(),
                        // nik : $('#no_nik').val(),
                    };
              //  debugger;
                MyApp.ajax(param).done(function (resp) {
                    var rsl = resp.result;
                    var res = [];
                    var total = resp.total
                    for (var i = 0; i < rsl.length; i++) {
                        res.push({
                            id: rsl[i].id_pencari_kerja_pendidikan,
                            jurusan_manual: rsl[i].jurusan_manual,
                            ketrampilan: rsl[i].ketrampilan,
                            tahun_lulus: rsl[i].tahun_lulus,
                            nem_ipk: rsl[i].nem_ipk,
                            file_ijazah: rsl[i].file_ijazah,
                            url_files: rsl[i].url_files,
                            tingkat_pendidikan: rsl[i].tingkat_pendidikan,
                            jurusan_pendidikan: rsl[i].jurusan_pendidikan,
                            nama_jurusan: rsl[i].nama_jurusan

                        });
                        
                    }

                    var rsl2 = {
                            data: res,
                            itemsCount: total
                        };
                        d.resolve(rsl2);
                   
                });
                return d.promise();
            },
            updateItem: function(item, editedItem) {
            },
            deleteItem: function(item) {

            },
        },
        fields: [
                    { name: 'id', type: 'text', title : 'ID', width: 30, editing: false, visible: false, validate : 'id' },
                    {   
                        type: "control", 
                        editButton: false,
                        deleteButton: false,
                        headerTemplate: function () {
                            var $myButton = $("<b>Aksi </b>");
                            return $myButton;
                        },
                        itemTemplate : function(val,item){
                           // debugger;
                        var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                           MyApp.$me.item3[i3] = item;

                            var button = $('<i  data-index='+i3+' data-aksi="delete" class="fa fa-times fa-lg"></i>').click(function(val,item){
                               
                                aksi = $(this).data('aksi');
                                if (aksi=="delete") {
                                   var r = confirm("Apakah Anda yakin akan menghapus data ini?");
                                  if (r == true) {
                                        var d = $.Deferred();
                                        index3 = $(this).data('index');
                                        items3 = {};
                                        items3.id = MyApp.$me.item3[index3].id;

                                var params = {
                                    option: 'PUBLIC',
                                    action: 'delPendidikan',
                                    id : MyApp.$me.item3[index3].id,
                                }
                                MyApp.ajax(params).done(function(resp) {
                                if (resp.success) {
                                    d.resolve(item);
                                    alert(resp.msg);
                                   $('#table-pendidikan').jsGrid("loadData");
                                }
                             });
                                return d.promise(); 
                             }
                              }
                            });
                            
                            i3++;
                            return $result.add(button);
                          
                        }

                    },
                    { name: 'tingkat_pendidikan', type: 'text', title: 'Pendidikan Tertinggi', width: 100, validate: 'required' },
                    { name: 'jurusan_pendidikan', type: 'text', title: 'Jurusan Tertinggi', width: 100, validate: 'required' },
                    { name: 'nama_jurusan', type: 'text', title: 'Nama Jurusan', width: 100, validate: 'required' },
                    { name: 'jurusan_manual', type: 'text', title: 'Nama Jurusan (FORM AK I)', width: 100, validate: 'required' },
                    { name: 'nem_ipk', type: 'text', title: 'NEM/IPK', width: 100, validate: 'required' },
                    { name: 'ketrampilan', type: 'text', title: 'Ketrampilan', width: 100, validate: 'required' },
                    { name: 'tahun_lulus', type: 'text', title: 'Tahun Lulus', width: 100, validate: 'required' },
                    {

                      type: "control",
                        editButton: false,
                        width: 200,
                        // align: "left",
                        deleteButton: false,
                        headerTemplate: function () {
                            var $myButton = $("<b>File Ijazah </b>");
                            return $myButton;
                        },
                        itemTemplate: function (value, item) {

                          var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                            var $datanya = item.url_files;
                            // console.log($fotonya);

                            if ($datanya === null) {
                                return 'File Kosong';
                            } else {
                                return '<a target="_blank" href="' + $datanya + '"><i class="fa fa-download" title="Download Berkas"></i></a>';
                            }   
                            
                           
                        },
                    },
             
        ],
        onItemUpdating: function(args) {
            
        },
        rowClick: function(args) {
         
        },
    
    }); // EndOf inisialisasi jsGrid

    // function add bahasa 
    $('.btSimpanBahasa').on("click",function(){
         // debugger;
        var bahasa_dikuasai         = $('#bahasa_dikuasai').val();
        var file_sertifikat_bahasa  = $('#file_sertifikat_bahasa').val();
        var id1                     = $('#id1').val();
        var nik1                    = $('#nik1').val();
        
        if (bahasa_dikuasai != null ) {

            var params = {
                    option : 'PUBLIC',
                    action : 'addbahasa',
                    bahasa_dikuasai:bahasa_dikuasai,
                    file_sertifikat_bahasa :file_sertifikat_bahasa,
                    id_pencari_kerja : id1,
                    nik : nik1,
                }

             MyApp.ajax(params).done(function(resp){
                alert(resp.msg) ;      
                if (resp.success){            
                    $('#table-bahasa').jsGrid("loadData");
                    $('#bahasa_dikuasai').val('');
                    $(".cbBahasaDikuasai").val('0').select2();
                     $("#file-sertifikat-bahasa").fileinput('destroy');
                     set_files();
                 } 
             }) 
        } else {
             alert("Silakan lengkapi data terlebih dahulu!");
        }
   
    });

    $("#myModal").on("click",function(){
        $("#table-bahasa").jsGrid("loadData");
    });

    //  inisialisasi jsGrid untuk table bahasa
    $("#table-bahasa").jsGrid({
        width: '100%',
        // autowidth: false,
        // shrinkToFit: true,
        noDataContent: 'Not found',
        inserting: false,
        editing: false,
        sorting: true,
        paging: true,
        autoload: true,
        pageSize: 10,
        pageLoading: true,
        pageIndex: 1,
        pageButtonCount: 5,
        deleteConfirm: 'Yakin akan menghapus data yg dipilih?',
        invalidMessage: 'Ada data yang tidak valid!',
        controller: {
            loadData: function(filter) {
               // debugger;
                var d = $.Deferred();
                var startIndex = (filter.pageIndex - 1) * filter.pageSize;
               // debugger;
                var param = {
                        option: 'PUBLIC',
                        action: 'getBahasa',
                        start: startIndex,
                        limit: filter.pageSize,
                        id_pencari_kerja : $('#id1').val(),
                        // nik : $('#no_nik').val(),
                    };
              //  debugger;
                MyApp.ajax(param).done(function (resp) {
                    var rsl = resp.result;
                    var res = [];
                    var total = resp.total
                    for (var i = 0; i < rsl.length; i++) {
                        res.push({
                            id: rsl[i].id_pencari_kerja_bahasa,
                            bahasa_asing: rsl[i].bahasa_asing,
                            file_sertifikat_bahasa: rsl[i].file_sertifikat_bahasa,
                            url_files: rsl[i].url_files,

                        });
                        
                    }

                    var rsl2 = {
                            data: res,
                            itemsCount: total
                        };
                        d.resolve(rsl2);
                   
                });
                return d.promise();
            },
            updateItem: function(item, editedItem) {
            },
            deleteItem: function(item) {

            },
        },
        fields: [
                    { name: 'id', type: 'text', title : 'ID', width: 30, editing: false, visible: false, validate : 'id' },
                    {       
                      type: "control", 
                      editButton: false,
                      deleteButton: false,
                      headerTemplate: function () {
                      var $myButton = $("<b>Aksi </b>");
                        return $myButton;
                      },

                        itemTemplate : function(val,item){
                            // debugger;
                            var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                            MyApp.$me.item3[i3] = item;

                            var button = $('<i  data-index='+i3+' data-aksi="delete" class="fa fa-times fa-lg"></i>').click(function(val,item){
                               
                                aksi = $(this).data('aksi');
                                if (aksi=="delete") {
                                   var r = confirm("Apakah Anda yakin akan menghapus data ini?");
                                  if (r == true) {
                                        var d = $.Deferred();
                                        index3 = $(this).data('index');
                                        items3 = {};
                                        items3.id = MyApp.$me.item3[index3].id;

                                var params = {
                                    option: 'PUBLIC',
                                    action: 'delbahasa',
                                    id : MyApp.$me.item3[index3].id,
                                }
                                MyApp.ajax(params).done(function(resp) {
                                if (resp.success) {
                                    d.resolve(item);
                                    alert(resp.msg);
                                   $('#table-bahasa').jsGrid("loadData");
                                }
                             });
                                return d.promise(); 
                             }
                              }
                            });
                            
                            i3++;
                            return $result.add(button);
                          
                        }
                    },

                    { name: 'bahasa_asing', type: 'text', title: 'Bahasa Dikuasai', width: 100, validate: 'required' },
                    {

                        type: "control",
                        editButton: false,
                        width: 200,
                        // align: "left",
                        deleteButton: false,
                        headerTemplate: function () {
                            var $myButton = $("<b>File Sertifikat Bahasa </b>");
                            return $myButton;
                        },

                        itemTemplate: function (value, item) {

                            var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                            var $datanya = item.url_files;
                                if ($datanya === null) {
                                        return 'File Kosong';
                                    } else {
                                        return '<a target="_blank" href="' + $datanya + '"><i class="fa fa-download" title="Download Berkas"></i></a>';
                                } 
                        },
                    },
            
            ],
                onItemUpdating: function(args) {
            
            },
                rowClick: function(args) {
         
        },
    
    }); // EndOf inisialisasi jsGrid

    // function add pengalaman

    $('.btSimpanPengalaman').on("click",function(){
     // debugger;

    var pengalaman_jabatan      = $('#pengalaman_jabatan').val();
    var uraian_tugas            = $('#uraian_tugas').val();
    var lama_kerja_tahun        = $('#lama_kerja_tahun').val();
    var lama_kerja_bulan        = $('#lama_kerja_bulan').val();
    var pemberi_pengguna        = $('#pemberi_pengguna').val();
    var file_pengalaman_kerja   = $('#file_pengalaman_kerja').val();
    var id_pencaker             = $('#id_pencaker').val();
    var nik                     = $('#no_nik').val();
    
        if (pengalaman_jabatan != "" && uraian_tugas != "" && lama_kerja_tahun !='' && lama_kerja_bulan !='' && pemberi_pengguna !='' && id_pencaker !='') {

            var params = {
                    option : 'PUBLIC',
                    action : 'addpengalaman',
                    pengalaman_jabatan :pengalaman_jabatan,
                    uraian_tugas : uraian_tugas,
                    lama_kerja_tahun : lama_kerja_tahun,
                    pemberi_pengguna : pemberi_pengguna,
                    lama_kerja_bulan : lama_kerja_bulan,
                    file_pengalaman_kerja : file_pengalaman_kerja,
                    id_pencari_kerja : id_pencaker,
                    nik : nik,
                }

             MyApp.ajax(params).done(function(resp){
                alert(resp.msg) ;      
                if (resp.success){            
                    $('#table-pengalaman').jsGrid("loadData");
                    $('#pengalaman_jabatan').val('');
                    $('#uraian_tugas').val('');
                    $('#lama_kerja_tahun').val('');
                    $('#lama_kerja_bulan').val('');
                    $('#pemberi_pengguna').val('');
                    
                    $("#file-pengalaman-kerja").fileinput('destroy');
                    set_files();
                 } 
             }) 
        } else {
             alert("Silakan lengkapi data terlebih dahulu!");
        }
   
    });

    $("#myModal").on("click",function(){
        $("#table-pengalaman").jsGrid("loadData");
    });

     // inisialisasi jsGrid untuk table pengalaman
    $("#table-pengalaman").jsGrid({
        width: '100%',
        // autowidth: false,
        // shrinkToFit: true,
        noDataContent: 'Not found',
        inserting: false,
        editing: false,
        sorting: true,
        paging: true,
        autoload: true,
        pageSize: 10,
        pageLoading: true,
        pageIndex: 1,
        pageButtonCount: 5,
        deleteConfirm: 'Yakin akan menghapus data yg dipilih?',
        invalidMessage: 'Ada data yang tidak valid!',
        controller: {
            loadData: function(filter) {
               // debugger;
                var d = $.Deferred();
                var startIndex = (filter.pageIndex - 1) * filter.pageSize;
               // debugger;
                var param = {
                        option: 'PUBLIC',
                        action: 'getPengalaman',
                        start: startIndex,
                        limit: filter.pageSize,
                        id_pencari_kerja : $('#id_pencaker').val(),
                        nik : $('#no_nik').val(),
                    };
              //  debugger;
                MyApp.ajax(param).done(function (resp) {
                    var rsl = resp.result;
                    var res = [];
                    var total = resp.total
                    for (var i = 0; i < rsl.length; i++) {
                        res.push({
                            id: rsl[i].id_pencari_kerja_pengalaman,
                            jabatan: rsl[i].jabatan,
                            uraian_tugas:rsl[i].uraian_tugas,
                            lama_kerja_tahun:rsl[i].lama_kerja_tahun,
                            lama_kerja_bulan:rsl[i].lama_kerja_bulan,
                            pemberi_pengguna:rsl[i].pemberi_pengguna,
                            url_files:rsl[i].url_files,
                        });
                        
                    }

                    var rsl2 = {
                            data: res,
                            itemsCount: total
                        };
                        d.resolve(rsl2);
                   
                });
                return d.promise();
            },
            updateItem: function(item, editedItem) {
            },
            deleteItem: function(item) {

            },
        },
        fields: [
            { name: 'id', type: 'text', title : 'ID', width: 30, editing: false, visible: false, validate : 'id' },
            {   type: "control", 
                editButton: false,
                deleteButton: false,
                headerTemplate: function () {
                    var $myButton = $("<b>Aksi </b>");
                    return $myButton;
                },
                itemTemplate : function(val,item){
                   // debugger;
                var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                MyApp.$me.item3[i3] = item;

                    var button = $('<i  data-index='+i3+' data-aksi="delete" class="fa fa-times fa-lg"></i>').click(function(val,item){
                       
                        aksi = $(this).data('aksi');
                        if (aksi=="delete") {
                           var r = confirm("Apakah Anda yakin akan menghapus data ini?");
                          if (r == true) {
                                var d = $.Deferred();
                                index3 = $(this).data('index');
                                items3 = {};
                                items3.id = MyApp.$me.item3[index3].id;

                        var params = {
                            option: 'PUBLIC',
                            action: 'delPengalaman',
                            id : MyApp.$me.item3[index3].id,
                        }
                        MyApp.ajax(params).done(function(resp) {
                        if (resp.success) {
                            d.resolve(item);
                            alert(resp.msg);
                           $('#table-pengalaman').jsGrid("loadData");
                        }
                     });
                        return d.promise(); 
                     }
                      }
                    });
                    
                    i3++;
                    return $result.add(button);
                  
                }

            },
            { name: 'jabatan', type: 'text',title : 'Jabatan', width: 100, validate: 'moduleClass' },
            { name: 'uraian_tugas', type: 'text', title: 'Uraian Tugas', width: 100, validate: 'required' },
            {
                type: "control",
                width: 100,
                editButton: false,
                deleteButton: false,

                headerTemplate: function () {
                var $myButton = $("<b>Lama Kerja</b>");
                return $myButton; },
                itemTemplate: function (value, item) {
                var tahun = item.lama_kerja_tahun;
                var bulan = item.lama_kerja_bulan;
               
                var item = $("<tr style='border:none'>\n\
                  <td style='border:none;text-align: center;width:80px;'>" + tahun +' tahun <br/>'+ bulan+' bulan'+"</td></tr>");
                return item;
              },        
            },

            { name: 'pemberi_pengguna', type: 'text', title: 'Pemberi /Pengguna', width: 100, validate: 'required'},
           {

              type: "control",
                editButton: false,
                width: 200,
                // align: "left",
                deleteButton: false,
                headerTemplate: function () {
                    var $myButton = $("<b>File Upload </b>");
                    return $myButton;
                },
                itemTemplate: function (value, item) {

                  var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
                    var $datanya = item.url_files;
                    // console.log($fotonya);
                    if ($datanya === null) {
                            return 'File Kosong';
                        } else {
                            return '<a target="_blank" href="' + $datanya + '"><i class="fa fa-download" title="Download Berkas"></i></a>';
                    } 
                   
                },
            },
             
        ],
        onItemUpdating: function(args) {
            
        },
        rowClick: function(args) {
         
        },
    
    }); // EndOf inisialisasi jsGrid


    $('.btSimpanSelesai').on('click',function(){
          // debugger;
        var id_pencari_kerja            = $('#id_pencaker').val();
        var catatan_pengantar_kerja     = $('#catatan_pengantar_kerja').val();
        var id_reff_jabatan_kerja       = $('#id_reff_jabatan_kerja').val();
        var id_reff_nama_jabatan        = $('#id_reff_nama_jabatan').val();
        var lokasi                      = $('#lokasi').val();
        var dalam_negeri                = $('#dalam_negeri').val(); 
        var id_upah_pencaker            = $('#id_upah_pencaker').val();

        if (catatan_pengantar_kerja != '' && id_reff_jabatan_kerja !== null && id_reff_nama_jabatan != null && lokasi != null && id_upah_pencaker!=null) {
            
            var params = {
                        option : 'PUBLIC',
                        action : 'UpdateCatatan',
                        id_pencari_kerja:id_pencari_kerja,
                        catatan_pengantar_kerja:catatan_pengantar_kerja,
                        id_reff_jabatan_kerja:id_reff_jabatan_kerja,
                        id_reff_nama_jabatan:id_reff_nama_jabatan,
                        lokasi:lokasi,
                        dalam_negeri:dalam_negeri,
                        id_upah_pencaker:id_upah_pencaker,
                       
                    }

            MyApp.ajax(params).done(function(resp){
                         
                    if (resp.success){
                        alert(resp.msg) ; 

                      $('#myModal').modal('hide');  
                       MyApp.$me.selectorTable.ajax.reload();
                      
                    } 
            });

        } else {
            alert("Silakan lengkapi data terlebih dahulu!");
        }

    });

     $('#btnCekNik').on("click",function(){
        // debugger;
        var params = {
            option : 'PUBLIC',
            action : 'getNik',
            nik : $("#CekNik").val(),
        }

        MyApp.ajax(params).done(function(resp) {
            if (resp.success) {
                var data = resp.result;
            }
        });
    });


    $('#close-pencaker').on('click',function(){
        $('#myModal').modal('hide');
        MyApp.$me.selectorTable.ajax.reload();
           
    });

    $('#close-pendidikan').on('click',function(){
        $('#myModal').modal('hide');
        MyApp.$me.selectorTable.ajax.reload();
        $('#table-datapendidikan').html('');
           
    });


    $('#close-bahasa').on('click',function(){
        $('#myModal').modal('hide');
        MyApp.$me.selectorTable.ajax.reload();
        $('#table-databahasa').html('');
           
    });

    $('#close-cv').on('click',function(){
        $('#myModal').modal('hide');
        MyApp.$me.selectorTable.ajax.reload();
        $('#table-datacv').html('');
           
    });
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

    // $(".next-step").click(function(e) {
    //     // debugger;
    //     $('#form_input').submit();
    //     if (validator.valid() == true) {
    //         e.preventDefault();
    //         var $active = $('.wizard .nav-tabs li.active');
    //         $active.next().removeClass('disabled');
    //         nextTab($active);
    //     } else {

    //     }
    // });

    $(".next-step").click(function(e) {
        if (validator.form() == true) {
            e.preventDefault();
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);
        } else {
            alert("Silahkan Lengkapi Form Terlebih Dahulu");
        }
    });

    $(".prev-step").click(function(e) {
        e.preventDefault();
        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);
    });

    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
        $("#myModal").scrollTop(0);
    }

    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }
})();
//# sourceURL=PencariKerja.js