<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $carName = $_POST['car_name'];
    $modelYear = $_POST['model_year'];
    $bodyType = $_POST['body_type'];
    $price = $_POST['price'];
    $transmission = $_POST['transmission'];

    $errors = array();
    if (empty($carName)) {
        $errors[] = "Car name is required";
    }
    if (empty($modelYear)) {
        $errors[] = "Model year is required";
    } elseif (!preg_match("/^[0-9]{4}$/", $modelYear)) {
        $errors[] = "Invalid model year format. Enter a valid 4-digit year.";
    }
    if (empty($bodyType)) {
        $errors[] = "Body type is required";
    }
    if (empty($price)) {
        $errors[] = "Price is required";
    } elseif (!is_numeric($price)) {
        $errors[] = "Invalid price format. Enter a numeric value.";
    }
    if (empty($transmission)) {
        $errors[] = "Transmission is required";
    }

    if (empty($errors)) {
        echo "<h2>Thank you for your submission!</h2>";
        echo "<p>Car Name: $carName</p>";
        echo "<p>Model Year: $modelYear</p>";
        echo "<p>Body Type: $bodyType</p>";
        echo "<p>Price: $price</p>";
        echo "<p>Transmission: $transmission</p>";

        try {
            $conn = new PDO("mysql:host=localhost:4306;dbname=licet", "root", "");
            $sql = "INSERT INTO cars_info (car_name, model_year, body_type, price, transmission) VALUES (?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(1, $carName);
            $stmt->bindParam(2, $modelYear);
            $stmt->bindParam(3, $bodyType);
            $stmt->bindParam(4, $price);
            $stmt->bindParam(5, $transmission);

            $rowsAffected = $stmt->execute();

            if ($rowsAffected > 0) {
                echo "<h1>Record inserted successfully</h1>";
            } else {
                echo "<h1>Error inserting record</h1>";
            }
        } catch (PDOException $e) {
            echo "<h1>Error: " . $e->getMessage() . "</h1>";
        } finally {
            if ($stmt !== null) {
                $stmt->closeCursor();
            }
            $conn = null;
        }
        exit;
    } else {
        foreach ($errors as $error) {
            echo "<p>$error</p>";
        }
    }
}

?>
