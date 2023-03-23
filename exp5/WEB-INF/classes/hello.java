import java.io.*;
import javax.servlet.http.*;  
import javax.servlet.*;  


public class Hello extends HttpServlet{
    private String message;
    
    public void init() throws ServletException{
        message="It's Servlet";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        out.println("<h1>"+message+"</h1>");
    }

    public void destroy(){
        //do nothing
    }
}
