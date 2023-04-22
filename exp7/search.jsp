<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

<%
response.setContentType("text/html");
Connection conn = null;
PreparedStatement pstmt = null;
String bodyTypeSelect = request.getParameter("car");
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/licet", "root", "");
    pstmt = conn.prepareStatement("SELECT * FROM cars_info WHERE body_type = ?");
    pstmt.setString(1, bodyTypeSelect);
    ResultSet rs = pstmt.executeQuery();
    %>

    <!DOCTYPE html>
    <html>
    <head>
        <title>Search Results</title>
        <link rel="stylesheet" href="style1.css">
    </head>
    <body>
    <%
        while (rs.next()) {
            String carName = rs.getString("car_name");
            int modelYear = rs.getInt("model_year");
            String bodyType = rs.getString("body_type");
            String transmission = rs.getString("transmission");
            out.println("<p>");
            out.println("Car name: " + carName + "<br>");
            out.println("Model year: " + modelYear + "<br>");
            out.println("Body type: " + bodyType + "<br>");
            out.println("Transmission type: " + transmission + "<br>");
            out.println("</p>");
        }
        rs.close();
        pstmt.close();
        conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            // Log or handle the exception in a more informative way
            e.printStackTrace();
            out.println("<p>Error retrieving search results.</p>");
        }
    %>
    </body>
</html>            