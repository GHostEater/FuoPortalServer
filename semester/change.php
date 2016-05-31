<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 5/18/2016
 * Time: 2:17 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from semester";
$result = mysqli_query($con,$query)or die("Unable To Execute");

while($row = mysqli_fetch_assoc($result)){
    $semester = $row['semester'];
    if($semester == 1){
        $query = "UPDATE semester SET semester='2' where sn='1'";
        mysqli_query($con,$query)or die("Unable To Execute");
    }
    else if($semester == 2){
        $query = "UPDATE semester SET semester='1' where sn='1'";
        mysqli_query($con,$query)or die("Unable To Execute");
    }
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();