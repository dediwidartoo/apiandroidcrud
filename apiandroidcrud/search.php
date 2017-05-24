<?php
	include "koneksi.php";
	//sleep(2);

	$cari = isset($_POST['cari']) && $_POST['cari'] != '' ? $_POST['cari'] : 0;

	$all = mysql_query("SELECT * FROM biodata WHERE nama LIKE CONCAT('%',?,'%')");
	$count_all = mysql_num_rows($all);

	$query = mysql_query("SELECT * FROM biodata WHERE nama LIKE CONCAT('%',?,'%') LIMIT $cari,10");

	$count = mysql_num_rows($query);
	$json_kosong = 0;

	if($count<10){
		if($count==0){
			$json_kosong = 1;
		}else{
			$query = mysql_query("SELECT * FROM biodata WHERE nama LIKE CONCAT('%',?,'%') LIMIT $cari,$count");
			$count = mysql_num_rows($query);
			if(empty($count)){
				$query = mysql_query("SELECT * FROM biodata WHERE nama LIKE CONCAT('%',?,'%') LIMIT 0,10");
				$num = 0;
			}else{
				$num = $cari;
			}
		}
	} else{
		$num = $cari;
	}

	$json = '[';
	while ($row = mysql_fetch_array($query)){
		$num++;
		$char ='"';
		$json .= '{
			"no": '.$num.',
			"nama": "'.str_replace($char,'`',strip_tags($row['nama'])).'",
			"alamat": "'.str_replace($char,'`',strip_tags($row['alamat'])).'"},';
	}

	$json = substr($json,0,strlen($json)-1);


	if($json_kosong==1){
		$json = '[{ "no": "", "name": "", "alamat": ""}]';
	}else{
		$json .= ']';
	}
	echo $json;

	mysql_close($connect);
?>
