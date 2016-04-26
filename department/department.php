<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:37 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from department";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $collegeId = $row['collegeId'];

    $query2 = "select * from college WHERE sn='$collegeId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $resultsArr[$i] = [
            'id' => $row['sn'],
            'name' => $row['name'],
            'collegeId' => $row['collegeId'],
            'college' => $row2['name'],
            'collegeAcronym' => $row2['acronym'],
        ];
    }
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();