<?php
require_once('DBConn.php');

// public function DB_Select($qry) {
	// $conn = DBConn::Conn();
	// if ($conn->connect_error) {
		// die("Connection failed: " . $conn->connect_error);
	// }
	// $result = $conn->query($qry);
	
	// return $result;
// }
// public function DB_Insert($qry) {
	// $conn = DBConn::Conn();
	// if ($conn->connect_error) {
		// die("Connection failed: " . $conn->connect_error);
	// }
	// if ($conn->query($qry) === TRUE) {
		// return "New records created successfully";
	// } else {
		// return "Error: " . $conn->error;
	// }
	// $conn->close();
// }

$conn = DBConn::Conn();
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
$result = $conn->query('SELECT * FROM `User`');

$found = false;
if ($result->num_rows > 0)
	while($row = $result->fetch_assoc()) {
		if($_POST['user_name'] == $row['Username'] && $_POST['pass_word'] == $row['Password'])
		{
			echo $row['ID']." ".$row['Username']." ".$row['Password']."<br>";
			$found = true;
		}
	}
$conn->close();
if($found == false)
{
	echo 'User not found';
	// header('Location: index.php', true, 301);
	// exit();
}
?>