<?php

//Define your Server host name here.
$HostName = "localhost";
 
//Define your MySQL Database Name here.
$DatabaseName = "pawan";
 
//Define your Database User Name here.
$HostUser = "root";
 
//Define your Database Password here.
$HostPass = ""; 

// Creating MySQL connection.
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
// Storing the received JSON in $json.
$json = file_get_contents('php://input');
 
// Decode the received JSON and store into $obj
$obj = json_decode($json,true);
 
// Getting name from $obj.
$state1 = $obj['state'];

// Creating SQL query and insert the record into MySQL database table.
//$Sql_Query = "insert into led (state) values ('$state')";
$Sql_Query =  "UPDATE led set state='$state1' where id=1";
//UPDATE tutorials_tbl set tutorial_title = "Learning Java" where tutorial_id = 4'
 
 
 if(mysqli_query($con,$Sql_Query)){
 
	 // On query success it will print below message.
	$MSG = 'Data Successfully Submitted.' ;
	 
	// Converting the message into JSON format.
	$json = json_encode($MSG);
	 
	// Echo the message.
	 echo $json ;
 
 }
 else{
 
	echo 'Try Again';
 
 }
 mysqli_close($con);
?>