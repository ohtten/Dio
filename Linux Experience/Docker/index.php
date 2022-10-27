<html>

<head>
<title>Example PHP</title>
</head>
<body>

<?php
ini_set("display_errors", 1);
header('Content-Type: text/html; charset=iso-8859-1');



echo 'Current Version of PHP: ' . phpversion() . '<br>';

$servername = "99.999.999.99";
$username = "user";
$password = "password";
$database = "academic";

// Create connection


$link = new mysqli($servername, $username, $password, $database);

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$rand1 =  rand(1, 999);
$rand2 = strtoupper(substr(bin2hex(random_bytes(4)), 1));
$host_name = gethostname();

$query += "INSERT INTO students (id_student, firstname, lastname, address, city, host) VALUES ('$rand1' , '$rand2', '$rand2', '$rand2', '$rand2','$host_name')";


if ($link->query($query) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $link->error;
}

?>
</body>
</html>
