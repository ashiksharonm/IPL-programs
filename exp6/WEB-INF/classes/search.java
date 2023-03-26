import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class search extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Connection conn = null;
        PreparedStatement pstmt = null;
        PrintWriter out = response.getWriter();
        String bodyTypeSelect = request.getParameter("car");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/licet", "root", "");
            pstmt = conn.prepareStatement("SELECT * FROM cars_info WHERE body_type = ?");
            pstmt.setString(1, bodyTypeSelect);
            ResultSet rs = pstmt.executeQuery();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Search Results</title>");
            out.println("<link rel=\"stylesheet\" href=\"style.css\">");
            out.println("</head>");
            out.println("<body>");

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

            out.println("</body>");
            out.println("</html>");

            rs.close();
            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            // Log or handle the exception in a more informative way
            e.printStackTrace();
            out.println("<p>Error retrieving search results.</p>");
        }
    }
}
