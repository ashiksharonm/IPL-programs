<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%  Class.forName("com.mysql.jdbc.Driver");%>

<%
   // Create cookies for first and last names.      
   Cookie email = new Cookie("email", request.getParameter("email"));
   
   // Set expiry date after 24 Hrs for both the cookies.
   email.setMaxAge(60*60*24); 
   
   // Add both the cookies in the response header.
   response.addCookie( email );
%>

<html>
   <head>
    <title>Cart</title>
    <link rel="stylesheet" href="style.css">
   </head>
   
   <body>
        <div class="container">
            <center>
            </br>
                <header style = 'text-align: right'><%= request.getParameter("email")%>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="logout.jsp" target="_blank">Logout</a> 
                </header>
            </br>
                <%
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:4306/licet", "root", "");
                    Statement statement = connection.createStatement() ;
                    ResultSet resultset = statement.executeQuery("select * from cars_info") ;
                %>
                <form method="post" action="price.jsp">
                <TABLE BORDER="1">
                    <TR>
                    <TH>Car Name</TH>
                    <TH>Model Year</TH>
                    <TH>Body Type</TH>
                    <TH>Transmission</TH>
                    <TH>Price</TH>
                    </TR>
                    <% while(resultset.next()){ %>
                    <TR>
                    <TD> <%= resultset.getString("car_name") %></TD>
                    <TD> <%= resultset.getInt("model_year") %></TD>
                    <TD> <%= resultset.getString("body_type") %></TD>
                    <TD> <%= resultset.getString("transmission") %></TD>
                    <TD> <%= resultset.getDouble("price") %></TD>
                    <td><input type="checkbox" name="selectedCars" value='<%= resultset.getString("car_name") + ":" + resultset.getString("price") %>'></td>
                    </TR>
                    <% } %>
                </TABLE>
                <br><br>
                <input type="submit" value="check price">
            </form>
        </center>
        </div>
   </body>
</html>