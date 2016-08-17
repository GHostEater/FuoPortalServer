<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/21/2016
 * Time: 8:23 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$firstName = $_GET['firstName'];
$middleName = $_GET['middleName'];
$lastName = $_GET['lastName'];
$sex = $_GET['sex'];
$position = $_GET['position'];
$email = $_GET['email'];
$password = $_GET['password'];

if($position == 0){
    $query = "select * from studentaffair WHERE position='0'";
    $result = mysqli_query($con,$query);
    $nRows = mysqli_num_rows($result);

    if($nRows == 0){
        $query = "insert into studentaffair(sn,firstName,middleName,lastName,email,password,sex,position)
        VALUES(NULL,'$firstName','$middleName','$lastName','$email','$password','$sex','$position')";
        mysqli_query($con,$query)or die("Unable To Execute");

        header("HTTP/1.0 201 Success");
    }
    else{
        header("HTTP/1.0 401 Dean Already Exists");
    }
}
else if($position == 1){
    $query = "select * from studentaffair WHERE position='1' AND sex='$sex'";
    $result = mysqli_query($con,$query);
    $nRows = mysqli_num_rows($result);

    if($nRows == 0){
        $query = "insert into studentaffair(sn,firstName,middleName,lastName,email,password,sex,position)
        VALUES(NULL,'$firstName','$middleName','$lastName','$email','$password','$sex','$position')";
        mysqli_query($con,$query)or die("Unable To Execute");

        header("HTTP/1.0 201 Success");
    }
    else{
        header("HTTP/1.0 402 Sub-Dean Already Exists");
    }
}
else if($position == 2){
    $query = "insert into studentaffair(sn,firstName,middleName,lastName,email,password,sex,position)
        VALUES(NULL,'$firstName','$middleName','$lastName','$email','$password','$sex','$position')";
    mysqli_query($con,$query)or die("Unable To Execute");

    header("HTTP/1.0 201 Success");
}


ob_end_flush();