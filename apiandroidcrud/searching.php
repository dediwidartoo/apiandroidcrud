<?php

require_once 'include/DB_Functions.php';
$db = new DB_Functions();

// json response array
$response = array("error" => FALSE);

if (isset($_POST['cari'])) {

    // receiving the post params
    $cr = $_POST['cari'];
    // get the user by email and password
    $search = $db->caridata($cr);

    if ($search != false) {
        // use is found
        $response["error"] = FALSE;
        $response["user"]["nama"] = $search["nama"];
        $response["user"]["alamat"] = $search["alamat"];
        echo json_encode($response);
			
    } else {
        // user is not found with the credentials
        $response["error"] = TRUE;
        $response["error_msg"] = "maaf email tidak di temukan ";
        echo json_encode($response);
    }
} else {
    // required post params is missing
    $response["error"] = TRUE;
    $response["error_msg"] = "Email Salah!";
    echo json_encode($response);
}
?>