<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>
<center>
<div class='card'>
<h5>Update student details</h5><br>
<%
if(request.getParameter("id") != null){

String id = request.getParameter("id");
//out.println(id);
try{
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from student where s_id='"+id+"'");
    if(!con.isClosed()){
        while(rs.next()){
            out.println("<form action='admin_upStud.jsp' method='get'>");
            out.println("<div class='input-field'><label>Reg. no</label><input type='text' name='regno' required='required' value='"+rs.getString(1)+"'/></div>");
            out.println("<div class='input-field'><label>Username</label><input type='text' name='uname' required='required' value='"+rs.getString(2)+"'/></div>");
            out.println("<div class='input-field'><label>Password</label><input type='password' name='upass' required='required' value='"+rs.getString(3)+"'/></div>");
            out.println("<div class='input-field'><label>Full name</label><input type='text' name='name' required='required' value='"+rs.getString(4)+"'/></div>");
            out.println("<div class='input-field'><label>Email</label><input type='email' name='email' required='required' value='"+rs.getString(5)+"'/></div>");
            out.println("<button type='submit' class='btn'>Update</button>");
            out.println("</form>");
        }
    }
    con.close();
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
    out.println(ex);    
}
}
if(request.getParameter("regno")!= null){
    String regno = request.getParameter("regno");
    String uname = request.getParameter("uname");
    String upass = request.getParameter("upass");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
try{
    Statement st = con.createStatement();
    int i = st.executeUpdate("update student set `s_uname`='"+uname+"',`s_pass`='"+upass+"',`s_name`='"+name+"',`s_email`='"+email+"' where(`s_id`='"+regno+"')");
    if(!con.isClosed()){
        out.println("Student record updated successfully.");
        out.println("Redirecting to dashboard...");
        out.println("<script>alert('record updated successfully')</script>");
        response.sendRedirect("admin_viewStud.jsp");
    }
    con.close();
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
    out.println(ex);    
}
}
%>
</div>
</center>

<%@ include file="./templates/footer.jsp" %>