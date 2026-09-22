-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 03, 2024 at 02:32 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `temankudb`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `module_id` varchar(80) NOT NULL DEFAULT '',
  `action_id` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(80) DEFAULT NULL,
  `action` varchar(80) DEFAULT NULL,
  `description` mediumtext,
  `log` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`module_id`, `action_id`, `option`, `action`, `description`, `log`) VALUES
('aduan', 'aduan_list', 'aduan', 'list', '', 0),
('aspek', 'aspek_list', 'aspek', 'list', 'list', 0),
('buku-hari', 'view_list', 'view', 'list', '', 0),
('capaian-indikator', 'capaian_list', 'capaian', 'list', 'list data urusan', 0),
('code-generator', 'code_generator_run', 'code_generator', 'run', 'Menjalankan fungsi-fungsi Code Generator', 1),
('code-module', 'action_list', 'action', 'list', 'Menampilkan list action', 0),
('code-module', 'cm_delete', 'cm', 'delete', 'Menghapus module atau actions', 1),
('code-module', 'code_module_run', 'code_module', 'run', 'Menjalankan fungsi-fungsi Code Module', 1),
('code-module', 'insert_action', 'insert', 'action', 'insert data action', 1),
('code-module', 'insert_module', 'insert', 'module', 'insert data module', 1),
('code-module', 'module_edit', 'module', 'edit', 'Update Data', 1),
('code-module', 'module_list', 'module', 'list', 'Menampilkan code module', 0),
('crud-generator', 'crud_list', 'crud', 'list', '', 0),
('daftar-kunjungan', 'kunjungan_view', 'kunjungan', 'view', 'kunjungan view', 1),
('daftar-tamu', 'tamu_view', 'tamu', 'view', 'List tamu', 1),
('dashboard', 'dashboard_view', 'dashboard', 'view', 'Menampilkan Dashboard', 1),
('dashboard-rup', 'dashboard_view', 'dashboard', 'view', 'Lihat dashboard RUP Kabupaten', 0),
('dashboard-rup-detail-penyedia', 'penyedia_list', 'penyedia', 'list', 'Lihat daftar paket penyedia RUP', 0),
('dashboard-rup-detail-skpd', 'skpd_list', 'skpd', 'list', 'Lihat daftar detail pada SKPD', 1),
('dashboard-rup-detail-swakelola', 'swakelola_list', 'swakelola', 'list', 'Lihat daftar paket swakelola RUP', 0),
('dashboard-rup-skpd', 'dashboard_view', 'dashboard', 'view', 'Lihat dashboard RUP SKPD', 0),
('data-pendaftar', 'data_list', 'data', 'list', 'list', 0),
('data-per-instansi', 'data_list', 'data', 'list', 'list data gender per instansi', 0),
('data-pilah', 'data_list', 'data', 'list', 'list', 0),
('data-umum-pertahun', 'data_list', 'data', 'list', 'data list', 0),
('data-urusan', 'urusan_list', 'urusan', 'list', 'list data urusan', 0),
('data_magang', 'magang_view', 'magang', 'view', 'menampilkan magang', 1),
('drawer-app', 'dm_list', 'dm', 'list', 'show drawer', 1),
('format-datagender', 'format_list', 'format', 'list', 'list', 0),
('hitung-rumus', 'rumus_list', 'rumus', 'list', 'list', 0),
('identitas-pemberikerja', 'module_view', 'module', 'view', 'view module', 1),
('indikator', 'indikator_list', 'indikator', 'list', 'list', 0),
('instansi-sumberdata', 'instansi_list', 'instansi', 'list', 'list instansi', 0),
('kategori', 'kategori_list', 'kategori', 'list', 'list', 0),
('kirim-pesan', 'module_view', 'module', 'view', '', 1),
('kirim-pesan', 'save_data', 'save', 'data', 'Mengirimkan data pesan wa', 1),
('kirim_pesan', 'module_view', 'module', 'view', 'kirim pesan', 1),
('laporan-ipk-delapan', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('laporan-ipk-dua', 'module_view', 'module', 'view', 'Menampilkan module view', 0),
('laporan-ipk-empat', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('laporan-ipk-enam', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('laporan-ipk-lima', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('laporan-ipk-tiga', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('laporan-ipk-tujuh', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('log-activity', 'log_list', 'log', 'list', 'Lihat log sesi user', 0),
('log-activity', 'session_list', 'session', 'list', 'Lihat log aktifitas user', 0),
('log-pesanwa', 'data_list', 'data', 'list', 'menampilkan data list', 1),
('logeduserinfo', 'logeduserinfo_getLoged', 'logeduserinfo', 'getLoged', 'Tampilkan keterangan user yang sedang login', 1),
('logeduserinfo', 'logeduserinfo_save', 'logeduserinfo', 'save', 'Simpan keterangan user yang sedang login', 1),
('logeduserinfo', 'logeduserinfo_savePassword', 'logeduserinfo', 'savePassword', 'Update password user yang sedang login', 1),
('lowongan-pekerjaan', 'module_view', 'module', 'view', 'menampilkan module vie', 0),
('message-private', 'message_list', 'message', 'list', 'Daftar Chat user', 0),
('message-public', 'message_send', 'message', 'send', 'Kirim pesan', 1),
('module_view', 'module', 'view', '', 'kirim pesan', 1),
('pencari-kerja', 'pencari_view', 'pencari', 'view', 'Pencari Kerja View', 1),
('penempatan-kerja', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('reff-badan-usaha', 'module_view', 'module', 'view', 'Menampilkan module view', 1),
('reff-bahasa-asing', 'bahasa_view', 'bahasa', 'view', 'melihat data bahasa', 1),
('reff-coba-crud-baru-with-validator', 'reffcobacrudbaruwithvalidator_view', 'reffcobacrudbaruwithvalidator', 'view', 'View Coba Crud Baru With Validator', 1),
('reff-daerah-penempatan', 'reffDaerahPenempatan', 'reffDaerahPenempatan', 'view', 'View Derah Penempatan', 1),
('reff-desa', 'desa_view', 'desa', 'view', 'melihat data desa', 1),
('reff-jabatan-kerja', 'jabatan_kerja_view', 'jabatan_kerja', 'view', 'Jabatan Kerja View', 1),
('reff-jaminan-sosial', 'reffjaminansosial_view', 'reffjaminansosial', 'view', 'View Jaminan Sosial', 1),
('reff-jk', 'jk_view', 'jk', 'view', 'view jk', 1),
('reff-jurusan-pendidikan', 'jurusanpendidikan_view', 'jurusanpendidikan', 'view', 'melihat data jurusan pendidikan', 1),
('reff-kabupaten', 'module_view', 'module', 'view', 'menampilkan module view', 1),
('reff-kecamatan', 'kecamatan_view', 'kecamatan', 'view', 'melihat data kecamatan', 1),
('reff-lapangan-usaha', 'lapanganusaha_view', 'lapanganusaha', 'view', 'View lapanganusaha', 1),
('reff-lokasi-kerja-pencaker', 'refflokasikerjapencaker_view', 'refflokasikerjapencaker', 'view', 'View Kerja Pencaker', 1),
('reff-mekanisme-penempatan', 'reffmekanismepenempatan_view', 'reffmekanismepenempatan', 'view', 'View Mekanisme Penempatan', 1),
('reff-nama-jabatan', 'nama_jabatan_view', 'nama_jabatan', 'view', 'Nama Jabatan View', 1),
('reff-nama-jurusan', 'namajurusan_view', 'namajurusan', 'view', 'melihat data nama jurusan', 1),
('reff-nama-usaha', 'namausaha_view', 'namausaha', 'view', 'View namausaha', 1),
('reff-provinsi', 'module_view', 'module', 'view', 'module view', 1),
('reff-sistem-pengupahan', 'sistempengupahan_view', 'sistempengupahan', 'view', 'View Sistem Pengupahan', 1),
('reff-status', 'status_view', 'status', 'view', 'View status', 1),
('reff-status-hubungan_kerja', 'statushubungankerja_view', 'statushubungankerja', 'view', 'View Hubungan Kerja', 1),
('reff-tingkat-pendidikan', 'tingkatpendidikan_view', 'tingkatpendidikan', 'view', 'melihat data tingkat pendidikan', 1),
('reff-upah-pencaker', 'upahpencaker_view', 'upahpencaker', 'view', 'View Upah Pencaker', 1),
('sample-module', 'sample_list', 'sample', 'list', 'COntoh aksi untuk module SampleModule', 1),
('sample-window', 'sample_list', 'sample', 'list', 'COntoh aksi untuk module SampleWindow', 1),
('setting-aplikasi', 'aplikasi_delete', 'aplikasi', 'delete', 'Menghapus Aplikasi Terintegrasi', 1),
('setting-aplikasi', 'aplikasi_edit', 'aplikasi', 'edit', 'Mengedit Aplikasi Terintegrasi', 1),
('setting-aplikasi', 'aplikasi_insert', 'aplikasi', 'insert', 'Menambah Aplikasi Terintegrasi ke List', 1),
('setting-aplikasi', 'aplikasi_list', 'aplikasi', 'list', 'Menampilkan list Aplikasi Terintegrasi', 0),
('setting-aplikasi', 'grup_list', 'grup', 'list', 'Menampilkan list Grup Aplikasi', 0),
('skpd-has-indikator', 'indikator_list', 'indikator', 'list', 'list', 0),
('sub', 'sub_list', 'sub', 'list', 'list', 0),
('sub-aspek', 'sub_list', 'sub', 'list', 'list', 0),
('sumber-data', 'sumberData_kunci', 'sumberData', 'Kunci', 'mengunci sumber data', 1),
('sumber-data', 'sumber_list', 'sumber', 'list', 'list', 0),
('tambah-kolom', 'kolom_list', 'kolom', 'list', 'list', 0),
('unit-layanan', 'layanan_add', 'layanan', 'add', 'add data', 1),
('unit-layanan', 'layanan_delete', 'layanan', 'delete', 'delete data', 1),
('unit-layanan', 'layanan_list', 'layanan', 'list', 'menampilkan daftar data', 0),
('unit-layanan', 'layanan_update', 'layanan', 'update', 'update data', 1),
('user-groups', 'group_list', 'group', 'list', 'Menampilkan daftar groups', 0),
('user-groups', 'user_list', 'user', 'list', 'Menampilkan daftar user', 0),
('user-unit', 'unit_list', 'unit', 'list', 'daftar unit', 0),
('user-unit', 'user_list', 'user', 'list', 'daftar user', 0),
('userinfo', 'userinfo_getDataUser', 'PUBLIC', 'save', 'Tampilkan keterangan user', 1),
('userinfo', 'userinfo_save', 'userinfo', 'save', 'Simpan keterangan user', 1),
('userinfo', 'userinfo_savePassword', 'PUBLIC', 'save', 'Simpan Update Password', 1),
('usermanagement', 'group_add', 'group', 'add', 'menambahkan group', 1),
('usermanagement', 'group_delete', 'group', 'delete', 'menghapus group user', 1),
('usermanagement', 'group_edit', 'group', 'edit', 'mengedit group user', 1),
('usermanagement', 'group_list', 'group', 'list', 'menampilkan data group', 0),
('usermanagement', 'user_add', 'user', 'add', 'Menambah user ke System', 1),
('usermanagement', 'user_delete', 'user', 'delete', 'Menghapus data user', 1),
('usermanagement', 'user_edit', 'user', 'edit', 'mengedit user', 1),
('usermanagement', 'user_list', 'user', 'list', 'menampilkan data user', 0),
('userotoritas', 'group_add', 'group', 'add', 'Tambah Data group otoritas user', 1),
('userotoritas', 'group_addUser', 'group', 'addUser', 'Tambah Daftar User pada group tertentu', 1),
('userotoritas', 'group_del', 'group', 'del', 'Hapus Data group otoritas user', 1),
('userotoritas', 'group_delUser', 'group', 'delUser', 'Hapus Daftar User pada group tertentu', 1),
('userotoritas', 'group_edit', 'group', 'edit', 'Ubah Data group otoritas user', 1),
('userotoritas', 'group_list', 'group', 'list', 'Lihat Daftar Data group otoritas user', 0),
('userotoritas', 'group_listUser', 'group', 'listUser', 'Lihat Daftar User pada group tertentu', 0),
('userotoritas', 'group_listUserAll', 'group', 'listUserAll', 'Lihat Daftar Semua User', 0),
('userotoritas', 'userotoritas_add', 'userotoritas', 'add', 'Tambah Data otoritas user', 1),
('userotoritas', 'userotoritas_del', 'userotoritas', 'del', 'Hapus Data otoritas user', 1),
('userotoritas', 'userotoritas_edit', 'userotoritas', 'edit', 'Ubah Data otoritas user', 1),
('userotoritas', 'userotoritas_export', 'userotoritas', 'export', 'Export Data otoritas user', 1),
('userotoritas', 'userotoritas_list', 'userotoritas', 'list', 'Lihat Data otoritas user', 0),
('userotoritas', 'userotoritas_listUserGroup', 'userotoritas', 'listUserGroup', 'Melihat Daftar User', 0),
('userotoritas', 'userotoritas_print', 'userotoritas', 'print', 'Cetak Data otoritas user', 1),
('userotoritas', 'userotoritas_save', 'userotoritas', 'save', 'Menyimpan Data otoritas user', 1),
('userunit', 'unit_list', 'unit', 'list', 'list unit', 0),
('userunit', 'userunit_view', 'userunit', 'view', 'Otoritas membuka module userunit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` varchar(50) DEFAULT NULL,
  `id` int NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `isi_footer` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `id`, `description`, `active`, `isi_footer`) VALUES
('superadmin', 1, 'Super Administrator', 1, 'dinas xxx'),
('admin', 3, 'Group Administrator', 1, NULL),
('operator', 4, 'grup operator', 1, NULL),
('test', 5, 'Group test', 1, 'dinas yyyy'),
('grp-rsud-sleman', 6, 'Group Operator RSUD Sleman', 1, '*RSUD Sleman*');

-- --------------------------------------------------------

--
-- Table structure for table `group_has_actions`
--

CREATE TABLE `group_has_actions` (
  `id` int NOT NULL,
  `group_id` varchar(100) DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  `action_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `group_has_actions`
--

INSERT INTO `group_has_actions` (`id`, `group_id`, `module_id`, `action_id`) VALUES
(59882, 'operator', 'dashboard', 'dashboard_view'),
(59883, 'operator', 'format-datagender', 'format_list'),
(59884, 'operator', 'logeduserinfo', 'logeduserinfo_getLoged'),
(59885, 'operator', 'logeduserinfo', 'logeduserinfo_save'),
(59886, 'operator', 'logeduserinfo', 'logeduserinfo_savePassword'),
(63893, 'admin', 'dashboard', 'dashboard_view'),
(63894, 'admin', 'userinfo', 'userinfo_getDataUser'),
(63895, 'admin', 'userinfo', 'userinfo_save'),
(63896, 'admin', 'userinfo', 'userinfo_savePassword'),
(63897, 'admin', 'userunit', 'unit_list'),
(63898, 'admin', 'userunit', 'userunit_view'),
(63899, 'admin', 'logeduserinfo', 'logeduserinfo_getLoged'),
(63900, 'admin', 'logeduserinfo', 'logeduserinfo_save'),
(63901, 'admin', 'logeduserinfo', 'logeduserinfo_savePassword'),
(64538, 'grp-rsud-sleman', 'kirim-pesan', 'module_view'),
(64539, 'grp-rsud-sleman', 'kirim-pesan', 'save_data'),
(64540, 'grp-rsud-sleman', 'log-pesanwa', 'data_list'),
(64541, 'superadmin', 'buku-hari', 'view_list'),
(64542, 'superadmin', 'code-module', 'action_list'),
(64543, 'superadmin', 'code-module', 'cm_delete'),
(64544, 'superadmin', 'code-module', 'code_module_run'),
(64545, 'superadmin', 'code-module', 'insert_action'),
(64546, 'superadmin', 'code-module', 'insert_module'),
(64547, 'superadmin', 'code-module', 'module_edit'),
(64548, 'superadmin', 'code-module', 'module_list'),
(64549, 'superadmin', 'crud-generator', 'crud_list'),
(64550, 'superadmin', 'userinfo', 'userinfo_getDataUser'),
(64551, 'superadmin', 'userinfo', 'userinfo_save'),
(64552, 'superadmin', 'userinfo', 'userinfo_savePassword'),
(64553, 'superadmin', 'userotoritas', 'group_add'),
(64554, 'superadmin', 'userotoritas', 'group_addUser'),
(64555, 'superadmin', 'userotoritas', 'group_del'),
(64556, 'superadmin', 'userotoritas', 'group_delUser'),
(64557, 'superadmin', 'userotoritas', 'group_edit'),
(64558, 'superadmin', 'userotoritas', 'group_list'),
(64559, 'superadmin', 'userotoritas', 'group_listUser'),
(64560, 'superadmin', 'userotoritas', 'group_listUserAll'),
(64561, 'superadmin', 'userotoritas', 'userotoritas_add'),
(64562, 'superadmin', 'userotoritas', 'userotoritas_del'),
(64563, 'superadmin', 'userotoritas', 'userotoritas_edit'),
(64564, 'superadmin', 'userotoritas', 'userotoritas_export'),
(64565, 'superadmin', 'userotoritas', 'userotoritas_list'),
(64566, 'superadmin', 'userotoritas', 'userotoritas_listUserGroup'),
(64567, 'superadmin', 'userotoritas', 'userotoritas_print'),
(64568, 'superadmin', 'userotoritas', 'userotoritas_save'),
(64569, 'superadmin', 'logeduserinfo', 'logeduserinfo_getLoged'),
(64570, 'superadmin', 'logeduserinfo', 'logeduserinfo_save'),
(64571, 'superadmin', 'logeduserinfo', 'logeduserinfo_savePassword'),
(64572, 'superadmin', 'usermanagement', 'group_add'),
(64573, 'superadmin', 'usermanagement', 'group_delete'),
(64574, 'superadmin', 'usermanagement', 'group_edit'),
(64575, 'superadmin', 'usermanagement', 'group_list'),
(64576, 'superadmin', 'usermanagement', 'user_add'),
(64577, 'superadmin', 'usermanagement', 'user_delete'),
(64578, 'superadmin', 'usermanagement', 'user_edit'),
(64579, 'superadmin', 'usermanagement', 'user_list'),
(64580, 'superadmin', 'kirim-pesan', 'module_view'),
(64581, 'superadmin', 'kirim-pesan', 'save_data'),
(64582, 'superadmin', 'log-pesanwa', 'data_list'),
(64583, 'admin', 'data-magang', 'magang_view');

-- --------------------------------------------------------

--
-- Table structure for table `group_has_modules`
--

CREATE TABLE `group_has_modules` (
  `id` int NOT NULL,
  `group_id` varchar(100) DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `group_has_modules`
--

INSERT INTO `group_has_modules` (`id`, `group_id`, `module_id`) VALUES
(14584, 'operator', 'dashboard'),
(14585, 'operator', 'format-datagender'),
(14586, 'operator', 'logeduserinfo'),
(16588, 'admin', 'dashboard'),
(16589, 'admin', 'userinfo'),
(16590, 'admin', 'userunit'),
(16591, 'admin', 'logeduserinfo'),
(16836, 'grp-rsud-sleman', 'kirim-pesan'),
(16837, 'grp-rsud-sleman', 'log-pesanwa'),
(16838, 'superadmin', 'buku-hari'),
(16839, 'superadmin', 'code-module'),
(16840, 'superadmin', 'crud-generator'),
(16841, 'superadmin', 'userinfo'),
(16842, 'superadmin', 'userotoritas'),
(16843, 'superadmin', 'logeduserinfo'),
(16844, 'superadmin', 'usermanagement'),
(16845, 'superadmin', 'kirim-pesan'),
(16846, 'superadmin', 'log-pesanwa'),
(16847, 'admin', 'data-magang');

-- --------------------------------------------------------

--
-- Table structure for table `group_has_users`
--

CREATE TABLE `group_has_users` (
  `id` int NOT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `group_has_users`
--

INSERT INTO `group_has_users` (`id`, `group_id`, `user_id`) VALUES
(352, 'superadmin', 'ebta'),
(353, 'superadmin', 'wimbo'),
(355, 'superadmin', 'admin'),
(356, 'superadmin', 'superadmin'),
(612, 'superadmin', 'noer'),
(613, 'superadmin', 'arkan'),
(614, 'superadmin', '199111052011012001'),
(615, 'operator', 'user'),
(616, 'member', NULL),
(617, 'operator', '196910151998031009'),
(618, 'operator', '197212171999031001'),
(621, 'operator', '19770992011011002'),
(627, 'operator', '198406062091102001'),
(648, 'operator', 'demo'),
(654, 'member', NULL),
(655, 'member', NULL),
(656, 'member', NULL),
(657, 'member', NULL),
(658, 'member', NULL),
(659, 'member', NULL),
(660, 'member', NULL),
(661, 'member', NULL),
(662, 'member', NULL),
(663, 'member', NULL),
(664, 'member', NULL),
(665, 'member', NULL),
(666, 'member', NULL),
(667, 'member', NULL),
(668, 'member', NULL),
(669, 'member', NULL),
(670, 'member', NULL),
(671, 'member', NULL),
(672, 'member', NULL),
(673, 'member', NULL),
(674, 'member', NULL),
(675, 'member', NULL),
(676, 'member', NULL),
(677, 'member', NULL),
(678, 'member', NULL),
(679, 'member', NULL),
(680, 'member', NULL),
(681, 'member', NULL),
(682, 'member', NULL),
(683, 'member', NULL),
(684, 'member', NULL),
(685, 'member', NULL),
(686, 'member', ''),
(687, 'member', ''),
(688, 'member', ''),
(689, 'member', ''),
(690, 'member', ''),
(691, 'member', ''),
(692, 'member', ''),
(693, 'member', ''),
(694, 'member', ''),
(695, 'member', ''),
(696, 'member', ''),
(697, 'member', ''),
(698, 'member', ''),
(699, 'member', ''),
(700, 'member', ''),
(701, 'member', ''),
(702, 'member', ''),
(703, 'admin', 'naker'),
(704, 'test', 'test'),
(706, 'admin', 'admnaker1'),
(707, 'admin', 'admnaker2'),
(708, 'admin', 'admnaker3'),
(709, 'admin', 'adminpkl'),
(710, 'superadmin', 'ngadminpro'),
(711, 'superadmin', 'kominfo'),
(712, 'grp-rsud-sleman', 'dedydc');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id` int NOT NULL,
  `id_tamu` int DEFAULT NULL,
  `kepentingan` varchar(155) DEFAULT NULL,
  `Catatan` text,
  `tgl_input` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id`, `id_tamu`, `kepentingan`, `Catatan`, `tgl_input`) VALUES
(1, 18, 'Mengantar Surat', 'MEngantar surat untuk undangan seminar', '2024-09-19 09:45:04'),
(2, 4, 'Bertemu Pegawai', 'Bertemu dengan Mas Habi', '2024-09-19 09:46:48'),
(3, 25, 'Mengantar Surat', 'MEngantar surat untuk undangan seminar', '2024-09-17 09:45:04'),
(4, 25, 'Mengantar Surat', 'MEngantar surat untuk undangan seminar', '2024-09-15 09:45:04'),
(5, 18, 'Mengantar Surat', 'MEngantar surat untuk undangan seminar', '2024-09-10 09:45:04'),
(6, 13, 'Bertemu Pegawai', 'Bertemu dengan Mas Nono', '2024-09-09 09:46:48'),
(7, 13, 'Bertemu Pegawai', 'Bertemu dengan Mas Edi', '2024-09-13 09:46:48'),
(8, 26, 'Bertemu Pegawai', 'Bertemu dengan Mbak Septi', '2024-09-15 09:46:48'),
(9, 29, 'Bertemu Pegawai', 'Bertemu dengan Mbak Nupus', '2024-09-18 09:46:48'),
(10, 8, 'Bertemu Pegawai', 'Bertemu dengan Bu Sekdin', '2024-09-15 09:46:48'),
(11, 11, 'Center seek population serious light.', 'Manager doctor news though floor pay young.\nRepresent choose go just own board account.', '2024-01-28 14:09:28'),
(12, 29, 'Big stop together member.', 'Affect buy ever thus rock cover. Great identify big bad student wear resource receive. Democrat impact serious always scene.', '2024-01-11 19:08:50'),
(13, 24, 'Table friend green police.', 'Outside street be know career option heart. Fund good animal responsibility yet this stock.', '2024-01-09 18:05:49'),
(14, 3, 'Same myself course develop drop.', 'Floor first natural. Season speak live organization quickly research. Success program include without group prepare.\nBill PM prepare low if foot hit television.', '2024-01-13 06:39:58'),
(15, 30, 'Audience audience put condition move power company.', 'Small impact stage dream. Company close care majority attorney.\nDetermine could realize above such herself line. One friend life family sell. Stay study class show build economic organization mind.', '2024-01-21 09:27:04'),
(16, 21, 'Though yeah benefit before.', 'Seek face various capital indicate oil. Respond animal common family sport night ground. View senior often just easy.', '2024-01-09 22:43:34'),
(17, 16, 'At capital face beautiful until more.', 'Fall kid rich dinner shoulder area center under. Play rule budget ten. Machine any well.\nImportant realize store top piece group artist red. Might often ready partner or.', '2024-01-19 14:19:27'),
(18, 15, 'Only fear so store act.', 'Few analysis show choose big four religious teacher. Treatment site expect over wear. Save onto understand similar just.', '2024-01-27 11:02:17'),
(19, 28, 'Reach live present forget development treatment if instead.', 'Across big always hard behavior forward. Form usually course card everyone people ahead.\nLeast keep loss piece control bill in most. Force music hour decision wide.', '2024-01-10 08:28:32'),
(20, 4, 'Far despite age other low sign cold.', 'Hotel market argue share person. Early first worker level go drive.\nCondition blood campaign. Wear appear detail at.', '2024-01-04 18:59:43'),
(21, 25, 'Different half safe next amount recently special any.', 'Source support term grow always matter when. Land begin return. Indeed ground street good old tend.', '2024-01-12 13:31:04'),
(22, 22, 'Far still tree eye enough what democratic bad.', 'Yeah suffer difference most wife. Program despite to institution policy simple.\nFuture benefit share the. Now pressure weight cultural rock. Explain system quickly budget traditional his.', '2024-01-22 23:33:59'),
(23, 5, 'South state character table office yourself.', 'No including themselves increase laugh. News white nature partner through know.\nLive economy mind film crime method play. Lead hotel land.', '2024-01-20 06:58:22'),
(24, 18, 'Than long include environmental ball.', 'Reveal spring lay. Benefit shake center industry song eat.', '2024-01-13 10:32:53'),
(25, 14, 'Ever staff write president.', 'Strong visit we some simply meeting. Close season around more it.\nParty leave cup allow author full effort.\nToday always less history network thing under. Street admit just offer civil.', '2024-01-06 14:12:04'),
(26, 17, 'Region top affect public mother evening amount major.', 'Water sort word against choice leg. Movie sell practice specific little clearly method. Near voice do entire fast fact.', '2024-01-12 23:08:38'),
(27, 13, 'Deep television particular hand.', 'Travel adult stage half ground experience. Out most town expert fall piece. Focus idea party head.\nStart key reason look.', '2024-01-05 14:04:20'),
(28, 13, 'Seat difference mention recognize.', 'Military whom quickly picture crime price dream bed.\nEven see short control four practice reach notice. Born American nature everything. Condition meeting coach those.', '2024-01-23 15:21:03'),
(29, 25, 'Imagine end wind better current office top.', 'Picture be impact small time product. Support fly officer great go matter cut.\nEat attack attorney small laugh program.\nAlways past bed.', '2024-01-04 09:57:02'),
(30, 25, 'Especially toward bring nation although shake Congress.', 'Number people if successful model ask. Several job concern forget century. Design source section low account expert report skin.', '2024-01-13 12:08:55'),
(31, 19, 'Community coach especially.', 'Which this east second fire. Among want glass yeah plant give.\nTheir across argue section tough decision guy. Husband actually compare move form time wind edge. Brother against law offer.', '2024-01-11 04:04:38'),
(32, 22, 'Central politics because identify plant figure me thousand.', 'Edge way people final program statement somebody. Nor interesting drive together movie out. Ever recognize nor arrive father nice.', '2024-01-27 07:39:07'),
(33, 21, 'Professional story wonder teach answer travel.', 'Authority street food team wall my. Understand defense town range general machine. War body both visit necessary.', '2024-01-13 09:23:23'),
(34, 8, 'Down suffer yes sort.', 'Window when suggest even myself grow.\nSchool difference say weight. Brother front school. See need amount friend evidence size.', '2024-01-02 07:32:12'),
(35, 6, 'Take Republican figure pressure evidence purpose might.', 'Author plant trial. Recent idea news. Whole heavy score off clearly fine.\nShare station travel senior what student. Local forget skin another which.', '2024-01-24 18:28:13'),
(36, 8, 'Approach process young product plan nothing over.', 'Dinner poor relationship president. Film finally issue city financial industry toward audience. First author test lawyer send explain.', '2024-01-08 09:53:49'),
(37, 21, 'Around management stand simple everyone whatever part.', 'Give although government over seem he through. Hope general process beyond everything speech.', '2024-01-14 09:38:54'),
(38, 19, 'Improve ten key firm focus.', 'Give forget vote read notice. Hotel in mind prevent.\nDark different quickly senior budget other. Trial behind create tend. List food song effort but affect.', '2024-01-08 23:05:30'),
(39, 4, 'That set top project character truth board those.', 'Between least rate our some public. Effect medical rest natural six two.', '2024-01-18 10:00:31'),
(40, 22, 'Interest treat authority.', 'Beautiful huge author. Site week camera state trade possible hundred center.\nDescribe compare wide see case finally. Case foot see product pass. Cut door statement most dog against.', '2024-01-22 20:47:48'),
(41, 8, 'Thing staff to turn wear benefit resource hold.', 'Think officer manager word word.\nSense safe Mr southern. Many or style picture west environmental. It before suffer learn oil difference.', '2024-01-07 12:25:39'),
(42, 2, 'Travel find knowledge.', 'Value professor know whether they. Since successful boy professor year full lot occur.', '2024-01-05 14:10:14'),
(43, 16, 'Growth choice page commercial.', 'Office remember least Republican character. Enter tell particular someone all data. Section door wrong.', '2024-01-11 00:21:02'),
(44, 13, 'Beautiful network subject stage board least operation.', 'Economic interesting value. Win entire future mission land crime fact. Student choice ago economy major professor claim.', '2024-01-18 12:54:57'),
(45, 15, 'Open oil blood less federal too election beat.', 'Very anyone fill also. Expert daughter real ago practice these. News risk top financial sea.', '2024-01-13 22:35:10'),
(46, 6, 'Moment wait letter major he carry.', 'Few building suddenly safe report force agreement. Several scientist industry yes cultural good. Fight standard leg two.', '2024-01-21 08:40:53'),
(47, 14, 'Anything read prepare natural.', 'Buy training record feel. Cultural heavy door attorney.\nAffect glass so production again trouble. Third fast reveal.', '2024-01-22 09:53:18'),
(48, 23, 'Individual too view million very.', 'Send argue remember page easy.\nStrong statement sense house whose his. These wide way current. Drop air may religious parent though table claim.', '2024-01-05 15:53:12'),
(49, 12, 'Today five time never event pass money.', 'Education drive sense music social officer. Take we today arm stand service picture.', '2024-01-04 00:48:49'),
(50, 22, 'Consumer wind worry left.', 'Consider year support seek perhaps especially measure. Before claim west rule put. Forward trial never campaign rich Republican. Drop whole room face.', '2024-01-17 08:10:20'),
(51, 11, 'Thousand daughter call week.', 'Reality other large provide lot star. Other sound seat loss much form. Full clear enter choose job evidence.\nNice rich series language including. Expect PM particular operation of figure.', '2024-01-03 09:39:28'),
(52, 19, 'Enjoy card each product page agree.', 'Establish production computer. Effect performance team they value.', '2024-01-14 02:03:24'),
(53, 2, 'Join Republican throughout deal live.', 'Change lose alone word interview set station. Product have bank fly against rock.', '2024-01-16 15:27:02'),
(54, 11, 'Industry city head sign up get.', 'Young officer smile ready set as peace rest. President education mission ground direction interesting over.\nHave drive democratic Mrs.\nEarly candidate law economy who start rock.', '2024-01-01 12:06:11'),
(55, 18, 'Rather can wide main.', 'Compare scientist pattern nature line group learn. Happen ten history own become. Doctor every instead enjoy.', '2024-01-23 02:10:40'),
(56, 29, 'Determine spring newspaper quality democratic.', 'Six wear report nothing let. West break yourself eat dream campaign minute. This protect use partner.\nDiscuss if nice draw line. Use position me.', '2024-01-14 07:26:54'),
(57, 30, 'Side already public democratic break.', 'Business drop case theory personal sure east agent. Themselves than play most every south often.\nKey full rule important add down two away. Economic sister development yard safe far recognize.', '2024-01-25 14:32:39'),
(58, 30, 'Human rate test class morning thought meeting.', 'Million soon quickly technology pick. But size wonder stop gas interview. Exactly bag morning side every.\nWhen player back daughter live maintain. Husband this cup popular leg we.', '2024-01-22 18:40:53'),
(59, 3, 'Fund since voice measure within watch.', 'Actually pretty maybe hear end several form. Shoulder already less sea soon teach. Tree traditional total break positive.', '2024-01-24 07:46:23'),
(60, 13, 'Century minute with peace spend.', 'Vote although wind enter eat how physical other. Green role side. Question field economic woman really they hand. Anyone simply magazine table group care another itself.', '2024-01-09 13:10:10'),
(61, 24, 'Program doctor American state.', 'Important executive skin church chair. Back medical tax as house recently range network.\nValue million between program identify.\nLine suddenly protect her ground. Six set use unit.', '2024-02-21 12:31:11'),
(62, 20, 'Talk situation several dark.', 'Rate career ready reduce read recognize money. Method moment say they statement audience others important.', '2024-02-01 22:31:17'),
(63, 27, 'Game thank side clearly.', 'Interest industry yourself kitchen. Author mention guy.', '2024-02-24 17:03:46'),
(64, 17, 'Daughter matter sing letter four.', 'Perhaps north surface step economy minute. Arrive pay mother detail yet space.', '2024-02-13 02:19:08'),
(65, 1, 'Them election despite statement expert option.', 'Attack body great else popular. Total offer along team apply. Turn animal factor traditional marriage summer fine.', '2024-02-25 23:53:39'),
(66, 13, 'Firm summer forward process two.', 'Call not last how next later hundred. Friend where likely top. Simply college number least.', '2024-02-10 20:26:04'),
(67, 2, 'Customer cup current tough.', 'Billion cell movie there hot which. Enter network less cost.\nLeast black each near.\nBeautiful wish help whole course structure. Small than nor easy health next about.', '2024-02-21 09:00:06'),
(68, 30, 'Tough live manager rate court enough.', 'Prove everyone area fish music. Write measure agreement lawyer.\nPull ask phone serve morning area. Cover political likely.', '2024-02-19 14:42:12'),
(69, 24, 'Defense attack follow tree see by stage.', 'Four fight forward stand born sister.\nPressure continue civil follow these coach five away. Watch house try method decision between. Get maintain usually become believe alone contain.', '2024-02-19 15:14:09'),
(70, 28, 'Late job billion system expect which.', 'Take apply clearly responsibility of. Standard plan them study media one bank per.\nSpeech deal theory require key let choice. Both way case provide expect present report.', '2024-02-12 09:06:52'),
(71, 9, 'Could player mother cover within.', 'Majority pressure begin several manage case. Argue state charge purpose government write. Senior finally through three some must.', '2024-02-03 13:56:31'),
(72, 20, 'Represent make hotel production cause if point.', 'Myself until letter.\nGovernment indicate perform. Teacher work would within make piece state about.\nMake body cold describe. Present throw eye system because turn. They operation also many.', '2024-02-12 04:32:24'),
(73, 11, 'Paper somebody baby large friend available.', 'Leave human class word most everything. I effect gun. Make fly can miss sense may south.', '2024-02-27 23:06:33'),
(74, 25, 'Guess two heart rock.', 'Against never low rock adult. Tonight cultural charge free down defense add.', '2024-02-19 19:40:13'),
(75, 3, 'Bank director front deep century break.', 'Respond build particular professor step current wife. Likely notice station during later.\nEverybody someone kitchen really. Suddenly ten responsibility situation. Next including see federal chair.', '2024-02-17 17:20:42'),
(76, 29, 'High life not trial.', 'Other door must article. Land administration dinner hold manage four.\nTeacher deal forward student lay alone perhaps. Great tree center. Prevent wear receive religious have message.', '2024-02-01 01:52:31'),
(77, 16, 'Wide about mother be his source indicate.', 'Card key level cold. Two include recently cultural there data.\nPlan none town property across space. Hot mission pull practice.', '2024-02-06 09:31:23'),
(78, 24, 'Whole effect themselves almost call yeah specific.', 'First collection experience smile. Them mention husband offer certain industry.\nSeason speak law arrive someone main mind. Oil to five fast music simple. Couple oil talk beyond red fine.', '2024-02-19 01:56:43'),
(79, 9, 'General recent free per huge run.', 'New early within data your right beautiful thousand. Out office positive way deep news. Practice approach quickly writer company bed.', '2024-02-20 09:13:12'),
(80, 3, 'Her media while by.', 'Heart production here many capital growth number. Reason rise sign financial professor medical. Crime do choice little.', '2024-02-07 13:10:16'),
(81, 17, 'Project clearly no six traditional.', 'Maintain step hotel standard no challenge stay. Face party feeling sport news simple. Firm special major listen music lawyer whatever discussion. Quite often agency fill gun.', '2024-02-28 10:31:46'),
(82, 17, 'War prevent seek few.', 'Clearly tend watch away. Discuss our any us sign across.\nWear allow find stand development actually. Network generation base clearly our.', '2024-02-13 22:51:21'),
(83, 1, 'Front into trouble manage activity serve player.', 'Prove exactly environment. Several according market per wind point simple. Thus will example put house.', '2024-02-08 16:58:39'),
(84, 16, 'As treatment break wear simply dark impact.', 'Usually owner cover trade improve method. Through generation history.\nCup from ever art front former become. Piece type budget contain according morning television. Stock apply drive beyond side.', '2024-02-14 21:50:53'),
(85, 16, 'Thus choose article daughter under buy case.', 'Director today notice nation performance rock couple not. Less growth couple less.\nMember entire hand almost energy would think. Him onto summer maybe listen day resource.', '2024-02-09 12:06:25'),
(86, 30, 'Many thousand cup baby drive.', 'Current million southern within politics Mr eat. Well continue most join activity church.\nTerm Republican none change note always resource. Dream recently choose occur shake sport set.', '2024-02-27 21:46:11'),
(87, 11, 'Nor community because team they land situation.', 'True catch relationship mouth debate weight. Mr food find everything shake. Particular recently matter citizen man husband.', '2024-02-04 15:02:14'),
(88, 25, 'Less activity short head.', 'Career stuff property yeah. Ground buy young day reach base. Season arrive way pull according.\nPolitics her game offer door rate. Change painting commercial positive all hard.', '2024-02-16 18:11:14'),
(89, 2, 'Policy state rise owner price decide cold.', 'Reason air adult our. Machine visit item put. Thank former recent old he team second.\nMyself effect religious morning friend. Reason discuss authority voice magazine focus.', '2024-02-11 08:25:46'),
(90, 24, 'Think despite argue moment serve well picture.', 'Others town stage night wait film. Sound action represent PM. Meeting go guy thought onto recently machine.', '2024-02-12 15:01:59'),
(91, 26, 'My star game center leave charge only feel.', 'Drug fall ok always. Left another impact beat form design out soldier.', '2024-02-17 16:04:47'),
(92, 25, 'Especially where avoid no.', 'Western good hundred kitchen should current. Smile prevent rest receive news Congress gun. Sign life modern total.', '2024-02-15 16:55:09'),
(93, 15, 'West sea until surface.', 'Particular cost cut instead ground garden agree teach. Happen resource day. Pressure rather road wife. Story operation rate they raise stage.', '2024-02-27 18:29:54'),
(94, 3, 'Fall ago site recent understand TV.', 'Yard to especially range accept read move. Laugh watch black attention tonight security ability.\nMy thousand reveal. Which note memory health those animal. Health nation sell network.', '2024-02-06 12:39:58'),
(95, 29, 'Movie someone he check game detail.', 'Either bill out year. Hit after concern reveal fast shoulder.\nKind brother sometimes.', '2024-02-20 01:50:03'),
(96, 13, 'Process without heart financial smile road practice.', 'Natural however never garden age far poor. When office stuff attorney likely.\nNone information unit arm peace quickly. Nothing knowledge answer.', '2024-02-23 02:45:07'),
(97, 9, 'Marriage more focus write campaign middle animal.', 'Remember challenge somebody method account coach. Head modern laugh image foreign. Spend drive memory north nation mean capital. Skin successful white put tax thousand.', '2024-02-22 00:19:13'),
(98, 5, 'It imagine order fish son.', 'Partner within throughout work collection hear laugh system. Loss little human. Air single truth either.', '2024-02-28 06:32:36'),
(99, 27, 'Customer doctor point book yet water.', 'Rate save process view attention others. Want then student. Push describe western able. Study as focus inside.\nThey quickly mouth impact card kid. Move wife unit east.', '2024-02-13 23:50:03'),
(100, 2, 'Pretty recently whatever matter base.', 'Less home strategy whose I. West crime life identify half another. Sing both town occur whom film plant minute.', '2024-02-26 06:12:31'),
(101, 16, 'Industry tough measure drug company.', 'Ready item next sign ever for.\nAnything understand whatever enter social. Agency national matter hundred.', '2024-02-24 20:49:00'),
(102, 16, 'Study learn behind administration laugh source.', 'Rather project behind consumer structure response.\nStudent not participant boy region power food. Although president after them million couple whom.', '2024-02-17 19:30:45'),
(103, 29, 'Letter cause such lawyer.', 'Table south end coach truth war certain. Less a contain including bring. Factor last stay floor lot. Travel as must.\nQuickly throw story laugh bad. Evidence great the measure key.', '2024-02-02 18:44:36'),
(104, 8, 'Here keep task same method.', 'Pay space approach economy. Peace human interesting low. Realize agreement coach seek concern poor.', '2024-02-19 20:15:01'),
(105, 13, 'However avoid also himself word moment range.', 'Country magazine perhaps decision. Thought great hope could table pass address summer. Color I suggest make commercial agent deal.', '2024-02-21 20:38:16'),
(106, 8, 'Oil say main too and step hour seek.', 'Admit go be law Republican husband research. Player particular relate house news apply industry.\nOnly anything mention successful. Put food heavy concern.', '2024-02-01 06:10:41'),
(107, 3, 'Large yeah college crime nearly.', 'Dark place onto get specific nature. Think standard shoulder change change. Visit drive increase expect.', '2024-02-12 08:11:39'),
(108, 19, 'Point add hotel risk sell probably though.', 'Common buy every go. Common vote whom state.\nAgainst watch board national other later. Audience west consider. Hit see father.', '2024-02-04 12:27:43'),
(109, 26, 'Maintain relationship myself its despite class.', 'Box rise daughter what forget. Still direction card coach strategy difference reason.', '2024-02-07 16:04:12'),
(110, 12, 'Concern plant claim.', 'North would short sea. Edge technology home tonight exactly begin.\nManage job TV second spend. Mr lose again case ever radio. Fear air dog production carry major.', '2024-02-18 08:44:42'),
(111, 11, 'Speak eat treat about home choose.', 'With agreement his century affect. Total paper worry begin more. Fact response toward perhaps. Guess pass window hear century end game.\nWith else break.', '2024-03-26 18:15:05'),
(112, 20, 'Open thousand story democratic.', 'Head indicate house yeah money effect condition. Window house that body job.\nBecome ever rest local decide energy wear. Material chance friend general. Employee hotel surface them choose.', '2024-03-17 09:05:22'),
(113, 5, 'Court care ahead.', 'Coach truth finish across. Eight music price six campaign throughout.', '2024-03-04 06:41:44'),
(114, 27, 'Worker upon evening around president day image.', 'Film bag good hand safe chair so.\nBeyond side behavior how including rest perform. Page ability appear management because. Help really kitchen little enough couple.', '2024-03-18 12:03:32'),
(115, 27, 'Course dark fact produce watch voice yeah.', 'Work good safe clearly politics company respond. Push require brother owner.\nHis free another man part evidence energy.\nAge theory order first new. Pick thing strategy open five dark.', '2024-03-03 10:47:18'),
(116, 25, 'Big ask field even.', 'Activity without include up. Board Congress effort maybe.\nYou me paper land usually trade speech. Their author future day over system. Manager possible guess individual.', '2024-03-10 07:48:53'),
(117, 12, 'Letter enough specific serve word customer.', 'Board expert best local stay. Join collection happen.\nExpect north just indeed. Unit floor black organization expert appear little. Everybody else body focus.', '2024-03-04 12:37:36'),
(118, 15, 'Guy information line economic.', 'Yet question coach box increase resource compare. Report general able summer. Network he stock treatment statement per.', '2024-03-10 00:58:08'),
(119, 7, 'Me indeed product sure.', 'Paper receive thing boy or fine computer. Control son stuff race thought need face game.\nOfficer good husband wind catch. Treatment matter visit real call billion.', '2024-03-20 13:02:06'),
(120, 20, 'Space sport eight sometimes policy sister particular.', 'Movement week Mr box list page glass. Former fund federal teach former sure beat parent. Current region identify the.\nCommon explain decide audience such. Career most throughout ask enough.', '2024-03-09 01:45:40'),
(121, 20, 'Start baby me usually.', 'Benefit capital scene enter for. Find personal office meeting receive person. Society Republican operation fine sit only professor. Within understand charge along pull financial arrive.', '2024-03-25 20:35:26'),
(122, 8, 'Military next forward test follow pay child.', 'Degree during position inside suddenly opportunity. Buy and plan we door. Bring address pass such friend lead scientist. Science guy brother.', '2024-03-05 07:09:18'),
(123, 9, 'Rate bar your generation wonder concern ability.', 'Free cell watch part hand thank machine enter. Network structure there much treat.\nProve serious floor report. Box attack green door six away.', '2024-03-20 00:28:02'),
(124, 22, 'South water family ask easy.', 'Create hand might discuss brother upon main. Discover manage one establish television at sea.\nSave professional quite once day bank notice.', '2024-03-17 06:06:06'),
(125, 21, 'Finally performance white including.', 'Voice why near onto reach. Season us anyone brother they field manager.\nJust but down beautiful power however goal indeed. Hour word which leg similar choose. Learn property pick condition.', '2024-03-21 23:40:12'),
(126, 8, 'White sometimes player good among.', 'Senior nearly through. Feel attention under travel once plant.\nSomebody want responsibility single. Customer skill record institution prevent civil. Kid occur five nothing whom born wear.', '2024-03-18 18:34:02'),
(127, 6, 'Tv accept amount mouth message before.', 'Sell treat degree able.\nGuy want open better poor over good contain. Hotel term themselves or bed. Program either practice see test particular dog. Figure pick can charge whose off cold such.', '2024-03-14 21:51:35'),
(128, 5, 'Center sit never these very.', 'Item while figure few. Wish cell easy evening under he. Subject us pay eight last street trial.\nPull somebody audience daughter politics must concern. Particularly baby wind group rich condition day.', '2024-03-19 14:39:28'),
(129, 9, 'Responsibility cell according kind money.', 'Responsibility back hand heavy general center blood or. School series something make impact can Republican case. Sometimes what manager or necessary price yourself.', '2024-03-03 08:15:34'),
(130, 27, 'Fact process lose by case their cause.', 'Source respond friend middle scene property. Specific trouble environment change central. Test go research especially manage nothing.', '2024-03-10 11:57:46'),
(131, 18, 'Necessary most add best raise guy box participant.', 'Benefit us increase team cost herself everyone. Set prevent yet cold nearly customer.\nCheck you discussion.\nWant traditional computer through many since say. Change since someone floor.', '2024-03-05 02:01:33'),
(132, 11, 'Force condition as water.', 'Direction mind director recently start affect current. Best note room someone provide.\nUsually baby pressure bank reduce act do. Tell small father impact thing second.', '2024-03-15 18:09:58'),
(133, 27, 'Recognize ago since fly public tend or.', 'Cost himself relationship your ready.', '2024-03-20 20:02:20'),
(134, 13, 'Trial government civil.', 'Medical trip personal quite morning. Onto consider name line must Congress.\nLate once team just reason game trip. Into community history ready.', '2024-03-16 02:08:42'),
(135, 14, 'Represent realize morning technology until difference town.', 'Choice talk listen how return. Anyone government person month mission music understand hold.\nNewspaper culture him in store. Experience work significant mouth life many.', '2024-03-20 01:32:13'),
(136, 2, 'Over control worry city bring big.', 'Deal mention although want produce. Away democratic feel different.\nRequire best bit old occur down worker. Thing tell eat nice leg quickly.', '2024-03-22 07:25:30'),
(137, 25, 'Hold special better production probably draw general less.', 'Tv inside physical attorney conference name. Provide concern age information generation moment you.', '2024-03-04 23:04:26'),
(138, 1, 'Social method research home live stock born information.', 'Though machine election effort.\nCreate bed husband hope eat.\nBehind organization far call hair executive. Player person each fire I. Interesting would realize early there employee history.', '2024-03-13 21:19:10'),
(139, 20, 'Walk section year several organization trouble drop.', 'Member film return continue. Lot speech major girl Mr possible particular.', '2024-03-03 10:38:24'),
(140, 5, 'Friend after serve large.', 'Certainly represent know member. Raise past throw strong off.\nGet report education surface. During usually cup mother this source fine face.', '2024-03-11 05:34:40'),
(141, 27, 'Happy visit performance year others true character.', 'Dream room speech professor hear. Show name year population Congress study prove.\nMessage which rise gas begin point. There activity despite daughter. Way drive them should during leave national.', '2024-03-15 23:47:45'),
(142, 27, 'Pattern positive fly contain summer strategy.', 'Thing ball name thus anyone college. Yes quite involve reason yet. Itself whom staff team memory foot director.', '2024-03-20 03:51:38'),
(143, 26, 'Wife sound within trip but should simply.', 'Theory think always science poor word. Seven day together cause wife various. World view speech Democrat work.\nDiscuss particular personal from message.', '2024-03-14 21:44:47'),
(144, 16, 'All teacher early already.', 'Trouble window head want. Attack determine stage before. Positive myself each treatment wind notice professor.', '2024-03-24 03:19:27'),
(145, 4, 'Agree national performance most look.', 'Thing respond human American him man. These travel campaign decision health.\nArticle need pay decade remain. Side center grow give. Teacher couple animal before win cost tonight listen.', '2024-03-18 05:32:43'),
(146, 29, 'Sport consumer determine despite sell room remember energy.', 'Security arm law situation when. Likely response window across us group.\nTable fund the market without. Chair raise decade wall. Little find professional sister. Less me between space agree sea.', '2024-03-17 09:40:04'),
(147, 13, 'Foot cell and quite.', 'Country attention dog capital natural yet.\nFine use already development option include. Name worker hold before ability. Fight and eye woman. Number information thank.', '2024-03-14 04:54:19'),
(148, 10, 'All political pressure page such today central lot.', 'Tonight cup might like myself machine yourself. Small him low far glass purpose agree. Might upon inside something establish art.', '2024-03-01 05:57:17'),
(149, 8, 'Man effort build challenge next important modern.', 'Together week research. Talk red between interesting care himself rock.\nQuite fine focus born traditional front. Recent who campaign still unit.', '2024-03-24 11:55:48'),
(150, 10, 'Where near if deep.', 'City church believe health. Sound seek record office training ability share administration. They clearly avoid bit.\nMiddle forget figure also. Card product accept small attorney analysis.', '2024-03-14 01:21:01'),
(151, 24, 'Week assume environment argue open physical.', 'Soon grow know by order music protect. Box project side increase information south certain consumer.', '2024-03-24 16:51:08'),
(152, 2, 'Other card reflect allow.', 'Least long tax worry travel. Hope beyond for parent skin.', '2024-03-13 23:42:16'),
(153, 29, 'None short quickly whose your base class nation.', 'Truth since herself. Practice parent knowledge its seem. Film federal piece need. Finally throughout present institution project us.', '2024-03-17 06:45:36'),
(154, 15, 'Bring surface visit arrive around.', 'Want team support outside. Less piece person increase. Total group share society.\nDecision listen traditional rock address rest up. Him on off executive huge social. Start be yet fish.', '2024-03-17 23:51:30'),
(155, 20, 'Hold firm very claim reason American.', 'Beyond personal might major together report. Anyone final personal whose. Room section left human tree leg.\nSituation those response part. Many just military pretty.', '2024-03-09 16:24:22'),
(156, 24, 'Tree personal since that.', 'Anything street feeling population social. Close knowledge party enter measure attention. Finally win check focus draw.\nMusic factor sing executive painting. Campaign court build into.', '2024-03-16 02:18:34'),
(157, 30, 'While human car sea account.', 'Republican case establish require hard require your increase. System indicate physical time cost dream success laugh.', '2024-03-25 05:15:19'),
(158, 16, 'Management Democrat interview discuss letter.', 'Effort interest watch little interest. Speech task teacher ask important herself guy. Commercial purpose go night.\nCompany sure senior option technology reason. Remember fine family.', '2024-03-01 03:40:24'),
(159, 21, 'Join price letter check former state any ball.', 'Land whom despite page drop raise plan. Area and condition small knowledge no. Continue sport that sign along.', '2024-03-04 12:45:06'),
(160, 26, 'Beautiful final what team property.', 'Civil fire close person. Off notice too try continue well memory just. Your thought industry property president. War figure ready.', '2024-03-05 21:49:03'),
(161, 8, 'Speech hope lead sell trip.', 'To name time send born. Material before father lay area though than.\nRespond site us. Image because machine else analysis conference station issue.', '2024-04-09 14:39:52'),
(162, 21, 'Recently production like support.', 'Several ball head section soldier ask newspaper. Perform movie it sound perform out site natural.\nAccording hear that recent. Dark thus well memory resource role feel meeting.', '2024-04-13 15:12:52'),
(163, 21, 'Letter various mean reach.', 'Realize cost man truth. Goal so sense out make. Value next any meet under other different.\nAdult charge rise. Service school star sure unit something hard prepare. Someone late big state individual.', '2024-04-17 00:16:29'),
(164, 11, 'Mr nice end road fast something.', 'Trouble those bill key job population president. Others control his thousand like it.\nStaff number treatment not statement along for. Until think hotel. Buy fine sense traditional approach model.', '2024-04-27 00:23:35'),
(165, 22, 'At use stock beyond.', 'Head there wind help grow hand. Medical professor difficult size low. Almost eat west Republican source fine success.', '2024-04-18 22:13:19'),
(166, 16, 'Clearly evidence direction political gas.', 'Memory himself your north relationship. Structure image husband great black. In mention feel during. Three establish fact trade.', '2024-04-08 00:25:28'),
(167, 12, 'Candidate my into two debate.', 'Stuff million prove improve. Board then order peace must street. Federal inside figure step perhaps six.', '2024-04-26 07:14:08'),
(168, 14, 'Provide put wear peace name action light.', 'Fly laugh peace create game increase concern. So body former listen.\nReach land beyond allow sing. Address real cell over that door. Statement green more account where.', '2024-04-26 04:41:40'),
(169, 1, 'Husband strong another indicate at.', 'Development people point campaign able rock. At back perform couple positive none.', '2024-04-11 13:30:21'),
(170, 24, 'Provide bring with avoid career medical.', 'Firm probably war simple.', '2024-04-24 05:08:05'),
(171, 26, 'Number yourself staff stuff fund.', 'Whom model job cause inside. Rather decide hold interview choice.\nStay truth firm area before.', '2024-04-17 20:00:01'),
(172, 29, 'Movement each conference one oil.', 'Heavy member question oil.\nEdge about every message.\nConsumer number family start. Late those reason foreign.\nContinue talk reduce. Toward power article pass provide political.', '2024-04-20 12:18:40'),
(173, 7, 'Form buy especially.', 'Reduce personal star service indeed against. Blue different pull than. People attack hit discuss bag who attack stuff.\nOften herself choose small. Music former change without.', '2024-04-06 09:09:04'),
(174, 7, 'Conference travel end left response yet despite.', 'Character evening camera you guy report phone position. May majority candidate rich deal mind. Leave in reason of dream effect.\nWater official TV half spend notice.', '2024-04-25 02:07:23'),
(175, 14, 'Remember sure kid put.', 'Court but wish either blue. Happy term value.\nRecord phone sea especially much man growth fast. Pull simple real tax include finally believe. Technology with while yet.', '2024-04-08 01:19:06'),
(176, 16, 'Large difficult truth summer grow exist sense when.', 'School say drop my short. Hope run sign data school another.\nCongress magazine Republican sense soldier. Popular every similar technology another anything. Watch especially public small.', '2024-04-15 14:40:43'),
(177, 10, 'Through foreign speech like we.', 'Lawyer Mrs head western computer car. Especially avoid result source.\nCourse resource entire box staff box from. Book eat sea able course better throughout.', '2024-04-28 12:56:22'),
(178, 30, 'Plant company yes Mrs while season life list.', 'Major drive media check. Seven learn green country Mrs away.\nImpact between peace usually care future throw. They myself through detail.', '2024-04-24 13:36:53'),
(179, 28, 'Inside phone raise service want cup full.', 'Fly TV finish city experience author affect. Million wall example drug foreign little off. Senior east senior common president often.', '2024-04-15 21:45:33'),
(180, 20, 'Over go college generation.', 'Can skin of someone eight friend action degree. Standard must speech movie cost.\nOver project course simple play. Because always political. Plan about prepare effort resource.', '2024-04-15 14:00:02'),
(181, 17, 'Build right day be.', 'Here these beat case movement.\nCommunity story hospital which box yard too. Assume member kitchen its Mrs.\nLater market court him book society. Left power style.', '2024-04-17 19:21:34'),
(182, 25, 'President specific less bag event most attorney meet.', 'Piece design card remember debate all my. Show red nation final culture including read. Most American garden raise order upon.', '2024-04-08 01:22:24'),
(183, 12, 'Oil lot computer which economic above.', 'Food crime ahead others movement decade. Half feeling performance care.\nGo raise cost if. Human wonder season anything coach especially. Include indicate movie only its prevent.', '2024-04-16 08:48:56'),
(184, 16, 'Wall worry sound now special.', 'Daughter wonder building data major. Sport ok foreign reason try figure various.', '2024-04-02 16:15:28'),
(185, 15, 'Class call stage.', 'Agent old loss want local. Political wide generation side without eight tell. Campaign subject fill wait several movie why special.', '2024-04-15 05:04:27'),
(186, 24, 'Cold sure available reality.', 'Wait chance walk media coach paper. Wish hit court. Station including war car. Exist natural maybe.\nThan provide away music decade building. Walk yeah doctor important rock.', '2024-04-04 13:49:44'),
(187, 17, 'Despite move just type save position.', 'Last near economic that defense. Health feeling hit suggest there resource many whom.\nBase always citizen kid value watch. Add community wrong. Without keep list case.', '2024-04-27 17:33:11'),
(188, 12, 'Fire believe place begin citizen region interview.', 'Vote brother hold. Thousand as table none including.\nMiddle move station. Top bring design medical other. Tell method property year.\nOpen ago half live. Hundred number move law personal organization.', '2024-04-22 11:20:30'),
(189, 8, 'Begin yes leg if shoulder.', 'What allow talk score expert. Mouth here fine career. Quality technology head region.', '2024-04-28 09:05:30'),
(190, 1, 'Hand cell camera action decade.', 'Spend task parent research find too that. School too land.\nHeavy fire trouble player. Source child company successful. Attention surface control while.', '2024-04-25 00:59:40'),
(191, 14, 'Strong my officer onto hotel but against.', 'Plan benefit ground reflect politics we. Thought service hit method music animal.\nExpert other future family build full generation. Develop man always black.', '2024-04-04 23:16:12'),
(192, 6, 'Their speak beat.', 'Increase career management agent far. One school as turn participant network experience personal.', '2024-04-05 22:45:54'),
(193, 18, 'Deal air baby matter.', 'Human stop seek despite worker knowledge court. Picture image need financial your. Despite region human several three conference cover.', '2024-04-04 11:18:42'),
(194, 12, 'Enjoy power else will across loss.', 'She ask owner travel item center. Stock age whom bed writer plan. Study summer agreement support.', '2024-04-04 06:20:34'),
(195, 5, 'Maybe daughter step write hard ahead religious.', 'May measure for begin think drug. Heavy talk always threat data visit. Radio own Congress necessary appear.', '2024-04-04 09:50:40'),
(196, 20, 'Choose bill realize line administration member.', 'Far democratic organization tell agreement anyone expect woman. Much hit yeah within ok agent there. Glass price red place.', '2024-04-28 16:08:48'),
(197, 22, 'Research worry mind project.', 'These save analysis after store idea her. Contain stage determine much popular reveal. Value without produce political knowledge Mr.\nForward image happen agree woman. Hour second one mind.', '2024-04-15 22:51:46'),
(198, 19, 'Fear early consumer democratic learn discussion evening.', 'Poor size them different.\nWill they despite buy.\nMedia animal enter in they. Cup physical others fear decide home. Ready any he trouble where deep idea people.', '2024-04-17 08:32:14'),
(199, 30, 'Decide do notice.', 'Throw few type game. Woman ago along student try close which as.\nStandard sport according area sport available form. Those instead pull production leg.', '2024-04-11 08:22:39'),
(200, 3, 'Now language husband for story sort.', 'School talk body spring argue. Arrive several that dream short your choose. Image evening early area. Just onto hand soon bank fly loss.', '2024-04-12 22:05:37'),
(201, 14, 'Pass certainly war despite foreign.', 'Real door sing attack condition specific rise. Through trade hour. Manager during report sign.\nNext human treatment provide. Institution exist my number help gun. Instead election million.', '2024-04-02 06:30:33'),
(202, 30, 'Upon pass unit reduce mouth.', 'Size project draw then executive thus. Its specific newspaper. Effect name fill use especially member.', '2024-04-03 22:19:58'),
(203, 16, 'Along play carry story only whole summer.', 'Speak off ok wear.\nJust talk lead respond. Glass protect street pass save. Player foreign less year of cost strategy.\nHere too be the modern front.', '2024-04-28 02:07:41'),
(204, 20, 'He tax make feeling return mother current.', 'On budget anything lay different receive. Part exist team close push physical kid accept. Develop laugh ball hope body task activity small. My among market skill decade protect.', '2024-04-04 18:39:59'),
(205, 24, 'Say color animal performance join necessary.', 'Wide commercial career part responsibility remember. Choice daughter me every look official current. Item environmental reason remain room recent want often.', '2024-04-21 01:48:33'),
(206, 28, 'Sign subject training fire yet head citizen.', 'Lawyer behavior candidate teacher guy war eat. Region bad himself artist question score benefit.', '2024-04-13 12:21:09'),
(207, 9, 'Education green policy field society with.', 'Explain figure cost door indeed part. Style institution same five discover administration. Change something ground candidate.', '2024-04-15 00:37:05'),
(208, 20, 'Especially cover our.', 'Gas president strategy summer make research. Book as still year everyone. Wife blue kind behavior.', '2024-04-20 10:22:13'),
(209, 11, 'Least clearly short.', 'Lead his under red research model about billion. Painting recently director alone home prepare.', '2024-04-04 05:23:41'),
(210, 24, 'Measure operation politics.', 'Leader conference then reflect better certain. Join professional specific feel my family. Improve easy feeling help good special purpose.\nMajor now everybody total western. Evidence finally among.', '2024-04-25 09:52:05'),
(211, 26, 'Best military your front.', 'Room daughter sit like. Chance experience either enough. Different week staff yeah future.\nGive everything professional bring Mrs think fear.', '2024-05-14 09:42:33'),
(212, 28, 'Pass meeting make accept right discuss.', 'Unit back life a help. Best major dream of receive relate performance.\nDaughter identify executive Democrat too education financial. Onto animal eat some heavy establish.', '2024-05-26 21:58:17'),
(213, 2, 'Sense on card strategy cause pass sort.', 'Certainly eight pattern different interest. Talk mother interview take follow perform final.\nData would some office recently might although. Newspaper bag true offer ok sell employee.', '2024-05-18 13:58:58'),
(214, 15, 'Candidate somebody risk season might develop.', 'Theory while scene think among mind condition site. Wife least key entire sport.\nDirector ok while east travel imagine. During value despite realize economy case. Have strategy along civil.', '2024-05-26 04:33:47'),
(215, 8, 'Forget bad economy mission way south decision.', 'Charge decision rather. Truth from war live.\nRadio him close reflect spend morning grow. Find fill customer herself future media. Carry strategy activity foot.', '2024-05-24 09:50:49'),
(216, 27, 'Agent safe officer north our foreign about.', 'Economy wear not mention.\nHuman management agree poor position seven throughout. Ahead others student investment fast identify program. Continue leave grow rule positive play. No job girl it price.', '2024-05-28 18:53:10'),
(217, 20, 'Idea ago trial seek.', 'Above turn difficult from whom team watch. Return agree guess.\nState describe evidence individual society mind not agreement. Picture citizen upon fight report if two want.', '2024-05-26 16:22:14'),
(218, 17, 'Trade already office bill result.', 'Shake agent since suggest here.\nHappy recognize plant this Mr. Successful factor difficult throughout hit. Book speech cost human leave.', '2024-05-14 04:53:35'),
(219, 26, 'Camera site could far type feeling.', 'Sing question himself bring power. Parent party people goal important course. We brother once role finish though.\nSense mission door. Image since individual child since last.', '2024-05-16 17:50:36'),
(220, 17, 'Audience statement onto hand development action man.', 'Require street assume own improve. Employee red medical environment us general sort remain. Language their she deep agreement join whatever stage.', '2024-05-26 16:08:24'),
(221, 8, 'Piece its lawyer vote voice apply happy.', 'Billion attack according everybody most office source. Candidate under other coach reality.', '2024-05-18 11:27:31'),
(222, 17, 'Color environment paper lawyer heart.', 'Father human though series around. Both wind clearly society reveal billion north phone. Record process enough.', '2024-05-16 13:10:57'),
(223, 1, 'Million decision production result nothing.', 'Doctor student western. Develop approach meeting close long specific bed. True real time turn life.\nCommunity become public realize. Benefit choose toward hear relate project.', '2024-05-26 01:07:27'),
(224, 12, 'Vote apply country window section act expert.', 'Central how out speak trip. Boy hot economic oil age there.\nForeign eight participant party whatever whom sell address. Rock those face put. East necessary find dinner course.', '2024-05-08 02:10:31'),
(225, 26, 'Baby nation strategy build whom find stay.', 'Sell form apply environment degree allow be. Between magazine understand current. Relationship policy director leg miss newspaper.', '2024-05-27 00:39:51'),
(226, 4, 'Offer mission yard five.', 'Although especially performance region upon talk clear. Clearly policy everything dream its cover case. Fact practice modern rise war attention necessary.', '2024-05-17 22:50:04'),
(227, 3, 'Fear smile skin when key return vote writer.', 'Environmental win they everyone drop building. Commercial something address age evening of collection.', '2024-05-20 09:14:03'),
(228, 30, 'Contain area eye model score ground.', 'Response situation thank green news different between six. Throughout option discover book difficult miss. Debate fight nearly art.', '2024-05-14 08:49:32'),
(229, 24, 'Us window community lay ready.', 'Turn kitchen picture sell fill accept. Red mouth not better eight somebody. Support law suffer own.', '2024-05-24 08:29:35'),
(230, 27, 'To shoulder real.', 'Realize range building message. Community technology team each wall professional past meeting.\nSell your current happen. Conference difference institution office.', '2024-05-14 03:38:15'),
(231, 1, 'Tax field record tend high.', 'State business dog daughter talk. Of energy forward movement about skin. Discuss light kind.\nFrom board morning whole. Society offer trouble. Quite participant lead pretty specific before management.', '2024-05-06 04:39:19'),
(232, 16, 'Fast unit onto fine work resource never.', 'Join them after role main. Knowledge game task act. Else very film see summer represent fly.\nReady management market number quickly blue positive television. Significant rate hand hotel full within.', '2024-05-19 01:53:19'),
(233, 18, 'Action bag well deal value.', 'Particularly especially direction whose.\nTough after store threat. Put ever statement event.\nRequire official rock form. Mention ready make social section. Draw beyond her form center smile.', '2024-05-23 18:21:57'),
(234, 8, 'Wall professor prove feel say these official.', 'Marriage will fear. Determine theory along around everyone history. Or speech require will.', '2024-05-01 06:08:22'),
(235, 17, 'Fish consider adult.', 'Team rule bar pattern attention population. Leave speak wall health you road many.\nVarious wide threat treat property. Among film involve sense theory seek.', '2024-05-13 05:10:56');
INSERT INTO `kunjungan` (`id`, `id_tamu`, `kepentingan`, `Catatan`, `tgl_input`) VALUES
(236, 1, 'Good class certainly admit from thank single.', 'Design culture treatment quickly audience.\nSkill create type instead mention. Choice rather method bed poor other manager. When art fly drop.', '2024-05-12 01:21:01'),
(237, 15, 'Act stock lay court risk upon because.', 'Single letter individual remain they since. Though edge point whom shoulder.', '2024-05-24 11:36:37'),
(238, 9, 'They available generation feeling marriage yourself night live.', 'Above newspaper owner deal bank final choice.\nCompare soldier someone. Important bad will arrive source film remain. Guess there matter water heart region. Support tough window every structure trial.', '2024-05-17 15:23:08'),
(239, 30, 'Population anyone we.', 'Control deal concern employee beautiful talk talk. Agency artist economic if anyone.\nSuccess power line. Sister feeling food address explain some range lot. Father job receive.', '2024-05-18 05:22:10'),
(240, 2, 'Nearly between identify method such training.', 'Whatever network know training language. Small soon drive our like capital ever. Close air and focus usually weight poor.', '2024-05-01 13:53:55'),
(241, 12, 'Provide inside lay many cause.', 'Bank term safe few. Physical ready ok form south attack will say.\nFeeling guess create than blood. No matter size television. Entire machine bit get wall.', '2024-05-08 21:16:29'),
(242, 20, 'Financial its class call.', 'Different stay toward agreement deep. Born site field last care.\nFree third attack loss everything that.\nInstitution lot must seek. Course beautiful difficult card different cut.', '2024-05-05 14:42:22'),
(243, 6, 'Able reason will hear position language also.', 'Former discuss operation board skill real six. Just lay crime resource science hard. Rate can yet.', '2024-05-17 08:12:31'),
(244, 29, 'Ago man fly knowledge first country common.', 'Only impact hair chance. Treat indeed strategy back blood wonder.\nBank law far call later once third. Effect charge these relationship.', '2024-05-18 21:53:05'),
(245, 7, 'Others allow feeling position all stop rock husband.', 'Tax she other city. Would analysis government word coach. Role late administration industry.\nAnyone choice heavy black series family.', '2024-05-25 20:11:53'),
(246, 6, 'Week central goal production.', 'Certain wife development return everything. Newspaper total real official debate manage information become.\nReally commercial list hit money. Drug each look pay guess college.', '2024-05-09 01:46:13'),
(247, 10, 'Clear nearly foreign order home party.', 'Section radio anyone area part. Seven effect leg fear two share. Else level approach receive seven.', '2024-05-03 20:24:35'),
(248, 30, 'Through side story prevent arm get.', 'Design with still allow.\nAllow plan stay authority sing husband. Senior still west member party identify. Increase lawyer trouble require both. Step already people me thing memory cultural.', '2024-05-07 10:36:21'),
(249, 1, 'Gun rise view stay price activity.', 'Policy hard citizen fund age. Note finish development. Quickly might who a dream professional seem where. Nothing mother under last also southern local.', '2024-05-06 17:44:26'),
(250, 3, 'Affect different yourself meeting large find.', 'Mission rule art dark open.\nTeacher officer I successful this two. Drop experience rule pattern. Cause trouble stock crime others life.', '2024-05-03 04:29:26'),
(251, 12, 'Report outside must beyond little moment.', 'Who even ago new economic. Involve maintain skill add. Resource trial toward forget party.\nIndividual member the deal member until. Color send within machine once security word region.', '2024-05-14 16:52:34'),
(252, 21, 'Light debate interesting election recognize.', 'Social mean social official house edge. Name since time expect interesting main.', '2024-05-23 13:46:35'),
(253, 10, 'Include process together less arm middle expert wonder.', 'Leave alone social toward wonder cell read. Goal study result subject between exactly turn. Worker to quality adult.', '2024-05-28 17:29:41'),
(254, 15, 'Bank research event mission focus.', 'And necessary into he bar training clearly. Civil you point medical always.\nClaim already type keep benefit collection. Nature financial set spend. Avoid already beat later southern whole.', '2024-05-21 10:19:34'),
(255, 16, 'Film decision from nature window.', 'Happen partner early. Yes past we explain win. Fly final me several role.\nAir which minute.\nNotice meeting film result eat cell.', '2024-05-09 22:37:34'),
(256, 2, 'Key focus lose trade.', 'Expect rock become. Sit article week. Ever simply senior a argue.\nFree in if. Federal of trial body ahead education.', '2024-05-01 09:28:50'),
(257, 23, 'Past for generation agent ago simply.', 'Science anyone choose once shoulder artist yes. Fast individual reach baby standard. Exist PM understand hair nearly lose member. Raise teach hit nor bit own very.', '2024-05-07 12:15:41'),
(258, 18, 'Show half career also under.', 'Ball size election mean put city idea. Happen join source provide true. Line cell particular. Road style adult professor.', '2024-05-07 09:42:59'),
(259, 22, 'Firm character day health method.', 'Close less discussion camera where air seat. Talk building ok certain sort deal.\nReality everyone hard anyone. Avoid resource treat message policy. Board brother stop.', '2024-05-20 02:52:28'),
(260, 24, 'Around bar significant particular picture.', 'Ready house attack modern hair. Realize population strategy couple.\nStage crime end despite enter national. Attention government parent dream.', '2024-05-07 11:33:51'),
(261, 24, 'Fire sign show school themselves.', 'Seek ahead hand manager word over situation. Visit paper director. Law either name thing Mrs indeed.', '2024-06-10 23:30:24'),
(262, 16, 'Loss write want forget director institution know.', 'Notice discuss all receive. Bar air lay. Other leader common instead.\nCharge population hotel few structure professional finally probably.', '2024-06-15 05:25:55'),
(263, 7, 'Speech public mother buy western increase half.', 'Activity simply run special today. Include project today ready attorney century.\nOthers across security all yard both. Huge who special beyond occur leg.', '2024-06-19 05:11:28'),
(264, 19, 'Claim I quite or.', 'Finally morning clearly story. Series discuss reduce necessary enough local.\nDirector item yet three. Successful tend heart party authority travel area whole.', '2024-06-01 01:58:31'),
(265, 12, 'Game management senior suddenly new your.', 'Usually region now inside. Build up white Congress. Support question power later significant.', '2024-06-23 10:38:10'),
(266, 4, 'Forward fear generation.', 'Indicate early nation pattern. In poor leg avoid. Appear today challenge suffer address.\nDo too manager plan side very resource pressure. Like behind memory management us.', '2024-06-14 17:16:21'),
(267, 13, 'Class same girl example of.', 'During building national ok another total teacher. Develop recognize he school play significant carry structure. Law PM then present ask it.', '2024-06-26 12:49:41'),
(268, 22, 'Use senior serious cause but.', 'Agreement fast value administration beat clearly. Wear fine memory discuss day. Certain stay fill drive.', '2024-06-03 03:03:57'),
(269, 11, 'We recently task both cell crime nothing.', 'Eight respond position risk brother. Across road long how before medical word.\nSerious prevent well door.\nCommon hundred probably. Toward key avoid room into. Because stuff hand worry chair public.', '2024-06-20 01:52:04'),
(270, 19, 'Ahead his education key brother place during allow.', 'Peace turn fill executive local not large person.\nEver against guy career only myself might huge. Sport quality service. Rise ability attorney a.', '2024-06-24 17:15:29'),
(271, 3, 'Window my fight down.', 'Bring ok process wide occur less him. Throughout news evidence.\nWho imagine manager even nothing fill. Ten his society pull security. Down weight special stand eat reveal air.', '2024-06-26 10:19:38'),
(272, 15, 'Message tree allow better individual season hear.', 'Partner they send speech these. Everyone group attorney movement turn company.\nOur increase key place space. Miss maybe particularly former develop sea help.', '2024-06-02 20:01:04'),
(273, 7, 'Onto mind staff various day instead make.', 'Pick anyone what different beautiful quite data. Fight head make among. Describe decade field operation network seat.\nHe power market here. Send that serve loss check those election.', '2024-06-10 01:30:43'),
(274, 21, 'Television stay positive fall knowledge.', 'Use would scientist lead thus Republican well.\nAgainst book star teach involve who hour. Now significant serve entire they market. Public player short challenge show notice ten.', '2024-06-23 15:48:13'),
(275, 21, 'Car court final customer foreign bag team.', 'Mother rule red hand to though. Quite stand professional card wide set. Rate away need interview choice collection west.', '2024-06-21 19:58:01'),
(276, 11, 'Conference charge where house term.', 'Consider box store challenge way of everything. Body fill third scientist last dinner into wall. Seven agency soon she space. Natural industry character develop together.', '2024-06-27 07:01:35'),
(277, 21, 'Little how live base.', 'Science order decision recognize. Need anything finally buy. Tend third stock performance week physical exactly. Summer responsibility far federal size.', '2024-06-17 08:31:57'),
(278, 14, 'Late today enjoy no today.', 'Traditional be drug night old federal often politics. Board eye blood economic company technology goal school. Hit hear avoid.\nBox expect force himself indeed score fight.', '2024-06-08 17:11:47'),
(279, 4, 'Paper edge mind source.', 'Call me share show effect pressure. Dinner station mind day research conference later.\nTraditional support yeah professor. Gas challenge war these resource hope.', '2024-06-21 20:05:51'),
(280, 8, 'Economy agent yard agency reflect available window former.', 'Debate easy instead manage stage artist small. Kid big agree research address class. Many exactly create light assume.', '2024-06-27 10:03:24'),
(281, 30, 'Within how state buy just short majority state.', 'Authority night behavior. Detail night single peace item easy.\nBlue receive agree. Sport buy involve save.\nDifferent pressure truth stock decision. Any others its book add education kid.', '2024-06-13 17:42:18'),
(282, 3, 'Medical brother including.', 'National worry activity design prepare. Item charge television ask lay job local. World get exist old follow interview. Drive attack positive movie pay.', '2024-06-06 03:45:10'),
(283, 15, 'Authority civil compare property account account.', 'Population something significant writer word. Staff yeah wind wife woman already.\nProgram carry almost seat mother. Close she move within bed fear.', '2024-06-03 21:46:53'),
(284, 4, 'Training government individual hotel despite always.', 'Trouble end choice agency opportunity help agent. Between once development west thousand media set. Significant tough cup what lead million any.', '2024-06-10 10:29:37'),
(285, 7, 'Blood purpose deal it.', 'Security amount song article attack fall property.\nBudget decision social. Sport around claim while.', '2024-06-08 02:58:43'),
(286, 21, 'Firm though worker new.', 'General activity couple attack. Eight nor dinner economic customer movement military today. Language simply record dark scientist.', '2024-06-22 14:57:38'),
(287, 24, 'Party how note.', 'Apply example bar still certainly person detail. Thus practice deep lead bank matter.', '2024-06-02 01:53:17'),
(288, 28, 'Campaign yeah hot current skin will trade.', 'Performance scene rock prove. Now live religious state.\nNo shoulder magazine trade these last sort. Ball player power across guy sign take. New table program.', '2024-06-04 01:11:36'),
(289, 6, 'Doctor outside lose.', 'Ever alone whole class lead specific game. Firm fight experience threat surface turn edge. Thought pay power month region.', '2024-06-09 23:05:41'),
(290, 8, 'Bit tend remember.', 'Technology box film threat help. Act yourself economy material. Attention scene method clearly pay.', '2024-06-11 14:04:34'),
(291, 19, 'Success worker house listen democratic along.', 'Protect spend black recognize production right occur ok. Thank road relate.\nSoldier language old out threat huge.', '2024-06-20 05:23:23'),
(292, 11, 'Win author discussion especially tree so.', 'Hot father school green family decade. Group try beautiful question.', '2024-06-12 10:07:01'),
(293, 26, 'Different true social company among two beyond.', 'Whole down of civil ability. Teacher number always network. To same work person room carry personal itself.', '2024-06-24 12:14:03'),
(294, 9, 'Six describe bit help quickly.', 'Cause investment mention many describe.\nAdult various approach decide. These town into sign future agreement listen task.\nFather price too threat factor. Hold break matter challenge forward.', '2024-06-06 18:33:50'),
(295, 27, 'Give fear produce top.', 'Far should book cost quality per result. Base father turn glass economy no bag. Strategy east happy party level according wife.', '2024-06-23 07:03:34'),
(296, 15, 'Change because never attention.', 'Very professor manage question class. City drop drug fall ability final. Expert personal night look question successful.', '2024-06-06 23:35:43'),
(297, 24, 'Hair fact conference sometimes future surface.', 'Case style style modern. Above candidate this strategy fall.\nRace lawyer most land. Model area describe industry nothing management month. Memory dinner policy.', '2024-06-14 22:33:17'),
(298, 14, 'Meet few various much west them.', 'Floor away mission adult. Deep keep organization pick late east. Design family tough must admit executive know from.', '2024-06-16 13:03:29'),
(299, 28, 'Everyone animal those tough you water system.', 'Together hear she unit. Home true Congress whether address major five.\nDay information top last training win. Itself value seek. Student no recent woman focus such.', '2024-06-25 11:46:07'),
(300, 6, 'Door contain fight say ground hear skin.', 'Best girl open tree knowledge. Short property production buy listen. Enjoy thank hundred less power.', '2024-06-16 00:42:46'),
(301, 7, 'Research performance position operation room sort.', 'Every any so goal industry pass nothing sound. Condition difference work police they speak forward. Some loss agency another.', '2024-06-24 00:38:54'),
(302, 17, 'Hour plant major save.', 'Maintain follow door subject. Fine check security population.\nGood reduce for certainly leader. Network actually language even. State around capital former despite training.', '2024-06-15 19:58:38'),
(303, 1, 'Fast white building discussion wife indeed.', 'Car stock employee walk. Long wrong may share economic. Apply offer region last church surface all key. Water give real less magazine.', '2024-06-06 05:59:59'),
(304, 17, 'Great itself reveal between provide she.', 'Because actually I statement society case American. Drop increase natural always.\nNext conference many end. Again market city total apply. Land allow yes produce service television.', '2024-06-09 20:06:56'),
(305, 18, 'Common serve under.', 'Voice agreement study to church. Wait sister in couple environment indeed laugh size. Go every yes behavior.', '2024-06-18 04:48:42'),
(306, 11, 'Probably enjoy clear society.', 'Watch address people side write. Well official face defense. Organization show collection floor citizen tree others.', '2024-06-26 00:44:49'),
(307, 1, 'Cut best kid go north camera company.', 'Successful worker speak phone we end. Position can behavior can.\nDebate mean with must on. You call free part. Compare most television case force thank nation.', '2024-06-16 16:02:05'),
(308, 2, 'Suffer yet would include ago mission.', 'Purpose wide party food course court dog. Including improve eat street pick despite hot. Dinner including interesting trouble check collection in perhaps.', '2024-06-09 14:06:14'),
(309, 4, 'Three because decision parent down.', 'Paper we real force war adult new. Without special education animal our their institution. Opportunity catch young personal even fund buy.', '2024-06-23 08:57:30'),
(310, 14, 'Investment already animal office teach.', 'Necessary if general size realize. Throughout student project campaign song bed. Move there traditional account over employee tough organization.\nBefore live hair save drop. Six hundred simply.', '2024-06-03 14:40:25'),
(311, 28, 'According natural sit partner east be seek.', 'Open value although own develop. Tell structure quality. Notice doctor response federal opportunity kitchen nothing movement.', '2024-07-07 10:11:24'),
(312, 9, 'Organization describe boy news save hard.', 'Beautiful clearly note poor. Five society from member many stand.\nNorth standard reduce way half. To task education rich standard begin.', '2024-07-22 16:42:39'),
(313, 22, 'Break stage hot remain prove outside I high.', 'American course step add. Less bed cultural play. Trouble market office beautiful tough find process number.', '2024-07-26 11:07:59'),
(314, 19, 'Common wind surface purpose name read send.', 'Onto official general structure. Spring glass box sister country line glass.\nTonight morning if seem as add. Culture something public rich. Cover debate time night western.', '2024-07-22 01:55:39'),
(315, 29, 'Bill different they list low month.', 'About skin past each price commercial eat. Key thus film rule way.', '2024-07-10 05:56:05'),
(316, 27, 'Network right customer like way front.', 'Apply focus foot. Former skin anyone base mean me. Night million out economy.\nAll both help task television back. Use thank rock speech a.', '2024-07-17 23:08:56'),
(317, 17, 'Article defense now Congress family sing.', 'Environmental southern himself and scene process media. Lay business prove suggest full.', '2024-07-05 11:59:24'),
(318, 6, 'Outside without figure south.', 'Stop address interesting organization or me miss. Nature kind hot her level realize.', '2024-07-21 18:21:21'),
(319, 7, 'I national need not finally.', 'Through read future second she future. Art network line onto project four pass.\nOften continue order adult. Benefit own final man.', '2024-07-03 22:12:37'),
(320, 19, 'Activity describe institution truth little include move response.', 'Difficult hit teach although increase. Order attorney world college although director.\nDrive table though really. Plan wind mention level might nature without.', '2024-07-11 06:00:19'),
(321, 11, 'Poor discussion billion around either meeting study range.', 'Old project attention time case police lawyer. Child hear focus.\nReligious heart by song message have. Their give base set price stuff day. Win majority attack claim.', '2024-07-12 23:22:35'),
(322, 28, 'Scene way speak table.', 'Describe clear room form sing.\nSomebody where age. Call worry hope.\nMoney expert dark.', '2024-07-09 23:58:44'),
(323, 15, 'Fact nearly effort piece nearly pressure.', 'Like control rock. They eye cold process wait.\nEdge total way attack that interest over upon.', '2024-07-12 19:21:52'),
(324, 22, 'Budget inside Republican everybody money.', 'Billion white alone production job car dark. Away buy establish will effort. Very almost thus black stay message if. Kid ready hold floor lead environment.', '2024-07-16 00:57:19'),
(325, 5, 'Box very open she account more.', 'Under discussion address message work part. Role style purpose simple over sure. Add will heart space.', '2024-07-18 23:34:52'),
(326, 20, 'Along cold check read physical fill example.', 'Relationship by film investment. Ready miss collection newspaper image from offer up.\nAnalysis want last believe. The design season resource upon teacher. Risk rest suddenly Congress old child.', '2024-07-28 08:07:13'),
(327, 21, 'Glass structure public send indeed image.', 'Own fear drug evening author season general senior.\nMusic moment about cost. Interview new southern else affect main military. Street property add effect.', '2024-07-22 04:58:04'),
(328, 16, 'Arrive administration beautiful herself yeah.', 'Drop understand effect do possible be. Rise bank professor herself economic art. Executive serve moment above morning focus up.', '2024-07-05 23:00:44'),
(329, 17, 'Number war arm military charge actually before.', 'Never wind family record part instead nothing. Green me many face challenge PM. Second party growth bad house.\nWait also her address understand.', '2024-07-03 02:43:03'),
(330, 7, 'Clear computer ground return view surface product.', 'Ability own wife that many. Tv local short training campaign. Forget on detail bit yourself.\nBusiness chair can all wind. Wish indeed end social.\nFloor first cover box our firm property.', '2024-07-22 18:17:32'),
(331, 11, 'Leg free travel either it history maintain.', 'Customer bad eight forward significant maybe. Stage later southern short idea rate.\nInclude smile event lead according staff hold stuff.', '2024-07-07 05:19:00'),
(332, 6, 'Performance test put lay computer figure state.', 'So different situation beyond yeah front area choose. Child hair audience against.', '2024-07-04 08:43:02'),
(333, 27, 'Develop goal while book concern.', 'In structure sister ever remain may.\nClass fish perform blue.\nReport two issue eight. Interview data there serious several wind bank. Including model short do rule research better.', '2024-07-11 06:49:28'),
(334, 26, 'Every energy field answer.', 'Provide despite human. Trade under movie popular best along save know. Wear foreign career prove probably.', '2024-07-22 20:40:32'),
(335, 18, 'Wide institution population after certain.', 'Notice concern board direction explain. List bit among local management large cell ahead. Actually forget with week building.', '2024-07-01 06:56:47'),
(336, 14, 'South nation west different church recognize finish.', 'Condition subject travel relate build suddenly necessary. Need from my become research card film.', '2024-07-18 03:49:14'),
(337, 12, 'But others memory always chance kitchen.', 'Might best movie human. Role throw crime important each market wait. Current learn short bag collection Democrat.', '2024-07-28 11:04:22'),
(338, 18, 'Which important Mr region.', 'Black eight wish get physical. Test player evidence feeling likely all smile. Happen never author discussion red staff TV indeed.', '2024-07-07 11:08:20'),
(339, 24, 'Ever green recognize really enough.', 'Poor happen charge edge. Public college energy thousand.\nBook success college kind some tree friend stage. Trouble language good until.', '2024-07-02 15:43:19'),
(340, 8, 'Concern myself soldier attack myself support.', 'Any our hard manager allow water.\nCultural science dog stuff. Talk over think form true point that.\nChance leg various late fight. Difference wait measure remember yes statement when yes.', '2024-07-09 20:01:25'),
(341, 24, 'Big level despite answer reason still factor.', 'First contain suggest apply affect. Environment American agreement meeting agree one. Suddenly policy reflect radio industry personal.', '2024-07-15 23:30:22'),
(342, 8, 'Mean language five spring attack mean none sometimes.', 'Day floor believe dark wife. They notice effect stop. But determine protect huge environment thing.\nEnough stand science what yet end. Policy his land involve.\nAnyone human really security pull.', '2024-07-12 02:21:05'),
(343, 28, 'Up industry service she.', 'Necessary record degree management certain. Five newspaper magazine system. Collection author door surface some weight.', '2024-07-25 04:14:13'),
(344, 23, 'Seek including too increase little television season.', 'Life similar machine writer difficult. Watch later because read fall long.\nSuddenly thing also short strong. Spend really leave turn civil speech.', '2024-07-22 15:34:25'),
(345, 3, 'Project design group stage notice.', 'Officer language peace too car. Decision parent animal pay price hospital. Talk style audience whom within agreement edge.\nKid anyone policy network lose. Add court turn son let administration even.', '2024-07-28 07:02:33'),
(346, 6, 'Task personal many next structure allow.', 'Fly effect us along black individual rather. Scene factor her against up.\nSystem consumer however they us kid part. Ago life spend glass sit beyond star these.', '2024-07-13 22:51:23'),
(347, 18, 'Music product every five marriage.', 'Process occur lose stay.\nNotice difficult first my have do deep. Total of democratic ten.', '2024-07-03 09:10:58'),
(348, 14, 'Notice even down popular get word hundred.', 'Scene fire both pressure. Garden loss third interview often power vote church.\nQuality group project partner until feel relationship.', '2024-07-23 13:02:54'),
(349, 12, 'Seek who people building doctor goal possible fly.', 'Hair include likely instead. Able sometimes cover. Arrive not still second. Sometimes wrong really live.', '2024-07-17 14:05:13'),
(350, 21, 'Southern college make political outside thousand.', 'Suffer page century shake degree apply. You style probably field. Whatever serious cup eye later mention.\nIdentify data without article specific since threat.', '2024-07-13 14:01:56'),
(351, 8, 'Southern despite former chance once sometimes.', 'History find hundred tax worry kind. Second camera rise voice every research black. Population someone bill realize. Shoulder interest position performance help.', '2024-07-06 00:30:00'),
(352, 7, 'Politics see term source nation ok.', 'Better floor then you throw drop. Magazine property beat offer.\nOr ok hospital front off customer. Anyone one get choice.', '2024-07-07 03:21:18'),
(353, 10, 'Song however trip these money network skin answer.', 'Dream around occur address just common international. Difference leg simply. Glass several wife seat help consider national.', '2024-07-06 09:59:28'),
(354, 29, 'Share common certain get.', 'Discussion and thousand camera break. Organization travel north bag parent throw.\nCost point information result size know. Such modern gas reveal between use worker.', '2024-07-15 07:02:40'),
(355, 23, 'Though onto when nor ask billion consumer.', 'Fine check central report popular. Star source within among professor argue consider. List his card office.\nPay read both someone east certain. Reduce key item.', '2024-07-02 21:12:54'),
(356, 26, 'Capital food response read might system across boy.', 'Respond federal easy glass. Might approach eat let. Technology use various section safe quality.', '2024-07-22 15:27:36'),
(357, 3, 'Better human seem all cold note significant.', 'Middle whatever use. Most pretty thought one indicate including.\nManage so message. Citizen tonight parent raise. Summer thus reason girl ok begin energy.', '2024-07-06 16:45:54'),
(358, 24, 'Center fine capital player painting.', 'Economic way however official. Black population space our us change. Thousand soon together direction.\nFact available data walk. Full board budget right get method their.', '2024-07-25 00:21:04'),
(359, 22, 'Sell mouth light different.', 'Girl light team hold since. Cut amount then kind.\nLater teacher sort. Three course structure opportunity. Instead receive authority sense always threat more.', '2024-07-04 10:30:33'),
(360, 6, 'Thousand police have maintain husband.', 'Throw hospital attack peace represent. Gun we coach year.\nPerhaps world meeting service traditional program seven three. Major without study task.', '2024-07-26 10:56:38'),
(361, 24, 'During now interest part age arrive.', 'Point imagine bring wish sea. Result tree to but attention.\nOn property safe. Serious he wind explain ago staff. Movie case kid discuss fear happy become.', '2024-08-22 19:57:12'),
(362, 10, 'Respond man because ahead.', 'Summer soon stage author send white. Establish include quite detail. Most participant international never above.\nEight watch style address. Degree once drop loss agent trial.', '2024-08-24 23:48:05'),
(363, 8, 'Imagine rule appear million above.', 'Challenge born real. High guess own throw full argue watch. Hand customer key boy push teacher. In lawyer husband ready whatever center.', '2024-08-08 21:44:34'),
(364, 8, 'Safe explain throughout decision worker fact.', 'Research explain then break actually. And do sound time.\nNation memory material level decade crime. Cause energy throughout hold.\nBecome skin dog oil financial along. Book happen clear.', '2024-08-17 15:06:24'),
(365, 19, 'Relationship green business family policy.', 'Truth remember paper threat establish. Me piece food draw throw write. Economic deal interesting.', '2024-08-27 01:51:56'),
(366, 7, 'Could ability improve above bad end popular.', 'Actually sort full establish need security. Race fight which cell many participant. Should they quality floor we. Reach condition half hotel democratic data customer produce.', '2024-08-24 20:26:43'),
(367, 9, 'Someone exist piece read from half lawyer.', 'Idea writer who final describe my. Marriage him above lot standard from much. Mouth remember receive walk.\nLeast success play response sea control when. Realize news film picture opportunity the.', '2024-08-09 20:55:13'),
(368, 25, 'Whom exactly section summer character.', 'It treat know put heart. Finally whether each nice.\nPolicy those animal issue ahead. Sell glass amount factor health majority music.\nHard who than education law. Watch part spend.', '2024-08-02 08:44:37'),
(369, 5, 'Student seat answer tonight actually focus.', 'Than miss short describe win. Theory memory level me change some create.\nAt fall watch such fast test detail. Scientist bank probably their. Quickly attorney I interesting rise.', '2024-08-07 06:36:39'),
(370, 12, 'Push program must bed.', 'Decide wrong side out administration as prevent. Response send low show.\nSend standard strong. Enter author executive before nothing behind.', '2024-08-15 07:13:42'),
(371, 11, 'Describe increase draw nation.', 'Discussion nor sport how. Foot management season current suggest Mrs her.\nHope figure which space hear why picture edge.\nWill argue term. Product because add.', '2024-08-19 05:57:44'),
(372, 22, 'Quality third want require.', 'Cover indicate necessary hospital happen. Some send production. Accept probably series economic some.\nRequire what if close. Thank apply garden center. Drop present subject start.', '2024-08-25 16:08:56'),
(373, 15, 'Beyond skill admit picture American case time unit.', 'Near me its wish mean surface wrong something. Call affect drop tree image. Team enough fight collection leader second begin.\nWhen event recent hotel talk east individual. System huge citizen growth.', '2024-08-19 09:04:58'),
(374, 10, 'Trip baby also teach paper analysis.', 'Boy understand development easy personal. Enter very article relationship line pull state. Tough movement section defense always under any view.', '2024-08-18 07:11:27'),
(375, 2, 'Human five analysis above right modern rise.', 'Foot threat heavy size nothing series. Officer indeed rock. Everyone professor somebody. Foreign way audience decade home.', '2024-08-06 21:23:06'),
(376, 11, 'Lot move once must under pass usually.', 'Professor government serve red. Just instead coach dog several yard. Congress simply event effort other use reduce maintain.\nThem data foreign. Last deal score great perhaps.', '2024-08-05 09:46:08'),
(377, 18, 'Answer seek baby let huge.', 'Center treat couple across above fund evening. Off measure would heavy always use.\nEverything put decision able side analysis price. Nearly not behavior.', '2024-08-15 21:55:28'),
(378, 26, 'Process life serious bit take.', 'Media east with mention guess identify road. Culture go section grow region career receive. Particularly production goal medical will.', '2024-08-17 13:23:36'),
(379, 18, 'Behind pass career player.', 'Shoulder price movie turn feeling threat. Rise media response parent customer environmental. Current leave capital present.', '2024-08-07 21:48:58'),
(380, 10, 'Guy score experience perhaps might.', 'Six stage attention night million wrong artist teacher. Democratic difference campaign hospital rise wide now message.', '2024-08-06 00:36:02'),
(381, 27, 'Story data prove agreement grow chance ask feel.', 'Indicate artist real song bed wish art. After fact ground general put at economic campaign.', '2024-08-26 06:31:25'),
(382, 14, 'Consider would recognize.', 'Improve long check really model both conference left. Game care program minute than success. Wear himself professional history tough.\nBuy edge into power. No product imagine.', '2024-08-04 19:37:02'),
(383, 17, 'Trip wonder cut under.', 'Individual ten bank prevent number. Street whole person reach word another. Themselves least different. Short provide cup pull rather.', '2024-08-09 07:54:09'),
(384, 13, 'Talk admit pass watch agree add city deep.', 'Public detail executive impact six guy could. Clear worry parent within. Imagine wear college page memory usually understand. Here young cover issue rather.', '2024-08-04 18:24:52'),
(385, 14, 'Director this something suddenly order.', 'Include can pass lay among let. Run attorney view look this couple history. Class investment to upon develop able tonight.', '2024-08-04 13:23:58'),
(386, 2, 'Story pass course cold treatment thing commercial.', 'Rate condition Republican truth space sometimes draw. Source government writer accept along bring suffer. Single if attorney both while relationship sister.', '2024-08-26 15:12:41'),
(387, 26, 'Enough seat research foreign.', 'A else until employee worry. Natural free history its. Movie career interesting within trouble.', '2024-08-03 06:20:41'),
(388, 3, 'Play computer ten bar sign billion image.', 'Hundred answer beat avoid. Society just clear often start start political. Perform worry least much artist serious.', '2024-08-20 04:02:15'),
(389, 27, 'Well individual college agree control bank Congress.', 'Partner follow provide Mrs. Statement space measure effort industry. During election body improve than pull.', '2024-08-21 01:51:23'),
(390, 6, 'Maintain during series floor dream speech fast.', 'Describe stop last door. Son each measure foot.\nSister share today rest. Government why data us.', '2024-08-27 01:41:38'),
(391, 8, 'Then challenge guy company article argue where.', 'Start side write finish mind.\nMajor will learn store site. Offer late consider statement instead less.', '2024-08-22 02:47:47'),
(392, 20, 'Trip yet peace week even key.', 'Put behavior ahead music best care. Beyond black wonder executive summer.\nYour phone gun health course. Inside positive score decade. Data ready however pretty street network. Health play go left.', '2024-08-16 18:46:40'),
(393, 18, 'Resource member guess tree model sea.', 'Whom for hear energy treatment international. Sometimes administration bill theory what but ok. Along line true business hour any little. During loss weight security decision arm town.', '2024-08-12 06:25:36'),
(394, 1, 'Perhaps wish tonight tend most reveal without war.', 'Officer form purpose west real nothing when. His across cause toward statement contain whatever. Financial former class source.', '2024-08-03 20:54:07'),
(395, 7, 'Peace read run government worry yet.', 'Miss after dinner fall debate.\nFather never city class reveal suffer. Them you short customer see. Buy expect decision gun fly establish pressure same.', '2024-08-11 22:43:13'),
(396, 4, 'Could five gas professional.', 'Site clear give mission. Month process move. Director lawyer yeah court.\nSkin book happy because meet shake food. Democrat car clear behavior cell happen.', '2024-08-02 02:42:27'),
(397, 28, 'Maintain rule ready art enter national teacher.', 'Short them memory method most contain so page.\nAlready bed pass one tend. More quickly modern hard cold. Culture there loss once bed social national.', '2024-08-10 05:37:47'),
(398, 7, 'Bag environmental name with above pattern ago.', 'Character cultural listen inside black. Member blood really idea growth. While crime would establish trade down thought.', '2024-08-28 19:22:26'),
(399, 12, 'Source decision major follow.', 'Pull middle open hit attack. Quickly mother talk continue walk particularly. Process rate environment chair dog low. Sense determine not offer than serve.', '2024-08-04 18:11:27'),
(400, 8, 'Worker writer artist until.', 'Put often especially development relationship ground eight. Question expect heart owner. Vote couple trial speak among send.\nDay read vote. Bank idea professional character grow join none.', '2024-08-06 20:43:21'),
(401, 5, 'Accept fire along management worker century break.', 'Test company serious defense chair world. Road remember first population become than.\nStop on paper director movement picture. Outside speak reach gun national. Imagine stock long hotel.', '2024-08-16 20:47:37'),
(402, 27, 'Opportunity final country watch fund.', 'National their ball try nice short difficult whose. It practice organization range wonder personal military. Involve none case result message.', '2024-08-18 19:56:45'),
(403, 3, 'Including partner within although.', 'Water response national war. Business some fact science. Left from another.\nHome region dark change institution. Arrive street collection mission big eye whatever.', '2024-08-01 00:35:50'),
(404, 20, 'Choice more goal determine scene.', 'Consider place either baby hope responsibility area mission. Together type player reduce effort.', '2024-08-05 23:26:59'),
(405, 4, 'Former shake leader upon read option.', 'Fine at support paper field. Wonder century choose cold away medical election must. House study reduce training agency appear fish.\nMoney me ten drive. Enjoy mean summer activity.', '2024-08-01 07:31:29'),
(406, 18, 'Question professional build yourself likely.', 'Will within boy wind turn. Expert final opportunity approach whatever.\nSystem official task bit Republican. Third strategy record oil relate necessary.', '2024-08-14 21:00:14'),
(407, 17, 'Blood protect song necessary specific.', 'Author newspaper point partner fill establish able. Game most race. Rise only ever another artist American.\nOption money structure fish.', '2024-08-11 06:17:31'),
(408, 30, 'Until society career.', 'Strong could ball strong allow talk scientist. Despite according economy good suggest science general. Agree avoid you save wait.\nSeven ever approach. Body at ok us consider inside.', '2024-08-23 09:54:47'),
(409, 8, 'Know item area particular light bag truth office.', 'Whole history have development from. Modern discover church happen audience such. Film player inside decade.\nHow notice office memory might. Store high present follow blood total open.', '2024-08-28 20:27:12'),
(410, 10, 'Degree as stock money happen.', 'Mention fly control technology research mission father. Economy thought collection happen dark us. Hour blood enjoy similar party.', '2024-08-25 12:56:17'),
(411, 25, 'Move place stand range.', 'Professional culture wall focus. Season than get thus despite product thousand. Blue suddenly experience social save.', '2024-09-21 07:31:07'),
(412, 5, 'Skin water number story.', 'Kind she several country price. Power use political performance write. Whom mother per might actually teach deep energy.', '2024-09-06 13:49:40'),
(413, 10, 'Prevent dream election field class American.', 'City probably debate hospital might consumer rise. Option poor safe with final begin blood wrong. Mrs similar necessary power thing stand task.', '2024-09-12 02:23:48'),
(414, 4, 'Forget again throw if area.', 'Travel mission partner myself.\nAway operation key debate. Finish mother per senior. State task life such single million.', '2024-09-08 02:27:53'),
(415, 21, 'Great American behavior off.', 'White least know still image. Speak shoulder site never catch. Energy specific tough town interesting hear site. Daughter relate think early trip major.', '2024-09-03 10:59:03'),
(416, 3, 'Popular decade administration century.', 'Computer always instead east property impact. Than responsibility task address.\nRead catch education game each easy. Later between style often even between. Wind before loss old right might role red.', '2024-09-21 23:13:13'),
(417, 9, 'Bank wide fund network bank economy.', 'Sort lot far get place. Exactly then manage medical kid area fish.\nEnd begin hope along peace theory. Guy very cold head fall. Government whom but traditional.', '2024-09-11 10:17:08'),
(418, 5, 'Tend life fill yard.', 'Wrong above eye together thus direction computer push. Mind paper none one laugh. Amount run play culture.\nA become our deal similar certain understand. Cut join child become wind former industry.', '2024-09-16 15:29:40'),
(419, 29, 'Best dark mother put responsibility usually.', 'Difference city very popular cut herself know. Staff give actually medical after shake majority. Memory sport seven conference.', '2024-09-25 11:22:50'),
(420, 8, 'Recent left science specific.', 'Politics nothing door minute might evening. Represent mention oil sign not before.', '2024-09-15 05:05:08'),
(421, 12, 'Record land act peace chance collection.', 'Team fact report through increase. Hotel among instead authority.\nCell matter guess magazine teach. Drive because miss stock good. Policy bit along then look girl pay.', '2024-09-24 15:59:17'),
(422, 8, 'Weight save physical sound drop.', 'Girl western finally want visit. Character create generation they service city race.\nHim require wrong coach only large top evidence. Onto night first western.', '2024-09-01 16:05:55'),
(423, 1, 'Wide read treatment child security.', 'Goal meeting decade friend reflect hotel believe. Your current against radio play word together. Get none close black.', '2024-09-13 12:17:09'),
(424, 11, 'Red agreement itself.', 'Majority look or clear send. Campaign court clearly news.\nBig exactly newspaper strong black first arrive. Available lay reduce sound. Record several impact consumer.', '2024-09-19 22:26:14'),
(425, 23, 'You imagine both activity.', 'Task voice experience thank lead. Some quite director the side tell work. Care school agent down one other.', '2024-09-24 20:01:34'),
(426, 19, 'Respond almost newspaper operation least number sound.', 'One tend big analysis wonder practice keep himself.\nAir pretty authority. Under firm model full assume world. Reflect collection according including.', '2024-09-01 17:41:34'),
(427, 26, 'College world grow anyone war indicate present.', 'Describe child serious still. Garden man put offer.\nAuthor common phone cover allow past experience. President final door although. Compare fast oil test organization sort treatment church.', '2024-09-07 10:17:21'),
(428, 14, 'The matter down defense listen.', 'Couple evidence ok.\nAway green discussion determine you strong something middle.\nBefore trial than agree. Travel over represent agent size production. What lead bad road behavior free.', '2024-09-08 01:18:34'),
(429, 20, 'Myself thousand great win traditional pressure.', 'Serve enjoy while especially look attack.\nAlone find oil loss threat process deal.', '2024-09-20 02:57:56'),
(430, 29, 'Difficult future live age community avoid.', 'Fund project security outside feeling consumer forward. Subject part economy.', '2024-09-27 11:01:28'),
(431, 22, 'Control fast large.', 'Fast machine professional why. Start model TV. Tax few probably bring deep another.', '2024-09-24 16:38:01'),
(432, 25, 'Economy president reach camera.', 'Result Democrat last choice our talk table audience. Garden process family budget wife. Center official senior wall. President popular member recognize anything go fish wonder.', '2024-09-28 03:59:32'),
(433, 29, 'Meeting data mean.', 'Kid but set start feeling wide. Bag song trade where pay. Research dog skin rich whose.\nAuthority treat morning buy bill top among. But against off successful test show too.', '2024-09-09 13:29:12'),
(434, 9, 'Man system into reveal production.', 'Stop scene still concern change agreement. Because white daughter card option recognize.\nWhy position artist account job. Certain could rest time. Walk under sometimes section.', '2024-09-02 22:00:38'),
(435, 16, 'Enjoy PM science scientist.', 'By civil color. Water model fire range field figure.\nLater save young information. Candidate yourself who audience put allow image drop.\nWar everything keep quickly fact everybody.', '2024-09-10 22:45:50'),
(436, 23, 'Today better occur tend conference.', 'Generation radio fish space often gun country.\nSeries first because mention result. Indeed finish practice work war.\nPage bank arrive someone sure shoulder. Kid despite paper analysis expert goal.', '2024-09-11 15:31:24'),
(437, 5, 'Size argue hard.', 'Effort best same place next nothing whole PM. Culture effect financial with interesting certainly quality.', '2024-09-14 16:06:57'),
(438, 15, 'Girl wait that report more few.', 'Wonder here assume. Term consider hear pretty. Full amount short prove.', '2024-09-28 00:29:07'),
(439, 2, 'Against may opportunity purpose join trip its.', 'Particularly chair up nor computer or. With garden least.\nMan red drug note spring minute. Station population make hard. Crime central yet nearly money.', '2024-09-03 21:35:13'),
(440, 22, 'Writer bit vote respond position.', 'Staff hope they say skill firm. Hear rate occur by system. Maintain for too back full identify my.\nAll force north call push. Particular light few cut. Treat investment interest.', '2024-09-02 19:42:33'),
(441, 13, 'Its husband compare assume.', 'Put eat write family. Should security sell with best ahead. Ago feel central discover fall once card.', '2024-09-01 10:45:54'),
(442, 1, 'Sing laugh still national.', 'Per road ask team special list especially. Source fire thought page grow indeed shake. Thus pick three while.\nMethod image Republican team include doctor professional. From life including remember.', '2024-09-03 17:30:43'),
(443, 24, 'Them commercial building goal design again suggest.', 'On wear collection stock run run. Relationship sit camera machine really. Drop buy standard draw determine.\nRule pick trouble must partner recent. Animal tell decade strategy.', '2024-09-28 15:11:42'),
(444, 29, 'Side amount significant experience herself more his.', 'Book either country exactly toward. Hair organization three sometimes back he adult.', '2024-09-05 11:47:54'),
(445, 10, 'Weight identify western its by necessary its.', 'Some surface east least. Western my important product.\nOr past beat same six available make. Structure head daughter matter. Modern but suddenly direction continue.\nStuff peace effect understand.', '2024-09-08 09:41:56'),
(446, 22, 'Woman expect economy also treatment national only.', 'Worker listen ready whole. Myself term option somebody.\nFamily truth discussion laugh war trade lead. Miss public beyond popular rest positive. Same time movie.', '2024-09-03 19:16:38'),
(447, 20, 'Teach soon important appear still old type.', 'Similar town red particularly message information when. Development energy young laugh. Other several political truth capital.', '2024-09-27 09:17:05'),
(448, 5, 'Real arrive short under none put mention suggest.', 'Growth politics represent term. Green for every discover important language. Report conference capital small lead ready. Decide participant condition believe.', '2024-09-11 04:33:59'),
(449, 23, 'Compare despite expert human including campaign life.', 'Step anyone season small black pretty too billion. Game book little nor statement quality game. Statement thank friend story best deal back. One question language finally place culture.', '2024-09-02 00:57:46'),
(450, 10, 'My significant political pull war company.', 'Large without customer science next. Feel fact art image hope control.\nBecause politics suddenly clear one program. Impact training law accept cell data sell. Author heavy four list company yard.', '2024-09-04 18:56:20'),
(451, 12, 'Public that sort door always provide energy.', 'House tend sort specific point. Century affect easy suddenly race.\nOur begin fine hundred measure. Century cultural whether. Clearly poor read save else mention although.\nThey range turn still.', '2024-09-20 16:14:38'),
(452, 27, 'Modern other chair include however.', 'Sign son activity money pretty chance. Window turn or what. Goal stuff hospital reduce young.\nPractice organization risk meet at model indicate. Give baby material small occur.', '2024-09-07 07:33:15'),
(453, 9, 'Community side vote some address participant.', 'Recently country notice degree available. Final behind stand and. Check myself ahead shoulder.\nDemocratic develop environment media cultural responsibility. Some sometimes interview plan.', '2024-09-24 23:30:00'),
(454, 24, 'Example stop can program world knowledge.', 'Special generation economic in order expert room late. When artist name suffer store analysis system.\nView tax court watch environmental interest former party. Everybody politics sell second teach.', '2024-09-15 13:00:19'),
(455, 1, 'Meet return paper specific.', 'Those about structure many. Traditional probably watch language.\nStep my likely north behind international lot. Industry ago reflect item.\nBetter letter project shake pretty.', '2024-09-13 12:54:49'),
(456, 22, 'Wonder suddenly purpose avoid ok author discussion guy.', 'Southern beyond daughter explain. Eye arrive receive audience administration.', '2024-09-21 17:58:36'),
(457, 19, 'Paper campaign peace choice you rather positive.', 'Real give out leader audience risk defense. Next policy seat. Rather matter similar week.', '2024-09-22 05:41:17'),
(458, 29, 'Yourself ability mean quite mind whom.', 'Your hour senior others. Although purpose attention ahead price onto national church. Pull something him fill condition.', '2024-09-18 01:07:19'),
(459, 28, 'Or religious window.', 'Although surface crime day like here. Everything quite institution care. Affect seat note government wife response enough.', '2024-09-01 10:25:53'),
(460, 23, 'Here focus someone.', 'Yourself total yet.\nAlso number mother best produce money scene. Start sure artist chair.\nStuff computer white college soldier growth seem. Site wear expert certainly see produce.', '2024-09-28 20:06:26'),
(463, 37, '1', 'KETEMU PAK YUSAK', '2024-10-02 15:33:53'),
(464, 37, '1', 'KETEMU PAK YUSAK', '2024-10-02 15:33:53'),
(465, 38, '1', 'KETEMU PAK YUSAK', '2024-10-02 15:34:43');
INSERT INTO `kunjungan` (`id`, `id_tamu`, `kepentingan`, `Catatan`, `tgl_input`) VALUES
(466, 38, '1', 'KETEMU PAK YUSAK', '2024-10-02 15:34:43'),
(467, 38, '2', 'MINTA PRODUK', '2024-10-02 15:40:13'),
(468, 38, '2', 'MINTA PRODUK', '2024-10-02 15:40:13'),
(469, 38, '5', 'SURAT UNDANGAN', '2024-10-02 15:41:57'),
(470, 38, '5', 'SURAT UNDANGAN', '2024-10-02 15:41:57'),
(471, 3, '6', 'ANTAR GALON', '2024-10-03 07:38:42'),
(472, 38, 'Promo Produk', 'ROUTER BARU', '2024-10-03 07:40:02'),
(473, 43, 'Janji Ketemu', 'KETEMU PAK YUSAK', '2024-10-03 07:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `session_id` varchar(255) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `remote_addr` varchar(100) DEFAULT NULL,
  `client_addr` varchar(100) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `data` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`session_id`, `user_id`, `username`, `date`, `remote_addr`, `client_addr`, `module`, `action`, `status`, `data`) VALUES
('50dc099d7c64a1f50d41eb0475c2ccac', 'admin', 'admin', '2024-09-27 10:37:51', '127.0.0.1', '127.0.0.1', 'code-module', 'insert_module', '', '{\"Module\":\"CodeModule\",\"option\":\"insert\",\"action\":\"module\",\"data\":{\"module_id\":\"data-magang\",\"module\":\"DataMagang\",\"name\":\"Data Magang\",\"description\":\"Data anak Magang\",\"menu\":\"023;Magang\\/\",\"icon\":\"user\",\"iconcls\":\"user\",\"active\":\"true\",\"onmenu\":\"true\"},\"_\":\"1727407897571\"}'),
('50dc099d7c64a1f50d41eb0475c2ccac', 'admin', 'admin', '2024-09-27 10:38:34', '127.0.0.1', '127.0.0.1', 'code-module', 'insert_action', '', '{\"Module\":\"CodeModule\",\"option\":\"insert\",\"action\":\"action\",\"data\":{\"module_id\":\"data_magang\",\"action_id\":\"magang_view\",\"option\":\"magang\",\"action\":\"view\",\"description\":\"menampilkan magang\",\"log\":\"true\"},\"_\":\"1727407897575\"}');

-- --------------------------------------------------------

--
-- Table structure for table `log_login_failed`
--

CREATE TABLE `log_login_failed` (
  `id` int NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `username` text,
  `password` text,
  `http_client_ip` text,
  `http_x_forwarded_for` text,
  `remote_addr` text,
  `http_user_agent` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `magang`
--

CREATE TABLE `magang` (
  `id` int NOT NULL,
  `nama` varchar(80) NOT NULL,
  `universitas` varchar(120) NOT NULL,
  `nim` varchar(16) NOT NULL,
  `user_input` varchar(50) NOT NULL,
  `user_update` varchar(50) NOT NULL,
  `tgl_input` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `module_id` varchar(80) NOT NULL,
  `module` varchar(45) DEFAULT NULL COMMENT 'Mjd nama folder, file php&js, class php&js',
  `name` varchar(45) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `menu` varchar(255) NOT NULL,
  `iconcls` varchar(45) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `onmenu` int DEFAULT '1',
  `onview` varchar(50) NOT NULL DEFAULT 'tabpanel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_id`, `module`, `name`, `description`, `menu`, `iconcls`, `icon`, `active`, `onmenu`, `onview`) VALUES
('buku-hari', 'BukuHari', 'Statistik Tamu Harian', 'Statistik Tamu Harian', '019;Statistik/', 'table', 'table', 1, 1, 'tabpanel'),
('code-generator', 'CodeGenerator', 'Code Generator', 'Generate otomatis code dalam module', '025;Developer/', 'angle-double-right', 'code', 0, 1, 'tabpanel'),
('code-module', 'CodeModule', 'Code Module', 'Mengelola Modules dan Actions', '025;Developer/', 'angle-double-right', 'code', 1, 1, 'tabpanel'),
('crud-generator', 'CrudGenerator', 'Crud Generator', 'crud generator', '025;Developer/', 'angle-double-right', 'code', 1, 1, 'tabpanel'),
('daftar-kunjungan', 'DaftarKunjungan', 'Daftar Kunjungan', 'Daftar Kunjungan', '018;Buku Tamu/', 'book', 'book', 1, 1, 'tabpanel'),
('daftar-tamu', 'DaftarTamu', 'Daftar Tamu', 'Buku Tamu', '018;Buku Tamu/', 'book', 'book', 1, 1, 'tabpanel'),
('dashboard', 'Dashboard', 'Dashboard', 'Dashboard Aplikasi', '011;Dashboard/', 'circle-o', 'dashboard', 1, 0, 'tabpanel'),
('data-magang', 'DataMagang', 'Data Magang', 'Data anak Magang', '023;Magang/', 'user', 'user', 1, 1, 'tabpanel'),
('drawer-app', 'DrawerModule', 'Drawer Apps', 'Drawer Aplikasi pada header', '021;Sistem Terintegrasi/', '', '', 1, 0, 'tabpanel'),
('drawer-module', 'DrawerModule', 'Drawer', 'Drawer', '', '', '', 1, 0, 'tabpanel'),
('kirim-pesan', 'EntryPesan', '020;Entry Pesan', 'Mengirim Pesan', '034;Kirim Pesan/', 'user', 'user', 1, 0, 'tabpanel'),
('log-activity', 'LogActivity', 'Log Aktifitas User Akses', 'Log/history akses oleh user', '030;Administrator/', 'angle-double-right', 'user', 1, 1, 'tabpanel'),
('log-pesanwa', 'LogPesanwa', 'Log Pesan WA', 'log aktivitas', '034;Kirim Pesan/', 'user', 'user', 1, 0, 'tabpanel'),
('logeduserinfo', 'LogedUserInfo', 'Informasi User Yang Login', 'pengolahan data user', '030;Administrator/', 'angle-double-right', 'user', 1, 0, 'window'),
('message-private', 'MessagePrivate', 'Kirim Pesan (Chat)', 'Kirim pesan dari user ke user (Chating)', '100;Utility/', 'angle-double-right', 'cogs', 0, 1, 'window'),
('message-public', 'MessagePublic', 'Kirim Pesan ke User', 'Kirim pesan ke user', '100;Utility/', 'angle-double-right', 'cogs', 0, 1, 'window'),
('sample-module', 'SampleModule', 'Sample Module', 'Contoh', '025;Developer/', 'angle-double-right', 'user-secret', 1, 1, 'tabpanel'),
('sample-window', 'SampleWindow', 'Sample Window', 'Contoh', '025;Developer/', 'angle-double-right', 'user-secret', 1, 0, 'tabpanel'),
('setting-aplikasi', 'SettingAplikasi', 'Setting Aplikasi', 'Setting Daftar Aplikasi yang terintegrasi', '030;Administrator/', 'angle-double-right', 'user', 1, 1, 'tabpanel'),
('test-code', 'Dashboard', 'Dashboard', '\"><img%20src=x%20onerror=alert(1)>\"', '025;Developer/', 'circle-o', 'code', 1, 1, 'tabpanel'),
('user-info', 'UserInfo', '030;User Info', 'Pengaturan user login', '031;User/', 'user', 'user', 1, 0, 'tabpanel'),
('userinfo', 'UserInfo', 'Informasi User', 'Pengolahan data user', '030;Administrator/', 'angle-double-right', 'user', 1, 0, 'window'),
('usermanagement', 'UserManagement', 'User Management', 'Pengolahan data  user', '030;Administrator/', 'angle-double-right', 'user', 1, 1, 'tabpanel'),
('userotoritas', 'UserOtoritas', 'User Otoritas', 'Pengolahan data otoritas user', '030;Administrator/', 'angle-double-right', 'user', 1, 1, 'tabpanel'),
('userunit', 'UserUnit', 'User Unit', 'Pengelolaan kepemilikan Unit', '030;Administrator/', 'angle-double-right', 'user', 1, 1, 'tabpanel');

-- --------------------------------------------------------

--
-- Table structure for table `reff_keperluan`
--

CREATE TABLE `reff_keperluan` (
  `id` int NOT NULL,
  `keperluan` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reff_unit_kerja`
--

CREATE TABLE `reff_unit_kerja` (
  `id_unit_kerja` int NOT NULL,
  `tahun_sotk` int DEFAULT NULL,
  `kode_unit_kerja` varchar(25) DEFAULT NULL,
  `unit_kerja` varchar(255) DEFAULT NULL,
  `nama_unit_kerja_lengkap` varchar(255) DEFAULT NULL,
  `nama_unit_kerja_pendek` varchar(255) DEFAULT NULL,
  `id_eselon` int DEFAULT NULL,
  `level_unit_kerja` int DEFAULT '0',
  `nomor_unit_kerja` int DEFAULT NULL,
  `kode_unit_kerja_parent` varchar(25) DEFAULT NULL,
  `aktif` int DEFAULT NULL,
  `caption_kepala_unit_kerja` varchar(255) DEFAULT NULL,
  `id_jenis_jabatan` int DEFAULT '1',
  `nama_kepala` varchar(255) DEFAULT NULL,
  `alamat` text,
  `singkatan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'a session : randomly generated id',
  `user_id` varchar(32) NOT NULL COMMENT 'user signed in',
  `group_id` int UNSIGNED DEFAULT NULL COMMENT 'Group the member signed in under',
  `data` mediumtext,
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` varchar(150) DEFAULT NULL,
  `time_login` datetime DEFAULT NULL,
  `time_updated` datetime DEFAULT NULL,
  `time_logout` datetime DEFAULT NULL,
  `logout_status` varchar(50) DEFAULT NULL,
  `username` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `group_id`, `data`, `ip_address`, `user_agent`, `time_login`, `time_updated`, `time_logout`, `logout_status`, `username`) VALUES
('47d444c6c39543cdede8e84a946ba14b', 'admin', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2024-09-27 10:40:26', '2024-09-27 10:52:59', '2024-09-27 12:22:59', NULL, 'admin'),
('50dc099d7c64a1f50d41eb0475c2ccac', 'admin', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2024-09-27 10:31:37', '2024-09-27 10:38:45', '2024-09-27 10:40:13', 'logout', 'admin'),
('88652c2c9fdadcd7e1de163e1193a5a6', 'admin', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2024-10-03 07:38:59', '2024-10-03 07:40:20', '2024-10-03 09:10:20', NULL, 'admin'),
('d0a6deede255270ec59cadb349242d38', 'admin', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2024-10-02 05:15:30', '2024-10-02 05:15:37', '2024-10-02 06:45:37', NULL, 'admin'),
('f6edf575f4f555eaf4fc7b2932c904e0', 'admin', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2024-09-27 09:04:24', '2024-09-27 09:43:52', '2024-09-27 11:13:52', NULL, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_hp` varchar(36) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `instansi` varchar(100) DEFAULT NULL,
  `tgl_input` datetime DEFAULT CURRENT_TIMESTAMP,
  `tgl_edit` datetime DEFAULT CURRENT_TIMESTAMP,
  `keterangan_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id`, `nama`, `no_hp`, `email`, `instansi`, `tgl_input`, `tgl_edit`, `keterangan_asal`) VALUES
(1, 'Susilo', '082277115', 'susilo@gmail.com', 'kominfos', '2024-09-19 09:43:15', '2024-09-19 09:43:15', ''),
(2, 'NOno', '082223331', 'nono@gmail.com', 'kominfos', '2024-09-19 09:44:15', '2024-09-19 09:44:15', ''),
(3, 'Andika', '081111111', 'andika@gmail.com', 'kominfos', '2024-09-19 09:45:04', '2024-09-19 09:45:04', ''),
(4, 'David Levine', '295-606-3333x7394', 'raymond77@powers.com', 'Martin, Young and Williams', '2024-09-12 00:00:00', '2024-05-08 00:00:00', ''),
(5, 'Shawn Nelson', '+1-732-294-9704x0648', 'maryrobles@gmail.com', 'Garcia, Case and Jackson', '2024-02-08 00:00:00', '2024-07-20 00:00:00', ''),
(6, 'Greg Barajas', '+1-873-461-7219', 'linda99@yahoo.com', 'Ruiz, Wilson and Williams', '2024-03-30 00:00:00', '2024-04-19 00:00:00', ''),
(7, 'Casey Park', '+1-139-885-7432', 'robert87@henson.info', 'Fuller, Burns and Gentry', '2024-03-14 00:00:00', '2024-01-08 00:00:00', ''),
(8, 'Stephen Graham', '734-950-6069x8719', 'michaelmalone@yahoo.com', 'Jones Ltd', '2024-06-17 00:00:00', '2024-05-16 00:00:00', ''),
(9, 'Lonnie Cox', '440-533-6530x52161', 'kimberly02@gmail.com', 'Smith-Wood', '2024-01-28 00:00:00', '2024-06-23 00:00:00', ''),
(10, 'Steven Jordan', '615.444.8284x04560', 'usmith@hotmail.com', 'Ruiz Group', '2024-06-24 00:00:00', '2024-09-18 00:00:00', ''),
(11, 'Candice Carroll', '001-936-186-8110x296', 'qgonzalez@ochoa.biz', 'Lee Group', '2024-02-17 00:00:00', '2024-06-25 00:00:00', ''),
(12, 'Jennifer Duke', '(758)972-8495', 'phillipslisa@hotmail.com', 'Singh-Garza', '2024-04-16 00:00:00', '2024-08-15 00:00:00', ''),
(13, 'Dustin Valencia', '702.753.5434', 'dmartinez@gmail.com', 'Cunningham-Harvey', '2024-01-05 00:00:00', '2024-03-20 00:00:00', ''),
(14, 'Matthew Martinez', '647.698.1981', 'charlotte22@gmail.com', 'Gill, Baker and Davis', '2024-05-12 00:00:00', '2024-01-08 00:00:00', ''),
(15, 'Steven Reyes', '457-935-9395', 'nataliedixon@brooks-castillo.com', 'Delacruz and Sons', '2024-07-11 00:00:00', '2024-08-08 00:00:00', ''),
(16, 'Cory Orr', '369.108.0854x6474', 'perezjohnny@hotmail.com', 'Thornton Group', '2024-01-22 00:00:00', '2024-03-25 00:00:00', ''),
(17, 'Michael Cox', '669-372-2260x44711', 'ashley99@yahoo.com', 'Horton-Walsh', '2024-05-04 00:00:00', '2024-05-19 00:00:00', ''),
(18, 'Frederick Erickson', '001-332-588-7984x245', 'michaelstout@barnes.com', 'Lopez, Johnson and Wagner', '2024-01-18 00:00:00', '2024-07-24 00:00:00', ''),
(19, 'Clifford Thomas', '001-735-923-1765', 'zfloyd@yahoo.com', 'Brown, Stewart and Lutz', '2024-01-01 00:00:00', '2024-07-27 00:00:00', ''),
(20, 'Susan Owens', '+1-800-064-7348', 'david93@wolf.com', 'Berry Ltd', '2024-08-20 00:00:00', '2024-03-18 00:00:00', ''),
(21, 'Maria Williams', '+1-119-164-1757x5268', 'lfrancis@gmail.com', 'Rice and Sons', '2024-08-12 00:00:00', '2024-04-14 00:00:00', ''),
(22, 'Dawn Dunn', '+1-863-428-8066', 'amybeltran@gmail.com', 'Ford-Winters', '2024-06-07 00:00:00', '2024-04-14 00:00:00', ''),
(23, 'Vanessa Price', '564-091-1337x0331', 'charles79@gmail.com', 'Elliott-Lynch', '2024-06-08 00:00:00', '2024-02-08 00:00:00', ''),
(24, 'Michael Shaw', '377.094.5760', 'lisanguyen@yahoo.com', 'Hayes, Taylor and Hutchinson', '2024-01-16 00:00:00', '2024-08-30 00:00:00', ''),
(25, 'Stacy Rojas', '+1-026-741-5106', 'melissa71@cruz.biz', 'Johnson, Riley and Norton', '2024-09-17 00:00:00', '2024-04-09 00:00:00', ''),
(26, 'Randall Bullock DDS', '+1-195-720-4742x964', 'jpierce@burns-bowman.com', 'Wheeler Group', '2024-04-28 00:00:00', '2024-06-23 00:00:00', ''),
(27, 'Charles Jackson', '761.267.9739x3718', 'uwhitney@hotmail.com', 'Smith, Ochoa and Hall', '2024-01-07 00:00:00', '2024-06-18 00:00:00', ''),
(28, 'Adam Fowler', '001-306-292-0467x86576', 'amandapace@bush.com', 'Simpson, Mcgrath and Wilkerson', '2024-02-14 00:00:00', '2024-02-24 00:00:00', ''),
(29, 'Crystal Vasquez', '886-756-4181', 'taylorapril@edwards.com', 'Miller-Barrera', '2024-04-14 00:00:00', '2024-04-14 00:00:00', ''),
(30, 'Kristen Nunez', '728-505-2621x5641', 'barnesvalerie@flowers-ross.com', 'Greer LLC', '2024-02-06 00:00:00', '2024-07-02 00:00:00', ''),
(31, 'Natalie Brewer', '(101)062-1042', 'zbrown@barrett-davis.com', 'Dominguez LLC', '2024-07-11 00:00:00', '2024-05-03 00:00:00', ''),
(32, 'Tiffany Perry', '+1-583-487-8963x5439', 'hineschristina@gmail.com', 'Johnson, Jones and Wilcox', '2024-05-21 00:00:00', '2024-04-12 00:00:00', ''),
(33, 'Robert Williams', '(762)780-5424', 'sarawolfe@watkins-beck.com', 'Bailey Ltd', '2024-01-06 00:00:00', '2024-04-07 00:00:00', ''),
(43, 'DWI ADI LAKSONO', '0817271960', NULL, 'Pegawai Swasta', '2024-10-03 07:52:23', '2024-10-03 07:52:23', 'BPD SLEMAN');

-- --------------------------------------------------------

--
-- Table structure for table `tanggal`
--

CREATE TABLE `tanggal` (
  `tgl` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanggal`
--

INSERT INTO `tanggal` (`tgl`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31);

-- --------------------------------------------------------

--
-- Table structure for table `tm_export`
--

CREATE TABLE `tm_export` (
  `id_export` int NOT NULL,
  `session` varchar(128) NOT NULL COMMENT 'session id',
  `json_data` text NOT NULL COMMENT 'json string'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tm_export`
--

INSERT INTO `tm_export` (`id_export`, `session`, `json_data`) VALUES
(1, '61aef098cb47cc96809f76c4118124d2', '{\"Module\":\"LapPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"rekap\",\"export_type\":\"stream\",\"_\":\"1469515813536\"}'),
(2, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929165\"}'),
(3, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929166\"}'),
(4, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929167\"}'),
(5, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929168\"}'),
(6, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929169\"}'),
(7, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929170\"}'),
(8, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929171\"}'),
(9, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929172\"}'),
(10, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929173\"}'),
(11, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929174\"}'),
(12, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929175\"}'),
(13, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929176\"}'),
(14, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929177\"}'),
(15, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929178\"}'),
(16, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929179\"}'),
(17, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929180\"}'),
(18, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929181\"}'),
(19, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929182\"}'),
(20, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929183\"}'),
(21, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929184\"}'),
(22, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929185\"}'),
(23, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929186\"}'),
(24, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929187\"}'),
(25, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929188\"}'),
(26, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929189\"}'),
(27, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929190\"}'),
(28, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493256929191\"}'),
(29, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705875\"}'),
(30, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705876\"}'),
(31, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705877\"}'),
(32, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705878\"}'),
(33, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705879\"}'),
(34, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705880\"}'),
(35, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705881\"}'),
(36, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705882\"}'),
(37, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705883\"}'),
(38, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705884\"}'),
(39, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705885\"}'),
(40, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705886\"}'),
(41, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705887\"}'),
(42, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493263860187\"}'),
(43, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705888\"}'),
(44, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705889\"}'),
(45, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705890\"}'),
(46, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705891\"}'),
(47, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705892\"}'),
(48, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705893\"}'),
(49, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705894\"}'),
(50, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705895\"}'),
(51, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705896\"}'),
(52, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705897\"}'),
(53, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705898\"}'),
(54, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705899\"}'),
(55, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705900\"}'),
(56, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705901\"}'),
(57, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705902\"}'),
(58, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705903\"}'),
(59, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705904\"}'),
(60, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705905\"}'),
(61, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705906\"}'),
(62, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705907\"}'),
(63, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261705908\"}'),
(64, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1493261706008\"}'),
(65, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266942984\"}'),
(66, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266942985\"}'),
(67, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266942987\"}'),
(68, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943003\"}'),
(69, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943052\"}'),
(70, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943053\"}'),
(71, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943054\"}'),
(72, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943055\"}'),
(73, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943056\"}'),
(74, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943057\"}'),
(75, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943058\"}'),
(76, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943059\"}'),
(77, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943060\"}'),
(78, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943061\"}'),
(79, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943062\"}'),
(80, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943063\"}'),
(81, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943064\"}'),
(82, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1493266943069\"}'),
(83, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943073\"}'),
(84, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943074\"}'),
(85, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943075\"}'),
(86, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943076\"}'),
(87, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943077\"}'),
(88, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943078\"}'),
(89, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943079\"}'),
(90, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943080\"}'),
(91, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943081\"}'),
(92, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943082\"}'),
(93, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943083\"}'),
(94, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943084\"}'),
(95, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943085\"}'),
(96, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943086\"}'),
(97, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943087\"}'),
(98, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943088\"}'),
(99, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943089\"}'),
(100, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943090\"}'),
(101, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943091\"}'),
(102, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943092\"}'),
(103, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943093\"}'),
(104, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943094\"}'),
(105, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943096\"}'),
(106, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943097\"}'),
(107, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943098\"}'),
(108, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943099\"}'),
(109, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943100\"}'),
(110, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943101\"}'),
(111, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943102\"}'),
(112, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943103\"}'),
(113, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"03\",\"_\":\"1493266943104\"}'),
(114, '1d4af5cee7749d3da9b7c510e8b163fd', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1493266943106\"}'),
(115, 'c2bc3eaf278ffc06424d9a53bc2d2def', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1493454443452\"}'),
(116, '890e6882b738ad67e070258ff4adb78a', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"04\",\"_\":\"1493871827308\"}'),
(117, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167754\"}'),
(118, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167755\"}'),
(119, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167756\"}'),
(120, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167757\"}'),
(121, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167758\"}'),
(122, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167759\"}'),
(123, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167760\"}'),
(124, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167761\"}'),
(125, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167762\"}'),
(126, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167763\"}'),
(127, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"09\",\"_\":\"1494303167764\"}'),
(128, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1494303167776\"}'),
(129, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"data_cari\":{\"id_pilar\":\"1\",\"kode_tujuan\":\"1.2\",\"kode_target\":\"1.2.2\",\"kode_indikator\":\"1.2.2.1\"},\"_\":\"1494311479657\"}'),
(130, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"data_cari\":{\"id_pilar\":\"1\",\"kode_tujuan\":\"1.2\",\"kode_target\":\"1.2.3\",\"kode_indikator\":\"\"},\"_\":\"1494311479659\"}'),
(131, '06d17dc0bf3f620827d8834624ea31ca', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"05\",\"data_cari\":{\"id_pilar\":\"\",\"kode_tujuan\":\"\",\"kode_target\":\"\",\"kode_indikator\":\"\"},\"_\":\"1494311479681\"}'),
(132, '1a0eb81d01391dcba960f6b84a34d3b1', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"data_cari\":{\"id_pilar\":\"\",\"kode_tujuan\":\"\",\"kode_target\":\"\",\"kode_indikator\":\"\"},\"_\":\"1494381873968\"}'),
(133, 'd42f61824be36d02c824d4d703cc683e', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"data_cari\":{\"id_pilar\":\"\",\"kode_tujuan\":\"\",\"kode_target\":\"\",\"kode_indikator\":\"\"},\"_\":\"1500959128604\"}'),
(134, '39f3cebb8afc8cab930a78e4c992ecb2', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"26\",\"_\":\"1500954716565\"}'),
(135, '9bd287148ee8f8ef65e34a74ea794177', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"data_cari\":{\"id_pilar\":\"\",\"kode_tujuan\":\"\",\"kode_target\":\"\",\"kode_indikator\":\"\"},\"_\":\"1501227030034\"}'),
(136, '2672cccb9efc219ffabd08a276f05f0c', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1502087403547\"}'),
(137, '3274813863af23aff710c3c3e5fcdb6a', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1502261332824\"}'),
(138, '3274813863af23aff710c3c3e5fcdb6a', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1502261332825\"}'),
(139, '9fc31c9754ecbe48f55bc7daa3d2f21c', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"data_cari\":{\"id_pilar\":\"\",\"kode_tujuan\":\"\",\"kode_target\":\"\",\"kode_indikator\":\"\"},\"_\":\"1503537866327\"}'),
(140, '9fc31c9754ecbe48f55bc7daa3d2f21c', '{\"Module\":\"Laporan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"data_cari\":{\"id_pilar\":\"\",\"kode_tujuan\":\"\",\"kode_target\":\"\",\"kode_indikator\":\"\"},\"_\":\"1503537866328\"}'),
(141, '47b438c4770a5d65b907bccd50b5758d', '{\"Module\":\"DaftarMDGS\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"unit_kerja\":\"\",\"_\":\"1506001244592\"}'),
(142, 'bf1940b675d35f3bca45bda0613d0642', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1522890695232\"}'),
(143, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523238117209\"}'),
(144, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105198\"}'),
(145, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105199\"}'),
(146, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105200\"}'),
(147, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105201\"}'),
(148, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"SubAspek\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105203\"}'),
(149, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"SubAspek\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105204\"}'),
(150, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"SubAspek\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105205\"}'),
(151, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"SubAspek\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105206\"}'),
(152, '64b54dc3c689689e18885466328e4688', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1523242105208\"}'),
(153, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(154, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(155, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(156, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(157, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(158, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(159, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(160, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(161, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(162, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(163, '64b54dc3c689689e18885466328e4688', '{\"option\":\"PUBLIC\",\"action\":\"pdf\",\"Module\":\"Indikator\",\"export_type\":\"stream\"}'),
(164, 'bb196d8a9fbe2fa1acc9304ea0af9b64', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524030261724\"}'),
(165, 'bb196d8a9fbe2fa1acc9304ea0af9b64', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524032597277\"}'),
(166, 'bb196d8a9fbe2fa1acc9304ea0af9b64', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524032597278\"}'),
(167, 'bb196d8a9fbe2fa1acc9304ea0af9b64', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524032597279\"}'),
(168, '0d878ffcf55fe746a6d4c5eec0cd0dca', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524104065993\"}'),
(169, '0d878ffcf55fe746a6d4c5eec0cd0dca', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524104065994\"}'),
(170, '4d139ab41162e41ea66b57a06a03c253', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524197128146\"}'),
(171, 'd66cc847bd785f7233f5ab1790b22916', '{\"Module\":\"Indikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1524632386874\"}'),
(172, '6624f48e116bbe7ab3a93553653b9de6', '{\"Module\":\"CapaianIndikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1533694723898\"}'),
(173, '6624f48e116bbe7ab3a93553653b9de6', '{\"Module\":\"CapaianIndikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1533694723899\"}'),
(174, '011f3b9f5198da4f404cec25007b7d85', '{\"Module\":\"DataPerInstansi\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1536547235083\"}'),
(175, '011f3b9f5198da4f404cec25007b7d85', '{\"Module\":\"DataPerInstansi\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1536547235084\"}'),
(176, '6d6f98cb396cbee53a61d0864dd92aa7', '{\"Module\":\"CapaianIndikator\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1536563014674\"}'),
(177, 'f76895349b064df97c7153cee1e45b0a', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1542946620123\"}'),
(178, '8b02a20d3c7d0afd39c7a12d42b98e18', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1542948015746\"}'),
(179, 'ad280b9ef64464dab6131ee3db776f1e', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543202842464\"}'),
(180, 'ad280b9ef64464dab6131ee3db776f1e', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543202842463\"}'),
(181, 'ad280b9ef64464dab6131ee3db776f1e', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543202842465\"}'),
(182, 'ad280b9ef64464dab6131ee3db776f1e', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543202842466\"}'),
(183, '0939bf6f75519b9b560cc269ce564f4a', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543202503279\"}'),
(184, '07620b3de4d63348cf3ec3482ea6cfbc', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543204008819\"}'),
(185, '9494a69e1b09c48dc4d90fde25e539d9', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543203231687\"}'),
(186, '837f3e9606ce97c7033e807b9c91c080', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543408637798\"}'),
(187, '837f3e9606ce97c7033e807b9c91c080', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543408637799\"}'),
(188, '837f3e9606ce97c7033e807b9c91c080', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543408637800\"}'),
(189, '837f3e9606ce97c7033e807b9c91c080', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543408637801\"}'),
(190, '90a41107c0d14651fb9b7225b2cabc09', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543479636362\"}'),
(191, '9d0f28e3ae4b5e7dc2e1c18cd713e76e', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1543997197294\"}'),
(192, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545879911202\"}'),
(193, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545879911204\"}'),
(194, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880312519\"}'),
(195, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880312520\"}'),
(196, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880312521\"}'),
(197, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880612935\"}'),
(198, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880612936\"}'),
(199, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865479\"}'),
(200, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865480\"}'),
(201, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865481\"}'),
(202, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865482\"}'),
(203, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865483\"}'),
(204, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865484\"}'),
(205, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865485\"}'),
(206, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865486\"}'),
(207, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865487\"}'),
(208, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545880865488\"}'),
(209, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545884000671\"}'),
(210, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545884000672\"}'),
(211, 'f3582a326fb29af12b620f7566888403', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545884000673\"}'),
(212, '29d16712664e4e94aeaedd41e1dcd445', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545964883522\"}'),
(213, 'e11f84d4a2d7d606f5a1aeb0fca804fd', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1545976353137\"}'),
(214, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417025\"}'),
(215, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417026\"}'),
(216, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417027\"}'),
(217, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417028\"}'),
(218, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417029\"}'),
(219, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417030\"}'),
(220, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417031\"}'),
(221, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417032\"}'),
(222, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417033\"}'),
(223, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417034\"}'),
(224, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417035\"}'),
(225, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417036\"}'),
(226, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417037\"}'),
(227, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417038\"}'),
(228, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417039\"}'),
(229, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417040\"}'),
(230, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417041\"}'),
(231, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417042\"}'),
(232, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417043\"}'),
(233, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417044\"}'),
(234, '944cc0b0d6a3c26accf21b879b4c952d', '{\"Module\":\"SumberData\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546397417045\"}'),
(235, '58a772669b1c6c2598d5dd4cd743719a', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546915915947\"}'),
(236, '58a772669b1c6c2598d5dd4cd743719a', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1546915915948\"}'),
(237, 'ce0b78102139a194f4c966ea6779db52', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1549423575259\"}'),
(238, '1ef0a0408a74bf01bf06dfbacfbf7cbd', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1550722863737\"}'),
(239, 'aa57015ed2176818dc9b4433c609ca8d', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1551753444983\"}'),
(240, '0075dec89647f4d73a8884eddf41bf30', '{\"Module\":\"FormatDatagender\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1554359694861\"}'),
(241, '646cb0526d9ee6eb691b81c297053db2', '{\"Module\":\"Aduan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1609918339303\"}'),
(242, '08ae8f383287ba248031e517e487cf3f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1611542490740\"}'),
(243, 'b4036e7287d8d6d75d29f35bc8d7ac90', '{\"Module\":\"ReffDesa\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1612492588737\"}'),
(244, 'b700366dac9bb723f318056fc5422bd8', '{\"Module\":\"ReffJurusanPendidikan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1612768473766\"}'),
(245, 'b700366dac9bb723f318056fc5422bd8', '{\"Module\":\"ReffNamaJurusan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1612768473783\"}'),
(246, '4b190d6f284d44c4b707c137e004696d', '{\"Module\":\"ReffNamaJurusan\",\"option\":\"PUBLIC\",\"action\":\"pdf\",\"export_type\":\"stream\",\"_\":\"1612947590764\"}'),
(247, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635817568032\"}'),
(248, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635817568043\"}'),
(249, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635817568054\"}'),
(250, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635818235632\"}'),
(251, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635818737300\"}'),
(252, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635818737311\"}'),
(253, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819258379\"}'),
(254, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819258390\"}'),
(255, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819331081\"}'),
(256, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819331092\"}'),
(257, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819331103\"}'),
(258, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749818\"}'),
(259, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749829\"}'),
(260, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749850\"}'),
(261, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749861\"}'),
(262, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749882\"}'),
(263, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749903\"}'),
(264, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749914\"}'),
(265, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635819749925\"}'),
(266, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635821045073\"}'),
(267, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635821243732\"}'),
(268, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635821243743\"}'),
(269, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635821243754\"}'),
(270, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635821243765\"}'),
(271, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635821243776\"}'),
(272, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635821243787\"}'),
(273, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635824158194\"}'),
(274, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635825572607\"}'),
(275, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635825912187\"}'),
(276, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635832578164\"}'),
(277, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635832578175\"}'),
(278, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635839156410\"}'),
(279, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635839156411\"}'),
(280, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635839156412\"}'),
(281, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635839156413\"}'),
(282, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635839617857\"}'),
(283, '252b241e3bf486358b7ad6232859d4ba', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635840247290\"}');
INSERT INTO `tm_export` (`id_export`, `session`, `json_data`) VALUES
(284, '319c44ce724ef15f0e7e88e917556c4c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635849340545\"}'),
(285, '319c44ce724ef15f0e7e88e917556c4c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635849340556\"}'),
(286, '319c44ce724ef15f0e7e88e917556c4c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635849340567\"}'),
(287, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635900984513\"}'),
(288, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635902535232\"}'),
(289, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635902535233\"}'),
(290, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635902535244\"}'),
(291, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635905402173\"}'),
(292, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635905402174\"}'),
(293, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635905518723\"}'),
(294, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635905518758\"}'),
(295, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635906297691\"}'),
(296, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635906297692\"}'),
(297, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635906646072\"}'),
(298, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635906856754\"}'),
(299, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635906870043\"}'),
(300, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635906901758\"}'),
(301, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635906901759\"}'),
(302, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635906901760\"}'),
(303, 'eb27c311975ab1f04ff0c8bcaa062bc4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635906901761\"}'),
(304, '6f8095457207804adaca974fe546d9d8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635907325004\"}'),
(305, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635917098419\"}'),
(306, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635917098420\"}'),
(307, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635917098421\"}'),
(308, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635917098422\"}'),
(309, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635917098423\"}'),
(310, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635917098424\"}'),
(311, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635917098425\"}'),
(312, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635917098426\"}'),
(313, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635917098427\"}'),
(314, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635918696302\"}'),
(315, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635918696303\"}'),
(316, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635918696314\"}'),
(317, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635918696315\"}'),
(318, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635918696316\"}'),
(319, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635918696317\"}'),
(320, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635918696328\"}'),
(321, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635918696339\"}'),
(322, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919044147\"}'),
(323, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919044148\"}'),
(324, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635919189188\"}'),
(325, '4611c087591464dd0277935495347877', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919044169\"}'),
(326, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919189199\"}'),
(327, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919189210\"}'),
(328, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919438499\"}'),
(329, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919438510\"}'),
(330, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919769978\"}'),
(331, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635919769979\"}'),
(332, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635919769981\"}'),
(333, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635919769980\"}'),
(334, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635919769982\"}'),
(335, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635919803581\"}'),
(336, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635919803592\"}'),
(337, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919803593\"}'),
(338, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635919803594\"}'),
(339, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635919803595\"}'),
(340, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919803596\"}'),
(341, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635919803607\"}'),
(342, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635919803608\"}'),
(343, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635919803609\"}'),
(344, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635919803610\"}'),
(345, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635919803621\"}'),
(346, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635919803632\"}'),
(347, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635919803633\"}'),
(348, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635919803634\"}'),
(349, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635919803635\"}'),
(350, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635919803636\"}'),
(351, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635921531870\"}'),
(352, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635921531921\"}'),
(353, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635921531932\"}'),
(354, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635921531980\"}'),
(355, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635923177290\"}'),
(356, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635923177321\"}'),
(357, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635923177322\"}'),
(358, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635921531981\"}'),
(359, 'ae5aa2608e9faa4a68ae9fcd3ccbb9a2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635923694561\"}'),
(360, 'ae5aa2608e9faa4a68ae9fcd3ccbb9a2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635923694562\"}'),
(361, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635923745500\"}'),
(362, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635923745501\"}'),
(363, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635924008057\"}'),
(364, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635924008058\"}'),
(365, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924008059\"}'),
(366, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635924008060\"}'),
(367, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924055477\"}'),
(368, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635924055478\"}'),
(369, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924055479\"}'),
(370, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924341183\"}'),
(371, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635924341184\"}'),
(372, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924424995\"}'),
(373, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924522103\"}'),
(374, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924876701\"}'),
(375, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924055500\"}'),
(376, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635924055501\"}'),
(377, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924876742\"}'),
(378, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924055522\"}'),
(379, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635924055523\"}'),
(380, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924055524\"}'),
(381, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924876764\"}'),
(382, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924876763\"}'),
(383, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635926919319\"}'),
(384, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635927038093\"}'),
(385, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635927038104\"}'),
(386, 'c7a7bfe5dc98b3ebdeb621b7e5911229', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635924055526\"}'),
(387, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635927038115\"}'),
(388, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635927038126\"}'),
(389, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635928058724\"}'),
(390, 'ae5aa2608e9faa4a68ae9fcd3ccbb9a2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635928464722\"}'),
(391, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635928058735\"}'),
(392, 'e3af5f031dcf804cf04eff94895c1d26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635929294265\"}'),
(393, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635988311848\"}'),
(394, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635988311859\"}'),
(395, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635988311870\"}'),
(396, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635990038853\"}'),
(397, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635990038864\"}'),
(398, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635990038875\"}'),
(399, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635990038886\"}'),
(400, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635990038887\"}'),
(401, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635991451808\"}'),
(402, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635991529168\"}'),
(403, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635991594482\"}'),
(404, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635991633448\"}'),
(405, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635993529299\"}'),
(406, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635993529298\"}'),
(407, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635993529300\"}'),
(408, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635993661629\"}'),
(409, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635993661630\"}'),
(410, 'f831fe82b92b659b80d9215cf36b4ae9', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635994658212\"}'),
(411, 'f831fe82b92b659b80d9215cf36b4ae9', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635994658213\"}'),
(412, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635993661631\"}'),
(413, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635993661632\"}'),
(414, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635998251379\"}'),
(415, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635998251380\"}'),
(416, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635998251381\"}'),
(417, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635998251382\"}'),
(418, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635998251383\"}'),
(419, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635998251384\"}'),
(420, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635998251395\"}'),
(421, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635998251396\"}'),
(422, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635998251397\"}'),
(423, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635998251398\"}'),
(424, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635998251399\"}'),
(425, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635998251400\"}'),
(426, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1635998251401\"}'),
(427, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1635998251402\"}'),
(428, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635998251403\"}'),
(429, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635998251404\"}'),
(430, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1635998251405\"}'),
(431, '1bd0e869d86b842bab14315386ff75e3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1635998251416\"}'),
(432, 'd2e6d92ff44b4903f27d8c2aa95d4051', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1635999710008\"}'),
(433, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636005486076\"}'),
(434, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636005486077\"}'),
(435, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1636005486088\"}'),
(436, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636007679186\"}'),
(437, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636007679187\"}'),
(438, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636007679207\"}'),
(439, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636007679208\"}'),
(440, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636007679209\"}'),
(441, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636007679210\"}'),
(442, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636007679211\"}'),
(443, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1636007679212\"}'),
(444, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636007679213\"}'),
(445, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636007679214\"}'),
(446, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636007679215\"}'),
(447, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636007679216\"}'),
(448, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636007679217\"}'),
(449, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1636007679218\"}'),
(450, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636007679219\"}'),
(451, '7fb11e937c42f2d0efe5fe2551b74b6a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636007679220\"}'),
(452, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636011272812\"}'),
(453, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636011272813\"}'),
(454, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636011272814\"}'),
(455, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636011272815\"}'),
(456, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636013434406\"}'),
(457, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636013434407\"}'),
(458, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636013434408\"}'),
(459, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636013434409\"}'),
(460, '9cc06d2c90cb337214a84b8d92a1e64c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636013434420\"}'),
(461, '59ce825eb067d3e13d0bebac1d3e48d0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636014774594\"}'),
(462, '59ce825eb067d3e13d0bebac1d3e48d0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636014774605\"}'),
(463, '59ce825eb067d3e13d0bebac1d3e48d0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636014774606\"}'),
(464, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636074350913\"}'),
(465, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636074350914\"}'),
(466, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1636074350915\"}'),
(467, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636074350926\"}'),
(468, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636074350927\"}'),
(469, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1636074350928\"}'),
(470, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636077083097\"}'),
(471, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636077083108\"}'),
(472, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636077083109\"}'),
(473, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636077083110\"}'),
(474, '0bac43f59302c4a609b0a10701ef8bd8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636082071024\"}'),
(475, 'd834627704cd22cc9b9b61e4f24ce3ef', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636082938830\"}'),
(476, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636334549712\"}'),
(477, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636338707867\"}'),
(478, 'dadce0a70bd5bcf96864a5a77eebd2ba', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636338754354\"}'),
(479, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636338707867\"}'),
(480, 'dadce0a70bd5bcf96864a5a77eebd2ba', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636341157962\"}'),
(481, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636343470202\"}'),
(482, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636343516838\"}'),
(483, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636343516876\"}'),
(484, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636343516875\"}'),
(485, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636343516887\"}'),
(486, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636343516888\"}'),
(487, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636343516889\"}'),
(488, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1636343516890\"}'),
(489, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636343516891\"}'),
(490, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636343516892\"}'),
(491, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636343516902\"}'),
(492, '8b0aeff7c6fbd8bf542ba26ee0e32c2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636343516913\"}'),
(493, 'fc3df26ee0b5b6e1b52fb2e700a54ccf', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636351332107\"}'),
(494, 'fc3df26ee0b5b6e1b52fb2e700a54ccf', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636353146458\"}'),
(495, 'fc3df26ee0b5b6e1b52fb2e700a54ccf', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636353146475\"}'),
(496, 'fc3df26ee0b5b6e1b52fb2e700a54ccf', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636353146476\"}'),
(497, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636353917146\"}'),
(498, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636354921809\"}'),
(499, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636354921810\"}'),
(500, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636357044451\"}'),
(501, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636357044452\"}'),
(502, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636357044453\"}'),
(503, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636357044454\"}'),
(504, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636357044455\"}'),
(505, 'fc3df26ee0b5b6e1b52fb2e700a54ccf', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636355889644\"}'),
(506, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1636357044456\"}'),
(507, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636357044457\"}'),
(508, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636357044458\"}'),
(509, '320e3a68b8f4cd6765ca8f20d4b090ad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"8\",\"_\":\"1636357044459\"}'),
(510, '06aaafe5f8b98c1e236e66502136892c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636526921788\"}'),
(511, '06aaafe5f8b98c1e236e66502136892c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636526921789\"}'),
(512, '6b98939737f75cf89a8c119d7dce8fbb', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636529829974\"}'),
(513, '6b98939737f75cf89a8c119d7dce8fbb', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636530289734\"}'),
(514, 'ab9d00993ec8eb894c3ba825a065567f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636596081412\"}'),
(515, 'ab9d00993ec8eb894c3ba825a065567f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636596081413\"}'),
(516, 'ab9d00993ec8eb894c3ba825a065567f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"3\",\"_\":\"1636596081423\"}'),
(517, '3f98cbacb276b6416643d8a680b42118', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636601483300\"}'),
(518, 'dce5e6a9a036ba7466cbbc2b033ba3a6', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"listPrint\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636613996654\"}'),
(519, 'e6f6f349b0b0820be889e3cadba38f2c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636686943065\"}'),
(520, '3c79abf984a139c84ec09e6e93666e9c', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636701842261\"}'),
(521, '57bc732285c149e81a7d7ae1c6428e58', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636701949077\"}'),
(522, '57bc732285c149e81a7d7ae1c6428e58', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"2\",\"_\":\"1636701949078\"}'),
(523, '57bc732285c149e81a7d7ae1c6428e58', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"3\",\"_\":\"1636701949079\"}'),
(524, '2680525dde900d0088dcf84f1675305a', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"2\",\"_\":\"1636702159146\"}'),
(525, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"3\",\"_\":\"1636702327544\"}'),
(526, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636702327545\"}'),
(527, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636702327567\"}'),
(528, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636702327566\"}'),
(529, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636702327568\"}'),
(530, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636702327569\"}'),
(531, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"2\",\"_\":\"1636702327579\"}');
INSERT INTO `tm_export` (`id_export`, `session`, `json_data`) VALUES
(532, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636702327580\"}'),
(533, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636702327581\"}'),
(534, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"3\",\"_\":\"1636702327582\"}'),
(535, 'fda8d92f126753c1315636531782d00f', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"3\",\"_\":\"1636702327583\"}'),
(536, '2b533ac9d57d2d19720db32928dc7d4c', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636939763480\"}'),
(537, '64f77781dd86a2510d13910791530c53', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636947671018\"}'),
(538, '755f772d24f4e7cdc2f83b219d38d4fa', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636947743116\"}'),
(539, 'e813c1b96f4983f72352ece0d4eebe5d', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1636947786863\"}'),
(540, 'e813c1b96f4983f72352ece0d4eebe5d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636949351280\"}'),
(541, 'e813c1b96f4983f72352ece0d4eebe5d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1636949351281\"}'),
(542, 'e813c1b96f4983f72352ece0d4eebe5d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"6\",\"_\":\"1636949351282\"}'),
(543, '7abdbdca6b289cf449a9b25febf09910', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636957349460\"}'),
(544, '8266eb7bfa3ef23c57f16830da2dc46c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636959508095\"}'),
(545, 'e2a66d82e874087fb6f4aa38d0e68d9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636962832281\"}'),
(546, 'e2a66d82e874087fb6f4aa38d0e68d9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636962832282\"}'),
(547, 'e2a66d82e874087fb6f4aa38d0e68d9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636962832293\"}'),
(548, 'e2a66d82e874087fb6f4aa38d0e68d9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636962832304\"}'),
(549, 'e2a66d82e874087fb6f4aa38d0e68d9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636962832315\"}'),
(550, 'e2a66d82e874087fb6f4aa38d0e68d9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1636962832366\"}'),
(551, '607adf3a67979b8713036eaebe2f5c70', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1637024863944\"}'),
(552, '607adf3a67979b8713036eaebe2f5c70', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"2\",\"_\":\"1637024863945\"}'),
(553, '607adf3a67979b8713036eaebe2f5c70', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637024863956\"}'),
(554, 'bc9059aaf4229efef5416dfc5fbe9e7a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637042948111\"}'),
(555, 'bc9059aaf4229efef5416dfc5fbe9e7a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637042948122\"}'),
(556, 'bc9059aaf4229efef5416dfc5fbe9e7a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637042948123\"}'),
(557, 'bc9059aaf4229efef5416dfc5fbe9e7a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637042948124\"}'),
(558, 'd7144d7fadbb5aaa6c8b77e9b8b25720', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637133095589\"}'),
(559, '86cca97b235047bbf345b31883411c42', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637133875795\"}'),
(560, 'bc967e8833ec97ff0e9e05c62bf91931', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637133995227\"}'),
(561, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520454\"}'),
(562, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520455\"}'),
(563, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520456\"}'),
(564, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520457\"}'),
(565, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520458\"}'),
(566, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520459\"}'),
(567, '25b9d80ad7ff2899b03cd67c58ee130d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801800291\"}'),
(568, '25b9d80ad7ff2899b03cd67c58ee130d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801800292\"}'),
(569, '25b9d80ad7ff2899b03cd67c58ee130d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801800293\"}'),
(570, '25b9d80ad7ff2899b03cd67c58ee130d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801800294\"}'),
(571, '25b9d80ad7ff2899b03cd67c58ee130d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801800295\"}'),
(572, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520473\"}'),
(573, 'ee5ff789d2f8e89c9ae6a7b16ba96a8f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801520474\"}'),
(574, '25b9d80ad7ff2899b03cd67c58ee130d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637801800308\"}'),
(575, 'cef87a21fe58519e7c078ff43467d9dc', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1637803242325\"}'),
(576, 'a107715ca2c4f45be1ffa3925abee9ca', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637804773058\"}'),
(577, 'a107715ca2c4f45be1ffa3925abee9ca', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637804773059\"}'),
(578, 'a107715ca2c4f45be1ffa3925abee9ca', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1637804773204\"}'),
(579, 'a107715ca2c4f45be1ffa3925abee9ca', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1637804773205\"}'),
(580, 'a107715ca2c4f45be1ffa3925abee9ca', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637804773206\"}'),
(581, 'a107715ca2c4f45be1ffa3925abee9ca', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"10\",\"_\":\"1637804773207\"}'),
(582, '7960e44e269ede1c572bfbde33fc38e0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637808289537\"}'),
(583, '441516f48a66f257ae858050e08cff39', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637808378479\"}'),
(584, '441516f48a66f257ae858050e08cff39', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1637808378480\"}'),
(585, '441516f48a66f257ae858050e08cff39', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"7\",\"_\":\"1637808378481\"}'),
(586, '7c9a2433f75d7f350c9a2016b21b0b91', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637813933106\"}'),
(587, '77143e70d66bd9147676c1381e906833', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1637814955180\"}'),
(588, 'fb1a690447ab8783258be049d06ab372', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638152217284\"}'),
(589, 'f4f74cba40403c48543ffb806e99ec8e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638159381498\"}'),
(590, 'f4f74cba40403c48543ffb806e99ec8e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638159381499\"}'),
(591, '305c90b5076a758df51f65df8b80df6c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638248410350\"}'),
(592, '305c90b5076a758df51f65df8b80df6c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638248410357\"}'),
(593, '305c90b5076a758df51f65df8b80df6c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638248410358\"}'),
(594, '6d2652e3d78689a59c5d92668e674e2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638248876498\"}'),
(595, '6d2652e3d78689a59c5d92668e674e2e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638248876499\"}'),
(596, 'ef672dc5f188ee258b32721319581143', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"11\",\"_\":\"1638253531783\"}'),
(597, 'ef672dc5f188ee258b32721319581143', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"11\",\"_\":\"1638253531784\"}'),
(598, 'ef672dc5f188ee258b32721319581143', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"11\",\"_\":\"1638253531785\"}'),
(599, 'd2459c1fdfebabb7807b6aec8faca09f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"12\",\"_\":\"1638253743527\"}'),
(600, 'd2459c1fdfebabb7807b6aec8faca09f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"11\",\"_\":\"1638253743551\"}'),
(601, 'd2459c1fdfebabb7807b6aec8faca09f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"12\",\"_\":\"1638253743622\"}'),
(602, 'ef672dc5f188ee258b32721319581143', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638253531786\"}'),
(603, 'a699352ed37d1fcd2cb5b27cd7c891cd', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"9\",\"_\":\"1638253880487\"}'),
(604, '2a455b67641e947743ece1df3af75835', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"12\",\"_\":\"1638256536169\"}'),
(605, '2a455b67641e947743ece1df3af75835', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"11\",\"_\":\"1638256536170\"}'),
(606, '2a455b67641e947743ece1df3af75835', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"11\",\"_\":\"1638256536171\"}'),
(607, '2a455b67641e947743ece1df3af75835', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"12\",\"_\":\"1638256536172\"}'),
(608, 'f373417b12c37af58713eaba67edae5e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"12\",\"_\":\"1638321903903\"}'),
(609, '43162b4bc3f2d666ef4a0716d4d62a72', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"13\",\"_\":\"1638346052603\"}'),
(610, '43162b4bc3f2d666ef4a0716d4d62a72', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"13\",\"_\":\"1638346163244\"}'),
(611, 'babd806bbfc88402e02b83b13bd05f0a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"13\",\"_\":\"1638346187432\"}'),
(612, 'd3e9e3887b396030eb07da075184931d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"14\",\"_\":\"1638344640050\"}'),
(613, '9f0daca701499dff3ecf4a68382d23de', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"14\",\"_\":\"1638347773016\"}'),
(614, '9f0daca701499dff3ecf4a68382d23de', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"14\",\"_\":\"1638347773017\"}'),
(615, '2eb25585e839f6e6882867b8c8bb9e10', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"13\",\"_\":\"1638418857474\"}'),
(616, 'bb36245d94e2fa8f9041a650d660bed6', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"15\",\"_\":\"1638426564095\"}'),
(617, 'e1c8c2476b094274da68d00804ee4a24', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"15\",\"_\":\"1638430383727\"}'),
(618, 'fede8066121ac515d8d3bcab8ba5ef64', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"15\",\"_\":\"1638430603545\"}'),
(619, 'bb36245d94e2fa8f9041a650d660bed6', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"15\",\"_\":\"1638431100411\"}'),
(620, '8e95316b5ea544a82c5e73b57e120167', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"15\",\"_\":\"1638432571262\"}'),
(621, '8cdfaf81dc564c783fb78b5a50900694', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"44\",\"_\":\"1639363391330\"}'),
(622, '0683231d6842a31c02c7a74fd2929d8b', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"51\",\"_\":\"1639708923525\"}'),
(623, '0683231d6842a31c02c7a74fd2929d8b', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"51\",\"_\":\"1639708923526\"}'),
(624, '0683231d6842a31c02c7a74fd2929d8b', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"51\",\"_\":\"1639708923527\"}'),
(625, '729519fe666a0122ebab3e5ecdfb5437', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"53\",\"_\":\"1639966177703\"}'),
(626, '729519fe666a0122ebab3e5ecdfb5437', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"53\",\"_\":\"1639966177704\"}'),
(627, '729519fe666a0122ebab3e5ecdfb5437', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"53\",\"_\":\"1639966177705\"}'),
(628, 'efe6d9de623835a0633ba10f0be03e00', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"53\",\"_\":\"1639971370174\"}'),
(629, 'efe6d9de623835a0633ba10f0be03e00', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"53\",\"_\":\"1639971370175\"}'),
(630, 'efe6d9de623835a0633ba10f0be03e00', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"34\",\"_\":\"1639971370176\"}'),
(631, 'efe6d9de623835a0633ba10f0be03e00', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"43\",\"_\":\"1639971370177\"}'),
(632, 'efe6d9de623835a0633ba10f0be03e00', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"43\",\"_\":\"1639971370178\"}'),
(633, 'a8543ad9b895c19fe6efbea365e47e19', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"46\",\"_\":\"1639989764532\"}'),
(634, 'a8543ad9b895c19fe6efbea365e47e19', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"40\",\"_\":\"1639989764533\"}'),
(635, 'a3bdd2fff54c9e719bd434492b7c6fb0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"64\",\"_\":\"1640221877480\"}'),
(636, 'a3bdd2fff54c9e719bd434492b7c6fb0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"64\",\"_\":\"1640221877481\"}'),
(637, 'a3bdd2fff54c9e719bd434492b7c6fb0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"58\",\"_\":\"1640221877482\"}'),
(638, 'a3bdd2fff54c9e719bd434492b7c6fb0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"55\",\"_\":\"1640221877483\"}'),
(639, 'a3bdd2fff54c9e719bd434492b7c6fb0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"64\",\"_\":\"1640221877484\"}'),
(640, 'a3bdd2fff54c9e719bd434492b7c6fb0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"64\",\"_\":\"1640221877485\"}'),
(641, 'c1a810bc243508bfa4c0935d74117f76', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"64\",\"_\":\"1640222379871\"}'),
(642, 'c1a810bc243508bfa4c0935d74117f76', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"64\",\"_\":\"1640222379872\"}'),
(643, 'e3ad65b3a47094f8d7360d151b628ef7', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"64\",\"_\":\"1640232248052\"}'),
(644, 'e3ad65b3a47094f8d7360d151b628ef7', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"55\",\"_\":\"1640232248053\"}'),
(645, 'e3ad65b3a47094f8d7360d151b628ef7', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"12\",\"_\":\"1640232248054\"}'),
(646, '2c88cb29a0e6150c1ca3458f8252ca3a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"67\",\"_\":\"1640579564555\"}'),
(647, '71e3bb2bafc63fac16a4cf5552d03705', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"19\",\"_\":\"1641520102532\"}'),
(648, '71e3bb2bafc63fac16a4cf5552d03705', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"19\",\"_\":\"1641520102533\"}'),
(649, 'a2cc94aeccda33a3c9c92cfd7cd42184', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641519833179\"}'),
(650, 'a2cc94aeccda33a3c9c92cfd7cd42184', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641519833180\"}'),
(651, '71e3bb2bafc63fac16a4cf5552d03705', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641520102562\"}'),
(652, 'a2cc94aeccda33a3c9c92cfd7cd42184', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641519833212\"}'),
(653, 'a2cc94aeccda33a3c9c92cfd7cd42184', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641519833213\"}'),
(654, 'a2cc94aeccda33a3c9c92cfd7cd42184', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641519833214\"}'),
(655, '946851dd6152f9141e0a344a9d6dce26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641520946557\"}'),
(656, '946851dd6152f9141e0a344a9d6dce26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641520946558\"}'),
(657, '946851dd6152f9141e0a344a9d6dce26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641520946559\"}'),
(658, '946851dd6152f9141e0a344a9d6dce26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641520946560\"}'),
(659, '946851dd6152f9141e0a344a9d6dce26', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641520946561\"}'),
(660, '5e5e69845c079f241aca3fd634334a6d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641521217094\"}'),
(661, '5e5e69845c079f241aca3fd634334a6d', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641521217095\"}'),
(662, 'f09cbf504c12a2f375b3fabfedf55a9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641521181669\"}'),
(663, 'f09cbf504c12a2f375b3fabfedf55a9e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641521181670\"}'),
(664, 'c8259f82d0ce87b0d3b1d70d8ebe3c0a', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641781407232\"}'),
(665, '6e2aadb08f68b6a53635035004728fa0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641796972178\"}'),
(666, 'dde2594d7222ba88585bb556003bcfb8', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641887223790\"}'),
(667, '2fadf94eab74a8a3f8e18a45196fceaf', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"69\",\"_\":\"1641887408601\"}'),
(668, '2fadf94eab74a8a3f8e18a45196fceaf', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641887408701\"}'),
(669, '2fadf94eab74a8a3f8e18a45196fceaf', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"70\",\"_\":\"1641887408702\"}'),
(670, 'a502572e83d059d54e08145217e7da7b', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"71\",\"_\":\"1641952034750\"}'),
(671, 'a87a6b58f3477a6c91a9af1e38742c85', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"71\",\"_\":\"1641953651090\"}'),
(672, 'a87a6b58f3477a6c91a9af1e38742c85', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"71\",\"_\":\"1641953651091\"}'),
(673, 'a87a6b58f3477a6c91a9af1e38742c85', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"71\",\"_\":\"1641953651092\"}'),
(674, 'fced63899c6135f8022d667169a96b57', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"71\",\"_\":\"1641959275129\"}'),
(675, '39e375c9fd0e21fdb4b117d1e19b6854', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"71\",\"_\":\"1641970006867\"}'),
(676, '39e375c9fd0e21fdb4b117d1e19b6854', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"71\",\"_\":\"1641971907051\"}'),
(677, '16086e99dcb1d90816eb75eeb8e5f426', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642143122249\"}'),
(678, '16086e99dcb1d90816eb75eeb8e5f426', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642143122250\"}'),
(679, 'a9d905d95913963fb86bd2f603fb9ddb', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642145101074\"}'),
(680, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642382531094\"}'),
(681, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642382531095\"}'),
(682, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"73\",\"_\":\"1642382531096\"}'),
(683, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642382531097\"}'),
(684, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"73\",\"_\":\"1642382531098\"}'),
(685, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642382531099\"}'),
(686, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642382531100\"}'),
(687, '8daccdc20448defbae5f4cc12f8c6633', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"73\",\"_\":\"1642382531133\"}'),
(688, '50fe367d34c19645a68580f38dee5756', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642383892505\"}'),
(689, '50fe367d34c19645a68580f38dee5756', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642383892512\"}'),
(690, '865bbf48eafe3c8ed2f965eb1bdf1539', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"76\",\"_\":\"1642387216244\"}'),
(691, '865bbf48eafe3c8ed2f965eb1bdf1539', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"76\",\"_\":\"1642387216245\"}'),
(692, '865bbf48eafe3c8ed2f965eb1bdf1539', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"77\",\"_\":\"1642387216563\"}'),
(693, '5617af7efd992dc436fff6c118424f61', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642471994536\"}'),
(694, '82eafd9f35a47e06b3f5ab68b0fcc5b9', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642477958557\"}'),
(695, '5617af7efd992dc436fff6c118424f61', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"72\",\"_\":\"1642471994547\"}'),
(696, '48b0466c434a1b2b7a28ae80ecfb9ae2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"79\",\"_\":\"1642575357993\"}'),
(697, '48b0466c434a1b2b7a28ae80ecfb9ae2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"79\",\"_\":\"1642575357994\"}'),
(698, 'c73aa5b09b8ffb7a92ea855d5b2bd419', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"78\",\"_\":\"1642639782060\"}'),
(699, '81a763b511a3e92a1028e7e6c97a10ec', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"78\",\"_\":\"1642660303829\"}'),
(700, 'b33a130d4a9f7e3950e530f11ade6c6c', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"83\",\"_\":\"1642733856524\"}'),
(701, '1e3dace7c8917ee107ff9953c3cf6465', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"88\",\"_\":\"1642736706500\"}'),
(702, '6b802947b862d380d4b9a293abc10a3e', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"83\",\"_\":\"1642759495668\"}'),
(703, 'e2d46129aa4fae7ba1e35f837e07ee6f', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"83\",\"_\":\"1643006710483\"}'),
(704, 'b145fb9f4f400f5b67bce7c3dc22d58b', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"93\",\"_\":\"1643093367838\"}'),
(705, '2672abd4df76a4141ae5a29214492b43', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"100\",\"_\":\"1643331248315\"}'),
(706, '2672abd4df76a4141ae5a29214492b43', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"100\",\"_\":\"1643331248316\"}'),
(707, '77c763da2f6f0fbd67d75a5421392a39', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"281\",\"_\":\"1648781346354\"}'),
(708, 'ddeb83b15151545301c4e2b0b8f8daad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"466\",\"_\":\"1655192559352\"}'),
(709, 'ddeb83b15151545301c4e2b0b8f8daad', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"466\",\"_\":\"1655192559353\"}'),
(710, '2833172f07813ad6f2a363b1a272c2f5', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"576\",\"_\":\"1656985778559\"}'),
(711, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1663034239295\"}'),
(712, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1663034239296\"}'),
(713, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"716\",\"_\":\"1663034239297\"}'),
(714, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"713\",\"_\":\"1663034239298\"}'),
(715, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"709\",\"_\":\"1663034239299\"}'),
(716, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"709\",\"_\":\"1663034239300\"}'),
(717, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"707\",\"_\":\"1663034239301\"}'),
(718, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"707\",\"_\":\"1663034239302\"}'),
(719, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"707\",\"_\":\"1663034239303\"}'),
(720, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1663034239329\"}'),
(721, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"11\",\"_\":\"1663034239330\"}'),
(722, 'c5100c1ef36c8ddb88ac001df6675ab4', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"57\",\"_\":\"1663034239331\"}'),
(723, 'efbd067398cafc4be266026a353a22a2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1665542596840\"}'),
(724, 'efbd067398cafc4be266026a353a22a2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"719\",\"_\":\"1665543693476\"}'),
(725, 'efbd067398cafc4be266026a353a22a2', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1665543693477\"}'),
(726, '8423ffc5a7a65ca48acbed647b562de7', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1669342130042\"}'),
(727, '8423ffc5a7a65ca48acbed647b562de7', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1669342130043\"}'),
(728, '03b880094413aefc2ddccc755b3f3ab0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1669682169842\"}'),
(729, '03b880094413aefc2ddccc755b3f3ab0', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"717\",\"_\":\"1669682169843\"}'),
(730, '03b880094413aefc2ddccc755b3f3ab0', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1669682169879\"}'),
(731, 'e028a06b2ee7a44a8a9de550229fddf6', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"63\",\"_\":\"1678759588790\"}'),
(732, '02ab5e0ce5c0c78c63799b9086ab57b3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"936\",\"_\":\"1680050997235\"}'),
(733, '02ab5e0ce5c0c78c63799b9086ab57b3', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"936\",\"_\":\"1680050997236\"}'),
(734, '2c68eff826c83cc44d1f0176b34187c1', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"936\",\"_\":\"1686192896683\"}'),
(735, '2c68eff826c83cc44d1f0176b34187c1', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"1\",\"_\":\"1686192896712\"}'),
(736, '2c68eff826c83cc44d1f0176b34187c1', '{\"Module\":\"LowonganPekerjaan\",\"option\":\"PUBLIC\",\"action\":\"laporanak3\",\"export_type\":\"stream\",\"id_lowongan_pekerjaan\":\"8\",\"_\":\"1686192896713\"}'),
(737, '729981f7c46c07e6d3963d93d82460fc', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"1733\",\"_\":\"1694060681535\"}'),
(738, '729981f7c46c07e6d3963d93d82460fc', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak2\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"1733\",\"_\":\"1694060681536\"}'),
(739, '729981f7c46c07e6d3963d93d82460fc', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"1732\",\"_\":\"1694060681537\"}'),
(740, '729981f7c46c07e6d3963d93d82460fc', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"1731\",\"_\":\"1694060681538\"}'),
(741, '729981f7c46c07e6d3963d93d82460fc', '{\"Module\":\"PencariKerja\",\"option\":\"PUBLIC\",\"action\":\"laporanak1\",\"export_type\":\"stream\",\"id_pencari_kerja\":\"1724\",\"_\":\"1694060681539\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(32) NOT NULL,
  `id` int NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `level_id` int DEFAULT NULL,
  `level_name` varchar(255) DEFAULT NULL,
  `wallPaper` varchar(45) DEFAULT 'Desk',
  `theme` varchar(45) DEFAULT 'blue',
  `wpStretch` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `param01` varchar(255) DEFAULT NULL,
  `param02` varchar(255) DEFAULT NULL,
  `param03` varchar(255) DEFAULT NULL,
  `param04` varchar(255) DEFAULT NULL,
  `param05` varchar(255) DEFAULT NULL,
  `param06` varchar(255) DEFAULT NULL,
  `param07` varchar(255) DEFAULT NULL,
  `param08` varchar(255) DEFAULT NULL,
  `param09` varchar(255) DEFAULT NULL,
  `param10` varchar(255) DEFAULT NULL,
  `isadmin` int NOT NULL DEFAULT '0',
  `method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `id`, `username`, `password`, `nama`, `email`, `level_id`, `level_name`, `wallPaper`, `theme`, `wpStretch`, `active`, `param01`, `param02`, `param03`, `param04`, `param05`, `param06`, `param07`, `param08`, `param09`, `param10`, `isadmin`, `method`) VALUES
('admin', 1, 'admin', '5007007bf0d84200644731d5d3bf9aff', 'Administrator', 'admin@arkanweb.com', 0, '', '', '', 0, 1, '2024', 'xx', '', '', '', '21232f297a57', '', 'Dummy', '', '', 1, 'xgnkk'),
('arkan', 2, 'arkan', '1341215dbe9acab4361fd6417b2b11bc', 'arkan herawan', 'admin@arkanweb.com', 1, NULL, 'Desk', 'blue', 0, 1, '2018', 'xx', NULL, NULL, NULL, NULL, NULL, 'Dummy', NULL, NULL, 1, NULL),
('user', 3, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', 'operator@gmail.com', 1, NULL, 'Desk', 'blue', 0, 1, '2018', 'xx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
('196910151998031009', 4, '196910151998031009', 'be7d74af8518871233bfb87d43a8fa8f', 'Agaeral', '196910151998031009@slemankab.go.id', 1, NULL, 'Desk', 'blue', NULL, 1, NULL, NULL, 'Kesra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
('197212171999031001', 5, '197212171999031001', '39f634a66b7313d2f03a25f6170dddf3', 'Imran Satriyadi', '197212171999031001@slemankab.go.id', 1, NULL, 'Desk', 'blue', NULL, 1, NULL, NULL, 'Dinas Pendidikan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
('naker', 39, 'naker', 'eed846f6a4200fe7ad1452b488d931e4', 'Administrator Dinas Tenaga Kerja', 'naker.sleman@slemankab.go.id', 1, '', '', '', 0, 1, '2021', 'xx', '', '', '', '', '', 'Dummy', '', '', 1, NULL),
('test', 40, 'test', 'e10adc3949ba59abbe56e057f20f883e', 'test1', 'test@yahoo.com', 1, NULL, 'Desk', 'blue', NULL, 1, '2021', NULL, NULL, NULL, NULL, '098f6bcd4621', NULL, NULL, NULL, NULL, 1, NULL),
('admnaker1', 42, 'admnaker1', '80fe204fcf719ccba76887d9c083ac81', 'Admin Naker 1', 'disnaker@slemankab.go.id', 1, NULL, 'Desk', 'blue', NULL, 1, '2021', NULL, NULL, NULL, NULL, '58399d710c18', NULL, NULL, NULL, NULL, 1, NULL),
('admnaker2', 43, 'admnaker2', 'ed2c8769be35fe70963e6906efb32218', 'Admin Naker 2', 'disnaker@slemankab.go.id', 1, NULL, 'Desk', 'blue', NULL, 1, '2021', NULL, NULL, NULL, NULL, '514be4719366', NULL, NULL, NULL, NULL, 1, NULL),
('admnaker3', 44, 'admnaker3', 'fd8bd1f337bac467b0a45d6950bb56f9', 'Admin Naker 3', 'disnaker@slemankab.go.id', 1, NULL, 'Desk', 'blue', NULL, 1, '2021', NULL, NULL, NULL, NULL, '4209b63aa7eb', NULL, NULL, NULL, NULL, 1, NULL),
('adminpkl', 45, 'adminpkl', '0a7f141be0d37fae22ef27a02da7c9fb', 'Admin PKL', 'admin@slemankab.go.id', 1, NULL, 'Desk', 'blue', NULL, 1, '2022', NULL, NULL, NULL, NULL, '0a7f141be0d3', NULL, NULL, NULL, NULL, 1, NULL),
('ngadminpro', 46, 'ngadminpro', '58fd608026c8ff4a99f114c0057e5a12', 'Admin Naker Pro', 'naker@gmail.com', 1, NULL, 'Desk', 'blue', NULL, 1, '2021', NULL, NULL, NULL, NULL, '00d88abcdf7d', NULL, NULL, NULL, NULL, 1, 'xgnkk'),
('kominfo', 47, 'kominfo', 'dc2f4ef676263fe9dde73a9ae6299258', 'kominfo', 'kominfo@slemankab.go.id', 1, NULL, 'Desk', 'blue', NULL, 1, '2024', NULL, NULL, NULL, NULL, 'dc2f4ef67626', NULL, NULL, NULL, NULL, 1, 'xgnkk'),
('dedydc', 48, 'dedydc', '01cfcd4f6b8770febfb40cb906715822', 'Dedy Dwi Cahyono', 'dedydc@slemankab.go.id', 0, NULL, 'Desk', 'blue', NULL, 1, '2024', NULL, NULL, NULL, NULL, '53eb3347c4e6', NULL, NULL, NULL, NULL, 0, 'xgnkk');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_actions`
--

CREATE TABLE `user_has_actions` (
  `id` int NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `module_id` varchar(100) DEFAULT NULL,
  `action_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_has_actions`
--

INSERT INTO `user_has_actions` (`id`, `user_id`, `module_id`, `action_id`) VALUES
(10252, 'admin', 'sistem-kepegawaian', 'kepegawaian_view'),
(10253, 'admin', 'dashboard', 'dashboard_view'),
(10254, 'admin', 'drawer-app', 'dm_list'),
(10255, 'admin', 'aplikasi-terintegrasi', 'integrated_view'),
(10256, 'admin', 'aplikasi-terintegrasi', 'login_dalev'),
(10257, 'admin', 'aplikasi-terintegrasi', 'login_sakip'),
(10258, 'admin', 'aplikasi-terintegrasi', 'login_sakipbaru'),
(10259, 'admin', 'aplikasi-terintegrasi', 'login_siad'),
(10260, 'admin', 'aplikasi-terintegrasi', 'login_simlppd'),
(10261, 'admin', 'aplikasi-terintegrasi', 'login_simon'),
(10262, 'admin', 'aplikasi-terintegrasi', 'login_simpeg'),
(10263, 'admin', 'aplikasi-terintegrasi', 'login_simrenda'),
(10264, 'admin', 'aplikasi-terintegrasi', 'login_teppa'),
(10301, 'admin', 'code-module', 'action_list'),
(10302, 'admin', 'code-module', 'cm_delete'),
(10303, 'admin', 'code-module', 'code_module_run'),
(10304, 'admin', 'code-module', 'insert_action'),
(10305, 'admin', 'code-module', 'insert_module'),
(10306, 'admin', 'code-module', 'module_edit'),
(10307, 'admin', 'code-module', 'module_list'),
(10308, 'admin', 'sample-module', 'sample_list'),
(10309, 'admin', 'sample-window', 'sample_list'),
(10310, 'admin', 'userinfo', 'userinfo_getDataUser'),
(10311, 'admin', 'userinfo', 'userinfo_save'),
(10312, 'admin', 'userinfo', 'userinfo_savePassword'),
(10313, 'admin', 'userunit', 'unit_list'),
(10314, 'admin', 'userunit', 'userunit_view'),
(10315, 'admin', 'log-activity', 'log_list'),
(10316, 'admin', 'log-activity', 'session_list'),
(10317, 'admin', 'userotoritas', 'group_add'),
(10318, 'admin', 'userotoritas', 'group_addUser'),
(10319, 'admin', 'userotoritas', 'group_del'),
(10320, 'admin', 'userotoritas', 'group_delUser'),
(10321, 'admin', 'userotoritas', 'group_edit'),
(10322, 'admin', 'userotoritas', 'group_list'),
(10323, 'admin', 'userotoritas', 'group_listUser'),
(10324, 'admin', 'userotoritas', 'group_listUserAll'),
(10325, 'admin', 'userotoritas', 'userotoritas_add'),
(10326, 'admin', 'userotoritas', 'userotoritas_del'),
(10327, 'admin', 'userotoritas', 'userotoritas_edit'),
(10328, 'admin', 'userotoritas', 'userotoritas_export'),
(10329, 'admin', 'userotoritas', 'userotoritas_list'),
(10330, 'admin', 'userotoritas', 'userotoritas_listUserGroup'),
(10331, 'admin', 'userotoritas', 'userotoritas_print'),
(10332, 'admin', 'userotoritas', 'userotoritas_save'),
(10333, 'admin', 'logeduserinfo', 'logeduserinfo_getLoged'),
(10334, 'admin', 'logeduserinfo', 'logeduserinfo_save'),
(10335, 'admin', 'logeduserinfo', 'logeduserinfo_savePassword'),
(10336, 'admin', 'usermanagement', 'group_list'),
(10337, 'admin', 'usermanagement', 'user_add'),
(10338, 'admin', 'usermanagement', 'user_delete'),
(10339, 'admin', 'usermanagement', 'user_list'),
(10340, 'admin', 'setting-aplikasi', 'aplikasi_delete'),
(10341, 'admin', 'setting-aplikasi', 'aplikasi_edit'),
(10342, 'admin', 'setting-aplikasi', 'aplikasi_insert'),
(10343, 'admin', 'setting-aplikasi', 'aplikasi_list'),
(10344, 'admin', 'setting-aplikasi', 'grup_list'),
(11696, 'admin', 'daftar-tamu', 'tamu_view'),
(11697, 'admin', 'daftar-kunjungan', 'kunjungan_view'),
(11698, 'admin', 'data-magang', 'magang_view');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_instansi`
--

CREATE TABLE `user_has_instansi` (
  `id` int NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `id_instansi` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_has_instansi`
--

INSERT INTO `user_has_instansi` (`id`, `user_id`, `tahun`, `id_instansi`) VALUES
(65, 'admin', 2014, 1),
(66, 'admin', 2014, 2),
(67, 'admin', 2014, 3),
(68, 'admin', 2014, 4),
(69, 'admin', 2014, 5),
(70, 'admin', 2014, 6),
(71, 'admin', 2014, 7),
(72, 'admin', 2014, 8),
(73, 'admin', 2014, 9),
(74, 'admin', 2014, 10),
(75, 'admin', 2014, 11),
(76, 'admin', 2014, 12),
(77, 'admin', 2014, 13),
(78, 'admin', 2014, 14),
(79, 'admin', 2014, 15),
(80, 'admin', 2014, 16),
(81, 'admin', 2014, 18),
(82, 'admin', 2014, 49),
(83, 'admin', 2014, 17),
(84, 'admin', 2014, 21),
(85, 'admin', 2014, 22),
(86, 'admin', 2014, 23),
(87, 'admin', 2014, 24),
(88, 'admin', 2014, 25),
(89, 'admin', 2014, 26),
(90, 'admin', 2014, 27),
(91, 'admin', 2014, 28),
(92, 'admin', 2014, 29),
(93, 'admin', 2014, 30),
(94, 'admin', 2014, 31),
(95, 'admin', 2014, 32),
(96, 'admin', 2014, 33),
(97, 'admin', 2014, 34),
(98, 'admin', 2014, 35),
(99, 'admin', 2014, 36),
(100, 'admin', 2014, 37),
(101, 'admin', 2014, 38),
(102, 'admin', 2014, 39),
(103, 'admin', 2014, 40),
(104, 'admin', 2014, 41),
(105, 'admin', 2014, 42),
(106, 'admin', 2014, 43),
(107, 'admin', 2014, 44),
(108, 'admin', 2014, 45),
(109, 'admin', 2014, 50),
(110, 'admin', 2014, 46),
(111, 'admin', 2014, 47),
(112, 'admin', 2014, 48);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_modules`
--

CREATE TABLE `user_has_modules` (
  `id` int NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `module_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_has_modules`
--

INSERT INTO `user_has_modules` (`id`, `user_id`, `module_id`) VALUES
(2441, 'admin', 'sistem-kepegawaian'),
(2442, 'admin', 'dashboard'),
(2443, 'admin', 'drawer-app'),
(2444, 'admin', 'aplikasi-terintegrasi'),
(2445, 'admin', 'daftar-mdgs'),
(2446, 'admin', 'add-pilar'),
(2447, 'admin', 'add-target'),
(2448, 'admin', 'add-tujuan'),
(2449, 'admin', 'upload-file'),
(2450, 'admin', 'add-indikator'),
(2451, 'admin', 'upload-filekegiatan'),
(2452, 'admin', 'grafik-indikator'),
(2453, 'admin', 'indikator-instansi'),
(2454, 'admin', 'kegiatan-program'),
(2455, 'admin', 'indikator-kegiatan'),
(2456, 'admin', 'kegiatan-hasindikator'),
(2457, 'admin', 'laporan'),
(2458, 'admin', 'laporan-kegiatan'),
(2459, 'admin', 'target-realisasi'),
(2460, 'admin', 'kegiatan-targetreal'),
(2461, 'admin', 'code-module'),
(2462, 'admin', 'sample-module'),
(2463, 'admin', 'sample-window'),
(2464, 'admin', 'userinfo'),
(2465, 'admin', 'userunit'),
(2466, 'admin', 'log-activity'),
(2467, 'admin', 'userotoritas'),
(2468, 'admin', 'logeduserinfo'),
(2469, 'admin', 'usermanagement'),
(2470, 'admin', 'setting-aplikasi'),
(2879, 'admin', 'daftar-tamu'),
(2880, 'admin', 'daftar-kunjungan'),
(2881, 'admin', 'data-magang');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_unit`
--

CREATE TABLE `user_has_unit` (
  `user_id` varchar(50) NOT NULL,
  `id_unit_kerja` int NOT NULL,
  `kode_unit_kerja` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_has_unit`
--

INSERT INTO `user_has_unit` (`user_id`, `id_unit_kerja`, `kode_unit_kerja`) VALUES
('admin', 58, '03'),
('admin', 45, '02'),
('admin', 67, '04'),
('admin', 1371, '05'),
('admin', 1398, '47'),
('admin', 1411, '48'),
('admin', 1465, '06'),
('admin', 1501, '07'),
('admin', 1515, '08'),
('admin', 1532, '09'),
('admin', 1545, '10'),
('admin', 1560, '11'),
('admin', 1571, '12'),
('admin', 1590, '13'),
('admin', 1642, '14'),
('admin', 1660, '15'),
('admin', 1673, '16'),
('admin', 1687, '17'),
('admin', 1704, '18'),
('admin', 1722, '19'),
('admin', 1734, '20'),
('admin', 1755, '21'),
('admin', 1770, '22'),
('admin', 1785, '23'),
('admin', 1798, '24'),
('admin', 1831, '25'),
('admin', 1849, '26'),
('admin', 1873, '27'),
('admin', 1905, '28'),
('admin', 1918, '29'),
('admin', 1932, '30'),
('admin', 1941, '31'),
('admin', 1950, '32'),
('admin', 1959, '33'),
('admin', 1968, '34'),
('admin', 1977, '35'),
('admin', 1986, '36'),
('admin', 1995, '37'),
('admin', 2004, '38'),
('admin', 2013, '39'),
('admin', 2022, '40'),
('admin', 2031, '41'),
('admin', 2040, '42'),
('admin', 2049, '43'),
('admin', 2058, '44'),
('admin', 2067, '45'),
('admin', 2076, '46'),
('admin', 1, '01'),
('admin', 5967, '49'),
('arkan', 363, '1.01.01.01'),
('arkan', 364, '1.01.02.01'),
('arkan', 365, '1.01.02.02'),
('arkan', 366, '1.01.02.03'),
('arkan', 368, '1.01.05.01'),
('arkan', 369, '1.01.06.01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`module_id`,`action_id`),
  ADD KEY `module_id` (`module_id`) USING BTREE,
  ADD KEY `action_id` (`action_id`) USING BTREE;

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`) USING BTREE;

--
-- Indexes for table `group_has_actions`
--
ALTER TABLE `group_has_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `action_id` (`action_id`) USING BTREE,
  ADD KEY `module_id` (`module_id`) USING BTREE;

--
-- Indexes for table `group_has_modules`
--
ALTER TABLE `group_has_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `module_id` (`module_id`) USING BTREE;

--
-- Indexes for table `group_has_users`
--
ALTER TABLE `group_has_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `log_activity_ix_session_id` (`session_id`(32)) USING BTREE;

--
-- Indexes for table `log_login_failed`
--
ALTER TABLE `log_login_failed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `magang`
--
ALTER TABLE `magang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `reff_keperluan`
--
ALTER TABLE `reff_keperluan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reff_unit_kerja`
--
ALTER TABLE `reff_unit_kerja`
  ADD PRIMARY KEY (`id_unit_kerja`),
  ADD UNIQUE KEY `reff_unique_uker` (`tahun_sotk`,`kode_unit_kerja`),
  ADD KEY `reff_unit_kerja_id_jenis_jabatan` (`id_jenis_jabatan`),
  ADD KEY `reff_unit_kerja_aktif` (`aktif`),
  ADD KEY `reff_unit_kerja_tahun_sotk` (`tahun_sotk`),
  ADD KEY `reff_unit_kerja_idx1` (`kode_unit_kerja`) USING BTREE;

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`,`user_id`,`username`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tamu_id_IDX` (`id`) USING BTREE;

--
-- Indexes for table `tm_export`
--
ALTER TABLE `tm_export`
  ADD PRIMARY KEY (`id_export`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `user_has_actions`
--
ALTER TABLE `user_has_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `user_has_instansi`
--
ALTER TABLE `user_has_instansi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_has_modules`
--
ALTER TABLE `user_has_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `group_has_actions`
--
ALTER TABLE `group_has_actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64584;

--
-- AUTO_INCREMENT for table `group_has_modules`
--
ALTER TABLE `group_has_modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16848;

--
-- AUTO_INCREMENT for table `group_has_users`
--
ALTER TABLE `group_has_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=713;

--
-- AUTO_INCREMENT for table `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;

--
-- AUTO_INCREMENT for table `log_login_failed`
--
ALTER TABLE `log_login_failed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2836;

--
-- AUTO_INCREMENT for table `magang`
--
ALTER TABLE `magang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reff_keperluan`
--
ALTER TABLE `reff_keperluan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reff_unit_kerja`
--
ALTER TABLE `reff_unit_kerja`
  MODIFY `id_unit_kerja` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tm_export`
--
ALTER TABLE `tm_export`
  MODIFY `id_export` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=742;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_has_actions`
--
ALTER TABLE `user_has_actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11699;

--
-- AUTO_INCREMENT for table `user_has_instansi`
--
ALTER TABLE `user_has_instansi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `user_has_modules`
--
ALTER TABLE `user_has_modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2882;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
