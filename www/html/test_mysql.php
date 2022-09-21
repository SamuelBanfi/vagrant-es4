<?php

// Show errors on screen
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Connection parameters
$servername = "10.10.20.15";
$database = "vagrant";
$username = "vagrant";
$password = "vagrantpass";

$query = "SELECT * FROM vagranttbl";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

// Data returned from database
$result = $conn->query($query);

echo "Connected to $servername";
echo "DB '$database' selected";
echo $query;
echo $result->num_rows;
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Test MySQL</title>
</head>
<body>
	<h1>PHP Test connection</h1>
	<table>
		<thead>
			<tr>
				<td>ID</td>
				<td>Version</td>
				<td>Software</td>
			</tr>
		</thead>
		<tbody>
			<?php while ($row = $result->fetch_array()): ?>
				<tr>
					<?php for ($i = 0; $i < 3; $i++): ?> 
						<td><?php echo $row[$i]; ?></td>
					<?php endfor; ?>
				</tr>
			<?php endwhile; ?>
		</tbody>
	</table>
</body>
</html>