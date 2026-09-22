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

    MyApp.module.tableInstansi = MyApp.$me('.table-instansi');
    var maxH = MyApp.getContentHeight() - 50;

    // inisialisasi jsGrid
    MyApp.module.tableInstansi.jsGrid({
        width: '100%',
        height: maxH,
        noDataContent: "Not found",
        inserting: false,
        // filtering: true,
        sorting: true,
        autoload: true,
        paging: true,
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
                    limit: filter.pageSize
                }
                MyApp.ajax(params).done(function(resp) {
                    var rsl = {
                        data: resp.result,
                        itemsCount: resp.total
                    };
                    d.resolve(rsl);
                });
                return d.promise();
            },
            updateItem: function(item, editedItem) {
                var d = $.Deferred();
                items = {};
                items.flag = "upd_data";
                items.id = item.id;
                items.nomor_surat = item.nomor_surat;
                items.perihal = item.perihal;

                var params = {
                    option: 'save',
                    action: 'data',
                    data: items
                }
                MyApp.ajax(params).done(function(resp) {
                    if (resp.success) {
                        d.resolve(item);
                        alert(resp.msg);
                        MyApp.module.tableInstansi.jsGrid("loadData");
                    } else {
                        d.resolve(MyApp.$me.previousItem);
                        alert("Update Gagal\n" + resp.msg);
                    }
                });
                return d.promise();
            },
            deleteItem: function(item) {
                var d = $.Deferred();

                items = {};
                items.flag = "del_data";
                items.id = item.id;

                var params = {
                    option: 'delete',
                    action: 'data',
                    data: items
                }
                MyApp.ajax(params).done(function(resp) {
                    if (resp.success) {
                        d.resolve(item);
                        alert(resp.msg);
                        MyApp.module.tableInstansi.jsGrid("loadData");
                    }
                });
                return d.promise();
            },
        },
        fields: [{
                type: 'action',
                width: "10%",
                // itemTemplate: function(value, item) {
                //     // var result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);

                //     MyApp.module.tableInstansi.on('click', '.item-edit', function(e) {
                //         // var a = $(this).closest('tr');
                //          MyApp.openModule('entry-pengguna', item);
                //         // console.log(a);
                //     });
                //     // return result.add(customButton);
                // },
            }, {
                name: "user_id",
                title: 'Id',
                type: "text",
                width: "10%",
                editing: false,
                // visible: false
            }, {
                name: "username",
                title: 'Username',
                width: "10%",
                type: "text"
            }, {
                name: "nama",
                title: 'Nama Lengkap',
                width: "25%",
                type: "text"
            }, {
                name: "email",
                title: 'Email',
                width: "20%",
                type: "text"
            }, {
                name: "unit_kerja",
                title: 'Unit Keja',
                width: "15%",
                type: "text"
            }, {
                name: "caption_kepala_unit_kerja",
                title: 'Jabatan',
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
    MyApp.module.tableInstansi.on('click', '.item-edit', function(e) {
        var data = $(this).closest('tr')[0].childNodes[1].innerText;
        MyApp.openModule('entry-pengguna', data);
        // console.log(data);
    });
    jsGrid.setActionFieldEvent('.table-instansi');
    $('#add_kategori').on("click", function() {
        MyApp.module.tableInstansi.jsGrid("insertItem");
    })

    function formatRepo(repo) {
        //console.log(repo);
        if (repo.loading) return repo.text;

        var markup = "<div class='select2-result-repository__title'>" + repo.text + "</div>";


        return markup;
    }

    function formatRepoSelection(repo) {

        return repo.unit_kerja || repo.text;
    }
    $('.select2').select2({
        placeholder: 'SKPD Sleman',
        ajax: {
            url: "./service.php",
            dataType: 'json',
            delay: 250,
            data: function(params) {
                console.log(params)
                return {
                    q: params.term, // search term
                    page: params.page,
                    Module: 'EntrySuratMasuk',
                    option: 'PUBLIC',
                    action: 'unitkerjaList',
                };
            },
            processResults: function(data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;
                //console.log(data)
                return {
                    results: data.result,
                    pagination: {
                        more: (params.page * 30) < data.total
                    },

                };
            },
            cache: true
        },
        escapeMarkup: function(markup) {
            return markup;
        }, // let our custom formatter work
        minimumInputLength: 5,
        templateResult: formatRepo, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelection, // omitted for brevity, see the source of this page
    });

    $('.cb-nomor').on("change", function() {
        var a = $(this).val() + "/XXX";
        $('.nomor-surat').val(a)
    })
    $('#cari_pengguna').on("click", function() {
        var instansi = $('.instansi').val();

        var params = {
                option: 'data',
                action: 'list',
                instansi: instansi,
                start: 0,
                limit: 15
            }
            // kedepan fungsi ini dimasukkan ke data module, sebagai master
        MyApp.ajax(params).done(function(resp) {
            if (resp.success) {
                MyApp.module.tableInstansi.jsGrid("loadData");
            }
        })
    })
    $('#add_pengguna').on("click", function() {
            MyApp.openModule('entry-pengguna', null);
        })
        // simulasi loading... hide setelah 500ms
    setTimeout(function() {
        MyApp.$me('.overlay').hide();
    }, 500);
})();

//# sourceURL=MDInstansi.js