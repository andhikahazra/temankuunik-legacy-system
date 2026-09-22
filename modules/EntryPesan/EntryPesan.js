// Script ini akan dijalankan setelah template utama *.html selesai di load
(function() {
    MyApp.renderMainTpl();
    MyApp.loadModuleCss();
    MyApp.$me.userparams;
    //Date range picker
    $('.tgl').datepicker({
        dateFormat: 'yy-mm-dd'
    });


    var datastring = $('#form-search').serializeArray();
    var params = {
            option: 'PUBLIC',
            action: 'groupList'
        }
        // kedepan fungsi ini dimasukkan ke data module, sebagai master
    MyApp.ajax(params).done(function(resp) {
        if (resp.success) {
            
            // clear combo modules dulu
            // cbMaster.html('');
            var data = resp.result;
            // console.log(data[0].isi_footer);
              $("#isi_footer").val(data[0].isi_footer);
        }
    });




    //check password sama
    $('#f_password, #f_password2').on('keyup', function() {
        if ($('#f_password').val() == $('#f_password2').val()) {
            $('#message').html('Password Sama').css('color', 'green');
        } else
            $('#message').html('Password Tidak Sama').css('color', 'red');

    });

    /* Digunakan untuk update data pengguna */
    if (MyApp.module.data) {
        $('.user_id').val(MyApp.module.data);
        //var unit = $('#form-kasus').serializeArray();

        var params = {
            option: 'PUBLIC',
            action: 'dataList',
            user_id: MyApp.module.data
        }
        MyApp.ajax(params).done(function(resp) {
            if (resp.success) {
                if (resp.result.PenggunaDS[0]) {
                    // debugger;
                    MyApp.setFormValues('#form-pengguna', resp.result.PenggunaDS[0]);
                    console.log(resp.result.PenggunaDS[0]);
                    var dataUser = resp.result.PenggunaDS[0];
                    /* email: "disdikkadis@slemankab.go.id"
                    group_id: "kadis"
                    id_unit_kerja: 1000
                    nama: "disdikkadis"
                    param01: ""
                    param03: null
                    param04: ""
                    param05: ""
                    user_id: "disdikkadis"
                    username: "disdikkadis" */


                    $("#f_username").val(dataUser.username);
                    $("#f_username").prop('readonly', true);
                    $("#user_id").val(dataUser.user_id);
                    $("#f_nama").val(dataUser.nama);
                    $("#f_email").val(dataUser.email);

                    if (dataUser.active == 1) { $('#f_aktif').prop('checked', true); }
                    if (dataUser.active == 0) { $('#f_aktif').prop('checked', false); }
                    if (dataUser.isadmin == 1) { $('#f_admin').prop('checked', true); }
                    if (dataUser.isadmin == 0) { $('#f_admin').prop('checked', false); }

                    $("#param01").val(dataUser.param01);
                    $("#param02").val(dataUser.param02);
                    $("#param03").val(dataUser.param03);
                    $("#param04").val(dataUser.param04);
                    $("#param05").val(dataUser.param05);
                    $("#param06").val(dataUser.param06);
                    $("#param07").val(dataUser.param07);
                    $("#param08").val(dataUser.param08);
                    $("#param09").val(dataUser.param09);
                    $("#param10").val(dataUser.param10);
                    // debugger;
                }
            }
        })
    }




    // if (MyApp.module.data) {
    //     MyApp.$me.userparams = MyApp.module.data;
    //     var x = MyApp.module.data;

    //     $("#f_username").val(x.username);
    //     $("#f_username").prop('readonly', true);
    //     $("#user_id").val(x.user_id);
    //     $("#f_nama").val(x.nama);
    //     $("#f_email").val(x.email);

    //     if (x.active == 1) { $("#f_aktif").prop('checked', true); }
    //     if (x.isadmin == 1) { $("#f_admin").prop('checked', true); }

    //     $("#param02").val(x.param02);
    //     $("#param03").val(x.param03);
    //     $("#param04").val(x.param04);
    //     $("#param05").val(x.param05);
    //     $("#param06").val(x.param06);
    //     $("#param07").val(x.param07);
    //     $("#param08").val(x.param08);
    //     $("#param09").val(x.param09);
    //     $("#param10").val(x.param10);
    //     setTimeout(function() {
    //         $("#group_id").val(x.group_id);
    //         if (x.param01 != '')
    //             $("#param01").val(x.param01);
    //     }, 1000);

    //     console.log(x);

    // }


    $(".save-pesan").on("click", function() {
            var datastring = $('.form-insert').serializeArray();
            idForm = $('#form-pesan');
            dataForm = MyApp.getFormValues(idForm);
// console.log(dataForm.nomor_telepon);

        if (dataForm.nomor_telepon == ''  ){
            alert('Nomor Telepon masih kosong');
        } else if (dataForm.isi_pesan == ''){
            alert('Pesan masih kosong');
        } else {

            var params = {
                option: 'save',
                action: 'data',
                data: datastring,
            }
            
            MyApp.ajax(params).done(function(resp) {
                if (resp.success) {
                    alert(resp.msg);
                    // MyApp.openModule('daftar-pengguna', null);
                }
            });

        }
            
        })
        // simulasi loading... hide setelah 500ms
    setTimeout(function() {
        MyApp.$me('.overlay').hide();
    }, 500);
})();

//# sourceURL=EntryPesan.js