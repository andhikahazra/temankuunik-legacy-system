<?php

class EntryPesan extends Database
{
    private $active_user_id = null;

    function __construct()
    {
        parent::__construct();
    }



    public function save_data()
    {
        $params = isset($_GET) ? $_GET : $_POST;


        $data = $params['data'];
        $userParams = $this->getUserParams();
        $userParams = json_decode($userParams, true);
        $usernya = $userParams[0]['username'];
        $user_id = $userParams[0]['user_id'];

        // print_r($userParams);exit();
        // Mengambil nomor telepon
        $nomor_telepon = $this->sanitize_input($data[0]['value']);

        // Mengambil isi pesan
        $isi_pesan = $this->sanitize_input($data[1]['value']);

         // Mengambil isi footer
        $isi_footer = $this->sanitize_input($data[2]['value']);

        // print_r($nomor_telepon);exit();
        $urlapi = 'https://interop.slemankab.go.id/api/';
        $method = $userParams[0]['method']; // isinya xgnkk diambil diparam user
        
        $url = $urlapi."".$method;
        // print_r($url);exit();

        // Data yang akan dikirim
        $data = [
            'phone' => $nomor_telepon,
            'message' => $isi_pesan . "\n\n" . $isi_footer
        ];

        // Header Authorization
        $headers = [
            'Authorization: Basic MjIycGZwdmI6VWV1NjIyd3hOUjVudG5SRm1pdFZRN1d2SFRNSVdmZ28='
        ];

        // Inisialisasi cURL
        $ch = curl_init();

        // Set opsi cURL
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Eksekusi cURL
        // $response = curl_exec($ch);
        
        $response = curl_exec($ch);
        $err = curl_error($ch);

        curl_close($ch);

       if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            // echo $response;exit;

            $hasil = json_decode($response,true);
            // print_r($hasil);exit();
            
            if (isset($hasil['success']) && $hasil['success'] === false) {

                $sqladmin = "INSERT into log_pesanwa (
                                nomor_telepon,
                                url,
                                data,
                                isi_pesan,
                                user_id,
                                user_insert,
                                tgl_insert,
                                status,
                                response) 
                            VALUES (
                                '".$nomor_telepon."',
                                '".$url."', 
                                '".json_encode($data)."',
                                '".$isi_pesan."',
                                '".$user_id."',
                                '".$usernya."',
                                NOW(),0,
                                '".json_encode($hasil)."')";
                                
                $this->dbFwExecute($sqladmin);

                echo '{"success":"false", "msg": "Pesan Gagal Dikirim :'.$hasil['msg'].'"}';

            } elseif (isset($hasil['_data'])) {
            

                $sqladmin = "INSERT into log_pesanwa (
                             nomor_telepon,
                             url,
                             data,
                             isi_pesan,
                             user_id,
                             user_insert,
                             tgl_insert,
                             status) 
                        VALUES (
                            '".$nomor_telepon."',
                            '".$url."',
                            '".json_encode($data)."',
                            '".$isi_pesan."',
                            '".$user_id."',
                            '".$usernya."',
                            NOW(),
                            1)";
         
                $this->dbFwExecute($sqladmin, $params);

