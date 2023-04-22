<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>

<%
    response.setContentType("text/html");
    Connection conn = null;
    PreparedStatement pstmt = null;
    String carName = request.getParameter("car_name");
    int modelYear = Integer.parseInt(request.getParameter("model_year"));
    String bodyType = request.getParameter("body_type");
    String transmissionType = request.getParameter("transmission_type");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/licet", "root", "");
        pstmt = conn.prepareStatement("INSERT INTO cars_info (car_name, model_year, body_type, transmission) VALUES (?, ?, ?, ?)");
        pstmt.setString(1, carName);
        pstmt.setInt(2, modelYear);
        pstmt.setString(3, bodyType);
        pstmt.setString(4, transmissionType);
        int rowsInserted = pstmt.executeUpdate();
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Delete Results</title>");
        out.println("<link rel=\"stylesheet\" href=\"style1.css\">");
        out.println("</head>");
        out.println("<body>");

        if (rowsInserted > 0) {
            out.println("<p>Values added into table successfully!</p>");
        }

        out.println("</body>");
        out.println("</html>");
        
        pstmt.close();
        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        // Log or handle the exception in a more informative way
        e.printStackTrace();
        out.println("<p>Error adding values into table.</p>");
    }
%>
