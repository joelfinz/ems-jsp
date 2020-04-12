<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>

<div class="card">
<center>
<h5>Register new student</h5>
<br>
<form action="admin_addStud.jsp" method="post">
    <div class="input-field">
        <label>Register no.</label>
        <input type="text" name="regno" required="required">
    </div>
    <div class="input-field">
        <label>Username</label>
        <input type="text" name="uname" required="required">
    </div>
    <div class="input-field">
        <label>Password</label>
        <input type="password" name="upass" required="required">
    </div>
    <div class="input-field">
        <label>Full name</label>
        <input type="text" name="name" required="required">
    </div>
    <div class="input-field">
        <label>Email</label>
        <input type="email" name="email" required="required">
    </div>

<button class="btn blue" type="submit">Register</button>
</center>
</form>
</div>

<%
if(request.getParameter("regno") != null){
String regno = request.getParameter("regno");
String uname = request.getParameter("uname");
String upass = request.getParameter("upass");
String name = request.getParameter("name");
String email = request.getParameter("email");
try{
Statement st= con.createStatement();
if(!con.isClosed()){
int i = st.executeUpdate("insert into student values('"+regno+"','"+uname+"','"+upass+"','"+name+"','"+email+"')");
}
con.close();
response.sendRedirect("admin_viewStud.jsp");
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
    out.println(ex);
}
}
%>

<%@ include file="./templates/footer.jsp" %>