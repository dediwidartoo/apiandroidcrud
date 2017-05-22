<?php
	include "koneksi.php";

	$id 	= $_POST['id'];

	class emp{}

	if (empty($id)) {
		$response = new emp();
		$response->success = 0;
		$response->message = "Hapus data error";
		die(json_encode($response));
	} else {
		$query = mysql_query("DELETE FROM biodata WHERE id='".$id."'");

		if ($query) {
			$response = new emp();
			$response->success = 1;
			$response->message = "Data berhasil dihapus";
			die(json_encode($response));
		} else{
			$response = new emp();
			$response->success = 0;
			$response->message = "Hapus Data Error";
			die(json_encode($response));
		}
	}
?>
