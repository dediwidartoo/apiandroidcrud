<?php 
	require_once 'src/autoload.php';

	$db = new mysqli('localhost', 'root', '', 'apiandroidcrud');

	$faker = Faker\Factory::create('id_ID');

	for ($i=0; $i < 10; $i++) { 
		$nama	= $faker->name;
		$alamat = $faker->address;

		echo '<p>'.$nama.'</p>';
		echo '<p>'.$alamat.'</p>';

		$db->QUERY("INSERT INTO biodata (nama, alamat) VALUES ('{$nama}', '{$alamat}')");

	}
?>