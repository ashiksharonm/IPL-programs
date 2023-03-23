import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class exp5b1 extends HttpServlet {
    
    public void init()
    {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        
        String textBoxValue = request.getParameter("text_box");
        
        PrintWriter out = response.getWriter();
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>MyServlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<form action=\"exp5b2_url\" method=\"get\">");
        out.println("<input type=\"hidden\" name=\"hid\" value=\"" + textBoxValue + "\">");
        out.println("<input type=\"submit\" value=\"Submit\">");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
        
        out.close();
    }

    public void destroy(){
        //do nothing
    }
}
