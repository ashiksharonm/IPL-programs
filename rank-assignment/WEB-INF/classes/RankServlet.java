import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RankServlet extends HttpServlet {

    // Sample data structure containing register numbers and ranks
    private static final String[][] STUDENT_RANKS = {
        {"311120104001", "1"},
        {"311120104002", "2"},
        {"311120104003", "3"},
        {"311120104004", "4"},
        {"311120104005", "5"}
    };

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get the register number from the request
        String registerNumber = request.getParameter("registerNumber");

        // Find the rank of the student with the given register number
        String rank = null;
        for (int i = 0; i < STUDENT_RANKS.length; i++) {
            if (STUDENT_RANKS[i][0].equals(registerNumber)) {
                rank = STUDENT_RANKS[i][1];
                break;
            }
        }

        // Send the response with the student's rank
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Student Rank</title>");
        out.println("</head>");
        out.println("<body>");
        if (rank != null) {
            out.println("<h2>Rank of student with register number " + registerNumber + " is " + rank + "</h2>");
        } else {
            out.println("<h2>Student with register number " + registerNumber + " not found</h2>");
        }
        out.println("</body>");
        out.println("</html>");
    }
}
