<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 11-May-16
 * Time: 12:08 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("conn.php");

$username = $_GET['username'];
$password = $_GET['password'];

$query = "SELECT * FROM student_info WHERE matricNo = '$username'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$n_rows = mysqli_num_rows($result);

if($n_rows > 0){
    $query2 = "SELECT * FROM student_info WHERE matricNo = '$username' AND password = '$password'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    $n_rows2 = mysqli_num_rows($result2);

    if($n_rows2 > 0){
        while($row = mysqli_fetch_assoc($result2)){
            $collegeId = $row['collegeId'];
            $departmentId = $row['departmentId'];
            $majorId = $row['majorId'];

            $query = "select * from college WHERE sn='$collegeId'";
            $result3  = mysqli_query($con,$query)or die("Unable To Execute");

            while($row3 = mysqli_fetch_assoc($result3)){

                $query = "select * from department WHERE sn='$departmentId'";
                $result4  = mysqli_query($con,$query)or die("Unable To Execute");

                while($row4 = mysqli_fetch_assoc($result4)){
                    $query = "select * from major WHERE sn='$majorId'";
                    $result5  = mysqli_query($con,$query)or die("Unable To Execute");

                    while($row5 = mysqli_fetch_assoc($result5)){

                        $college = $row3['name'];
                        $department = $row4['name'];
                        $major = $row5['name'];

                        $loginArr = [
                            'id' => $row['matricNo'],
                            'matricNo' => $row['matricNo'],
                            'lastName' => $row['lastName'],
                            'middleName' => $row['middleName'],
                            'firstName' => $row['firstName'],
                            'college' => $college,
                            'department' => $department,
                            'major' => $major,
                            'level' => $row['level'],
                            'modeOfEntry' => $row['mode_of_entry'],
                            'session' => $row['session'],
                            'dateBirth' => $row['dob'],
                            'email' => $row['email'],
                            'address' => $row['address'],
                            'sysRank' => 5
                        ];
                    }
                }
            }
        }
        header("HTTP/1.0 201 Success");
        echo json_encode($loginArr);
    }
    else{
        header("HTTP/1.0 402 Incorrect Password");
    }
}
else{
    header("HTTP/1.0 401 Incorrect Username");
}
ob_end_flush();