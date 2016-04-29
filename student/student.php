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

$query = "select * from student_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$college = '';
$department = '';
$major = '';

while($row = mysqli_fetch_assoc($result)){
    $collegeId = $row['collegeId'];
    $departmentId = $row['departmentId'];
    $majorId = $row['majorId'];

    $query = "select * from college WHERE sn='$collegeId'";
    $result3  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row3 = mysqli_fetch_assoc($result3)){
        $college = $row3['name'];
    }

    $query = "select * from department WHERE sn='$departmentId'";
    $result4  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row4 = mysqli_fetch_assoc($result4)){
        $department = $row4['name'];
    }

    $query = "select * from major WHERE sn='$majorId'";
    $result5  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row5 = mysqli_fetch_assoc($result5)){
        $major = $row5['name'];
    }

    $resultsArr[$i] = [
        'id' => $row['matricNo'],
        'matricNo' => $row['matricNo'],
        'lastName' => $row['lastName'],
        'middleName' => $row['middleName'],
        'firstName' => $row['firstName'],
        'collegeId' => $row['collegeId'],
        'college' => $college,
        'departmentId' => $row['departmentId'],
        'department' => $department,
        'majorId' => $row['majorId'],
        'major' => $major,
        'level' => $row['level'],
        'modeOfEntry' => $row['mode_of_entry'],
        'session' => $row['session'],
        'dateBirth' => $row['dob'],
        'email' => $row['email'],
        'address' => $row['address'],
        'password' => $row['password'],
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();