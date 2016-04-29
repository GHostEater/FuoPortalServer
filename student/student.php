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
$level = '';
$modeOfEntry = '';

while($row = mysqli_fetch_assoc($result)){
    $collegeId = $row['collegeId'];
    $departmentId = $row['departmentId'];
    $majorId = $row['majorId'];
    $levelId = $row['levelId'];
    $modeOfEntryId = $row['modeOfEntryId'];

    $query = "select * from college WHERE sn='$collegeId'";
    $result3  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row3 = mysqli_fetch_assoc($result3)){
        $college = $row3['acronym'];
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

    $query = "select * from level WHERE sn='$levelId'";
    $result5  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row5 = mysqli_fetch_assoc($result5)){
        $level = $row5['level'];
    }

    $query = "select * from modeofentry WHERE sn='$modeOfEntryId'";
    $result5  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row5 = mysqli_fetch_assoc($result5)){
        $modeOfEntry = $row5['modeOfEntry'];
    }

    $resultsArr[$i] = [
        'matricNo' => $row['matricNo'],
        'lastName' => $row['lastName'],
        'middleName' => $row['middleName'],
        'firstName' => $row['firstName'],
        'sex' => $row['sex'],
        'email' => $row['email'],
        'phoneNumber' => $row['phoneNumber'],
        'dateBirth' => $row['dob'],
        'nationality' => $row['nationality'],
        'stateOrigin' => $row['stateOrigin'],
        'lga' => $row['lga'],
        'religion' => $row['religion'],
        'address' => $row['address'],
        'nextOfKin' => $row['nextOfKin'],
        'nextOfKinAddress' => $row['nextOfKinAddress'],
        'collegeId' => $row['collegeId'],
        'college' => $college,
        'departmentId' => $row['departmentId'],
        'department' => $department,
        'majorId' => $row['majorId'],
        'major' => $major,
        'levelId' => $row['levelId'],
        'level' => $level,
        'modeOfEntry' => $modeOfEntry,
        'password' => $row['password'],
        'img' => $row['img']
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();