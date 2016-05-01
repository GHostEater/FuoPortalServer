<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/26/2016
 * Time: 7:57 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from lecturerRank";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'rank' => $row['rank'],
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();