<?php
class DBConn
{
	public static function Conn()
	{
		$servername = "localhost";
		$username = "root";
		$password = "1234";
		$dbname = "DatVeMayBay";
		return new mysqli($servername, $username, $password, $dbname);
	}
};
?>