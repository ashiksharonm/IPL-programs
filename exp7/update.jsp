<%@ page import="java.io." %>
<%@ page import="java.util." %>
<%@ page import="javax.servlet." %>
<%@ page import="javax.servlet.http." %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

<%
response.setContentType("text/html");
Connection conn = null;
PreparedStatement pstmt = null;
String carName = request.getParameter("car_name");
int modelYear = Integer.parseInt(request.getParameter("model_year"));
String bodyType = request.getParameter("body_type");
String transmissionType = request.getParameter("transmission_type");
String oldCarName = request.getParameter("old_car_name");
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/licet", "root", "");
    pstmt = conn.prepareStatement("UPDATE cars_info SET car_name=?, model_year=?, body_type=?, transmission=? WHERE car_name=?");
    pstmt.setString(1, carName);
    pstmt.setInt(2, modelYear);
    pstmt.setString(3, bodyType);
    pstmt.setString(4, transmissionType);
    pstmt.setString(5, oldCarName);
    int rowsUpdated = pstmt.executeUpdate();
    
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Delete Results</title>");
    out.println("<link rel=\"stylesheet\" href=\"style1.css\">");
    out.println("</head>");
    out.println("<body>");

    if (rowsUpdated > 0) {
        out.println("<p>Row updated successfully!</p>");
    } else {
        out.println("<p>No rows updated.</p>");
    }

    out.println("</body>");
    out.println("</html>");

    pstmt.close();
    conn.close();
} catch (ClassNotFoundException | SQLException e) {
    // Log or handle the exception in a more informative way
    e.printStackTrace();
    out.println("<p>Error updating row.</p>");
}
%>