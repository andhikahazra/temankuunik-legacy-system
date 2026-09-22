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

                // console.log(data);
                var template = 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">IPK III/8: PENEMPATAN PENCARI KERJA MENURUT JENIS ANTAR KERJA</div>'+ 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">PENERIMA TENAGA KERJA DAN JENIS KELAMIN DIKOTA/KABUPATEN SLEMAN</div>'+
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">BULAN '+arrbulan[bulan]+' '+tahun+'</div>'+
                        '<br/>'+
                        '<table style="border-collapse: collapse; width: 100%; height: 90px;" border="1">'+
                            '<thead>'+
                                '<tr>'+
                                        '<td rowspan="3" style="font-weight:bold;text-align:center;">No</td>'+
                                        '<td rowspan="3" style="font-weight:bold;text-align:center;">II. Penerima Pencari Kerja</td>'+
                                        '<td colspan="9" style="font-weight:bold;text-align:center;">Jenis Antar Kerja</td>'+
                                        '<td colspan="3" rowspan="2" style="font-weight:bold;text-align:center;">Jumlah</td>'+
                                '</tr>'+
                                '<tr>'+
                                        '<td colspan="3" style="font-weight:bold;text-align:center;">AKL</td>'+
                                        '<td colspan="3" style="font-weight:bold;text-align:center;">AKAD</td>'+
                                        '<td colspan="3" style="font-weight:bold;text-align:center;">AKAN</td>'+
                                '</tr>'+
                                '<tr>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                '</tr>'+
                                '<tr>'+
                                        '<td style="font-weight:bold;text-align:center;">1</td>'+
                                        '<td style="font-weight:bold;text-align:center;">2</td>'+
                                        '<td style="font-weight:bold;text-align:center;">3</td>'+
                                        '<td style="font-weight:bold;text-align:center;">4</td>'+
                                        '<td style="font-weight:bold;text-align:center;">5</td>'+
                                        '<td style="font-weight:bold;text-align:center;">6</td>'+
                                        '<td style="font-weight:bold;text-align:center;">7</td>'+
                                        '<td style="font-weight:bold;text-align:center;">8</td>'+
                                        '<td style="font-weight:bold;text-align:center;">9</td>'+
                                        '<td style="font-weight:bold;text-align:center;">10</td>'+
                                        '<td style="font-weight:bold;text-align:center;">11</td>'+
                                        '<td style="font-weight:bold;text-align:center;">12</td>'+
                                        '<td style="font-weight:bold;text-align:center;">13</td>'+
                                        '<td style="font-weight:bold;text-align:center;">14</td>'+
                                '</tr>'+
                            '</thead>'+
                            '<tbody>';
                        
                        var jmltot_akl_laki=0;
                        var jmltot_akl_cew=0;
                        var jmltot_akad_laki=0;
                        var jmltot_akad_cew=0;
                        var jmltot_akan_laki=0;
                        var jmltot_akan_cew=0;
                        var tot_jml_akl=0;
                        var tot_jml_akan=0;
                        var tot_jml_akad=0;
                        var jmltot_laki=0;
                        var jmltot_cew=0;
                        var jmltot_laki_cew=0;


                        for (var p = 0; p < data.length; p++) {


                              template =template+
                                '<tr>'+
                                        '<td style="text-align:center;">'+parseInt(p+1)+'</td>'+
                                        '<td>'+data[p].nama_badan_usaha+'</td>'+
                                        '<td style="text-align:right;">';
                                        
                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akl_laki = data[p].penempatan[0].jml_laki;  
                                        }
                                        
                                        jmltot_akl_laki +=parseInt(jml_akl_laki);
                                        template =template+
                                            jml_akl_laki;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akl_cew = data[p].penempatan[0].jml_cew; 
                                        }
                                        
                                        jmltot_akl_cew +=parseInt(jml_akl_cew);
                                        template =template+
                                            jml_akl_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            tot_jml = data[p].penempatan[0].tot_jml; 
                                        }
                                        
                                        tot_jml_akl +=parseInt(tot_jml);
                                        template =template+
                                            tot_jml;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akad_laki = data[p].penempatan[1].jml_laki; 
                                        }

                                        jmltot_akad_laki +=parseInt(jml_akad_laki);
                                        template =template+
                                            jml_akad_laki;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akad_cew= data[p].penempatan[1].jml_cew; 
                                        }
                                        
                                        jmltot_akad_cew +=parseInt(jml_akad_cew);
                                        template =template+
                                            jml_akad_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            tot_jml = data[p].penempatan[1].tot_jml; 
                                        }
                                        
                                        tot_jml_akad +=parseInt(tot_jml);
                                        template =template+
                                            tot_jml;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akan_laki = data[p].penempatan[2].jml_laki; 
                                        }
                                        
                                        jmltot_akan_laki +=parseInt(jml_akan_laki);
                                        template =template+
                                            jml_akan_laki;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akan_cew = data[p].penempatan[2].jml_cew; 
                                        }
                                        
                                        jmltot_akan_cew +=parseInt(jml_akan_cew);
                                        template =template+
                                            jml_akan_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            tot_jml = data[p].penempatan[2].tot_jml; 
                                        }
                                        
                                        tot_jml_akan +=parseInt(tot_jml);
                                        template =template+
                                            tot_jml;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        var jml_laki = parseInt(jml_akl_laki) + parseInt(jml_akad_laki) + parseInt(jml_akan_laki);

                                        jmltot_laki +=parseInt(jml_laki);
                                        template =template+
                                            jml_laki;
                                        template =template+
                                        '<td style="text-align:right;">';

                                        var jml_cew = parseInt(jml_akl_cew) + parseInt(jml_akad_cew) + parseInt(jml_akan_cew);

                                        jmltot_cew +=parseInt(jml_cew);
                                        template =template+
                                            jml_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';
                                        var jml_laki_cew =  parseInt(jml_laki) +  parseInt(jml_cew);

                                        jmltot_laki_cew +=parseInt(jml_laki_cew);
                                        template =template+
                                            jml_laki_cew;
                                        template =template+
                                        '</td>'+
                                '</tr>';
                            
                        }

                        template =template+
                                '<tr>'+
                                        '<td style="font-weight:bold;text-align:center;" colspan="2">TOTAL</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akl_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akl_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+tot_jml_akl+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akad_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akad_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+tot_jml_akad+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akan_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akan_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+tot_jml_akan+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_laki_cew+'</td>'+
                                '</tr>'+

                            '</tbody>'+
                        '</table>';
                // var html = Mustache.to_html(template, data);
                $('.table-ipkdelapan').html(template,data);
                // window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
            } else {
                alert(resp.msg);
                $('.table-ipkdelapan').html("");
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

            arrbulan = ["JANUARI","FEBRUARI","MARET","APRIL","MEI","JUNI","JULI","AGUSTUS","SEPTEMBER","OKTOBER","NOVEMBER","DESEMBER"];
            date = new Date();
            bulan = date.getMonth();
            tahun = date.getFullYear();
            var data = resp.result;

                // console.log(data);
                var template = 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">IPK III/8: PENEMPATAN PENCARI KERJA MENURUT JENIS ANTAR KERJA</div>'+ 
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">PENERIMA TENAGA KERJA DAN JENIS KELAMIN DIKOTA/KABUPATEN SLEMAN</div>'+
                 '<div style="text-align:center;font-size:12pt;font-weight:bold; text-transform: uppercase;">BULAN '+arrbulan[bulan]+' '+tahun+'</div>'+
                        '<br/>'+
                        '<table style="border-collapse: collapse; width: 100%; height: 90px;" border="1">'+
                            '<thead>'+
                                '<tr>'+
                                        '<td rowspan="3" style="font-weight:bold;text-align:center;">No</td>'+
                                        '<td rowspan="3" style="font-weight:bold;text-align:center;">II. Penerima Pencari Kerja</td>'+
                                        '<td colspan="9" style="font-weight:bold;text-align:center;">Jenis Antar Kerja</td>'+
                                        '<td colspan="3" rowspan="2" style="font-weight:bold;text-align:center;">Jumlah</td>'+
                                '</tr>'+
                                '<tr>'+
                                        '<td colspan="3" style="font-weight:bold;text-align:center;">AKL</td>'+
                                        '<td colspan="3" style="font-weight:bold;text-align:center;">AKAD</td>'+
                                        '<td colspan="3" style="font-weight:bold;text-align:center;">AKAN</td>'+
                                '</tr>'+
                                '<tr>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                        '<td style="font-weight:bold;text-align:center;">L</td>'+
                                        '<td style="font-weight:bold;text-align:center;">P</td>'+
                                        '<td style="font-weight:bold;text-align:center;">JML</td>'+
                                '</tr>'+
                                '<tr>'+
                                        '<td style="font-weight:bold;text-align:center;">1</td>'+
                                        '<td style="font-weight:bold;text-align:center;">2</td>'+
                                        '<td style="font-weight:bold;text-align:center;">3</td>'+
                                        '<td style="font-weight:bold;text-align:center;">4</td>'+
                                        '<td style="font-weight:bold;text-align:center;">5</td>'+
                                        '<td style="font-weight:bold;text-align:center;">6</td>'+
                                        '<td style="font-weight:bold;text-align:center;">7</td>'+
                                        '<td style="font-weight:bold;text-align:center;">8</td>'+
                                        '<td style="font-weight:bold;text-align:center;">9</td>'+
                                        '<td style="font-weight:bold;text-align:center;">10</td>'+
                                        '<td style="font-weight:bold;text-align:center;">11</td>'+
                                        '<td style="font-weight:bold;text-align:center;">12</td>'+
                                        '<td style="font-weight:bold;text-align:center;">13</td>'+
                                        '<td style="font-weight:bold;text-align:center;">14</td>'+
                                '</tr>'+
                            '</thead>'+
                            '<tbody>';
                        
                        var jmltot_akl_laki=0;
                        var jmltot_akl_cew=0;
                        var jmltot_akad_laki=0;
                        var jmltot_akad_cew=0;
                        var jmltot_akan_laki=0;
                        var jmltot_akan_cew=0;
                        var tot_jml_akl=0;
                        var tot_jml_akan=0;
                        var tot_jml_akad=0;
                        var jmltot_laki=0;
                        var jmltot_cew=0;
                        var jmltot_laki_cew=0;


                        for (var p = 0; p < data.length; p++) {


                              template =template+
                                '<tr>'+
                                        '<td style="text-align:center;">'+parseInt(p+1)+'</td>'+
                                        '<td>'+data[p].nama_badan_usaha+'</td>'+
                                        '<td style="text-align:right;">';
                                        
                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akl_laki = data[p].penempatan[0].jml_laki;  
                                        }
                                        
                                        jmltot_akl_laki +=parseInt(jml_akl_laki);
                                        template =template+
                                            jml_akl_laki;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akl_cew = data[p].penempatan[0].jml_cew; 
                                        }
                                        
                                        jmltot_akl_cew +=parseInt(jml_akl_cew);
                                        template =template+
                                            jml_akl_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            tot_jml = data[p].penempatan[0].tot_jml; 
                                        }
                                        
                                        tot_jml_akl +=parseInt(tot_jml);
                                        template =template+
                                            tot_jml;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akad_laki = data[p].penempatan[1].jml_laki; 
                                        }

                                        jmltot_akad_laki +=parseInt(jml_akad_laki);
                                        template =template+
                                            jml_akad_laki;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akad_cew= data[p].penempatan[1].jml_cew; 
                                        }
                                        
                                        jmltot_akad_cew +=parseInt(jml_akad_cew);
                                        template =template+
                                            jml_akad_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            tot_jml = data[p].penempatan[1].tot_jml; 
                                        }
                                        
                                        tot_jml_akad +=parseInt(tot_jml);
                                        template =template+
                                            tot_jml;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akan_laki = data[p].penempatan[2].jml_laki; 
                                        }
                                        
                                        jmltot_akan_laki +=parseInt(jml_akan_laki);
                                        template =template+
                                            jml_akan_laki;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            jml_akan_cew = data[p].penempatan[2].jml_cew; 
                                        }
                                        
                                        jmltot_akan_cew +=parseInt(jml_akan_cew);
                                        template =template+
                                            jml_akan_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        for (var q = 0; q < data[p].penempatan.length; q++) { 
                                            tot_jml = data[p].penempatan[2].tot_jml; 
                                        }
                                        
                                        tot_jml_akan +=parseInt(tot_jml);
                                        template =template+
                                            tot_jml;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';

                                        var jml_laki = parseInt(jml_akl_laki) + parseInt(jml_akad_laki) + parseInt(jml_akan_laki);

                                        jmltot_laki +=parseInt(jml_laki);
                                        template =template+
                                            jml_laki;
                                        template =template+
                                        '<td style="text-align:right;">';

                                        var jml_cew = parseInt(jml_akl_cew) + parseInt(jml_akad_cew) + parseInt(jml_akan_cew);

                                        jmltot_cew +=parseInt(jml_cew);
                                        template =template+
                                            jml_cew;
                                        template =template+
                                        '</td>'+
                                        '<td style="text-align:right;">';
                                        var jml_laki_cew =  parseInt(jml_laki) +  parseInt(jml_cew);

                                        jmltot_laki_cew +=parseInt(jml_laki_cew);
                                        template =template+
                                            jml_laki_cew;
                                        template =template+
                                        '</td>'+
                                '</tr>';
                            
                        }

                        template =template+
                                '<tr>'+
                                        '<td style="font-weight:bold;text-align:center;" colspan="2">TOTAL</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akl_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akl_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+tot_jml_akl+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akad_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akad_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+tot_jml_akad+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akan_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_akan_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+tot_jml_akan+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_laki+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_cew+'</td>'+
                                        '<td style="font-weight:bold;text-align:right;">'+jmltot_laki_cew+'</td>'+
                                '</tr>'+

                            '</tbody>'+
                        '</table>';
                var html = Mustache.to_html(template, data);
                // $('.table-ipkdelapan').html(template,data);
                window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
            } else {
                alert(resp.msg);
                $('.table-ipkdelapan').html("");
            }
        });
    });

        // simulasi loading... hide setelah 500ms
    setTimeout(function() {
        MyApp.$me('.overlay').hide();
    }, 500);
})();

//# sourceURL=LaporanIpkDua.js