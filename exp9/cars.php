<style>

body{
  padding: 100px;
  background-color: #f5f5f5;
  font-family: Arial, sans-serif;
  font-size: 16px;
  color: #333;
  /* Linear gradient background */
  background: rgb(2,0,36);
	background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(184,11,195,1) 0%, rgba(0,212,255,1) 100%);
}

table, th, td {
  border: 1px solid white;
  color: white;
}
form{
  color: white;
}
</style>
<center>
  <form method="get">
    <label for="userName">Enter the car name:</label>
    <input type="text" id="carName" name="carName"></br></br>
    <button type="submit">Search</button>
  </form>
</center>
<!-- PHP code to display the XML data -->
<?php
// check if the car name was submitted
if (isset($_GET['carName'])) {
  // get the car name from the form
  $carName = $_GET['carName'];

  // load the XML file
  $xml = simplexml_load_file('cars.xml');

  // use XPath to select the car data from the XML
  $carData = $xml->xpath("//car[carname='" . $carName . "']");

  // check if car data was found
  if (!empty($carData)) {
    // display the car data in an HTML table
    echo "<center><table>";
    echo "<tr><th>Car Name</th><th>Body Type</th><th>Model Year</th><th>Price</th><th>Transmission</th></tr>";
    foreach ($carData as $car) {
      echo "<tr><td>" . $car->carname . "</td><td>" . $car->type . "</td><td>". $car->year .
	  "</td><td>". $car->price ."</td><td>". $car->transmission ."</td></tr>";
    }
    echo "</table></center>";
  } else {
    // display an error message if user data was not found
    echo "<p>Car data not found.</p>";
  }
}
?>