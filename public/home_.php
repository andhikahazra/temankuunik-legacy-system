<div class="container mt-5" style="width: 600px;">
    <!-- Nav tabs -->


    <!-- Tab content -->
    <div class="mt-3">
        <!-- Nomor HP Tab -->
        <div class="tab-pane" id="nomor_hp" role="tabpanel" aria-labelledby="nomor_hp-tab">
            <h2>Masukkan Nomor HP</h2>
            <form action="" method="POST" autocomplete="off">
                <div class="mb-3 item-center mx-auto" style="width:500px">
                    <label for="no_hp" class="form-label">Nomor HP</label>
                    <input type="text" class="form-control" id="no_hp" name="no_hp" placeholder="Masukkan Nomor HP" required>
                </div>
                <button type="submit" class="btn btn-success btnHP">Submit</button>
            </form>
        </div>

        <!-- Form Detail Tamu Tab -->
        <div class="tab-pane" id="form_tamu" role="tabpanel" aria-labelledby="form_tamu-tab" style="display: none;">
            <h2>Form Detail Tamu</h2>
            <form action="" method="POST" id="f_tamu" autocomplete="off">
                <div class="form-group mb-3 row">
                    <label for="no_hp">Nomor HP</label>
                    <input type="hidden" name="type_tamu" id="type_tamu" value="new">
                    <input type="text" class="form-control" id="no_hp2" name="no_hp2" placeholder="Masukkan Nomor HP" readonly>
                </div>
                <div class="form-group mb-3 row">
                    <label for="nama">Nama</label>
                    <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan Nama" required>
                </div>
                <div class="form-group mb-3 row">
                    <label for="instansi">Asal</label>
                    <select class="form-select" id="instansi" name="instansi">
                        <option value="0">Silahkan Pilih</option>
                        <option value="Instansi Pemkab Sleman">Instansi Pemkab Sleman</option>
                        <option value="Pegawai Swasta">Pegawai Swasta</option>
                        <option value="Akademisi">Akademisi</option>
                        <option value="LSM">LSM</option>
                        <option value="Masyarakat">Masyarakat</option>
                        <option value="Lainnya">Lainnya</option>
                    </select>
                </div>
                <div class="form-group mb-3 row">
                    <label for="pekerjaan">Keterangan Asal/Instansi</label>
                    <input type="text" class="form-control" id="keterangan" name="keterangan" placeholder="Keterangan Asal" required>
                </div>
                <button type="submit" class="btn btn-warning btBaru">DATA BARU</button>
                <button type="submit" class="btn btn-success btNext">SELANJUTNYA</button>
            </form>
        </div>

        <!-- Detail Kunjungan Tab -->
        <div class="tab-pane" id="form_kunjungan" role="tabpanel" aria-labelledby="form_kunjungan-tab" style="display: none;">
            <h2>Detail Kunjungan</h2>
            <form action="#" method="POST" id="f_kunjungan" autocomplete="off">
                <div class="form-group mb-3 row">
                    <label for="no_hp">Kepentingan</label>
                    <select class="form-select" id="keperluan" name="keperluan">
                        <option value="0">Silahkan Pilih</option>
                        <option value="Janji Ketemu">Janji Ketemu</option>
                        <option value="Promo Produk">Promo Produk</option>
                        <option value="PKL/Magang">PKL/Magang</option>
                        <option value="LSM">LSM</option>
                        <option value="Menyampaikan Surat/Proposal/Laporan">Menyampaikan Surat/Proposal/Laporan</option>
                        <option value="Lainnya">Lainnya</option>
                    </select>
                </div>
                <div class="form-group mb-3 row">
                    <label for="catatan">Keterangan</label>
                    <textarea class="form-control" name="catatan" id="catatan"></textarea>
                </div>
                <button type="submit" class="btn btn-success btSimpan">Simpan</button>
            </form>
        </div>
    </div>
</div>


<!-- Bootstrap Toast -->
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="notificationToast" class="toast success" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="4000">
        <div class="toast-header">
            <strong class="me-auto">Notification</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            DATA BERHASIL DISIMPAN!
        </div>
    </div>
</div>