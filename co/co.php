<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/21/2016
 * Time: 8:36 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from co_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$college = '';

while($row = mysqli_fetch_assoc($result)) {
    $collegeId = $row['collegeId'];

    $query = "select * from college WHERE sn='$collegeId'";
    $result3 = mysqli_query($con, $query) or die("Unable To Execute");
    while ($row3 = mysqli_fetch_assoc($result3)) {
        $college = $row3['acronym'];
    }

        $resultsArr[$i] = [
            'id' => $row['sn'],
            'firstName' => $row['firstName'],
            'middleName' => $row['middleName'],
            'lastName' => $row['lastName'],
            'collegeId' => $row['collegeId'],
            'college' => $college,
            'email' => $row['email'],
            'password' => $row['password']
        ];
        $i += 1;

}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();