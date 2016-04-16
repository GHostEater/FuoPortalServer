<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 12:28 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from student";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $resultsArr[$i] = [
        'id' => $row['matric_no'],
        'matric_no' => $row['matric_no'],
        'lastName' => $row['last_name'],
        'middleName' => $row['middle_name'],
        'firstName' => $row['first_name'],
        'college' => $college,
        'department' => $department,
        'major' => $major,
        'level' => $row['level'],
        'modeOfEntry' => $row['mode_of_entry'],
        'session' => $row['session'],
        'dateBirth' => $row['dob'],
        'email' => $row['email'],
        'address' => $row['address']

    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();