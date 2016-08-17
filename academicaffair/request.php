<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 16-Aug-16
 * Time: 2:31 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$id = $_GET['id'];

$query = "insert into editrequests(id,lecturerId,status,date,handledBy) VALUES(NULL,'$id','0',Null,NULL)";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();