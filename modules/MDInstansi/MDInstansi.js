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

    var i = 0;
    MyApp.$me.item=[];
    var cek = '0';
    var mycek = '0';

    MyApp.module.tableInstansi = MyApp.$me('.table-instansi');
    var maxH = MyApp.getContentHeight() - 100;
    MyApp.$me.nomor = 1;

    // inisialisasi jsGrid
    MyApp.module.tableInstansi.jsGrid({
        width: '100%',
        height: maxH,
        noDataContent: "Not found",
        inserting: false,
        editing: false,
        // filtering: true,
        sorting: true,
        autoload: true,
        // paging: true,
        pageLoading: true,
        pageSize: 15,
        pageIndex: 1,
        pageButtonCount: 5,
        deleteConfirm: "Yakin akan menghapus data yg dipilih?",
        invalidMessage: "Ada data yang tidak valid!",
        controller: {
            loadData: function(filter) {
                var d = $.Deferred();
                var startIndex = (filter.pageIndex - 1) * filter.pageSize;
                
                var params = {
                    option: 'data',
                    action: 'list',                    
                    start: startIndex,
                    limit:filter.pageSize
                }
                MyApp.ajax(params).done(function(resp) {
                    $.map(resp.result, function (item, itemIndex) {
                            return $.extend(item, { "Index": itemIndex + 1 });
                        });
                    var rsl = {
                        data: resp.result,
                        itemsCount: resp.total
                    };
                        d.resolve(rsl);

                    });
                return d.promise();
            },
            // updateItem: function(item, editedItem) {
            //     var d = $.Deferred();
            //     items = {};
            //     items.flag = "upd_data";
            //     items.unit_kerja = item.nama_unit_kerja_lengkap;
            //     items.nama_unit_kerja_lengkap = item.nama_unit_kerja_lengkap;
            //     items.nama_kepala = item.nama_kepala;
            //     items.id_unit_kerja = item.id_unit_kerja;
            //     items.kode_unit_kerja = item.kode_unit_kerja;
            //     items.kode_unit_kerja_parent = item.kode_unit_kerja_parent;
            //     items.nama_unit_kerja_pendek = item.nama_unit_kerja_pendek;
                

            //     var params = {
            //         option: 'save',
            //         action: 'data',
            //         data: items
            //     }
            //     MyApp.ajax(params).done(function(resp) {
            //         if (resp.success) {
            //             d.resolve(item);
            //             alert(resp.msg);
            //             MyApp.module.tableInstansi.jsGrid("loadData");
            //         } else {
            //             d.resolve(MyApp.$me.previousItem);
            //             alert("Update Gagal\n" + resp.msg);
            //         }
            //     });
            //     return d.promise();
            // },
            // insertItem: function(item) {
            //     var d = $.Deferred();
            //     items = {};
            //     items.flag = "ins_data";
            //     items.unit_kerja = item.nama_unit_kerja_lengkap;
            //     items.nama_unit_kerja_lengkap = item.nama_unit_kerja_lengkap;
            //     items.nama_kepala = item.nama_kepala;
            //     items.id_unit_kerja = item.id_unit_kerja;
            //     items.kode_unit_kerja = item.kode_unit_kerja;
            //     items.kode_unit_kerja_parent = item.kode_unit_kerja_parent;
            //     items.nama_unit_kerja_pendek = item.nama_unit_kerja_pendek;

            //     var params = {
            //         option: 'save',
            //         action: 'data',
            //         data: items
            //     }
            //     MyApp.ajax(params).done(function(resp) {
            //         if (resp.success) {
            //             d.resolve(item);
            //             alert(resp.msg);
            //             MyApp.module.tableInstansi.jsGrid("loadData");
            //             MyApp.$me('.jsgrid-mode-on-button').trigger('click');
            //         }
            //     });
            //     return d.promise();
            // },
            // deleteItem: function(item) {
            //     var d = $.Deferred();

            //     items = {};
            //     items.flag = "del_data";
            //     items.id_unit_kerja = item.id_unit_kerja;

            //     var params = {
            //         option: 'delete',
            //         action: 'data',
            //         data: items
            //     }
            //     MyApp.ajax(params).done(function(resp) {
            //         if (resp.success) {
            //             d.resolve(item);
            //             alert(resp.msg);
            //             MyApp.module.tableInstansi.jsGrid("loadData");
            //         }
            //     });
            //     return d.promise();
            // },
        },
        fields: [{
                name: "Index", 
                title: "No", 
                type: "number",
                width: 40, 
                fediting: false,
                visible: true, 
                align: "center", 
            },{
                title: "Aksi",
            type: 'control',
            width: 70,
            editButton: false,
            deleteButton: false,
            itemTemplate : function(val,item){
               // debugger;
               var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);
               MyApp.$me.item[i] = item;

               var button = $('<i  data-index='+i+' data-aksi="edit" class="fa fa-edit item-edit"></i> '+
                '<i data-index='+i+' data-aksi="del" class="fa fa-trash item-delete"></i>').click(function(val,item){
                       // debugger;
                       aksi = $(this).data('aksi');
                       if (aksi=="edit") {
                        $('#myModal').modal() ;
                        
                        cek = '0';
                        index = $(this).data('index');
                        var id_form = $('#form-search');
                        MyApp.setFormValues(id_form,MyApp.$me.item[index]);
                            // console.log(MyApp.$me.item);
                            
                        } else if (aksi=="del") {
                            var r = confirm("Apakah Anda yakin akan menghapus data ini?");
                            if (r == true) {
                                var d = $.Deferred();
                                index = $(this).data('index');
                                items = {};
                                items.id_unit_kerja = MyApp.$me.item[index].id_unit_kerja;

                                var params = {
                                    option: 'delete',
                                    action: 'data',
                                    data: items,
                                }
                                MyApp.ajax(params).done(function(resp) {
                                    if (resp.success) {
                                        d.resolve(item);
                                        alert(resp.msg);
                                        MyApp.$me('.table-instansi').jsGrid("loadData");
                                    }
                                });
                                return d.promise(); 
                            }
                        } 
                    });
                
                i++;
                return $result.add(button);
            }
            
            }, {
                name: "id_unit_kerja",
                title: 'Id',
                type: "text",
                width: "2%",
                editing: false,
                visible: false
            }, {
                name: "unit_kerja",
                title: 'Nama Instansi',
                width: "45%",
                type: "text"
            }, {
                name: "nama_unit_kerja_pendek",
                title: 'Singkatan',
                width: "45%",
                type: "text"
            }, {
                name: "nama_kepala",
                title: 'Kepala Instansi',
                width: "45%",
                type: "text"
            },{
                name: "kode_unit_kerja",
                title: 'Kode Instansi',
                width: "15%",
                type: "text"
            }, {
                name: "kode_unit_kerja_parent",
                title: 'Kode Parent',
                width: "15%",
                type: "text"
            }
            // ,{ type: "control" }

        ],
        // before controller.updateItem, simpan item sebelum edit terjadi
        onItemUpdating: function(args) {
            MyApp.$me.previousItem = args.previousItem;
        }
       
    }); // EndOf inisialisasi jsGrid


    $('#add_data').on('click',function(){
       cek = '1';
       $('#myModal').modal() ; 
       $("#id_unit_kerja").hide();
       $("#unit_kerja").val('');
       $("#nama_unit_kerja_pendek").val('');
       $("#nama_kepala").val('');
       $("#kode_unit_kerja").val('');
    });

    $('#save').on("click", function() {
        var id_unit_kerja = $('.id_unit_kerja').val();
        var unit_kerja = $('.unit_kerja').val();
        var nama_unit_kerja_pendek = $('.nama_unit_kerja_pendek').val();
        var nama_kepala = $('.nama_kepala').val();
        var kode_unit_kerja = $('.kode_unit_kerja').val();

        var params = {
            option: 'save',
            action: 'data',
            flag:cek,
            id_unit_kerja:id_unit_kerja,
            unit_kerja:unit_kerja,
            nama_unit_kerja_lengkap:unit_kerja,
            nama_unit_kerja_pendek:nama_unit_kerja_pendek,
            nama_kepala:nama_kepala,
            kode_unit_kerja:kode_unit_kerja,
            kode_unit_kerja_parent:kode_unit_kerja,
        }
                    // console.log(params);
                    // kedepan fungsi ini dimasukkan ke data module, sebagai master
                    if ($('.nama_unit_kerja_lengkap').val() != ''){
                        MyApp.ajax(params).done(function(resp) {
                            if(resp.success){
                                MyApp.$me('.table-instansi').jsGrid("loadData");
                                alert(resp.msg);
                                $('#myModal').modal('hide');
                            } else {
                                alert(resp.msg);
                            }
                        })
                    }else{
                        alert("Data masih kosong!");              
                    }
        });

    $('#close').on('click',function(){
       $('#myModal').modal('hide'); 
    });

    MyApp.$me('.search-module').on('input', function(e) {
        // loop semua row di tabel modules
        var key = this.value;
        MyApp.$me('.table-instansi tbody tr').each(function(index) {
            if (key.length < 3) {
                $(this).show();
            } else {
                if ($(this).text().toLowerCase().indexOf(key) === -1) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            }
        })
    });

   

    // simulasi loading... hide setelah 500ms
    setTimeout(function() {
        MyApp.$me('.overlay').hide();
    }, 500);
})();

//# sourceURL=MDInstansi.js