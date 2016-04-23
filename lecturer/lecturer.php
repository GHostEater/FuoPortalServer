<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:36 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from lecturer_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $collegeId = $row['collegeId'];
    $departmentId = $row['departmentId'];

    $query3 = "select * from college where sn = '$collegeId'";
    $result3 = mysqli_query($con,$query3)or die("Unable To Execute");

    while($row3 = mysqli_fetch_assoc($result3)){
        $query4 = "select * from department where sn = '$departmentId'";
        $result4 = mysqli_query($con,$query4)or die("Unable To Execute");

        while($row4 = mysqli_fetch_assoc($result4)){
            $college = $row3['name'];
            $department = $row4['name'];

            $resultsArr[$i] = [
                'id' => $row['sn'],
                'firstName' => $row['firstName'],
                'middleName' => $row['middleName'],
                'lastName' => $row['lastName'],
                'rank' => $row['rank'],
                'status' => $row['status'],
                'collegeId' => $row['collegeId'],
                'college' => $college,
                'departmentId' => $row['departmentId'],
                'department' => $department,
                'phoneNumber' => $row['phone_number'],
                'email' => $row['email']
            ];
        }
    }
    $i += 1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();