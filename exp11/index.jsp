<%-- 
    Document   : index
    Created on : 13 May, 2023, 9:28:28 PM
    Author     : sharo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Details</title>
    <style>
        hr {
            background-color: rgb(139, 0, 0);
            border-top-color: rgb(139, 0, 0);
            border-right-color: rgb(139, 0, 0);
            border-bottom-color: rgb(139, 0, 0);
            border-left-color: rgb(139, 0, 0);
            border-style: solid;
        }
        mt {
            font-size: 1cm;
            font-family: 'Times New Roman', Times, serif;
            color: rgb(90, 44, 255);
        }
        mt1 {
            color: brown;
        }
        p {
            font-size: 0.5cm;
            font-family: 'Times New Roman', Times, serif;
            color: rgb(60, 136, 126);
        }
    </style>
</head>
<body style="background-color: rgb(240, 201, 150);">
    <hr>
    <mt>Car Details</mt>  
    <br>
    <hr>
    <p>
        Welcome to the world of cars. Whether you're a car enthusiast or just curious, we have the information you need about various car models.
        <br><br> 
        Enter the car name below to view the details
    </p>
    <hr>
    <form>
        <label>Car Name: </label>
        <input type="text" name="carName"/>
        <input type="submit" value="SUBMIT"/>
    </form>
    <%-- start web service invocation --%>
    <hr/>
    <%
        try {
            cars.CarWebService_Service service = new cars.CarWebService_Service();
            cars.CarWebService port = service.getCarWebServicePort();
            // TODO initialize WS operation arguments here
            String carName = request.getParameter("carName");
            // TODO process result here
            java.lang.String result = port.hello(carName);
            out.println("Result = " + result);

            String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            String DB_URL = "jdbc:mysql://localhost:4306/cars";

            // Database credentials
            String USER = "root";
            String PASS = "";

            // Set response content type
            response.setContentType("text/html");
            PrintWriter out1 = response.getWriter();

            String title = "Car Details Database";

            if (carName.length() > 0) {
                out1.println("<html>\n");
                out1.println("<head> ");
                out1.println("</head>\n");
                out1.println("<body bgcolor = \"#f0f0f0\">\n");
                out1.println("<br>");
                out1.println("<h1> " + result + "</h1>");
                out1.println("<hr>");

                out1.println("<center><h1 > " + title + "</h1></center>");

                // Register JDBC driver
                Class.forName(JDBC_DRIVER);

                // Open a connection
                Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

                // Execute SQL query
                Statement stmt = conn.createStatement();
                String sql;
                sql = "SELECT * FROM cars_table;";
                ResultSet rs = stmt.executeQuery(sql);

                out1.println("<style> body { background: linear-gradient(90deg, rgba(211, 211, 211, 1) 0%, rgba(255, 255, 255, 1) 100%);");
                out1.println("th, td { ");
                out1.println("padding-top: 10px;");
                out1.println("padding-bottom: 20px;");
                out1.println("padding-left: 30px;");
                out1.println("padding-right: 40px;}");
                out1.println("table { border: 2px solid; border-style: double}");
                out1.println("</style><center><div><table border=1>");

                out1.println("<tr><td color = \"purple\"> Make </td>");
                out1.println("<td> Model </td>");
                out1.println("<td> Year </td>");
                out1.println("<td> Color </td></tr>");

                // Extract data from result set
                while (rs.next()) {
                    // Retrieve by column name
                    String make = rs.getString("Make");
                    String model = rs.getString("Model");
                    String year = rs.getString("Year");
                    String color = rs.getString("Color");

                    // Display values
                    out1.println("<tr> <td>" + make + " </td>");
                    out1.println("<td>" + model + "</td>");
                    out1.println("<td>" + year + "</td>");
                    out1.println("<td>" + color + "</td>");
                    out1.println("</tr> ");
                }

                out1.println("</table></div></center>");
                out1.println("<br>");
                out1.println("</body></html>");

                rs.close();
                stmt.close();
                conn.close();
            }
        } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%-- end web service invocation --%>
<hr>
</body>
</html>
