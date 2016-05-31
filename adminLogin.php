<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 11-May-16
 * Time: 12:51 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("conn.php");

$username = $_GET['username'];
$password = $_GET['password'];
$position = $_GET['position'];
$loginArr = '';

switch($position){
    case '1':
        $query = "SELECT * FROM admin WHERE username = '$username'";
        $result = mysqli_query($con,$query)or die("Unable To Execute");
        $n_rows = mysqli_num_rows($result);
        if($n_rows > 0){
            $query2 = "SELECT * FROM admin WHERE username = '$username' AND password = '$password'";
            $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
            $n_rows2 = mysqli_num_rows($result2);

            if($n_rows2 > 0){
                while($row = mysqli_fetch_assoc($result2)){
                    $loginArr = [
                        'id' => $row['sn'],
                        'username' => $row['username'],
                        'name' => $row['name'],
                        'sysRank' => 1
                    ];
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
        break;
    case '2':
        $query = "SELECT * FROM co_info WHERE email = '$username'";
        $result = mysqli_query($con,$query)or die("Unable To Execute");
        $n_rows = mysqli_num_rows($result);
        if($n_rows > 0){
            $query2 = "SELECT * FROM co_info WHERE email = '$username' AND password = '$password'";
            $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
            $n_rows2 = mysqli_num_rows($result2);

            if($n_rows2 > 0){
                while($row = mysqli_fetch_assoc($result2)){
                    $loginArr = [
                        'id' => $row['sn'],
                        'username' => $row['username'],
                        'firstName' => $row['firstName'],
                        'middleName' => $row['middleName'],
                        'lastName' => $row['lastName'],
                        'sysRank' => 2
                    ];
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
        break;
    case '3':
        $query = "SELECT * FROM lecturer_info WHERE email = '$username'";
        $result = mysqli_query($con,$query)or die("Unable To Execute");
        $n_rows = mysqli_num_rows($result);

        if($n_rows > 0){
            $query2 = "SELECT * FROM lecturer_info WHERE email = '$username' AND password = '$password'";
            $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
            $n_rows2 = mysqli_num_rows($result2);

            if($n_rows2 > 0){
                while($row = mysqli_fetch_assoc($result2)){
                    $collegeId = $row['collegeId'];
                    $departmentId = $row['departmentId'];
                    $lecturerId = $row['sn'];

                    $query3 = "select * from college where sn = '$collegeId'";
                    $result3 = mysqli_query($con,$query3)or die("Unable To Execute");

                    while($row3 = mysqli_fetch_assoc($result3)){
                        $query4 = "select * from department where sn = '$departmentId'";
                        $result4 = mysqli_query($con,$query4)or die("Unable To Execute");

                        while($row4 = mysqli_fetch_assoc($result4)){

                            $query10 = "SELECT * FROM hod_info WHERE lecturerId='$lecturerId'";
                            $result10 = mysqli_query($con,$query10)or die("Unable To Execute");
                            $n_rows10 = mysqli_num_rows($result10);

                            if($n_rows10 > 0){
                                $sysRank = 3;
                            }
                            else{
                                $sysRank = 4;
                            }
                            $college = $row3['name'];
                            $department = $row4['name'];

                            $loginArr = [
                                'id' => $row['sn'],
                                'firstName' => $row['firstName'],
                                'middleName' => $row['middleName'],
                                'lastName' => $row['lastName'],
                                'rank' => $row['rank'],
                                'status' => $row['status'],
                                'college' => $college,
                                'department' => $department,
                                'phoneNumber' => $row['phone_number'],
                                'email' => $row['email'],
                                'sysRank' => $sysRank
                            ];
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
        break;
    case '4':
        $query = "SELECT * FROM academicaffair_info WHERE email = '$username'";
        $result = mysqli_query($con,$query)or die("Unable To Execute");
        $n_rows = mysqli_num_rows($result);
        if($n_rows > 0){
            $query2 = "SELECT * FROM academicaffair_info WHERE email = '$username' AND password = '$password'";
            $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
            $n_rows2 = mysqli_num_rows($result2);

            if($n_rows2 > 0){
                while($row = mysqli_fetch_assoc($result2)){
                    $loginArr = [
                        'id' => $row['sn'],
                        'username' => $row['username'],
                        'firstName' => $row['firstName'],
                        'middleName' => $row['middleName'],
                        'lastName' => $row['lastName'],
                        'sysRank' => 6
                    ];
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
        break;

}