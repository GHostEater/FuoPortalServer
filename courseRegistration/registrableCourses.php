<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 29-Apr-16
 * Time: 9:41 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from registrablecourses";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$college = '';
$department = '';
$major = '';

while($row = mysqli_fetch_assoc($result)){

    $resultsArr[$i] = [
        '' => $row[''],
        '' => $row['']
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();