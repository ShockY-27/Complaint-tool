<?php
// Establish database connection
$servername = "localhost";
$username = "root"; // Your MySQL username
$password = ""; // Your MySQL password
$dbname = "complaint_tool"; // Your MySQL database name

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Generate tracking ID
$tracking_id = rand(1000000000, 9999999999);

// Check if the complaint with the generated tracking ID already exists
$sql_check = "SELECT complaint_id FROM complaint_info WHERE tracking_id = $tracking_id";
$result_check = $conn->query($sql_check);

if ($result_check->num_rows > 0) {
    // Complaint with the same tracking ID already exists
    $row = $result_check->fetch_assoc();
    $complaint_id = $row["complaint_id"];
    echo "Complaint with the same tracking ID already exists! Complaint ID: $complaint_id";
} else {
    // Prepare and bind SQL statement to insert the new complaint
    $stmt = $conn->prepare("INSERT INTO complaint_info (tracking_id, name, email, phone, description) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("issss", $tracking_id, $_POST['name'], $_POST['email'], $_POST['phone'], $_POST['description']);

    // Execute the statement
    if ($stmt->execute() === TRUE) {
        $complaint_id = $stmt->insert_id; // Get the auto-incremented complaint ID
        echo "Complaint submitted successfully! Complaint ID: $complaint_id";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close the statement
    $stmt->close();
}

// Close the database connection
$conn->close();
?>
