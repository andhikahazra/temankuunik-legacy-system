// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    MyApp.loadModuleCss();
    jsGrid.validators.moduleId = {
        message: 'Module ID harus lowercase, pemisah tanda strip',
        validator: function(value, item) {
            return /^[a-z-]+$/.test(value);
        }
    }
      $('.tgl').datepicker({
        dateFormat: 'yy-mm-dd'
    });
   


    $('#btnTampil').on("click",function() {
      // var Loadauditee = function () {

           var param = {
             option: 'PUBLIC',
             action: 'list',   
           }

        //console.log(param);

        MyApp.ajax(param).done(function(resp) {
        // console.log(resp.result);
            if(resp.success){
            
            arrbulan = ["Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember"];
            date = new Date();
            bulan = date.getMonth();
            tahun = date.getFullYear();
            var data = resp.result;

                console.log(data);
                var template = 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">PENCARI KERJA YANG DITEMPATKAN</div>'+ 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">MENURUT DAERAH TUJUAN</div>'+
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">DI KABUPATEN SLEMAN '+tahun+'</div>'+
                 '<br/>'+
                       '<table border="1" style="border-collapse: collapse; width: 100%;">'+
                            '<thead>'+
                                '<tr>'+
                                    '<td rowspan="2" style="text-align:center;font-weight:bold;">NO</td>'+
                                    '<td rowspan="2" style="text-align:center;font-weight:bold;">DAERAH TUJUAN</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">JANUARI</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">FEBRUARI</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">MARET</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">APRIL</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">MEI</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">JUNI</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">JULI</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">AGUSTUS</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">SEPTEMBER</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">OKTOBER</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">NOVEMBER</td>'+
                                    '<td colspan="2" style="text-align:center;font-weight:bold;">DESEMBER</td>'+
                                    '<td colspan="3" style="text-align:center;font-weight:bold;">JUMLAH</td>'+
                                '</tr>'+
                                '<tr>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">L</td>'+
                                    '<td style="text-align:center;font-weight:bold;">W</td>'+
                                    '<td style="text-align:center;font-weight:bold;">TOTAL</td>'+
                                '</tr>'+
                                '<tr>'+
                                    '<td style="text-align:center;font-weight:bold;">1</td>'+
                                    '<td style="text-align:center;font-weight:bold;">2</td>'+
                                    '<td style="text-align:center;font-weight:bold;">3</td>'+
                                    '<td style="text-align:center;font-weight:bold;">4</td>'+
                                    '<td style="text-align:center;font-weight:bold;">5</td>'+
                                    '<td style="text-align:center;font-weight:bold;">6</td>'+
                                    '<td style="text-align:center;font-weight:bold;">7</td>'+
                                    '<td style="text-align:center;font-weight:bold;">8</td>'+
                                    '<td style="text-align:center;font-weight:bold;">9</td>'+
                                    '<td style="text-align:center;font-weight:bold;">10</td>'+
                                    '<td style="text-align:center;font-weight:bold;">11</td>'+
                                    '<td style="text-align:center;font-weight:bold;">12</td>'+
                                    '<td style="text-align:center;font-weight:bold;">13</td>'+
                                    '<td style="text-align:center;font-weight:bold;">14</td>'+
                                    '<td style="text-align:center;font-weight:bold;">15</td>'+
                                    '<td style="text-align:center;font-weight:bold;">16</td>'+
                                    '<td style="text-align:center;font-weight:bold;">17</td>'+
                                    '<td style="text-align:center;font-weight:bold;">18</td>'+
                                    '<td style="text-align:center;font-weight:bold;">19</td>'+
                                    '<td style="text-align:center;font-weight:bold;">20</td>'+
                                    '<td style="text-align:center;font-weight:bold;">21</td>'+
                                    '<td style="text-align:center;font-weight:bold;">22</td>'+
                                    '<td style="text-align:center;font-weight:bold;">23</td>'+
                                    '<td style="text-align:center;font-weight:bold;">24</td>'+
                                    '<td style="text-align:center;font-weight:bold;">25</td>'+
                                    '<td style="text-align:center;font-weight:bold;">26</td>'+
                                    '<td style="text-align:center;font-weight:bold;">27</td>'+
                                    '<td style="text-align:center;font-weight:bold;">28</td>'+
                                    '<td style="text-align:center;font-weight:bold;">29</td>'+
                                '</tr>'+
                            '</thead>'+
                            '<tbody>';

                var jmltot_laki=0;
                var jmltot_laki_jan =0;
                
                for (var p = 0; p < data.length; p++) {

                    var jmltot_laki=0;
                    for (var q = 0; q < data[p].bulan.length; q++) {
                            jmltot_laki += data[p].bulan[q].jml_laki;  
                    }



                   template =template+           
                                '<tr>'+
                                    '<td>'+parseInt(p+1)+'</td>'+
                                    '<td>'+data[p].provinsi+'</td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[0].jml_laki;  
                                    }

                                      jmltot_laki_jan +=parseInt(jml_laki);
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[1].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[2].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[3].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[4].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[5].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[6].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[7].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[8].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[9].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[10].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">';

                                    for (var q = 0; q < data[p].bulan.length; q++) {
                                        jml_laki = data[p].bulan[11].jml_laki;  
                                    }
                                      template =template+
                                      jml_laki;
                                      template =template+ 

                                    '</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;">'+jmltot_laki+'</td>'+
                                    '<td style="text-align:right;"></td>'+
                                    '<td style="text-align:right;"></td>'+
                                '</tr>';
                }

                template = template+
                                '<tr>'+
                                    '<td style="text-align:center;font-weight:bold;" colspan="2">JUMLAH</td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;">'+jmltot_laki_jan+'</td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                    '<td style="text-align:center;font-weight:bold;text-align:right;"></td>'+
                                '</tr>'+

                            '</tbody>'+
                        '</table>';
                // var html = Mustache.to_html(template, data);
                $('.table-daerahtujuan').html(template,data);
                // window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
            } else {
                alert(resp.msg);
                $('.table-daerahtujuan').html("");
            }
        });
    });

    // Loadauditee();



    $('#btnExcel').on("click",function() {

           // var  idPemeriksaan= $('.cb-periksa').val();

            // $('#IdSurat').val(IdSurat);

           var param = {
             option: 'PUBLIC',
             action: 'list', 
             // id_pemeriksaan : idPemeriksaan,
             // id_temuan_uraian : sur,
            
        }
        // console.log(param);

         MyApp.ajax(param).done(function(resp) {
        // console.log(resp.result.data_temuan);
            if(resp.success){

       arrbulan = ["Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember"];
            date = new Date();
            bulan = date.getMonth();
            tahun = date.getFullYear();
            var data = resp.result;

                // console.log(data);
                var template = 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">IPK III/2: PENCARI KERJA YANG TERDAFTAR, DITEMPATKAN DAN DIHAPUSKAN</div>'+ 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">MENURUT JENIS PENDIDIKAN DIKABUPATEN SLEMAN</div>'+
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">BULAN '+arrbulan[bulan]+' '+tahun+'</div>'+
                        '<table style="border-collapse: collapse; width: 100%;" border="1">'+
                        '<thead>'+
                            '<tr>'+
                                '<td rowspan="2" style="text-align:center;font-weight:bold;">Kode</td>'+
                                '<td rowspan="2" style="text-align:center;font-weight:bold;">Jenis Pendidikan</td>'+
                                '<td colspan="2" style="text-align:center;font-weight:bold;">Sisa akhir bulan lalu</td>'+
                                '<td colspan="2" style="text-align:center;font-weight:bold;">Pendaftaran bulan ini</td>'+
                                '<td colspan="2" style="text-align:center;font-weight:bold;">Penempatan bulan ini</td>'+
                                '<td colspan="2" style="text-align:center;font-weight:bold;">Penghapusan bulan ini</td>'+
                                '<td colspan="2" style="text-align:center;font-weight:bold;">Sisa akhir bulan ini</td>'+
                            '</tr>'+
                            '<tr>'+
                                '<td style="text-align:center;font-weight:bold;">L</td>'+
                                '<td style="text-align:center;font-weight:bold;">P</td>'+
                                '<td style="text-align:center;font-weight:bold;">L</td>'+
                                '<td style="text-align:center;font-weight:bold;">P</td>'+
                                '<td style="text-align:center;font-weight:bold;">L</td>'+
                                '<td style="text-align:center;font-weight:bold;">P</td>'+
                                '<td style="text-align:center;font-weight:bold;">L</td>'+
                                '<td style="text-align:center;font-weight:bold;">P</td>'+
                                '<td style="text-align:center;font-weight:bold;">L</td>'+
                                '<td style="text-align:center;font-weight:bold;">P</td>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

             for (var p = 0; p < data.length; p++) {

                  template =template+
                            '<tr>'+
                                '<td style="background: WhiteSmoke;">'+data[p].kode+'</td>'+
                                '<td style="font-weight:bold;background: WhiteSmoke;">'+data[p].jurusan_pendidikan+'</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">'+data[p].laki_bln_lalu+'</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">'+data[p].cew_bln_lalu+'</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">'+data[p].laki_bln_ini+'</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">'+data[p].cew_bln_ini+'</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">&nbsp;</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">&nbsp;</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">&nbsp;</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">&nbsp;</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">&nbsp;</td>'+
                                '<td style="background: WhiteSmoke;text-align:right;">&nbsp;</td>'+
                            '</tr>';

                for (var q = 0; q < data[p].namajurusan.length; q++) {

                  template =template+
                            '<tr>'+
                                '<td>'+data[p].namajurusan[q].kode+'</td>'+
                                '<td>'+data[p].namajurusan[q].nama_jurusan+'</td>'+
                                '<td style="text-align:right;">'+data[p].namajurusan[q].laki_jur_bln_lalu+'</td>'+
                                '<td style="text-align:right;">'+data[p].namajurusan[q].cew_jur_bln_lalu+'</td>'+
                                '<td style="text-align:right;">'+data[p].namajurusan[q].laki_jur_bln_ini+'</td>'+
                                '<td style="text-align:right;">'+data[p].namajurusan[q].cew_jur_bln_ini+'</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                            '</tr>';
                    
                }
                 template =template+
                            '<tr>'+
                                '<td></td>'+
                                '<td></td>'+
                                '<td style="text-align:right;"></td>'+
                                '<td style="text-align:right;"></td>'+
                                '<td style="text-align:right;"></td>'+
                                '<td style="text-align:right;"></td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                                '<td style="text-align:right;">&nbsp;</td>'+
                            '</tr>';
             }
                            '</tbody>'+
                        '</table>';
                var html = Mustache.to_html(template, data);
                // $('.table-ipkdua').html(template,data);
                window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
            } else {
                alert(resp.msg);
                $('.table-ipkdua').html("");
            }
        });
    });

        // simulasi loading... hide setelah 500ms
    setTimeout(function() {
        MyApp.$me('.overlay').hide();
    }, 500);
})();

//# sourceURL=LaporanIpkDua.js