                echo '{"success":"true", "msg":"Pesan Berhasil Dikirim!"}';

            } else {

                // Menangani respons yang tidak dikenal
                echo "Format respons API tidak dikenal.";
            }

          
        }

        // Cek apakah ada error
       /* if ($err) {

             $sqladmin = "INSERT into log_pesanwa (nomor_telepon,url,data,isi_pesan,user_id,user_insert,tgl_insert,status,response) 
                            VALUES ('".$nomor_telepon."', '".$url."',  '".json_encode($data)."', '".$isi_pesan."', '".$user_id."', '".$usernya."', NOW(),0, '".curl_error($ch)."')";
                                
             $this->dbFwExecute($sqladmin, $params);

            // echo '{"success":"false", "msg":"Pesan Gagal Dikirim!"}';
            echo 'Error:' . curl_error($ch);
        } else {

            $sqladmin = "INSERT into log_pesanwa (nomor_telepon,url,data,isi_pesan,user_id,user_insert,tgl_insert,status) 
                            VALUES ('".$nomor_telepon."', '".$url."',  '".json_encode($data)."', '".$isi_pesan."', '".$user_id."', '".$usernya."', NOW(), 1)";
            // print_r($response);exit;
            $this->dbFwExecute($sqladmin, $params);

            echo '{"success":"true", "msg":"Pesan Berhasil Dikirim!"}';
        }*/

        // Tutup cURL
        // curl_close($ch);



    }


    // public function PUBLIC_bidangList($ret = false)
    // {
    //     $params = isset($_GET) ? $_GET : $_POST;
    //     $userParams = $this->getUserParams();
    //     $userParams = json_decode($userParams, true);
    //     $sql  = "SELECT * FROM tr_bidang";
    //     if ($ret) {
    //         return $this->dbFwSelectAndReturnAll($sql, null, true);
    //     } else {
    //         echo $this->dbFwSelectAndReturnAll($sql);
    //     }
    // }
    // public function PUBLIC_groupList($ret = false)
    // {
    //     $params = isset($_GET) ? $_GET : $_POST;
    //     $userParams = $this->getUserParams();
    //     $userParams = json_decode($userParams, true);
    //     // print_r($userParams[0]['username']);exit();
    //     $usernya = $userParams[0]['username'];
    //     $sql  = "SELECT
    //               c.id_unit_kerja,
    //               reff.user_id,
    //               reff.username,
    //               reff.nama,
    //               reff.email,
    //               b.group_id,
    //               b.isi_footer
    //             FROM
    //               users reff
    //               LEFT JOIN group_has_users a
    //                 ON reff.`user_id` = a.`user_id`
    //               LEFT JOIN groups b
    //                 ON a.`group_id` = b.`group_id`
    //               LEFT JOIN user_has_unit c
    //                 ON reff.user_id = c.user_id
    //             WHERE reff.`user_id` = '$usernya'
    //             GROUP BY user_id";
    //     if ($ret) {
    //         return $this->dbFwSelectAndReturnAll($sql, null, true);
    //     } else {
    //         echo $this->dbFwSelectAndReturnAll($sql);
    //     }
    // }
    // public function PUBLIC_providerList($ret = false)
    // {
    //     $params = isset($_GET) ? $_GET : $_POST;
    //     $userParams = $this->getUserParams();
    //     $userParams = json_decode($userParams, true);
    //     $sql  = "SELECT * FROM provider_2019";
    //     if ($ret) {
    //         return $this->dbDataSelectAndReturnAll($sql, null, true);
    //     } else {
    //         echo $this->dbDataSelectAndReturnAll($sql);
    //     }
    // }
    // public function PUBLIC_sifatList($ret = false)
    // {
    //     $params = isset($_GET) ? $_GET : $_POST;
    //     $userParams = $this->getUserParams();
    //     $userParams = json_decode($userParams, true);
    //     $sql  = "SELECT * FROM tr_sifat_surat";
    //     if ($ret) {
    //         return $this->dbFwSelectAndReturnAll($sql, null, true);
    //     } else {
    //         echo $this->dbFwSelectAndReturnAll($sql);
    //     }
    // }
    // public function PUBLIC_unitkerjaList2()
    // {
    //     $params = isset($_GET) ? $_GET : $_POST;
    //     $os = new Os();
    //     $user_id = $os->getUserLogin();
    //     $sql  = "SELECT kode_unit_kerja from user_has_unit where user_id='$user_id'";
    //     //echo $this->debugSql($sql,$params);exit();
    //     $kode_unit_kerja = $this->dbFwGetValue($sql, null);
    //     $kode_unit_kerja = substr($kode_unit_kerja, 0, 2);

    //     $sql  = "
    //             SELECT *, reff.id_unit_kerja, reff.nama_unit_kerja_lengkap AS `text`
    //                 FROM reff_unit_kerja reff
    //                 LEFT JOIN user_has_unit a
    //                 ON a.`id_unit_kerja`=reff.`id_unit_kerja`
                  
    //                 WHERE reff.kode_unit_kerja_parent LIKE '$kode_unit_kerja%'
    //            ";
    //     // echo $this->debugSql($sql,$params);exit();
    //     echo $this->dbFwSelectAndReturnAll($sql, $params);
    // }
    // public function PUBLIC_dataList()
    // {
    //     $params = isset($_GET) ? $_GET : $_POST;

    //     if (is_array($params['user_id'])) {
    //         $usernya = $params['user_id']['user_id'];
    //     } else {
    //         $usernya = $params['user_id'];
    //     }

    //     $sql  = "SELECT 
    //             c.id_unit_kerja,
    //             reff.user_id,
    //             reff.username,
    //             reff.nama,
    //             reff.email,
    //             reff.param01,
    //             reff.param03,
    //             reff.param04,
    //             reff.param05,
    //             reff.active,
    //             reff.isadmin,
    //             b.group_id 
    //             FROM users reff
    //             LEFT JOIN group_has_users a
    //             ON reff.`user_id`=a.`user_id`
    //             LEFT JOIN groups b
    //             ON a.`group_id`=b.`group_id`
    //             LEFT JOIN user_has_unit c
    //             ON reff.user_id=c.user_id
    //             WHERE reff.`user_id`='$usernya' GROUP BY user_id";
    //     $pengguna = $this->dbFwSelectAndReturnAll($sql, $params, true);
    //     // echo $this->debugSQL($sql, $params, true);
    //     // die;

    //     $result = array();
    //     $result['PenggunaDS'] = $pengguna;
    //     echo '{"success" : true, "total":' . count($result) . ', "result":' .  json_encode($result) . '}';
    // }

    function sanitize_input($data) {
        return htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    }
}
