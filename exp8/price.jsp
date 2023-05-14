<h1>Total Amount of Selected Products</h1>

<%@ page import="java.util.*" %>
<%
// get the selected products from the request parameter
String[] selectedCars = request.getParameterValues("selectedCars");

// initialize the total price to 0
double totalPrice = 0.0;

// loop through the selected products and add their prices to the total
if (selectedCars != null) {
    %>
    <TABLE BORDER="1" style="color:white;">
        <TR>
            <TH>Car Name</TH>
            <TH>Car Price</TH>
        </TR>
    <% 
    for (String cars : selectedCars) {
        String[] parts = cars.split(":");
        double price = Double.parseDouble(parts[1]);
        totalPrice += price;
    %>
        <TR>
            <TD> <%= parts[0] %></TD>
            <TD> <%= price %></td>
        </TR>
    <% }
    %>
    </TABLE>
<% } %>



<!DOCTYPE html>
<html>
<head>
    <title>total price</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <p style="color:white;"> Total amount of the selected cars is <b><%= totalPrice %></b>.</p>
</body>
</html>