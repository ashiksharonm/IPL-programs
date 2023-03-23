import java.io.*;
import javax.servlet.http.*;  
import javax.servlet.*;  

class data{
    public String username;
    public String password;
    public void setData(String na,String ra)
    {
        username=na;
        password=ra;
    }
}

public class exp5c extends HttpServlet{
    public data[] obj=new data[4];
    private String ran;
    private String nam;
    public int hit;
    public int j;
    public void init()
    {
        hit=0;
        obj[0]=new data();
        obj[1]=new data();
        obj[2]=new data();
        obj[0].setData("Ashik", "1234");
        obj[1].setData("Sharon", "5678");
        obj[2].setData("Mark", "d@2");
    }
    
    public void doGet(HttpServletRequest req,HttpServletResponse response)throws ServletException,IOException{
        response.setContentType("text/html");
        String user=req.getParameter("username");
        String pas=req.getParameter("pass");
        PrintWriter out=response.getWriter();
        hit++;
        j=0;
        for(int i=0;i<3;i++)
        {
            if(obj[i].username.equals(user) && obj[i].password.equals(pas))
            {
                j=1;
                out.println("<h3>User logged in successfully!</h3>");
                out.println("<p>This is IP laboratory experiment 5c</p>");
                out.println("<p>Session Tracking - Hit Count</p>");
                out.println("<h3>Number of page visits:"+hit+"</h3>");
                break;
            }
            if(j==1)
            {
                out.println("<h3>Invalid Username and Password</h3>");
            }
        }
    }
    public void destroy(){
        //do nothing
    }
}