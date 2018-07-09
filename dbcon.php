<?php 
class Database {
	public $host = "localhost";
	public $user = "root";
	public $pass ="";
	public $dbname ="shopping_cart";

	public $conn;

	public function __construct() {
		$this->connectDB();
	}

	private function connectDB() {
		$this->conn = new mysqli($this->host,$this->user,$this->pass,$this->dbname);

		if (!$this->conn) {
			die("Connection failed: ".$this->conn->connect_error);
		} 
		
	}

	
	
}


 ?>