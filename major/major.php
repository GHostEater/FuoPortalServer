<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:35 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from major";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$department = "";
$collegeId = '';
$college = "";

while($row = mysqli_fetch_assoc($result)){
    $departmentId = $row['departmentId'];

    $query2 = "select * from department WHERE sn ='$departmentId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $department = $row2['name'];
        $collegeId = $row2['collegeId'];
    }

    $query2 = "select * from college WHERE sn ='$collegeId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $college = $row2['acronym'];
    }

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'name' => $row['name'],
        'departmentId' => $row['departmentId'],
        'department' => $department,
        'college' => $college
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();