import java.io.*;
import javax.servlet.http.*;  
import javax.servlet.*;  


public class exp5b2 extends HttpServlet{
    
    public void init()
    {

    }

    public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException{
        response.setContentType("text/html");
        String box=req.getParameter("hid");
        
        PrintWriter out=response.getWriter();
        out.println("<p>"+box+"</p>");
    }

    public void destroy(){
        //do nothing
    }
}