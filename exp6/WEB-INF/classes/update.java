import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class update extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Connection conn = null;
        PreparedStatement pstmt = null;
        PrintWriter out = response.getWriter();
        String carName = request.getParameter("car_name");
        int modelYear = Integer.parseInt(request.getParameter("model_year"));
        String bodyType = request.getParameter("body_type");
        String transmissionType = request.getParameter("transmission_type");
        String oldCarName = request.getParameter("old_car_name");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/licet", "root", "");
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
            out.println("<link rel=\"stylesheet\" href=\"style.css\">");
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
    }
}
