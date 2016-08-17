<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/28/2016
 * Time: 8:50 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from roomAllocation";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;

while($row = mysqli_fetch_assoc($result)){
    $roomId = $row['roomId'];
    $matricNo = $row['matricNo'];
    $sessionId = $row['sessionId'];

    $query = "select * from room WHERE sn='$roomId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $room = $row2['name'];
        $hostelId = $row2['hostelId'];

        $query = "select * from hostel WHERE sn='$hostelId'";
        $result2 = mysqli_query($con,$query)or die("Unable To Execute");
        while($row2 = mysqli_fetch_assoc($result2)){
            $hostel = $row2['name'];
        }
    }

    $query = "select * from session WHERE sn='$sessionId'";
    $result5  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row5 = mysqli_fetch_assoc($result5)){
        $session = $row5['session'];
    }

    $query = "select * from student_info WHERE matricNo='$matricNo'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $collegeId = $row2['collegeId'];
        $departmentId = $row2['departmentId'];
        $majorId = $row2['majorId'];
        $levelId = $row2['levelId'];
        $modeOfEntryId = $row2['modeOfEntryId'];
        $firstName = $row2['firstName'];
        $middleName = $row2['middleName'];
        $lastName = $row2['lastName'];
        $sex = $row2['sex'];
        $img = $row2['img'];

        $query = "select * from college WHERE sn='$collegeId'";
        $result3  = mysqli_query($con,$query)or die("Unable To Execute");
        while($row3 = mysqli_fetch_assoc($result3)){
            $college = $row3['acronym'];
            $collegeFull = $row3['name'];
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
    }

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'roomId' => $roomId,
        'room' => $room,
        'hostelId' => $hostelId,
        'hostel' => $hostel,
        'matricNo' => $matricNo,
        'firstName' => $firstName,
        'middleName' => $middleName,
        'lastName' => $lastName,
        'sex' => $sex,
        'collegeId' => $collegeId,
        'college' => $college,
        'collegeFull' => $collegeFull,
        'departmentId' => $departmentId,
        'department' => $department,
        'majorId' => $majorId,
        'major' => $major,
        'modeOfEntryId' => $modeOfEntryId,
        'modeOfEntry' => $modeOfEntry,
        'levelId' => $levelId,
        'level' => $level,
        'sessionId' => $sessionId,
        'session' => $session,
        'img' => $img
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();