<?php
// Database connection parameters
$servername = "localhost"; // Change this to your database server name
$username = "root";        // Change this to your database username
$password = "";            // Change this to your database password
$dbname = "travelscapes";  // Change this to your database name

// Create a connection to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Initialize variables
$cityId = $_GET['city_id']; // Assuming you pass the city ID in the URL

// Fetch city details from the database
$sql = "SELECT * FROM cities WHERE cityid = $cityId";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $city = $row['city'];
    $region = $row['region'];
    $season = $row['season'];
    $days = $row['days'];
    $cost = $row['cost'];
    // $image1 = $row['mountains.jpg']; 
    // $image2 = $row['image2']; 
} else {
    // Handle the case where the city ID is not found
    echo "City not found.";
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="journey.css"> <!-- Include your CSS styles here -->
    <title><?php echo $city; ?> Details</title>
</head>
<body>
    <h1><?php echo $city; ?> Details</h1>
    
    <div class="city-card">
        <div class="city-images">
            <img src="<?php echo $image1; ?>" alt="City Image 1">
            <img src="<?php echo $image2; ?>" alt="City Image 2">
        </div>
        <div class="city-details">
            <p><strong>City:</strong> <?php echo $city; ?></p>
            <p><strong>Region:</strong> <?php echo $region; ?></p>
            <p><strong>Season:</strong> <?php echo $season; ?></p>
            <p><strong>Days:</strong> <?php echo $days; ?></p>
            <p><strong>Cost:</strong> $<?php echo $cost; ?></p>
        </div>
        <div class="view-hotels-button">
            <a href="view_hotels.php?city_id=<?php echo $cityId; ?>" class="view-button">View Hotels</a>
        </div>
    </div>

    <?php
    // Close the database connection
    $conn->close();
    ?>
</body>
</html>
