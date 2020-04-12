<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>
            <%  
                try{
                String name = request.getParameter("uname");
                String pwd = request.getParameter("upwd");
                    Statement st= con.createStatement();
                    ResultSet rs = st.executeQuery("select * from student");
                  if(!con.isClosed()){
                    while(rs.next()){
                    String dbuser = rs.getString(2);
                    String dbpass = rs.getString(3);
                    String dbname = rs.getString(4);
                    if(name.equals(dbuser) && pwd.equals(dbpass)){
                      session.setAttribute("user", dbname);
                      session.setAttribute("home", "home.jsp");
                      response.sendRedirect("home.jsp");
                    }
                    }
                    if(name.equals("admin") && pwd.equals("admin")){
                      session.setAttribute("user", "ADMIN");
                      session.setAttribute("home", "admin_home.jsp");
                      response.sendRedirect("admin_home.jsp");
                    }
                    else{
                      out.println("<script>alert('Invalid login')</script>");
                      response.sendRedirect("index.jsp");
                    }
                    
                  }
                  con.close();
                }
    catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
}            
%>
<%@ include file="./templates/footer.jsp" %>