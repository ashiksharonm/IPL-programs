<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>

<%
    response.setContentType("text/html");
    Connection conn = null;
    PreparedStatement pstmt = null;
    String carName = request.getParameter("car_name");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/licet", "root", "");
        pstmt = conn.prepareStatement("DELETE FROM cars_info WHERE car_name = ?");
        pstmt.setString(1, carName);
        int rowsDeleted = pstmt.executeUpdate();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Delete Results</title>");
        out.println("<link rel=\"stylesheet\" href=\"style1.css\">");
        out.println("</head>");
        out.println("<body>");

        if (rowsDeleted > 0) {
            out.println("<p>Record deleted successfully</p>");
        } else {
            out.println("<p>No record found with the specified car name</p>");
        }

        out.println("</body>");
        out.println("</html>");

        pstmt.close();
        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        // Log or handle the exception in a more informative way
        e.printStackTrace();
        out.println("<p>Error deleting record</p>");
    }
%>
